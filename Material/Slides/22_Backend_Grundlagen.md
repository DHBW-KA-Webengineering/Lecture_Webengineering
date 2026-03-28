---
title: "Vorlesung Webengineering 1 - Grundlagen Backend"
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

# Grundlagen Backend

## Unterscheidung Frontend - Backend

- Architekturmuster: Layer
  -> Warum Aufteilung? Aufteilung der Aufgaben

## Gruppenarbeit Online Shop

### Flow: Ich möchte ein neues MacBook kaufen

## Aufgaben Frontend Online Shop

- Produktliste anzeigen
- Produktbilder darstellen
- Suche & Filter bedienen
- Produkt konfigurieren (z. B. RAM, Speicher)
- Warenkorb anzeigen & aktualisieren
- Checkout-Formular darstellen
- Buttons & Interaktionen („Kaufen“)
- Ladezustände (Spinner)

## Aufgaben Backend Online Shop

- Produkte aus Datenbank laden
- Preise korrekt berechnen
- Verfügbarkeit prüfen
- Warenkorb serverseitig verwalten
- Bestellung speichern
- Zahlung verarbeiten (z.B. PayPal)
- Nutzer authentifizieren (Login)
- Bestellbestätigung versenden (E-Mail)

## Aufgaben Frontend allgemein

- Darstellung von Daten (UI)
- Benutzerinteraktion (Klicks, Eingaben)
- Formularverarbeitung (UX-seitig)
- Zustandsverwaltung (z. B. UI-State)
- Validierung (für schnelles Feedback)
- Kommunikation mit Backend (HTTP Requests)
- Anzeige von Lade- & Fehlerzuständen

=> Fokus: Benutzererlebnis (UX)

## Aufgaben Backend allgemein

- Daten persistent speichern (Datenbank)
- Geschäftslogik umsetzen
- Validierung & Sicherheit
- Authentifizierung & Autorisierung
- APIs bereitstellen
- Zustände verwalten (z. B. Sessions)
- Integration externer Services
- Skalierung & Performance

=> Fokus: Logik, Daten, Sicherheit

# Kommunikation Frontend - Backend

## Grundprinzip HTTP

- HTTP ist **zustandslos**
- Auf einen _Request_ folgt eine _Response_
- _Clients_ stellen Requests, _Server_ beantworten sie

![HTTP Request/Response](media/http_req_res.png)

## Request/Response Struktur

- Textbasiertes Protokoll
- Request: `<Methode> <Resource> <Protokoll><CR><LF>`
  - gefolgt von _Header_-Zeilen und optionalem _Body_
  - endet mit einer leeren Zeile (`<CR><LF>`)
- Response: `<Protokoll> <Status-Code> <Status-Text><CR><LF>`
  - gefolgt von _Header_-Zeilen und optionalem _Body_
  - endet mit einer leeren Zeile (`<CR><LF>`)

## Wichtige HTTP Methoden

| **Methode** | **Beschreibung**    | **Idempotent** | **Safe** |
| ----------- | ------------------- | -------------- | -------- |
| **GET**     | Ressource abrufen   | Ja             | Ja       |
| **POST**    | Ressource erstellen | Nein           | Nein     |
| **PUT**     | Ressource ersetzen  | Ja             | Nein     |
| **DELETE**  | Resource löschen    | Ja             | Nein     |

## HTTP Status Codes

Aufgeteilt in 5 Gruppen:

| **Bereich** | **Kategorie** | **Zweck**                                                                       |
| ----------- | ------------- | ------------------------------------------------------------------------------- |
| 1xx         | Informational | Informationen über den aktuellen Stand, kaum relevant                           |
| 2xx         | Success       | Request war erfolgreich                                                         |
| 3xx         | Redirection   | Client muss andere Seite aufrufen, Server teilt dem Client mit welche / Auswahl |
| 4xx         | Client Error  | Fehler, der Client ist schuld                                                   |
| 5xx         | Server Error  | Fehler, der Server ist schuld                                                   |


## REST (1)

> **Representational State Transfer**

Prinzipien:
- Ressources with unique Identifiers
- Links & Hypermedia
- Uniform Interfaces
- Multiple Representations
- Stateless Interactions

## REST (2)

- **Ressourcen** stehen im Mittelpunkt der Anwendung
  - z.B. Produkte, Nutzer, Prozesse, Bestellungen, ...
  - eindeutig identifizierbar und addressierbar
- Einheitliche Schnittstellen \rightarrow{} HTTP Methoden
  - Klare Semantik von Methoden und Status Codes

## REST API Design




-> Vertiefung REST API Design (insbesondere Methoden + Semantik)

- Mapping von Use-Cases auf Endpunkte, API Strukturen

## Praxisbeispiel URLs und HTTP Methoden

Einführung von HTTP Test Tools (curl, postman/posting etc.)

## Limitierungen von Standard REST APIs

-> Nur Synchrone Kommunikation, Request-Response
Sammeln was nicht geht, bzw. nicht so gut unterstützt wird

## Fortgeschrittene HTTP Konzepte

- Streaming (z.B. LLM), Server-Sent Events, CORS, CSP

## Alternative Kommunikationswege

- WebSockets (ist eigentlich auch ein HTTP Feature)
- GraphQL, gRPC

# Praxis

## Mocking von Backend für Frontend-Entwicklung

## OpenAPI / Swagger
