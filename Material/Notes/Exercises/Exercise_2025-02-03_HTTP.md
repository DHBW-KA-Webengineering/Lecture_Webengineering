---
title: Übungsaufgabe HTTP
date: 2025-02-03
lang: de-DE
author: "Silas Schnurr"
...

# Übungsaufgabe HTTP

Im Rahmen dieser Übung arbeiten Sie an der Entwicklung einer webbasierten Anwendung zur Erfassung, Speicherung und Auswertung
von Arbeitszeiten – eine sogenannte digitale "Stechuhr".

## Aufgabe 1

Definieren Sie die REST API zum Erstellen, Löschen und Verändern von protokollierten Arbeitszeiten, um die Grundlagen von HTTP und REST zu vertiefen.

Beachten Sie dabei die REST-Prinzipien!

Definieren Sie hierfür bitte die drei erforderlichen Endpunkte wie folgt. Der Endpunkt für das Abrufen eines Datensatzes ist bereits gegeben.

- HTTP-Methode: GET
- Safe / Idempotent: Ja / Ja
- Pfad: /times/{id}
- content type: application/json
- Beispiel request & response Payload:
  - request: n.a.
  - response: `{ "id": 42, "start": "2025-07-24T08:00:00", "end": "2025-07-24T12:00:00" }`
- Mögliche Statuscodes:

## Aufgabe 2

Ziel dieser Aufgabe ist es, ausgehend von Ihrer Anwendungsidee eine erste konzeptionelle REST-API zu entwerfen. Sie sollen dabei überlegen, welche Daten und Funktionen Ihre Anwendung benötigt und wie diese über eine REST-Schnittstelle bereitgestellt werden könnten.

- Es bietet Sich an, die Lösung dieser Aufgabe in einer Tabelle festzuhalten.

- Nutzen Sie bereits erstellte Wireframes, Designs oder Skizzen, um sicherzustellen, dass:
  - alle geplanten Funktionen der Anwendung durch die API abgedeckt sind
  - es eine nachvollziehbare Verbindung zwischen UI-Funktion und REST-Endpoint gibt

Einordnung in die Softwareentwicklung

### 1. Identifikation der REST-Ressourcen

Leiten Sie aus Ihrer geplanten Anwendung die zentralen Ressourcen ab. Ressourcen sind fachliche Objekte Ihrer Anwendung, z. B. Benutzer, Einträge, Kommentare, Aufgaben, Termine, etc.

Beschreiben Sie für jede Ressource:

- den Pfad der Ressource (z. B. /users, /projects)
- eine kurze fachliche Bedeutung

### 2. HTTP-Methoden und Endpunkte

- Überlegen Sie für jede Ressource, mit welchen HTTP-Methoden auf sie zugegriffen werden soll, z. B. GET, POST, PUT, PATCH, DELETE, ...

- Beschreiben Sie den Endpoint (z. B. GET /projects/{id}) und grob die Funktion des Endpoints

- Überlegen Sie, wie die Datenstrukturen aussehen könnten, die zwischen Client und Server ausgetauscht werden.
  - Welche Felder enthält ein Request beim Anlegen oder Ändern einer Ressource?
  - Wie könnte eine typische Response aussehen?

Es reicht aus, vereinfachte Beispiel-Payloads anzugeben.

## Information: Einordnung in die Softwareentwicklung

Diese Aufgabe ist Teil der Konzeptions- und Discovery-Phase der Softwareentwicklung und wird häufig als API-Design oder API-Konzeption bezeichnet. Ziel ist es, frühzeitig zu klären, welche Schnittstellen benötigt werden, bevor mit der eigentlichen Implementierung begonnen wird.
