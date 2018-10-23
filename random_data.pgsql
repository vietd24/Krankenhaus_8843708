\c krankenhaus;
-- persons
insert into person (name,vname,familienstand,geburtsdatum) values ('Berends','Nickie','verheiratet','1996-03-29');
insert into person (name,vname,familienstand,geburtsdatum) values ('Gingrich','Phebe','ledig','1994-05-24');
insert into person (name,vname,familienstand,geburtsdatum) values ('Landis','Ahmed','verheiratet','1987-09-17');
insert into person (name,vname,familienstand,geburtsdatum) values ('Gailey','Valeria','ledig','1964-01-15');
insert into person (name,vname,familienstand,geburtsdatum) values ('Bullins','Randal','verheiratet','1994-10-09');
insert into person (name,vname,familienstand,geburtsdatum) values ('Dempsey','Jeanelle','verwitwet','1959-12-01');
insert into person (name,vname,familienstand,geburtsdatum) values ('Clowers','Janiece','verwitwet','1978-05-02');
insert into person (name,vname,familienstand,geburtsdatum) values ('Chavis','Rickie','verheiratet','1972-04-01');
insert into person (name,vname,familienstand,geburtsdatum) values ('Aaron','Crystle','ledig','1992-12-21');
insert into person (name,vname,familienstand,geburtsdatum) values ('Rainer','Ozella','verwitwet','1997-02-17');
insert into person (name,vname,familienstand,geburtsdatum) values ('Mcdonough','Daniel','geschieden','1987-02-26');
insert into person (name,vname,familienstand,geburtsdatum) values ('Brwon','Lashunda','ledig','1966-03-26');
insert into person (name,vname,familienstand,geburtsdatum) values ('Quinton','Ashlie','verwitwet','1980-11-16');
insert into person (name,vname,familienstand,geburtsdatum) values ('Brookshire','Percy','verheiratet','1954-06-06');
insert into person (name,vname,familienstand,geburtsdatum) values ('Criner','Leila','ledig','1989-01-02');
insert into person (name,vname,familienstand,geburtsdatum) values ('Dewolfe','Clayton','verheiratet','1992-01-16');
insert into person (name,vname,familienstand,geburtsdatum) values ('Lefevre','Misty','ledig','1968-04-14');
insert into person (name,vname,familienstand,geburtsdatum) values ('Dey','Shanti','geschieden','1983-10-26');
insert into person (name,vname,familienstand,geburtsdatum) values ('Bogner','Belva','verheiratet','1995-11-06');
insert into person (name,vname,familienstand,geburtsdatum) values ('Bradley','Darla','ledig','1968-04-15');

--adresse
insert into adresse select pid, '25761', ' Hedwigenkoog ', ' Hülsebrockstr', '161' from person where person.vname = 'Nickie' and person.name = 'Berends';
insert into adresse select pid, '21368', ' Boitze ', ' Baumberger Str', '112' from person where person.vname = 'Phebe' and person.name = 'Gingrich';
insert into adresse select pid, '45309', ' Essen ', ' Geiststr', '78' from person where person.vname = 'Ahmed' and person.name = 'Landis';
insert into adresse select pid, '87730', ' Bad Grönenbach ', ' Am Pulverschuppen', '197' from person where person.vname = 'Valeria' and person.name = 'Gailey';
insert into adresse select pid, '89192', ' Rammingen ', ' Kurneystr', '113' from person where person.vname = 'Randal' and person.name = 'Bullins';
insert into adresse select pid, '54316', ' Ollmuth ', ' Vorgebirgstr', '120' from person where person.vname = 'Jeanelle' and person.name = 'Dempsey';
insert into adresse select pid, '67734', ' Katzweiler ', ' Lammerbach ', '132' from person where person.vname = 'Janiece' and person.name = 'Clowers';
insert into adresse select pid, '49324', ' Melle ', ' Arnheimweg ', '115' from person where person.vname = 'Rickie' and person.name = 'Chavis';
insert into adresse select pid, '99438', ' Troistedt ', ' Münsterstr', '50' from person where person.vname = 'Crystle' and person.name = 'Aaron';
insert into adresse select pid, '23715', ' Bosau ', ' Unter Kahlenhausen ', '84' from person where person.vname = 'Ozella' and person.name = 'Rainer';
insert into adresse select pid, '78147', ' Vöhrenbach ', ' Neißestr', '170' from person where person.vname = 'Daniel' and person.name = 'Mcdonough';
insert into adresse select pid, '56377', ' Seelbach ', ' Am Blütenhain ', '94' from person where person.vname = 'Lashunda' and person.name = 'Brwon';
insert into adresse select pid, '83458', ' Schneizlreuth ', ' Grevener Str', '147' from person where person.vname = 'Ashlie' and person.name = 'Quinton';
insert into adresse select pid, '89353', ' Glött ', ' Carossastr', '183' from person where person.vname = 'Percy' and person.name = 'Brookshire';
insert into adresse select pid, '42281', ' Wuppertal ', ' Methweg ', '83' from person where person.vname = 'Leila' and person.name = 'Criner';
insert into adresse select pid, '25575', ' Beringstedt ', ' Sanddornweg', '130' from person where person.vname = 'Clayton' and person.name = 'Dewolfe';
insert into adresse select pid, '89077', ' Ulm ', ' Immelmannstr', '190' from person where person.vname = 'Misty' and person.name = 'Lefevre';
insert into adresse select pid, '2708', ' Rosenbach ', ' Hüfferstr', '174' from person where person.vname = 'Shanti' and person.name = 'Dey';
insert into adresse select pid, '56630', ' Kretz ', ' Liboristr', '88' from person where person.vname = 'Belva' and person.name = 'Bogner';
insert into adresse select pid, '57518', ' Alsdorf ', ' Werkstattstr', '13' from person where person.vname = 'Darla' and person.name = 'Bradley';

