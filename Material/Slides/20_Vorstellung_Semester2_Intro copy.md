---
title: "Vorlesung Webengineering I (Semester 2) - Einführung"
topic: "Webengineering_1_2_1"
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

## Vorstellung

### Dozent: Lukas Panni 
- 2021: _B.Sc._ Informatik - DHBW Karlsruhe
- 2023: _M.Sc._ Informatik - HKA
- Seit 2018 bei SEW-EURODRIVE in Bruchsal
    - aktuell Softwareentwickler mit Fokus auf Open Source Compliance & Security
    - Fachbetreuer DHBW Studierende Informatik


### Ihr
- Firma
- Programmiersprachen?
- Vorkenntnisse Webengineering?
  - Lücken aus dem letzten Semester?
  - Interessanteste Themen aus dem letzten Semester?
  - Vorkenntnisse Tools: git, docker, VSCode?
- Erwartungen & Wünsche


## Vorlesung

- 33 Vorlesungseinheiten
  - i.d.R. 3x 45 min. + 15 min. Pause 

- Vorlesung mit Programmieraufgaben
  - Keine Vorkenntnisse erforderlich
  - Tools: Texteditor, Browser, Terminal, Git, (evtl. Container-Tools, i.e. Docker)
    - Empfehlung: [VSCode](https://code.visualstudio.com/) / [WebStorm](https://www.jetbrains.com/de-de/webstorm/) (kostenlos für Studenten), Firefox, Docker-Desktop
  - kleine Hausaufgaben

## Material

- Vorlesungsfolien \rightarrow{} Slides
- Vorlesungsnotizen (gemeinsam Erarbeitetes) \rightarrow{} Notes
- Sonstiges (Anleitungen, Zusatzmaterial) \rightarrow{} Extra

\rightarrow{} alles auf GitHub [(DHBW-KA-Webengineering/Lecture_Webengineering_2025)](https://github.com/DHBW-KA-Webengineering/Lecture_Webengineering)

\rightarrow{} separates Repo für Code [(DHBW-KA-Webengineering/Lecture_Code)](https://github.com/DHBW-KA-Webengineering/Lecture_Code)


## Prüfungsleistung

### Projektarbeit:

- Entwicklung einer (kleinen) Webanwendung mit hier gelernten Technologien
- Gruppenarbeit möglich (3 - 5 Studierende)
- Bewertung mit Vorlesung Projektmanagement (Hr. Merkel)
  - Note Webengineering: 
    - Konzept & Umsetzung der Webanwendungen
    - Einhaltung vorgestellter Best-Practices
    - Regelmäßige Vorstellung aktueller Zwischenstände
  - Note Projektmanagement: Projektmanagement, mehr dazu von Hr. Merkel

\rightarrow{} **Aufgabe bis in 2 Wochen (22.01.): Gruppen bilden & Thema überlegen** + kurze Präsentation (~3 min) 

## Projektarbeit - mögliche Themen

- TODO-App
- Zeiterfassung ("Stechuhr")
- Karteikarten-Anwendung ("Anki")
- einfaches Spiel (Snake, Pac-Man, ...)
- Dashboard für Daten von einer APIs (GitHub, deps.dev, ...)
  - [verschiedene Daten öffentlicher Stellen](https://github.com/bundesAPI) 
- eigene Ideen

# Vorlesungsinhalt & Lernziele

## Ziele der Vorlesung

- Was ist eine "Webanwendung" und wie funktioniert sie? \rightarrow{} Fokus auf Backend
- Erstellen einfacher Backends mit verschiedenen Technologien
- Anbindung von Datenbanken & Crashkurs SQL
- Grundlagen & Best-Practices Web-Security


## Vorlesungsinhalt / Agenda (vorläufig)

- Wiederholung Semester 1
- Serverseitiges JavaScript
  - Typsicherheit mit TypeScript
  - Runtimes und Server-Frameworks: Node.js + express / Bun + Elysia
- Datenbanken
  - Crashkurs SQL & ORMs
- Web-Security
  - Angriffe & Best-Practices
- Grundlagen ASP.NET Core
- Deployment von Webanwendungen
  - Docker, CI/CD

Nicht unbedingt in dieser Reihenfolge 