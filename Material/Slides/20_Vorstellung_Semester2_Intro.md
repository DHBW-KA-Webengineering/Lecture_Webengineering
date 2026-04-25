---
title: "Vorlesung Webengineering I (Semester 2) - Einführung"
topic: "Webengineering_1_2_1"
author: "Lukas Panni"
theme: "metropolis"
fonttheme: "structurebold"
fontsize: 12pt
urlcolor: BrickRed
linkcolor: BrickRed
aspectratio: 169
lang: de-DE
section-titles: true
plantuml-format: svg
...

## Vorstellung

### Dozent: Lukas Panni 
- 2021: _B.Sc._ Informatik - DHBW Karlsruhe
- 2023: _M.Sc._ Informatik - HKA
- Seit 2018 bei SEW-EURODRIVE in Bruchsal
    - aktuell Full-Stack Entwickler
    - unternehmensweite Verantwortung für Open Source Compliance & Security
    - Fachbetreuer DHBW Studierende Informatik


### Ihr
- Firma
- Programmiersprachen?
- Vorkenntnisse Webengineering?
  - Lücken aus dem letzten Semester?
  - Interessanteste Themen aus dem letzten Semester?
- Erwartungen & Wünsche


## Vorlesung

- 33 Vorlesungseinheiten
  - i.d.R. 3x 45 min. + 15 min. Pause 

- Vorlesung mit Programmieraufgaben
  - Keine Vorkenntnisse erforderlich (außer 1. Semester logischerweise)
  - Was ihr braucht 
    - [VSCode](https://code.visualstudio.com/) oder sonstige IDE
    - Browser (idealerweise chromium-basiert)
    - Terminal
    - Git
    - Container-Tools (Docker / Podman, ...)
 

## Material

- Vorlesungsfolien \rightarrow{} Slides
- Vorlesungsnotizen (gemeinsam Erarbeitetes) \rightarrow{} Notes
- Sonstiges (Anleitungen, Zusatzmaterial) \rightarrow{} Extra

\rightarrow{} alles auf GitHub [(DHBW-KA-Webengineering/Lecture_Webengineering_2025)](https://github.com/DHBW-KA-Webengineering/Lecture_Webengineering)

\rightarrow{} separates Repo für Code [(DHBW-KA-Webengineering/Lecture_Code)](https://github.com/DHBW-KA-Webengineering/Lecture_Code)



## Prüfungsleistung

### Projektarbeit:

- Sollte aus 1. Semester bekannt sein, in diesem Semester: Backend für euer Frontend
  - Note Webengineering: 
    - Konzept & Umsetzung der Webanwendungen
    - Einhaltung vorgestellter Best-Practices
    - Regelmäßige Vorstellung aktueller Zwischenstände

### Klausur:

- Klausur (60 min) am Ende des Semesters über _alle Themen_

### Note:

- 50 % Projekt (Details siehe Notes/Bewertung_Projektarbeit)
- 50 % Klausur

## Klausurvorbereitung

- Plan: Fragestunde in letztem Termin vor Klausur & Übung mit Musteraufgaben
- Programmieraufgaben und theoretischen Fragen aus Folien (und Excercise-Dokumenten) sind gute Vorbereitung
  - Code-Aufgaben z.B.: Fehler in Beispiel-Code finden, Beispiel-Code ergänzen (einzelne Zeilen)
  - Stellt euch darauf ein, "Hausaufgaben" vorzustellen!
- Beste Vorbereitung: Aufpassen in der Vorlesung & regelmäßige Arbeit am Projekt


# Vorlesungsinhalt & Lernziele

## Ziele der Vorlesung

- Was ist eine "Webanwendung" und wie funktioniert sie? \rightarrow{} In diesem Semester Fokus auf Backend
  - Warum brauchen wir ein Backend?
  - Verschwimmende Grenzen zwischen Frontend & Backends
- Erstellen einfacher Backends mit TypeScript
  - Grundlagen: was macht das Backend überhaupt? Wiederholung Kommunikation mit Frontend
  - Verwendung von Server-Frameworks
- Anbindung von Datenbanken & Crashkurs SQL
- Bereitstellung (_Deployment_) von Backends
  - Server, Container, Serverless
- Grundlagen & Best-Practices Web-Security



## Vorlesungsinhalt / Agenda (vorläufig) [1]

- Wiederholung Semester 1
- Serverseitiges JavaScript
  - Typsicherheit mit TypeScript
  - Runtimes Node.js & Bun
- Backend
  - Aufgaben Backend
  - Abgrenzung zum Frontend, verschwimmende Grenzen
  - Server-Frameworks (z.B. Express, Fastify, ...)

## Vorlesungsinhalt / Agenda (vorläufig) [2]

- Datenbank-Anbindung
  - Crashkurs SQL & ORMs
- Web-Security
  - Angriffe & Best-Practices
- Deployment von Webanwendungen
  - Container, Serverless/Cloud
- Wenn noch Zeit ist: Wunschthema der Studierenden
  - z.B. Server-Side-Rendering, Webassembly, ...

Nicht unbedingt in dieser Reihenfolge 