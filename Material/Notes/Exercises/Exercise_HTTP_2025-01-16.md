---
title: Übungsaufgabe HTTP
date: 2025-01-16
lang: de-DE
author: "Silas Schnurr"
...

# Übungsaufgabe HTTP

Bei dieser Übung ist es Ihre Aufgabe mithilfe von Express.js, ein REST Backend zu implementieren, um die Grundlagen von HTTP und REST zu vertiefen. Erstellen Sie zunächst ein Projekt, entwickeln Sie eine API mit mehreren Endpunkten und testen Sie diese anschließend.

## Projekt erstellen

Legen Sie eine package.json Datei an, um das Projekt zu initialisieren.

**package.json**:

```json
{
  "name": "simple-backend",
  "version": "1.0.0",
  "description": "This is a simple node backend",
  "main": "main.js",
  "scripts": {
    "start": "node main.js"
  }
}
```

Initialisieren Sie das Projekt mit den folgenden Befehlen:
`npm install -g express-generator`
`npm install express --save`

Mit `npm run start` kann das Projekt gestartet werden.

## Backend entwickeln

Erstellen Sie eine Datei main.js und implementieren Sie die Basis des Backends. Ein Beispiel-Endpunkt ist bereits vorgegeben:

**main.js**:

```javascript
var express = require("express");
var app = express();
app.listen(8080, () => {
  console.log("Listening on port 8080");
});

// example GET Endoint
app.get("/example", (req, res, next) => {
  res.json({ message: "This is an example endpoint." });
});
```

Implementieren Sie die folgenden Endpunkte. Bestimmen Sie selbst die passenden HTTP-Methoden sowie die Struktur der Request- und Response-Payloads:

- `/users`: Gibt eine Liste von Benutzerobjekten mit Benutzername, Name, Id und Geburtsdatum zurück.
- `/users`: Fügt einen neuen Benutzer hinzu. Die erforderlichen Daten sollen aus dem Request übermittelt werden.
- `/users/:id`: Gibt die Details eines Benutzers basierend auf der ID zurück.
- `/users/:id`: Aktualisiert die Informationen eines Benutzers basierend auf der ID. Die erforderlichen Daten sollen aus dem Request übermittelt werden.
- `/users/:id`: Aktualisiert einen Teil der Informationen eines Benutzers basierend auf der ID. Die zu aktualisierenden Daten sollen aus dem Request übermittelt werden.
- `/users/:id`: Löscht einen Benutzer basierend auf der ID.

### Hinweise

- Verwenden Sie die [Dokumentation von express.js](https://expressjs.com/en/5x/api.html).
- Überlegen Sie, welche HTTP-Methoden für die jeweiligen Endpunkte sinnvoll sind.
- Definieren Sie die notwendigen Request- und Response-Payloads entsprechend den Anforderungen der jeweiligen Endpunkte.
- Achten Sie darauf, sinnvolle Status-Codes für die HTTP-Antworten zu verwenden.
- Speichern der Daten in einer Liste oder einem einfachen Array, um die Funktionalität zu demonstrieren.

**Optional können Sie zusätzliche Features implementieren, wie z. B.:**

- Fehlerbehandlung (z. B. “Benutzer nicht gefunden”).
- Validierung der Request-Daten.

## Backend aufrufen

Testen Sie Ihre Endpunkte mit einem der folgenden Werkzeuge:

- Postman: Ein grafisches Tool zur HTTP-Request-Simulation.
- Insomnia: Ein grafisches Tool zur HTTP-Request-Simulation.
- cURL: Für CLI-basierte Anfragen.
- Browser: Für einfache GET-Anfragen.
- Implementieren Sie ein eigenes Frontend, um das Backend in einer Benutzeroberfläche zu testen.
