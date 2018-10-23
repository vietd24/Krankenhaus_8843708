\c postgres;
drop database if exists krankenhaus;
CREATE DATABASE krankenhaus;
\c krankenhaus;

DROP VIEW IF EXISTS personal_overview;
DROP VIEW IF EXISTS fachbereich_overview;
DROP MATERIALIZED VIEW IF EXISTS arzt_overview;
DROP TABLE IF EXISTS Wechselwirkung CASCADE;
DROP TABLE IF EXISTS verwendet CASCADE;
DROP TABLE IF EXISTS Behandlung CASCADE;
DROP TABLE IF EXISTS einsetzbar CASCADE;
DROP TABLE IF EXISTS Medikament CASCADE;
DROP TABLE IF EXISTS hatsymptom CASCADE;
DROP TABLE IF EXISTS Symptom CASCADE;
DROP TABLE IF EXISTS Krankheit CASCADE;
DROP TABLE IF EXISTS Patient CASCADE;
DROP TABLE IF EXISTS Pfleger CASCADE;
DROP TABLE IF EXISTS Arzt CASCADE;
DROP TABLE IF EXISTS Fachgebiet CASCADE;
DROP TABLE IF EXISTS Adresse CASCADE;
DROP TABLE IF EXISTS Person CASCADE;

CREATE TABLE Person
    (
        pid SERIAL NOT NULL PRIMARY KEY,
        name TEXT CHECK(name <> ''),
        vname TEXT CHECK(vname <> ''),
        familienstand TEXT CHECK(familienstand <> ''),
        geburtsdatum DATE NOT NULL
    );

CREATE TABLE Adresse
    (
        pid INTEGER NOT NULL PRIMARY KEY REFERENCES Person(pid), 
         /*"besitzt" Relation zu Person*/
        plz TEXT CHECK(plz <> ''),
        ort TEXT CHECK(ort <> ''),
        strasse TEXT CHECK(strasse <> ''),
        hausnummer TEXT CHECK(strasse <> '')
         /*hausnr 13/2 */
       
    );
CREATE TABLE Fachgebiet
    (
        id SERIAL NOT NULL PRIMARY KEY,
        name TEXT CHECK(name <> '')
    );
CREATE TABLE Arzt
    (
        pid INTEGER NOT NULL PRIMARY KEY ,
        gehalt DOUBLE PRECISION NOT NULL CHECK(gehalt > 0),
        start DATE NOT NULL,
        ende DATE NOT NULL,
        fachgebiet INTEGER NOT NULL REFERENCES Fachgebiet(id),
        /*"gehoert_zu" Relation zu Fachgebiet*/
        CONSTRAINT pid_FK FOREIGN KEY(pid) REFERENCES Person(pid)
        /*"ist" Relation zu Person*/
    );
    
CREATE TABLE Pfleger
    (
        pid INTEGER NOT NULL PRIMARY KEY ,
        gehalt DOUBLE PRECISION NOT NULL CHECK(gehalt > 0),
        start DATE NOT NULL,
        ende DATE NOT NULL,
        ausbildung TEXT CHECK(ausbildung <> ''),
        arzt_pid INTEGER NOT NULL REFERENCES Arzt(pid),
        /*"besitzt" Relation zu Arzt*/
        CONSTRAINT pid_FK FOREIGN KEY(pid) REFERENCES Person(pid)
        /*"ist" Relation zu Person*/

    );
CREATE TABLE Patient
    (
        pid INTEGER NOT NULL PRIMARY KEY ,
        krankenkasse TEXT CHECK(krankenkasse <> ''),
        gewicht DOUBLE PRECISION NOT NULL,
        groesse DOUBLE PRECISION NOT NULL,
        CONSTRAINT pid_FK FOREIGN KEY(pid) REFERENCES Person(pid)
        /*"ist" Relation zu Person*/

    );
CREATE TABLE Krankheit
    (
        whoid TEXT CHECK(whoid <> '') PRIMARY KEY, /*laut who sind buchstaben enthalten*/
        name TEXT CHECK(name <> '')
    );
CREATE TABLE Symptom
    (
        id SERIAL NOT NULL PRIMARY KEY,
        name TEXT CHECK(name <> '')
    );
CREATE TABLE hatsymptom
    (
        whoid TEXT NOT NULL REFERENCES Krankheit(whoid),
        id INTEGER NOT NULL REFERENCES Symptom(id) ,
        CONSTRAINT hatsymptom_PK PRIMARY KEY(whoid,id)
    );
