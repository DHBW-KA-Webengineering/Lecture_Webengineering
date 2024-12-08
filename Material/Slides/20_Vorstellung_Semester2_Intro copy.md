---
title: "Vorlesung Webengineering I - Einführung"
topic: "Webengineering_1_1"
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


# Organisatorisches

## Heute



## Vorstellung

### Dozent: Lukas Panni 
- 2021: _B.Sc._ Informatik - DHBW Karlsruhe
- 2023: _M.Sc._ Informatik - HKA
- Seit 2018 bei SEW-EURODRIVE in Bruchsal
    - aktuell Softwareentwickler mit Fokus auf Open Source Compliance & Security


### Ihr
- Firma
- Programmiersprachen?
- Vorkenntnisse Webengineering?
    - Vorkenntnisse Tools: git, docker, VSCode?
- Erwartungen & Wünsche


## Ablauf

- Vorlesung: 44 Vorlesungseinheiten (VE)
  - Dieses Semester: 8 Termine, je 3 VE = 24 VE
    - Montag 8:30 - 11:00 Uhr (3 VE + 15 Minuten Pause)
  - Rest (20 VE) im nächsten Semester

- Vorlesung mit Programmieraufgaben
  - Keine Vorkenntnisse erforderlich
  - Tools: Texteditor, Browser, Terminal, Git, (evtl. Container-Tools, i.e. Docker)
    - Empfehlung: [VSCode](https://code.visualstudio.com/) / [WebStorm](https://www.jetbrains.com/de-de/webstorm/) (kostenlos für Studenten), Firefox, Docker-Desktop
  - kleine Hausaufgaben

## Material

- Vorlesungsfolien \rightarrow{} Slides 
- Vorlesungsnotizen (gemeinsam Erarbeitetes) \rightarrow{}  Notes
- Sonstiges (Anleitungen, Zusatzmaterial) \rightarrow{} Extra


\rightarrow{} alles auf GitHub [(lukaspanni/Lecture_Webengineering_2024)](https://github.com/lukaspanni/Lecture_Webengineering_2024)

\rightarrow{} separates Repo für Code [(TINF23B5-Webengineering/Lecture_Code)](https://github.com/TINF23B5-Webengineering/Lecture_Code) 


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
- Was ist eine "Webanwendung" und wie funktioniert sie?
- Grundlegende Architektur von Webanwendungen
- Erstellen einfacher Webanwendungen
- Grundlagen Webdesign & Mobile Webdesign


## Vorlesungsinhalt / Agenda (vorläufig)

- Grundlagen "Web" & Webanwendungen \rightarrow{} _ab heute_
  - HTTP & REST
- Einfache Webanwendungen
  - HTML
  - CSS
- Einführung Webdesign
- Dynamische Webanwendungen
  - JavaScript + Intro TypeScript
  - Interaktion Client/Server
- Fortgeschrittene Themen
  - Architektur moderner Webanwendungen
  - Security: Angriffe, Best-Practices


# Einführung: Webanwendungen

## Webanwendungen (1)

![](./media/Example_Webapplications.png){width=70%}


## Webanwendungen (2)

> Eine **Webanwendung** (auch Online-Anwendung, Webapplikation oder kurz Web-App) ist ein Anwendungsprogramm nach dem **Client-Server-Modell**. Anders als klassische Desktopanwendungen werden Webanwendungen **nicht lokal** auf dem Rechner des Benutzers installiert. Die Datenverarbeitung findet **teilweise auf einem entfernten Webserver** statt. Die Ergebnisse der Datenverarbeitung werden an den lokalen Client-Rechner des Benutzers übertragen (Thin Client). Genutzt wird eine Webanwendung dabei zumeist über einen **Webbrowser**. Diese kommuniziert mit dem Webserver meist über das **HTTP**.
>
> -- [Wikipedia](https://de.wikipedia.org/wiki/Webanwendung)

\rightarrow{} zu komplex!  

## Webanwendungen (3)

> Eine **Webanwendung** ist ein Programm, das über einen **Webbrowser** aufgerufen wird und teilweise auf einem **Server** ausgeführt wird.

- Auch nicht unbedingt korrekt 
  - Progressive Web Apps (PWAs) können auch teilweise offline (ohne Server) ausgeführt werden
  - z.B. Electron-Anwendungen sind unabhängig von Browser und Server \rightarrow{} integrierte Browser-Engine

## Webanwendungen (4)

> Eine **Webanwendung** ist eine Anwendung, die Web-Technologien (_HTML_, _CSS_, _JavaScript_) verwendet

- Einfache und kurze, aber zyklische Definition
- HTML + CSS werden teilweise auch außerhalb von Webanwendungen benutzt 
- JavaScript wird heute praktisch überall benutzt!


\rightarrow{} es gibt keine klare Definition! Das ist aber auch garnicht notwendig.



## Live-Demo: Webanwendungen

- Was passiert beim Abruf einer Webseite? z.B. "lukaspanni.de"
  - Auflösung des Namens zu einer IP-Adresse über DNS \rightarrow{} 37.120.173.24
  - HTTP-Anfrage an diese IP-Adresse an Port 80 (Standard für HTTP)
  - Antwort: 301 Moved Permanently; Location: https://lukaspanni.de/
  - HTTPS-Anfrage an gleiche IP-Adresse an Port 443 (Standard für HTTPS)
  - Antwort: 200 OK, HTML-Code, CSS-Code

- Was passiert bei komplexeren Websites?