--fachgebiet

insert into Fachgebiet (name) values ('Allgemeinchirurgie');
insert into Fachgebiet (name) values ('Anästhesiologie');
insert into Fachgebiet (name) values ('Augenheilkunde');
insert into Fachgebiet (name) values ('Frauenheilkunde');
insert into Fachgebiet (name) values ('Gefäßchirurgie');
insert into Fachgebiet (name) values ('Geriatrie');
insert into Fachgebiet (name) values ('Innere Medizin');
insert into Fachgebiet (name) values ('Kinder- und Jugendheilkunde');
insert into Fachgebiet (name) values ('Kindererchirurgie');
insert into Fachgebiet (name) values ('Mund-, Kiefer- und Gesichtschirurgie');
insert into Fachgebiet (name) values ('Neurologie');
insert into Fachgebiet (name) values ('Nuklermedizin');
insert into Fachgebiet (name) values ('Orthopädie');
insert into Fachgebiet (name) values ('Radiologie');
insert into Fachgebiet (name) values ('Unfallchirurgie');


--patient

insert into patient select pid, 'aok', 76.9, 177  from person where vname = 'Daniel' and name = 'Mcdonough';
insert into patient select pid, 'bkk', 54.3, 193.9  from person where vname = 'Lashunda' and name = 'Brwon';
insert into patient select pid, 'ikk', 112.7, 158.3  from person where vname = 'Ashlie' and name = 'Quinton';
insert into patient select pid, 'tk', 79.8, 189.9  from person where vname = 'Percy' and name = 'Brookshire';
insert into patient select pid, 'aok', 45.7, 194.1  from person where vname = 'Leila' and name = 'Criner';
insert into patient select pid, 'bkk', 93.9, 189.6  from person where vname = 'Clayton' and name = 'Dewolfe';
insert into patient select pid, 'tk', 70.4, 166.2  from person where vname = 'Misty' and name = 'Lefevre';
insert into patient select pid, 'barmer', 84.4, 187.5  from person where vname = 'Shanti' and name = 'Dey';
insert into patient select pid, 'aok', 70, 179.3  from person where vname = 'Belva' and name = 'Bogner';
insert into patient select pid, 'ikk', 115.1, 173.2  from person where vname = 'Darla' and name = 'Bradley';

--arzt

insert into Arzt select pid, '3000.56','1999-05-01','9999-01-01',1 from person where name ='Chavis' and vname='Rickie';
insert into Arzt select pid, '2644.82','2018-09-01','2020-12-01',8 from person where name ='Aaron' and vname='Crystle';
insert into Arzt select pid, '3599.80','2010-11-24','2025-01-01',3 from person where name ='Rainer' and vname='Ozella';


--pfleger