CREATE TABLE Medikament
    (
        znr INTEGER NOT NULL PRIMARY KEY,
        name TEXT CHECK(name <> '')
    );
CREATE TABLE einsetzbar
    (
        znr INTEGER NOT NULL REFERENCES Medikament(znr),
        whoid TEXT CHECK(whoid <> '') REFERENCES Krankheit(whoid) ,
        CONSTRAINT einsetzbar_PK PRIMARY KEY(znr,whoid)
    );
CREATE TABLE Wechselwirkung
    (
        beschreibung TEXT,
        znr INTEGER NOT NULL REFERENCES Medikament(znr),
        /*"hat" Relation zu Medikament*/
        ww_znr INTEGER NOT NULL REFERENCES Medikament (znr),
        CONSTRAINT wechselwirkung_PK PRIMARY KEY(znr,ww_znr)
    );
    
CREATE TABLE Behandlung 
    (
        behnr SERIAL NOT NULL PRIMARY KEY,
        datum TIMESTAMP NOT NULL,
        whoid TEXT CHECK(whoid <> '') REFERENCES Krankheit(whoid),
        /*"fuer" Relation zu Krankheit*/
        arzt_pid INTEGER NOT NULL REFERENCES Arzt(pid),
        /*"leitet" Relation zu Arzt*/
        patient_pid INTEGER NOT NULL REFERENCES Patient(pid)
        /*"bekommt" Relation zu Patient*/

    );
CREATE TABLE verwendet
    (
        znr INTEGER NOT NULL REFERENCES Medikament(znr),
        behnr INTEGER NOT NULL REFERENCES Behandlung(behnr) ,
        CONSTRAINT verwendet_pk PRIMARY KEY(znr,behnr)
    );

--arzt_overview
create materialized view arzt_overview as 
select p.name as "Arzt Name", p.vname as "Arzt Vorname", f.name, count(patient.pid) as "Behandelte Patienten" 
from person p, fachgebiet f, arzt a,patient,behandlung b 
where a.pid=p.pid 
and f.id = a.fachgebiet 
and b.arzt_pid = a.pid 
and b.patient_pid=patient.pid 
group by (p.name,p.vname,f.name,p.pid);


--fachbereich_overview

create materialized view fachbereich_overview as select f.name, arztcount.zahl AS "Anzahl Ärzte", count(distinct p.pid) AS "Anzahl Patienten"
from 
(
select fachgebiet.id, count(arzt.pid) as zahl
	from fachgebiet
	left join arzt on fachgebiet.id = arzt.fachgebiet
	group by fachgebiet.id
)as arztcount /*anzahl der aerzte pro fachgebiet*/,fachgebiet f
left join arzt a on a.fachgebiet = f.id /*fachgebiet zum arzt*/
left join behandlung b on a.pid = b.arzt_pid 
left join patient p on p.pid = b.patient_pid /*arzt behandelt patient*/
WHERE  (f.id = arztcount.id) /*fachgebiet zum fachgebiet der "untertabelle" arztcount*/
group by (f.name, arztcount.zahl);

--recent_operations

create materialized view recent_operations as
select person.name as "Arzt Name", person.vname as "Arzt Vorname", f.name, STRING_AGG(distinct pflegertable.name,', ') as "Pfleger Name", count(b.patient_pid) as "Behandelte Patienten"
from person
right join arzt a on a.pid=person.pid
left join
    (select concat(person.name,' ',person.vname) as name, pfleger.arzt_pid 
    from person 
    join pfleger on person.pid=pfleger.pid) as pflegertable on a.pid = pflegertable.arzt_pid
join fachgebiet f on f.id = a.fachgebiet
join behandlung b on b.arzt_pid = a.pid and b.datum > NOW() - INTERVAL '12 months'
group by(person.name,person.vname,f.name)
order by (person.name);
--personal_overview

create materialized view personal_overview as select p.pid, p.name as "Name", p.vname as "Vorname", p.familienstand, p.geburtsdatum, 
a.strasse, a.hausnummer, a.plz, a.ort, 
arzt.start  as "Arzt Beginn", arzt.ende as "Arzt Ende", fachgebiet.name as "Fachgebiet Arzt",
pfleger.start as "Pfleger Beginn", pfleger.ende as "Pfleger Ende", pfleger.ausbildung as "Ausbildung"
from person p
left join patient on p.pid = patient.pid 
join adresse a on p.pid = a.pid 
full join arzt on p.pid = arzt.pid
full join pfleger on p.pid = pfleger.pid
left join fachgebiet on arzt.pid = fachgebiet.id
where patient.pid is null order by p.pid asc; 

