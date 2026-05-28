---
title: Themen Projektarbeit
date: 2026-01-12
lang: de-DE
author: "Lukas Panni & Silas Schnurr"
...

\clearpage

# Grundsätzliches

Die beiden Semester sind mehr oder weniger in Frontend (Semester 1) und Backend (Semester 2) gegliedert. Da eine vollständige Trennung dieser beiden Bereiche nicht praktikabel ist, werden sich in der Regel Überschneidungen ergeben. Es ist daher von entscheidender Bedeutung, dass bereits in der Anfangsphase des Projekts ein sinnvolles "Mentales Modell" entwickelt wird. Dies gewährleistet, dass im zweiten Semester nur geringfügige (oder im Idealfall gar keine) Anpassungen am Frontend erforderlich sind, um eine sinnvolle, gut strukturierte und gekapselte API im Backend zu entwickeln.

Die Themen sind bewusst so gewählt, dass sie verschiedene Schwerpunkte und Herausforderungen bieten. Jedes Thema bietet ausreichend Spielraum, um die erlernten Grundlagen der Webentwicklung anzuwenden. Zusätzlich ermöglicht die Themenwahl unterschiedliche technische Umsetzungen und Kreativität bei der Gestaltung.

Die genannten Mindestanforderungen sind eine Hilfestellung: Man kann eine 1,0 bekommen, wenn die Mindestanforderungen nicht wie beschrieben umgesetzt sind, das Ergebnis aber der Idee der Anwendung entspricht und die entsprechende Qualität aufweist. Ebenso kann man durchfallen, wenn die Umsetzung schlecht ist - auch wenn die Mindestanforderungen prinzipiell funktionieren.

Folgende Themen stehen zur Auswahl:

- Thema 1: TODO-App
- Thema 2: Zeiterfassung ("Stechuhr")
- Thema 3: Karteikarten-Anwendung ("Anki")

\pagebreak

# Thema 1: TODO-App

Entwicklung einer webbasierten Anwendung, die es Nutzern ermöglicht, Aufgaben zu erstellen, zu verwalten und zu organisieren. Features können z. B. Kategorien, Fälligkeitsdaten, Priorisierungen oder Filterfunktionen umfassen.

## Zwischenstand 1

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2

- Mindestanforderungen Frontend:
  - Listenansicht der Aufgaben
  - Aufgaben können im Frontend erstellt und angezeigt werden
  - Dynamische Listenansicht (z. B. Aufgaben mit Titel und Status)
  - Interaktionen, wie Hinzufügen und Markieren von Aufgaben als “erledigt”
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3

- Zusätzliche Mindestanforderungen Frontend:
  - Vollständige CRUD-Operationen: Aufgaben können erstellt, bearbeitet und gelöscht werden
  - Filter- oder Sortieroptionen implementiert
- Mindestanforderungen Backend:
  - Datenmodell für Aufgaben definiert
    - Ressourcen + deren Eigenschaften
    - Beziehungen zwischen Ressourcen
    - Mögliche Aktionen auf Ressourcen
  - Struktur der API definiert: Aktion, Methode, Endpunkt, Input/Output
     - Siehe z.B. Tabelle Aufgabe 2 in 22_Backend_Grundlagen
  - Kein Deployment
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe

- Komplett funktionsfähig mit persistenter Datenspeicherung
- Mindestanforderungen Backend:
  - Persistente Datenspeicherung, unabhängige Datenspeicherung für lokale Tests
  - Deployment auf einem Server / Serverless
  - Web-Security Best-Practices befolgt
- Verbindung Frontend - Backend
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe

\pagebreak

# Thema 2: Zeiterfassung ("Stechuhr")

Entwicklung einer Anwendung, die Arbeitszeiten erfasst, speichert und auswertet. Nutzer können Start- und Endzeiten eintragen oder durch Buttons automatisch erfassen lassen.

## Zwischenstand 1

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2

- Mindestanforderungen Frontend:
  - Grundlayout mit Eingabefeldern für Arbeitszeiten
  - Eingabemöglichkeit für Start- und Endzeiten
  - Nachträgliches Korrigieren der protokollierten Arbeitszeit
  - Anzeige der berechneten Arbeitszeit in einer Tabelle
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3

- Zusätzliche Mindestanforderungen Frontend:
  - Hinweise zu Arbeitszeitüberschreitungen
  - Anzeige von Wochenübersichten und Überstunden
- Mindestanforderungen Backend:
  - Datenmodell für Aufgaben definiert
    - Ressourcen + deren Eigenschaften
    - Beziehungen zwischen Ressourcen
    - Mögliche Aktionen auf Ressourcen
  - Struktur der API definiert: Aktion, Methode, Endpunkt, Input/Output
     - Siehe z.B. Tabelle Aufgabe 2 in 22_Backend_Grundlagen
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe

- Komplett funktionsfähig mit persistenter Datenspeicherung.
- Mindestanforderungen Backend:
  - Persistente Datenspeicherung, unabhängige Datenspeicherung für lokale Tests
  - Deployment auf einem Server / Serverless
  - Web-Security Best-Practices befolgt
- Verbindung Frontend - Backend
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe

\pagebreak

# Thema 3: Karteikarten-Anwendung ("Anki")

Umsetzung einer Anwendung, die das Lernen mit Karteikarten erleichtert. Nutzer können Karteikarten erstellen, bearbeiten, löschen und durch die Karten blättern / damit lernern.

## Zwischenstand 1

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2

- Mindestanforderungen Frontend:
  - Verwaltung, Erstellung und Bearbeitung von Karten
  - Lernmodus, bei welchem man "Abgefragt" wird
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3

- Zusätzliche mindestanforderungen Frontend:
  - Gruppieren von Lernkarten
  - Karteikasten Funktion
- Mindestanforderungen Backend:
  - Datenmodell für Aufgaben definiert
    - Ressourcen + deren Eigenschaften
    - Beziehungen zwischen Ressourcen
    - Mögliche Aktionen auf Ressourcen
  - Struktur der API definiert: Aktion, Methode, Endpunkt, Input/Output
     - Siehe z.B. Tabelle Aufgabe 2 in 22_Backend_Grundlagen
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe

- Komplett funktionsfähig mit persistenter Datenspeicherung
- Mindestanforderungen Backend:
  - Persistente Datenspeicherung, unabhängige Datenspeicherung für lokale Tests
  - Deployment auf einem Server / Serverless
  - Web-Security Best-Practices befolgt
- Verbindung Frontend - Backend
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe
