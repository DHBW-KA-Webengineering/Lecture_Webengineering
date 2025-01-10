---
title: "Vorlesung Webengineering 1 - Serverseitiges JavaScript mit NodeJS"
topic: "Webengineering_1_2_3"
author: "Lukas Panni"
theme: "Berlin"
colortheme: "dove"
fonttheme: "structurebold"
fontsize: 12pt
urlcolor: olive
linkstyle: boldslanted
aspectratio: 169
lang: de-DE
section-titles: true
plantuml-format: svg
...

# Node.js

## Node.js

- Open Source (MIT) JavaScript Runtime
  - Ausführung von JavaScript außerhalb des Browsers
  - \rightarrow{} z.B. Webserver, Desktop
- Basiert auf V8-Engine des Chromium-Projekts
- Gut geeignet für Webanwendungen
  - Eventbasiert
  - Non-Blocking I/O, insbesondere Netzwerk
  - \rightarrow{} Kann mit wenigen Ressourcen (insbesondere RAM) viele Anfragen bearbeiten

[Node.js](https://nodejs.org/en/)

## Node.js Installation (1)

- Node.js kann über Installer oder Paketmanager installiert werden
  - [Windows Installer](https://nodejs.org/en/download/)
  - [Windows winget](https://winget.run/pkg/OpenJS/NodeJS) `winget install -e --id OpenJS.NodeJS`
  - [macOS Installer](https://nodejs.org/en/download/)
  - [macOS Homebrew](https://formulae.brew.sh/formula/node) `brew install node`
  - [Linux Package Manager](https://nodejs.org/en/download/package-manager/)

## Node.js Non-Blocking I/O (1)

```javascript
const fs = require("fs");

console.log("Start");

fs.readFile("./test.txt", (error, data) => {
  console.log("Daten gelesen: ");
  console.log(data.toString());
});

console.log("Ende");
```

## Node.js Non-Blocking I/O (2)

### Ausgabe

```text
Start
Ende
Daten gelesen:
Test-File Line 1
Test-File Line 2
```

## Node.js Non-Blocking I/O (3)

### Erklärung

- Modul `fs` (File System) wird über require eingebunden und ist über Variable `fs` verfügbar
  - Mehr zu Modulen später
- Ausgabe `console.log("Start")` wird sofort ausgeführt
- `fs.readFile` wird mit einer Callback-Funktion aufgerufen
  - Datei lesen ist aufwändig, daher standardmäßig asynchron
  - Aufgabe wird an Betriebssystem übergeben \rightarrow{} Node.js kann nächste Aufgaben bearbeiten!
  - Sobald Betriebssystem fertig ist, wird Callback-Funktion mit den Ergebnissen aufgerufen
- Ausgabe `console.log("Ende")` wird sofort ausgeführt

## Node.js Non-Blocking I/O (4)

- Standard-Module für File System, Netzwerk, Timer, ... sind asynchron
  - Ähnliche API wie bei `readFile` gezeigt
  - Beim Aufruf wird eine Callback-Funktion übergeben
  - Callback-Funktion wird aufgerufen, sobald die Aufgabe erledigt ist
- Meist zusätzlich auch synchroner Aufruf möglich
  - z.B. `fs.readFileSync` statt `fs.readFile`
  - \rightarrow{} Blockiert Node.js bis Aufgabe erledigt ist
  - \rightarrow{} Am besten vermeiden!

## Node.js Blocking I/O (1)

### Beispiel Synchron

```javascript
const fs = require("fs");

console.log("Start synchron");

const data = fs.readFileSync("./test.txt");
console.log("Daten synchron gelesen: ");
console.log(data.toString());

console.log("Ende synchron");
```

## Node.js Blocking I/O (2)

### Ausgabe

```text
Start synchron
Daten synchron gelesen:
Test-File Line 1
Test-File Line 2
Ende synchron
```

## Node.js Non-Blocking I/O mit Promises (1)

- Callbacks sind nicht ideal
  - Verschachtelete Callbacks sind schwer zu lesen
  - Fehlerbehandlung ist schwierig
  - \rightarrow{} Promises sind eine bessere Alternative
- Ab Node.js 10 ist für `fs` auch eine Promise-basierte API verfügbar
  - Import über `const fs = require("fs").promises;`
  - Um `await` zu nutzen, muss der Code in einem `async`-Block stehen oder in der `package.json`, `{"type": "module"}` gesetzt werden (dann import über `import { promises } from "fs";`)

## Node.js Non-Blocking I/O mit Promises (2)

```javascript
import { promises as fs } from "fs";
// Alternativ: Promise-basierte API
console.log("Start Promise");

const readPromise = fs.readFile("./test.txt");
console.log("Lesen im Hintergrund gestartet");
const data = await readPromise;
console.log("Daten mit Promise gelesen: ");
console.log(data.toString());

console.log("Ende Promise");
```

## Node.js Non-Blocking I/O mit Promises (3)

### Ausgabe

```text
Start Promise
Lesen im Hintergrund gestartet
Daten mit Promise gelesen:
Test-File Line 1
Test-File Line 2
Ende Promise
```

## Node.js HTTP-Server

```javascript
import createServer from "http";

createServer((request, response) => {
  response.writeHead(200, {
    "Content-Type": "text/html",
  });
  response.write(
    "<!DOCTYPE html>\n<html>\n<head>\n<title>Test</title>\
    \n</head>\n<body>\n<h1>Test</h1>\n</body>\n</html>\n"
  );
  response.end();
}).listen(80);
```

## Praxisaufgabe 1

Schreibt einen einfachen HTTP-Server, der HTML, CSS und JavaScript-Dateien ausliefern kann.
Der Server soll auf Port 80 laufen und bei einem Aufruf der URL `http://localhost/` oder `http://localhost/index.html` die Datei `index.html` ausliefern.
Bei einem Aufruf der URL `http://localhost/style.css` soll die Datei `style.css` ausgeliefert werden.
Analog auch für `/script.js`.
Bei allen anderen Anfragen soll ein Fehler ausgegeben werden.

Achtet auf die richtigen _Content-Types_ und _Status-Codes_!

Argumente von `createServer`: `request`: [http.IncomingMessage](https://nodejs.org/api/http.html#class-httpincomingmessage), `response`: [http.ServerResponse](https://nodejs.org/api/http.html#class-httpserverresponse)

# Modules und Pakckages

## Module in Node.js

- Einige Standard-Module sind in Node.js integriert: `fs`, `http`, `os`, `net` ...
- Ein Modul ist eine abgeschlossene Einheit mit **wiederverwendbarer Funktionalität**
  - Bessere Strukturierung von Code
  - Wird inzwischen auch in Browsern unterstützt
- Historisch mehrere Modulsysteme für Node.js:
  - CommonJS (CJS)
  - ECMAScript Modules (ESM)

## CommonJS vs. ECMAScript Modules (1)

**CJS**: Standard in Node.js (bei Extension `.js`)

- Import über `require()` Funktion
  - Import zur Laufzeit möglich (dynamisch)
- Export über `module.exports` Objekt

## CommonJS vs. ECMAScript Modules (2)

**ESM**: In Node.js über Extension `.mjs` oder `package.json`-Einstellung `{"type": "module"}` aktivierbar

- Import über `import XY` Statement
  - Kein dynamischer Import
  - Import einzelner Teile möglich (z.B. `import { readFileSync } from "fs";`)
- Export über `export` Statement
  - Benannter Export möglich (z.B. `export function XY ...`)
- Moderner und heute empfohlen

## CommonJS vs. ECMAScript Modules (3)

```javascript
// CJS
const fs = require("fs");
const data = fs.readFileSync("./test.txt");
module.exports = data;
```

```javascript
// ESM
import { readFileSync } from "fs";
const data = readFileSync("./test.txt");
export default data;
```

## Eigene Module

- Wiederverwendbare Komponenten über `module.exports` (CJS) oder `export` (ESM) exportieren
  - Funktion, Klasse, Objekt, ...
  - Auch zur reinen Strukturierung von Code möglich
- In anderen Dateien über die jeweiligen Import-Mechanismen einbinden
  - In der Regel über relativen Pfad
    - `import XY from "./xy.js";` (ESM)
    - `const XY = require("./xy.js");` (CJS)

## Packages in Node.js

- **Module** = eine JavaScript-Datei
- **Package** = "A package is a folder tree described by a `package.json` file." ([Node.js Dokumentation](https://nodejs.org/api/packages.html))
  - Enthält mindestens ein Modul
  - Wird über Konfigurationsdatei `package.json` beschrieben
  - Umfasst alle Unterordner, die kein `package.json` oder einen Unterordner `node_modules` enthalten

## Package-Manager npm

- Node.js bringt einen **Package-Manager** mit: `npm`
- Installation von vorgefertigten Packages aus dem Internet
  - Standard-Registry: [npmjs.com](https://www.npmjs.com/)
  - Installation in `node_modules`-Ordner und Eintrag in `package.json`
  - Installation aller Abhängigkeiten
- Funktionen von Packages können über `require()` (CJS) oder `import` (ESM) importiert werden

## Arbeit mit npm

- Projekt initialisieren: `npm init`
  - Erstellt `package.json` mit Basisinformationen
- Package installieren: `npm install <package>` (kurz `npm i <package>`)
  - `--save-prod (-P)`: Package in `package.json` unter `dependencies` eintragen (default)
  - `--save-dev (-D)`: Package in `package.json` unter `devDependencies` eintragen
  - `--global (-g)`: Package global (nicht im aktuellen Projekt) installieren
- Package entfernen: `npm uninstall <package>`

## Risiken bei Verwendung von npm

- Packages können beliebigen Code ausführen (Zur Laufzeit und bei der Installation)
  - \rightarrow{} Sicherheitsrisiko!
- Packages können beliebige Abhängigkeiten haben
  - Kein Überblick über verwendeten Code
  - \rightarrow{} Erhöht das Sicherheitsrisiko: sogenannte Lieferkettenangriffe (Supply Chain Attacks)
- Lizenzrisiken
  - Packages können beliebige Lizenzen haben
  - Bei **Auslieferung** von Software (auch Bereitstellung im Internet) müssen Bedingungen beachtet werden
  - \rightarrow{} rechtliche Folgen möglich!
- \rightarrow{} Packages nur von vertrauenswürdigen Quellen installieren!

## npm Alternativen

- Verschiedene alternative Package Manager mit jeweils eigenen Stärken
  - [yarn](https://yarnpkg.com/)
    - Schneller
    - Besseres Caching
  - [pnpm](https://pnpm.io/)
    - Schneller
    - Weniger Speicherplatzverbrauch durch Teilen von Packages zwischen Projekten
    - Guter Monorepo support

# express

## express

- Open Source (MIT) Webframework für Node.js
  - Leichtgewichtig, flexibel, erweiterbar
  - Weit verbreitet (> 30.000.000 Downloads/Woche)
  - Besonders für APIs genutzt, kann aber auch als einfacher HTTP-Server genutzt werden

Ressourcen:

- [express Website](https://expressjs.com/)
- [express GitHub](https://github.com/expressjs/express)
- [express npm](https://www.npmjs.com/package/express)

## express Installation

**Installation**:
  - `npm install express`
  - `yarn add express`
  - `pnpm install express`

**Import**:

- CJS: `const express = require("express");`
- ESM: `import express from "express";`

## express Minimalbeispiel mit ESM (1)

### package.json:

```json
{
  "type": "module",
  "dependencies": {
    "express": "*"
  }
}
```

## express Minimalbeispiel mit ESM (2)

Siehe [express-basics](https://github.com/TINF23B5-Webengineering/Lecture_Code/tree/2025/22_Node_express/express-basics)

### simple-express-server:

```javascript
import express from "express";

const app = express();
app.get("/", (request, response) => {
  response.send("Server funktioniert!");
});
app.listen(80, () => {
  console.log("Server gestartet");
});
```

## express Minimalbeispiel mit ESM (3)

### Ausführen

```bash
$ npm install
$ node simple-express-server.js
> Server gestartet
```

### Aufruf

```bash
$ curl localhost
> Sever funktioniert!
```

## express Minimalbeispiel mit ESM (4)

![Erklärung express Minimalbeispiel](./media/express_basics.pdf){height=80%}

## express Request Handler (1)

Grundkonzept in express: **Request Handler** für bestimmte **Routen**

- Routen werden über **HTTP-Methoden** und **URL-Pfade** definiert
  - `app.METHOD(PATH, HANDLER)`, z.B. `app.get("/", ...)` oder `app.post("/users", ...)`
  - `METHOD`: HTTP-Methode (`GET`, `POST`, `PUT`, `DELETE`, ...)
  - `PATH`: relativer Pfad (`/`, `/users`, ...)
  - `HANDLER`: Funktion, die aufgerufen wird, wenn die Route aufgerufen wird

## express Request Handler (2)

- Parameter für Request Handler:

  - `request`: Anfrage-Objekt (enthält z.B. URL-Pfad, HTTP-Methode, Anfrage-Body, ...)
  - `response`: Antwort-Objekt (festlegen von z.B. Status-Code, Header, Antwort-Body)
  - `next`: Nächsten Request Handler ausführen

- \rightarrow{} Mehrere Request Handler für eine Route möglich
  - Explizit mit `next()` nächsten Request Handler aufrufen

## express Request Handler - Antwort erzeugen

- `response.write` schreibt Daten in den Antwort-Body (sendet direkt an Client!)
- `response.end` sendet die Antwort, danach kein `response.write` mehr möglich
- `response.send` = `response.write` + `response.end`
  - - automatisches setzen von `Content-Type` und `Content-Length`-Header
  - - automatisches konvertieren von Objekten und Arrays zu JSON
  - \rightarrow{} `response.send` zu bevorzugen

## Mehrere Request Handler (1)

```javascript
app.get(
  "/",
  (request, response, next) => {
    response.write("Antwort von erstem Handler\n");
    next();
  },
  (request, response) => {
    setTimeout(() => {
      response.write("Antwort von zweitem Handler");
      response.end();
    }, 1000);
  }
);
```

## Mehrere Request Handler (2)

```javascript
app.get(
  "/",
  (request, response, next) => {
    response.locals.responseText = "Antwort von erstem Handler\n";
    next();
  },
  (request, response) => {
    setTimeout(() => {
      response.locals.responseText += "Antwort von zweitem Handler";
      response.send(response.locals.responseText);
    }, 1000);
  }
);
```

## Mehrere Request Handler (3)

- Antwort in `response.locals` speichern
  - Zugriff durch alle Request Handler
  - \rightarrow{} Schrittweiser Aufbau der Antwort
- `response.send` im letzen Request Handler, danach kann die Antwort nicht mehr verändert werden
  - Setzt Header automatisch und sendet Antwort an Client
- \rightarrow{} Besserer Ansatz, wenn Antwort schrittweise aufgebaut wird und kein Response streaming gewünscht ist.
  - Streaming (Antwort schrittweise senden) erfordert eventuell Anpassungen auf Client-Seite, kann aber vorteilhaft sein (z.B. wenn nicht alle Daten sofort verfügbar sind)

## express Request Handler - Header (1)

```javascript
app.get("/", (request, response) => {
  response.set("Content-Type", "text/plain");
  response.set({
    "Content-Language": "de-DE",
    "X-Powered-By": "Test-Server",
  });
  response.send("Plaintext-Antwort");
});
```

## express Request Handler - Header (2)

- Header mit `response.set` setzen
  - Einzelne Header: `key, value` als Parameter
  - Mehrere Header: Objekt mit jeweils `key: value` als Parameter
  - Für häufige Header gibt es teilweise eigene Methoden, z.B. `response.type("text/html")`


## express Request Handler - Status-Code

```javascript
app.get("/test", (request, response) => {
  response.status(404).send("Nicht gefunden");
});
```

- Setzen mit `response.status`, bevor `response.send` / `response.end` aufgerufen wird
- Standard-Status-Code ist `200` (OK)
  - Bei Exception: `500` (Internal Server Error) 


## express Request Handler - Request-Parameter

```javascript
app.get("users/:userid/items/:itemid?", (request, response) => {
  let responseText = `Empfangene User-ID: ${request.params.userid}`;
  responseText += `\nEmpfangene Item-ID: ${request.params.itemid}`;
  response.send(responseText);
});
```

- URL-Parameter werden über `:PARAMETERNAME` definiert
  - express parst die aufgerufene URL und extrahiert die Parameter
  - Zugriff im Handler über `request.params.PARAMETERNAME` als string
- Wenn Parameter optional sein sollen: `:PARAMETERNAME?`
  - Ansonsten bei fehlendem Parameter: `404` (Not Found), da keine Route passt
  - Wenn nicht gesetzt: `undefined`
  

## express Request Handler - Query-Parameter

- Query-Parameter (z.B. `?key1=value1&key2=value2`) werden von express automatisch extrahiert
  - Zugriff über `request.query` Objekt
  - Zugriff auf einzelne Parameter: `request.query.PARAMETERNAME`
  - **Best-Practice**: Nicht von Vorhandensein der Parameter ausgehen
    - Vorhandensein mit `PARAMETERNAME in request.query` prüfen
    - Wert mit `request.query.PARAMETERNAME || DEFAULTWERT` auslesen

## express Route-Wildcards

- Wildcards in Routen zur Abdeckung mehrerer Pfade mit einem Request Handler
  - `*`: Beliebige Zeichenkette (`/users/*` matcht `/users/`, `/users/1`, `/users/1/test`, ...)
  - `?`: Vorheriges Zeichen optional (`/users?` matcht `/users` und `/user`)
  - `+`: Vorheriges Zeichen mindestens 1 mal
  - `()`: Gruppierung von Zeichen
- Auch _reguläre Ausdrücke_ erlaubt: `/REGEX/`, zwischen `/` und `/`, **ohne** Anführungszeichen!

- Zugriff auf aufgerufenen Pfad über `request.path` (`request.url` für Pfad inkl. Query-Parameter)


## express Dateien ausliefern (1)

```javascript
app.get("/", (request, response) => {
  response.sendFile("./index.html", {root: ROOT_DIR});
});
```

- Relativer Pfad zu Datei, nur wenn `root`-Option gesetzt ist
  - Alle Pfade dann relativ zu `ROOT_DIR`
- Aktueller Ordner (ESM):
```javascript
import { fileURLToPath } from "url";
const folderPath = fileURLToPath(new URL(".", import.meta.url));
```

## Praxisaufgabe 2

Überarbeitet euren HTTP-Server aus der Praxisaufgabe 1, sodass er express nutzt.
Die Funktionalität soll gleich bleiben.
Setzt den Server-Root auf einen Unterordner `public`, nur Dateien aus diesem Ordner sollen ausgeliefert werden können!
Ohne Dateiendung soll automatisch nach einem Unterordner mit dem angefragten Namen und einer Datei `index.html` gesucht werden.


# express Middleware

## Middleware (1)

- express bringt nur wenig Funktionalität selbst mit
- Erweiterbar über sogenannte **Middleware**
  - Entspricht im Wesentlichen einem Request Handler: Parameter `request`, `response`, `next`
  - Wird **unabhängig** von HTTP-Methode **vor** Request Handlern ausgeführt
- Middleware kann z.B. für Logging, Authentifizierung, ... genutzt werden
  - Kann beliebigen Code ausführen
  - Kann Request und Response verändern (z.B. Header setzen oder Antwort senden)
- Wenn Middleware keine Antwort sendet, muss `next()` aufgerufen werden

## Middleware (2)

- Das express-Projekt spricht auch bei Request Handlern von Middleware
- Wir verwenden den Begriff **Middleware** für alle Funktionen, die keinen spezifischen Endpunkt (Methode + URL) behandeln
  - Stattdessen allgemeine Vorverarbeitung: z.B. Logging, Authentifizierung, ...
- Alles, was spezifische Endpunkte behandelt, bezeichnen wir als **Request Handler** oder **Route Handler**

Siehe dazu auch diese Antwort auf Stack Overflow: [a/58925330](https://stackoverflow.com/a/58925330)

## Middleware (3)

```javascript
app.use((request, response, next) => {
  console.log("Middleware aufgerufen");
  ...
  next();
});
```

- Registrieren auf Anwendungsebene mit `app.use(MIDDLEWARE)`
- Beschränken auf bestimmte Pfade mit `app.use(PATH, MIDDLEWARE)`


## static Middleware (1)

```javascript
import express from "express";
import { fileURLToPath } from "url";

const folderPath = fileURLToPath(new URL(".", import.meta.url));
const app = express();
app.use(express.static(folderPath));
app.listen(80, () => {
  console.log("Server gestartet");
});
```

## static Middleware (2)

- Erfüllt Praxisaufgabe 2
- Built-In Middleware zur Auslieferung statischer Dateien
  - Kann auf bestimmten Request-Pfad beschränkt werden
- `express.static` liefert Dateien aus, wenn sie im angegebenen Ordner gefunden werden
  - Ansonsten wird der Request weitergegeben (nächste Middleware / Request Handler)


## Nützliche Middlewares (npm)

- [cookie-parser](https://www.npmjs.com/package/cookie-parser) (`npm install cookie-parser`)
  - Parst Cookies aus Request-Header, Ergebnis in `request.cookies`
- [body-parser](https://www.npmjs.com/package/body-parser) (`npm install body-parser`)
  - Parst Request-Body in verschiedenen Formaten und Codierungen
- [cors](https://www.npmjs.com/package/cors) (`npm install cors`)
  - Ermöglicht Cross-Origin Resource Sharing (CORS)
  - Konfiguration: [Express cors middleware](https://expressjs.com/en/resources/middleware/cors.html)

## Exkurs: Cross-Origin Resource Sharing (CORS)

- Same-Origin-Policy: JavaScript auf Website kann nur auf Ressourcen mit gleichem Origin zugreifen
  - Same Origin: gleiches **Protokoll**, gleicher **Port** und gleiche **Domain**
  - z.B. JavaScript-Code von `https://example.com` darf nicht auf Ressourcen von `https://example.org` zugreifen
- CORS: Möglichkeit, Same-Origin-Policy (beschränkt) aufzuweichen
  - Angefragter Server kann Zugriff erlauben
  - Steuerung über HTTP-Header `Access-Control-Allow-*`

## CORS Header (1)

- `Access-Control-Allow-Origin`: Von welchen (anderen) Origins aus, darf auf diese Ressource zugegriffen werden?
  - `ORIGIN` / `*`: Nur Zugriffe von `ORIGIN` / Alle Zugriffe erlaubt \rightarrow{} **vorsichtig einsetzen**
- `Access-Control-Allow-Methods`: Welche HTTP-Methoden sind für CORS erlaubt?
  - `METHOD` / `*`: Analog zu `Access-Control-Allow-Origin`

## CORS Header (2)

- `Access-Control-Allow-Credentials`: Dürfen Authentifizierungsdaten (z.B. Cookies) von anderen Origins mitgeschickt werden?
  - `true` / `false`
  - Auf Client Seite (`fetch`-API) muss zusätzlich `credentials: "include"` gesetzt werden
  - Gefahr von [CSRF](https://developer.mozilla.org/en-US/docs/Glossary/CSRF)-Angriffen \rightarrow{} **vorsichtig einsetzen**


## express Middleware Beispiel (1)

![express Middleware Beispiel](./media/express_middleware.pdf){height=80%}

## express Middleware Beispiel (2)

![express Middleware Visualisierung](./media/express_middleware_visualization.pdf){height=80%}


## express Router

- express Router ermöglichen das Gruppieren von Routen
  - Router können in eigenen Dateien definiert werden\rightarrow{} bessere Code-Struktur
  - Schachtelung von Routern möglich
  - Registrieren von Middleware auf Router-Ebene möglich
- Erstellen eines Routers: `const router = express.Router();`
  - Registrieren von Middleware und Request Handlern: `router.use(PATH?, MIDDLEWARE)`, `router.METHOD(PATH, HANDLER)`
- Registrieren von Router: `app.use(PATH, ROUTER)`

## express Router Beispiel

app-router.js
```javascript
import { router as userRouter } from "./user-router.js";
app.use("/users", userRouter);
```

user-router.js
```javascript
import express from "express";
export const router = express.Router();

router.get("/", (request, response) => {
   response.send([{ id: 1, name: "Lukas" }, ...]);
});
```


