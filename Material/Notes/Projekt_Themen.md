---
title: Themen Projektarbeit
lang: de-DE
author: "Silas Schnurr"
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
- Thema 4: Snake
- Thema 5: Pac-Man
- Thema 6: API Dashboard

# Thema 1: TODO-App

Entwicklung einer webbasierten Anwendung, die es Nutzern ermöglicht, Aufgaben zu erstellen, zu verwalten und zu organisieren. Features können z. B. Kategorien, Fälligkeitsdaten, Priorisierungen oder Filterfunktionen umfassen.

## Zwischenstand 1 (Termin: 30.01.2025)

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2 (ca. 2 - 3 Wochen vor den Klausuren Semester 1, Termin folgt)

- Mindestanforderungen Frontend:
  - Listenansicht der Aufgaben
  - Aufgaben können im Frontend erstellt und angezeigt werden
  - Dynamische Listenansicht (z. B. Aufgaben mit Titel und Status)
  - Interaktionen, wie Hinzufügen und Markieren von Aufgaben als “erledigt”
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3 (Anfang des zweiten Semesters, Termin folgt)

- Zusätzliche Mindestanforderungen Frontend:
  - Vollständige CRUD-Operationen: Aufgaben können erstellt, bearbeitet und gelöscht werden
  - Filter- oder Sortieroptionen implementiert
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe (Ende des zweiten Semesters, Termin folgt)

- Komplett funktionsfähig mit persistenter Datenspeicherung
- Details zum Backend (Persistierung, Accounts, API, ...) werden zu Beginn des zweiten Semesters bekannt gegeben
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe

# Thema 2: Zeiterfassung ("Stechuhr")

Entwicklung einer Anwendung, die Arbeitszeiten erfasst, speichert und auswertet. Nutzer können Start- und Endzeiten eintragen oder durch Buttons automatisch erfassen lassen.

## Zwischenstand 1 (Termin: 30.01.2025)

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2 (ca. 2 - 3 Wochen vor den Klausuren Semester 1, Termin folgt)

- Mindestanforderungen Frontend:
  - Grundlayout mit Eingabefeldern für Arbeitszeiten
  - Eingabemöglichkeit für Start- und Endzeiten
  - Nachträgliches Korrigieren der protokollierten Arbeitszeit
  - Anzeige der berechneten Arbeitszeit in einer Tabelle
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3 (Anfang des zweiten Semesters, Termin folgt)

- Zusätzliche mindestanforderungen Frontend:
  - Hinweise zu Arbeitszeitüberschreitungen
  - Anzeige von Wochenübersichten und Überstunden
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe (Ende des zweiten Semesters, Termin folgt)

- Komplett funktionsfähig mit persistenter Datenspeicherung.
- Details zum Backend (Persistierung, Accounts, API, ...) werden zu Beginn des zweiten Semesters bekannt gegeben
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe

# Thema 3: Karteikarten-Anwendung ("Anki")

Umsetzung einer Anwendung, die das Lernen mit Karteikarten erleichtert. Nutzer können Karteikarten erstellen, bearbeiten, löschen und durch die Karten blättern / damit lernern.

## Zwischenstand 1 (Termin: 30.01.2025)

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2 (ca. 2 - 3 Wochen vor den Klausuren Semester 1, Termin folgt)

- Mindestanforderungen Frontend:
  - Verwaltung, Erstellung und Bearbeitung von Karten
  - Lernmodus, bei welchem man "Abgefragt" wird
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3 (Anfang des zweiten Semesters, Termin folgt)

- Zusätzliche mindestanforderungen Frontend:
  - Gruppieren von Lernkarten
  - Karteikasten Funktion
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe (Ende des zweiten Semesters, Termin folgt)

- Komplett funktionsfähig mit persistenter Datenspeicherung
- Details zum Backend (Persistierung, Accounts, API, ...) werden zu Beginn des zweiten Semesters bekannt gegeben
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe

