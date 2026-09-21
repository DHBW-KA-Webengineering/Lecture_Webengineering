---
title: "Webengineering I - Einführung"
topic: "Webengineering_1_1_1"
author: "Lukas Panni & Silas Schnurr"
theme: "metropolis"
fonttheme: "structurebold"
fontsize: 12pt
urlcolor: BrickRed
linkcolor: BrickRed
aspectratio: 169
lang: de-DE
numbersections: true
plantuml-format: svg
toc: true
section-titles: true
...

# Organisatorisches

## Heute

- Organisatorisches
  - Vorstellung
  - Ablauf
  - Material
  - Prüfungsleistungen
- Vorlesungsinhalt & Lernziele
- Einführung Webengineering
- Grundlagen Git
- Grundlagen Webdesign

## Vorstellung

### Dozent Semester 1: Silas Schnurr

- Per Du
- E-Mail-Adresse: schnurr.silas@edu.dhbw-karlsruhe.de

- Seit Dezember 2025 IT-Berater/Lead Developer bei PTA IT-Beratung
- 2015 - 2025 bei PeakAvenue in Bühl
  - 2023 - 2025: Softwarearchitekt & Teamleiter Softwareentwicklung
  - 2021 - 2023: _M.Sc._ Informatik - HKA
  - 2018 - 2021: _B.Sc._ Informatik - DHBW Karlsruhe
  - 2015 - 2018: Ausbildung Fachinformatiker Anwendungsentwicklung

## Ablauf

- Vorlesung: 66 Vorlesungseinheiten (VE)
  - Dieses Semester: 8 Termine, insgesamt 33 VE
  - Rest (33 VE) im nächsten Semester bei Lukas Panni