insert into Pfleger select pid, '1042.5','2015-11-15','2019-12-24','Gesundheits- und Krankenpfleger','10' from person where name ='Berends' and vname='Nickie';
insert into Pfleger select pid, '1380.2','2013-08-25','2019-02-15','Medizinisch- technischer Assistent','8' from person where name ='Gingrich' and vname='Phebe';
insert into Pfleger select pid, '1888.2','2010-02-25','2023-11-04','Gesundheits- und Krankenpfleger','10' from person where name ='Landis' and vname='Ahmed';
insert into Pfleger select pid, '1741.3','2016-10-16','2019-07-13','Gesundheits- und Krankenpfleger','9' from person where name ='Gailey' and vname='Valeria';
insert into Pfleger select pid, '1464.1','2011-03-16','2035-11-05','Medizinisch- technischer Assistent','8' from person where name ='Bullins' and vname='Randal';
insert into Pfleger select pid, '1222.9','2012-05-25','2023-05-08','Gesundheits- und Krankenpfleger','10' from person where name ='Dempsey' and vname='Jeanelle';
insert into Pfleger select pid, '1657.4','2011-08-31','2019-11-17','Gesundheits- und Krankenpfleger','9' from person where name ='Clowers' and vname='Janiece';


-- krankheit

insert into Krankheit values ('a15','Tuberkulose');
insert into Krankheit values ('b20','HIV');
insert into Krankheit values ('c51','Bösartige Neubildungen der weiblichen Genitalorgane');
insert into Krankheit values ('e10','Diabetes mellitus');
insert into Krankheit values ('j09','Grippe');


--symptom

insert into Symptom (name) values ('Bauchschmerzen');
insert into Symptom (name) values ('Kopfschmerzen');
insert into Symptom (name) values ('Übelkeit');
insert into Symptom (name) values ('Harndrang');
insert into Symptom (name) values ('Fieber');

--hatsymptom

insert into hatsymptom values ('a15',1);
insert into hatsymptom values ('a15',3);
insert into hatsymptom values ('a15',4);
insert into hatsymptom values ('b20',5);
insert into hatsymptom values ('c51',1);
insert into hatsymptom values ('j09',2);
insert into hatsymptom values ('j09',3);


--Medikament

insert into Medikament values ('18999998','Acetylsalicylsäure-Kapseln 500 mg');
insert into Medikament values ('22999898','Ascorbinsäure');
insert into Medikament values ('91999999','Enzianwurzel');
insert into Medikament values ('65999999','Eucalyptusöl');
insert into Medikament values ('10099999','Heidelbeeren');
insert into Medikament values ('70999999','Pfefferminzöl');


--einsetzbar

insert into einsetzbar values (91999999,'a15');
insert into einsetzbar values (91999999,'j09');
insert into einsetzbar values (91999999,'c51');
insert into einsetzbar values (22999898,'a15');
insert into einsetzbar values (65999999,'a15');
insert into einsetzbar values (65999999,'c51');
insert into einsetzbar values (10099999,'c51');
insert into einsetzbar values (70999999,'j09');


--Wechselwirkung

insert into wechselwirkung values ('',18999998,70999999);
insert into wechselwirkung values ('Kapseln und Öl',18999998,65999999);
insert into wechselwirkung values ('',18999998,91999999);
insert into wechselwirkung values ('Wurzel und Beeren',91999999,10099999);
insert into wechselwirkung values ('',22999898,18999998);

--Behandlung

insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2018-06-22 14:01:40', 'a15',8,11);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2018-05-21 03:26:19', 'c51',8,12);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2016-06-12 14:06:40', 'c51',9,13);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2015-09-02 04:31:56', 'a15',10,14);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2017-06-28 14:38:40', 'a15',8,15);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2018-09-14 14:13:01', 'j09',8,16);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2018-07-04 03:43:39', 'j09',9,17);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2018-08-29 19:37:15', 'c51',10,18);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2018-06-29 11:35:20', 'a15',10,19);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2017-10-22 16:57:04', 'c51',9,20);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2015-09-02 04:31:56', 'a15',10,14);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2010-06-28 14:38:40', 'a15',8,15);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2015-06-12 14:06:40', 'c51',9,13);
insert into Behandlung (datum,whoid,arzt_pid,patient_pid) values ('2008-09-14 14:13:01', 'j09',8,16);


--verwendet

insert into verwendet values (18999998,1);
insert into verwendet values (18999998,4);
insert into verwendet values (18999998,5);
insert into verwendet values (18999998,9);
insert into verwendet values (22999898,1);
insert into verwendet values (22999898,4);
insert into verwendet values (22999898,5);
insert into verwendet values (18999998,2);
insert into verwendet values (65999999,3);
insert into verwendet values (18999998,8);
insert into verwendet values (65999999,10);
insert into verwendet values (70999999,10);
insert into verwendet values (10099999,6);
insert into verwendet values (10099999,7);
insert into verwendet values (91999999,7);


refresh materialized view arzt_overview;