# Thema 4: Snake

Entwicklung einer klassischen Snake-Anwendung, bei der der Spieler Punkte sammelt und die Schlange verlängert.

## Zwischenstand 1 (Termin: 30.01.2025)

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2 (ca. 2 - 3 Wochen vor den Klausuren Semester 1, Termin folgt)

- Mindestanforderungen Frontend:
  - Anzeige eines Spielfelds mit einer Schlange
  - Bewegungslogik für die Schlange
  - Grundlegendes Punktesystem
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3 (Anfang des zweiten Semesters, Termin folgt)

- Zusätzliche mindestanforderungen Frontend:
  - Spielmechaniken (z. B. Game Over bei Kollision)
  - Zusätzliche Features wie Hindernisse oder Level
  - Highscoreanzeige
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe (Ende des zweiten Semesters, Termin folgt)

- Komplett funktionsfähig mit persistenter Datenspeicherung.
- Details zum Backend (Persistierung, Accounts, API, ...) werden zu Beginn des zweiten Semesters bekannt gegeben.
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe

# Thema 5: Pac-Man

Umsetzung des Arcade-Klassikers Pac-Man, bei dem der Spieler durch ein Labyrinth navigiert, Punkte sammelt und Gegnern ausweicht.

## Zwischenstand 1 (Termin: 30.01.2025)

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2 (ca. 2 - 3 Wochen vor den Klausuren Semester 1, Termin folgt)

- Mindestanforderungen Frontend:
  - Darstellung des Spielfelds und der Pac-Man-Figur.
  - Bewegungslogik für Pac-Man
  - Grundlegendes Punktesystem
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3 (Anfang des zweiten Semesters, Termin folgt)

- Zusätzliche mindestanforderungen Frontend:
  - Gegnerbewegung mit Kollisionserkennung
  - Spielmechaniken wie Power-Ups
  - Highscoreanzeige
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe (Ende des zweiten Semesters, Termin folgt)

- Komplett funktionsfähig mit persistenter Datenspeicherung.
- Details zum Backend (Persistierung, Accounts, API, ...) werden zu Beginn des zweiten Semesters bekannt gegeben.
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe

# Thema 6: API Dashboard

Entwicklung eines Dashboards zur Visualisierung und Verwaltung von API-Daten (z. B. Wetter, Finanzen, etc.).

## Zwischenstand 1 (Termin: 30.01.2025)

- Git Repository mit funktionierender CI/CD-Pipeline und GitHub Pages (oder einem Äquivalent)
- 5 Minuten Präsentation pro Gruppe (Repository zeigen, Pipeline demonstrieren, Grundidee anhand von simplen Mockups erläutern)

## Zwischenstand 2 (ca. 2 - 3 Wochen vor den Klausuren Semester 1, Termin folgt)

- Mindestanforderungen Frontend:
  - Seite mit Layout
  - Abruf und Anzeige von API-Daten (z. B. über Fetch)
  - Grundlegende Filter- und Sortiermöglichkeiten
- 10 Minuten Präsentation pro Gruppe (Zwischenstand, Ideen, Probleme)

## Zwischenstand 3 (Anfang des zweiten Semesters, Termin folgt)

- Zusätzliche mindestanforderungen Frontend:
  - Interaktive Visualisierungen (z. B. Diagramme)
  - Interaktives Dashboard mit flexiblen Filter- und Anzeigeoptionen
  - Benutzerdefinierte Filter
- 10 Minuten Präsentation pro Gruppe (inkl. Funktionsdemo)

## Finale Abgabe (Ende des zweiten Semesters, Termin folgt)

- Komplett funktionsfähig mit persistenter Datenspeicherung.
- Details zum Backend (Persistierung, Accounts, Export, API, ...) werden zu Beginn des zweiten Semesters bekannt gegeben.
- Abgabe Quellcode + Dokumentation
- 15 Minuten Präsentation pro Gruppe