- Vorlesung mit Programmieraufgaben
  - Keine Vorkenntnisse erforderlich
  - Tools: Texteditor, Browser, Terminal, Git, (evtl. Container-Tools wie Docker)
    - Empfehlung: [VSCode](https://code.visualstudio.com/) / [WebStorm](https://www.jetbrains.com/de-de/webstorm/) (kostenlos für Studenten), Firefox, Docker-Desktop
  - Hausaufgaben

## Material

- Vorlesungsfolien \rightarrow{} Slides
- Vorlesungsnotizen (gemeinsam Erarbeitetes) \rightarrow{} Notes
- Sonstiges (Anleitungen, Zusatzmaterial) \rightarrow{} Extra

\rightarrow{} alles auf GitHub [(DHBW-KA-Webengineering/Lecture_Webengineering_2027)](https://github.com/DHBW-KA-Webengineering/Lecture_Webengineering)

\rightarrow{} separates Repo für Code [(DHBW-KA-Webengineering/Lecture_Code)](https://github.com/DHBW-KA-Webengineering/Lecture_Code)

## Prüfungsleistungen

### Projektarbeit:

- Entwicklung einer (kleinen) Webanwendung mit hier gelernten Technologien
- Gruppenarbeit verpflichtend (4 - 7 Studierende)
- Bewertung mit Vorlesung Projektmanagement (Hr. Göller)
- Note Projektmanagement: Projektmanagement, mehr dazu von Hr. Göller

### Klausur:

- Klausur (60 min) am Ende von Semester 2 über die Themen **beider** Semester
  - Circa 10% theoretische Fragen
  - Circa 30% Transfer zu den theoretischen Fragen
  - Circa 30% Fragen zur gesamten Vorlesung
  - Circa 30% Transfer zur gesamten Vorlesung

## Prüfungsleistungen: Note Webengineering:

- Kombinierte Prüfung:
  - 50 % Projekt (Details siehe Notes/Bewertung_Projektarbeit)
  - 50 % Klausur (60 min)

## Projektarbeit - Themenauswahl

- TODO-App
- Zeiterfassung ("Stechuhr")
- Karteikarten-Anwendung ("Anki")
- Weitere Vorschläge heute möglich

\rightarrow{} siehe [Projekt Themen](https://github.com/DHBW-KA-Webengineering/Lecture_Webengineering/blob/2026/Material/Notes/Projekt_Themen.md)

## Vorstellung Studis

- Gruppen für Projekt bilden und Gruppenname festlegen

- Vorstellung
  - Name und Firma
  - Welche Projektgruppe
  - Vorkenntnisse: Programmiersprachen, Webengineering, Tools: git, docker, VSCode, ...
  - Erwartungen & Wünsche

# Vorlesungsinhalt & Lernziele

## Ziele der Vorlesung

- Was ist eine "Webanwendung" und wie funktioniert sie?
- Grundlegende Architektur von Webanwendungen
- Erstellen einfacher Webanwendungen
- Grundlagen Webdesign & Mobile Webdesign

## Vorlesungsinhalte Semester 1

1. Einführung & Webdesign _(4 VE)_
2. HTTP & REST _(4 VE)_
3. HTML & CSS _(4 VE)_
4. **Zwischenabgabe 1** & JavaScript _(5 VE)_
5. JavaScript & TypeScript _(4 VE)_
6. Framework (REACT?, ...) _(4 VE)_

- _3 Wochen Zeit für die Arbeit am Projekt_

7. Webarchitekturen & Fragen / Feedback zum Projekt _(5 VE)_

- _2 Wochen Zeit für die Arbeit am Projekt_

8. **Zwischenabgabe 2** & Semesterabschluss _(3 VE)_

# Einführung Webengineering

## Definition

Webengineering, das (Substantiv, Neutrum)

- Kofferwort aus Web und Engineering (engl. „Ingenieurwissenschaften“).

Web, das (Substantiv, Neutrum)

- Kurzform für World Wide Web
- ...

Ingenieurwissenschaft, die (Substantiv, feminin):

-

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
- Gibt es noch weitere "Haltestellen" bei einem Webseitenaufruf?

# Git Grundlagen

## Was ist Git?

Git ist ein _dezentrales_ Versionsverwaltungssystem und ermöglicht die einfache Nachverfolgung von Änderungen an Dateien.
Heute ist Git der de-facto Standard in der Softwareentwicklung.
Dezentral bedeutet dabei, dass jede Person, die an einem Projekt arbeitet, eine eigene Kopie des Projekts und aller Änderungen lokal auf ihrem Rechner hat und damit auch offline arbeiten kann.

## Wozu brauche ich Git?

Git ist besonders sinnvoll, wenn im Team gearbeitet wird.
Durch die Nachverfolgbarkeit der Änderungen einzelner Personen können parallele Änderungen an einem Projekt einfach zusammengeführt werden.
Aber auch für Einzelpersonen ist Git sinnvoll, da es eine einfache Möglichkeit bietet, Änderungen an einem Projekt nachzuvollziehen und bei Bedarf zu einem früheren Stand zurückzukehren.

## Wie kann ich Git nutzen?

Um alle Funktionen nutzen zu können, wird die Verwendung der Kommandozeile empfohlen.
Allerdings gibt es auch grafische Oberflächen, Plugins für Editoren und IDEs, die wichtige Funktionen von Git einfach zugänglich bereitstellen.

## Wichtige Begriffe

- Repository: Projekt/Ordner, der mit Git verwaltet wird.
  - Remote: Repository auf einem zentralen Server, zum Beispiel GitHub oder GitLab
  - Local: Lokales Repository auf dem eigenen Rechner, häufig ein Klon eines Remote-Repositories
- Commit: Änderung an einem Repository, kann eine oder mehrere Dateien betreffen
- Push: Hochladen von Änderungen zu einem Remote-Repository
- Pull: Herunterladen und Integrieren von Änderungen von einem Remote-Repository in ein lokales Repository
- Branch: "Zweig" eines Projekts, erlaubt parallele Entwicklung von verschiedenen Features ohne Konflikte zu erzeugen. Alle Commits auf einem Branch sind zunächst nur auf diesem Branch, andere Branches werden davon nicht beeinflusst

## Erste Schritte mit Git

Viele Linux-Distributionen haben Git bereits vorinstalliert, ansonsten ist Git über den jeweiligen Paketmanager verfügbar.
Unter MacOS wird Git über die XCode Command Line Tools automatisch installiert, wenn das erste Mal `git` in der Kommandozeile ausgeführt wird (für die neuste Version ist eventuell eine Installation über die Webseite besser).
Für Windows kann Git von der [Git-Website](https://git-scm.com/downloads) heruntergeladen werden.

### Grundkonfiguration

Bevor mit der Arbeit mit Git begonnen werden sollte, wird emfpolen, einige grundlegende Einstellungen vorzunehmen.
Insbesondere sollten Name und E-Mail-Adresse für die Zuordnung zu einem Commit konfiguriert werden:

```bash
git config --global user.name "XXXX YYYY"
git config --global user.email "XXXX.YYYY@ZZZZ.AA"
```

Windows-Nutzer sollten außerdem noch die folgende Einstellung vornehmen, um Problemen mit Zeilenumbrüchen bei der Zusammenarbeit mit Nutzern anderer Betriebssysteme vorzubeugen:

```bash
git config --global core.autocrlf true
```

### Repository anlegen

Ein neues Repository wird mit `git init` erzeugt.
Dabei wird ein neuer Ordner `.git` im aktuellen Ordner angelegt, der alle Informationen über das Repository enthält.
Ansonsten ist das Repository zunächst leer.

Um ein bestehendes Remote-Repository zu klonen, wird `git clone <url>` verwendet, wobei standardmäßig die gesamte Historie heruntergeladen wird.

### Änderungen nachverfolgen

Mit `git status` kann der aktuelle Status des Repositories abgefragt werden.
Dabei wird angezeigt, welche Dateien geändert wurden, welche Dateien neu hinzugekommen sind und welche Dateien gelöscht wurden.
Außerdem wird angezeigt, welche Dateien aktuell nicht nachverfolgt werden.
Änderungen müssen explizit mit `git add <file>` (oder `git add -A` für alle Dateien) für den Commit vorgemerkt ("staged") werden.

Mit dem Befehl `git commit` wird ein Commit erzeugt, der alle vorgemerkten Änderungen enthält.
Ein Commit hat immer auch eine Commit-Message, die beschreiben sollte, welche Änderungen vorgenommen wurden.
Die Message kann direkt mit `git commit -m "Message"` angegeben werden, ansonsten wird der Standard-Editor geöffnet.

### Änderungen hochladen

Wenn ein Remote-Repository konfiguriert ist (automatisch beim Klonen, ansonsten mit `git remote add <name> <url>`), können Änderungen mit `git push <name> <branch>` hochgeladen werden.
Der Standardname eines Remote-Repositories ist `origin` und kann weggelassen werden.
Auch der Branch kann häufig weggelassen werden, da standardmäßig der aktuelle Branch und dessen konfigurierter Remote-Branch verwendet wird.

### Änderungen herunterladen

Mit `git pull <name> <branch>` können Änderungen von einem Remote-Repository heruntergeladen und in das lokale Repository integriert werden.
Auch hier können der Name und der Branch meist weggelassen werden.

Achtung: ohne weitere Konfiguration nutzt Git die Standard-Strategie `merge`, um Änderungen zusammenzuführen, wobei Merge-Commits mit zwei Eltern-Commits erzeugt werden.
Um die Historie linear zu halten, kann stattdessen `rebase` verwendet werden, was entweder über die Konfiguration allgemein oder mit `git pull --rebase` einmalig aktiviert werden kann.

## Weitere Informationen

- [Git-Website](https://git-scm.com/)
- [Git-Book](https://git-scm.com/book/en/v2): konstenloses E-Book mit ausführlichen Anleitungen und Hintergrundinformationen
- [Attlasian Git-Tutorial](https://www.atlassian.com/git/tutorials): gute Tutorials zu verschiedenen Themen rund um Git, empfehlenswert auch die Tutorials zu Git-Branching und Git-Workflows: https://www.atlassian.com/git/tutorials/comparing-workflows

## Exkurs: GitHub

GitHub erlaubt die kostenlose Verwaltung von Remote-Repositories und bietet darüber hinaus viele Funktionen zur Zusammenarbeit.
Außerdem gibt es unter [GitHub Edducation](https://education.github.com/) für Studierende die Möglichkeit auf viele weitere normalerweise kostenpflichtige Funktionen zuzugreifen.

Im Rahmen dieser Vorlesung werden alle Vorlesungsmaterialien auf GitHub bereitgestellt.
Zugriff ist auch ohne Account möglich, mit Account können Updates leichter nachverfolgt werden (Repository beobachten oder mit Stern markieren).
Außerdem können Issues und Discussions genutzt werden, um Fragen zu stellen oder Fehler zu korrigeren und ihr könnt eure Projektarbeiten direkt über GitHub abgeben.
Trotzdem ist ein Account keine Pflicht!
