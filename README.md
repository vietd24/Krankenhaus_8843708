## 8843708 Krankenhaus DB

# 1 Datenbank erstellen
- login als postgres in beliebige Datenbank
- ( \i ... )
- import von **krankenhaus_project.pgsql**
- import von **random_data.pgsql**
- erstellte datenbank heißt:  "krankenhaus"

# 2 Frontend
- [nodejs installieren (min. Version 8)](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
- zip entpacken
- "npm install" ausfuehren in Frontend
- **Frontend--index.js** anpassen:
    - unter **const Pool** host,port,user,password, database name ggf. aendern
- in /Frontend/ ausfuehren:
    - **node ./index.js**
- [Frontend](localhost:3000) aufrufen