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

## Beispiel Online Shop

### Gruppenarbeit Flow: Ich möchte ein neues MacBook kaufen


#TODO: ...

## Aufgaben Frontend Online Shop 

- Anzeige von Produkten
- Bilder anzeigen
- Suchfeld & Filter 
- Warenkorb anzeigen
- Button „Kaufen“
- Formulare (Adresse eingeben)
- Ladezustände (Spinner)

=> Alles, was der User sieht und direkt bedient


## Aufgaben Backend Online Shop

- Produkte aus Datenbank laden
- Preise berechnen
- Verfügbarkeit prüfen („noch auf Lager?“)
- Bestellung speichern
- Zahlung verarbeiten (z. B. PayPal API)
- Nutzer authentifizieren (Login)
- E-Mails versenden (Bestellbestätigung)

## Aufgaben Backend allgemein

- Datenspeicherung, DB Interkation
- Geschäftslogik, Use-Cases
- Authentifizierung, Autorisierung
- Integration von Drittsystemen, z.B. Payment



# Kommunikation Frontend - Backend

## Wiederholung HTTP / REST

Request Response Prinzip, Zustandslosigkeit
Methoden: GET, POST, PUT, DELETE
Rest-Prinzipien: Ressourcen!


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


##  OpenAPI / Swagger
