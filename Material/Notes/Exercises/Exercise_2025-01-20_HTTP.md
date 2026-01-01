---
title: Übungsaufgabe HTTP
date: 2025-01-20
lang: de-DE
author: "Silas Schnurr"
...

# Übungsaufgabe HTML

Im Rahmen dieser Übung arbeiten Sie an der Entwicklung einer webbasierten Anwendung zur Erfassung, Speicherung und Auswertung
von Arbeitszeiten – eine sogenannte digitale "Stechuhr".

## Aufgabenstellung

Definieren Sie die REST API zum Erstellen, Löschen und Verändern von protokollierten Arbeitszeiten, um die Grundlagen von HTTP und REST zu vertiefen.

Definieren Sie hierfür bitte die drei erforderlichen Endpunkte wie folgt. Der Endpunkt für das Abrufen eines Datensatzes ist bereits gegeben.

- HTTP-Methode: GET
- Safe / Idempotent: Ja / Ja
- Pfad: /times/{id}
- content type: application/json
- Beispiel request & response Payload:
  - request: n.a.
  - response: `{ "id": 42, "start": "2025-07-24T08:00:00", "end": "2025-07-24T12:00:00" }`
