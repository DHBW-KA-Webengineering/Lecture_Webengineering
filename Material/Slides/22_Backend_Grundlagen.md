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

## Theoretische Fragen

- Erläutere die Aufgaben des Backends in einer Webanwendung
- Erläutere die Aufgaben des Frontends in einer Webanwendung

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

## Theoretische Fragen

- Erkläre den Aufbau eines HTTP-Requests
- Welche HTTP Methode sollte für das Aktualisieren einer Ressource genutzt werden
- Welche HTTP Methoden sind Idempotent? Welche Safe?

# REST API Design Grundlagen

## Grundlagen

- Design ausgehend von Ressourcen \rightarrow{} Daten
  - Welche Ressourcen gibt es?
  - In Welcher Beziehung stehen sie zueinander?
  - Welche Aktionen können auf Ressourcen ausgeführt werden?

## Beispiel Benutzerverwaltung

### Aufgabe 1 (15 min):

Dokumentiert in Kleingruppen (2-3 Personen) die grundlegenden Informationen für ein Standard-Benutzerverwaltungssystem für eine Webanwendung:

- Ressourcen und deren Eigenschaften (welche Daten gehören zu einer Ressource?)
- Beziehungen zwischen den Ressourcen
- Mögliche Aktionen auf den Ressourcen

## Besprechung Benutzerverwaltung

### Zwei Gruppen stellen ihre Ergebnisse vor

## Ressourcen auf HTTP Endpunkte abbilden (1)

- Ressourcen werden über HTTP Endpunkte adressiert
- Verwendung von Substantiven (englisch) im Plural für URL-Pfade
  - Benutzer \rightarrow{} `/users`
  - Produkte \rightarrow{} `/products`
- Eindeutige Identifikation einzelner Ressourcen durch IDs
  - z.B. `/users/123` für Benutzer mit ID 123
  - \rightarrow{} Datenmodell muss eindeutige IDs vorsehen
- Geschachtelte Pfade können für hierarchische Beziehungen genutzt werden
  - z.B. `/users/123/orders` für Bestellungen eines Benutzers

## Ressourcen auf HTTP Endpunkte abbilden (2)

- Verwendung von HTTP Methoden Semantik für Aktionen auf Ressourcen
- Unterscheidung zwischen Sammlung von Ressourcen (_Collection_ `/users`) und einzelnen Ressourcen (`/users/123`) beachten
  - `GET /users` \rightarrow{} Alle Benutzer abrufen
  - `GET /users/123` \rightarrow{} Benutzer mit ID 123 abrufen
- Typische Aktionen: **CRUD** (Create, Read, Update, Delete)

## Ressourcen auf HTTP Endpunkte abbilden (3)

### Aufgabe 2 (10 min):

Füllt die folgende Tabelle für eure Benutzerverwaltung aus:
| **Aktion** | **HTTP Methode** | **Endpunkt** |
| ------------ | ----------------- | ------------ |
| Alle Benutzer abrufen | `GET` | `/users` |
| ... | ... | ... |

Fokus auf CRUD Operationen.

## Ressourcen auf HTTP Endpunkte abbilden (4)

- Erstellen einer neuen Ressource: `POST /users`
  - ID ist vor Erstellung noch nicht bekannt, wird vom Server generiert
  - Es gibt eine implizite Collection, API Consumer können keine neue Collection erstellen
- Neben der Semantik der HTTP Methoden sind auch die Eigenschaften _Idempotenz_ und _Safety_ wichtig

## Idempotenz

> Eine Operation ist idempotent, wenn sie 1 oder n mal ausgeführt werden kann, ohne dass sich das Ergebnis ändert

- Idempotente Methoden können sicher wiederholt werden, ohne unerwünschte Nebeneffekte zu verursachen
- Es ist immer mit Netzwerkfehlern zu rechnen, retries für idempotente Methoden sind unproblematisch
- Erleichtert Caching

## Safety

> Eine Operation ist safe, wenn sie 0 oder n mal ausgeführt werden kann, ohne dass sich das Ergebnis ändert

- Operation ohne Seiteneffekte
- Zustand der Ressource auf dem Server wird nicht verändert
- Safe Methoden können ohne Risiko ausgeführt werden, z.B. prefetching von Daten, Caching

## Idempotenz und Safety umsetzen

- Idempotenz und Safety werden nicht automatisch garantiert!
  - Entwickler müssen HTTP Semantik _aktiv_ umsetzen
- Auch bei `GET` kann der Server Seiteneffekte ausführen, z.B. logging
  - Unterscheidung zwischen _fachlichen_ und _technischen_ Seiteneffekten
- Retry-Mechanismen bei Implementierung beachten

## Theoretische Fragen

- Wie können hierarchische Beziehungen in API Pfaden abgebildet werden
- Welche Aktion verbirgt sich typischerweise hinter dem folgenden Request `POST /products`?
- Erläutere die Begriffe _idempotent_ und _safe_
- Warum ist auch bei korrekter Implementierung nicht garantiert, dass wiederholte Requests das gleiche Ergebnis liefern?

## Exkurs: APIs testen (1)

- APIs sind i.d.R. nicht direkt sichtbar
  - Interaktion über Frontend
- Wie können wir APIs ohne Frontend sinnvoll testen?
  - z.B. während der Entwicklung, Fehlersuche ...

## Exkurs: APIs testen (2)

- `curl`: Kommandozeilentool um HTTP Requests zu erstellen
  - GET: `curl https://api.example.com/users`
  - POST: `curl -X POST https://api.example.com/users -H "Content-Type: application/json" -d '{"name": "Max"}'`
  - Details: `-v` verbose \rightarrow{} zeigt Request/Response komplett an
- GUI Tools: [Postman](https://www.postman.com/downloads/), [Insomnia](https://insomnia.rest), [Bruno](https://www.usebruno.com)

## Aufgabe 3

> Stellt euch vor, ihr baut eine echte API für eure Benutzerverwaltung
> Was fehlt euch aktuell noch?

3 Minuten alleine, dann 3 Minuten Austausch mit Partner, dann gemeinsam sammeln.

# ...

## Fortgeschrittene Themen API Design

- Pagination, Query parameter (Filter, Suche)
- Ressourcen Repräsentationen -> JSON, XML, Wiederholung Content Negotiation
- Abbildung von nicht-hierarchischen Beziehungen
  - URL-Links vs Nesting vs ID-Referenzen

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
