---
title: "Vorlesung Webengineering 1 - Datenbanken"
topic: "Webengineering_1_2_8"
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

# Crashkurs Relationale Datenbanken

## Was ist eine relationale Datenbank?

- Speicherung und Verwaltung von Daten organisiert in Tabellen
  - Tabellen bestehen aus Zeilen und Spalten
  - Zeile = **Datensatz**
  - Spalte = **Attribut**
- Attribute haben einen Datentyp (z.B. Text, Zahl, Datum)

## Beispiel: User-Tabelle

| ID  | Vorname | Nachname | GitHub-Username |
| --- | ------- | -------- | --------------- |
| 1   | Lukas   | Panni    | lukaspanni      |
| 2   | Silas   | Schnurr  | pa-ssch         |

- Attribute: `ID`, `Vorname`, `Nachname`, `GitHub-Username`
  - **Primärschlüssel**: `ID`, eindeutige Identifikation von Datensätzen
- Datensätze: `(1, Lukas, Panni, lukaspanni)`, `(2, Silas, Schnurr, pa-ssch)`

## Beispiel: Post-Tabelle

| ID  | Titel                                 | Autor | Inhalt |
| --- | ------------------------------------- | ----- | ------ |
| 1   | Vorlesung Webengineering I - Frontend | 2     | ...    |
| 2   | Vorlesung Webengineering I - Backend  | 1     | ...    |

## Beziehungen zwischen Tabellen - Fremdschlüssel

- Beziehungen zwischen Tabellen werden durch **Fremdschlüssel** definiert
- Fremdschlüssel verweist auf Primärschlüssel einer anderen Tabelle
  - Beispiel: `Autor` in Post-Tabelle verweist auf `ID` in User-Tabelle
  - Daten müssen nicht mehrfach gespeichert werden (Redundanz vermeiden)
  - Mehrfache Speicherung macht Updates fehleranfällig!

## Einfache lokale Datenbank: SQLite

- [SQLite](https://www.sqlite.org/index.html): Einfache relationale Datenbank ohne Server
- Daten werden in einer Datei gespeichert, erlaubt einfache Verwaltung von vielen einzelnen Datenbanken
- Erstellen neuer Datenbank: `sqlite3 mydatabase.db`
  - Noch einfacher mit GUI-Tools wie [DB Browser for SQLite](https://sqlitebrowser.org/)

## Praxisaufgabe 1

Installiert den SQLite-Browser und erstellt eine neue Datenbank mit den oben gezeigten Tabellen.
Falls ihr schon SQL Kenntnisse habt, könnt ihr die Datenbank auch über SQL-Befehle erstellen.
Erstellt zusätzlich eine Tabelle `comment`, die zu jedem Post Kommentare speichert.


## SQL (1)

- SQL (Structured Query Language) zur Verwaltung und Manipulation von Daten
- **Abfragen (SELECT)**:
  ```sql
  SELECT * FROM user;
  ```
- **Abfragen mit Filter (WHERE)**:
  ```sql
  SELECT * FROM user WHERE id = 1;
  ```
- **Einfügen (INSERT)**:
  ```sql
  INSERT INTO user (name, username) VALUES ('Lukas Panni', 
  'lukaspanni');
  ```

## SQL (2)

- **Aktualisieren (UPDATE)**:
  ```sql
  UPDATE user SET username = 'lpanni' WHERE id = 1;
  ```
- **Löschen (DELETE)**:
  ```sql
  DELETE FROM user WHERE id = 1;
  ```

## SQL - Joins

- Häufig werden Daten aus mehreren Tabellen benötigt
- **Joins** verbinden Daten aus mehreren Tabellen
- Einfacher Join über WHERE Bedingung:
  ```sql
  SELECT user.name, post.title FROM user, post 
  WHERE user.id = post.author;
  ```

## Praxisaufgabe 2

Schreibt einige SQL-Abfragen für die oben erstellte Datenbank:

- Ausgabe aller Posts mit Autorname und GitHub Benutzernamen.
- Ausgabe aller Kommentare zu einem Post.
- Ausgabe aller Kommentare zu Posts eines bestimmten Autors.


# Datenbanken in Webanwendungen

## Motivation

- Datenbanken erlauben eine effiziente und strukturierte Speicherung von Daten
- Trennung von Daten und Anwendungslogik ist grundsätzlich sinnvoll
- Wie bei Serverless-Deployment gesehen: Anwendung braucht einen Weg, Daten persistent zu speichern
  - Ermöglicht auch mehrere Instanzen der Anwendung

**Viele Backend-APIs sind nur ein dünner Wrapper um eine Datenbank**

- Mapping von HTTP-Requests auf SQL-Abfragen + ein bisschen Logik und Validierung
- Eure Projekt-Backends sind vermutlich auch simpel

## Anbindung von Datenbanken

- Datenbanken können auf verschiedenen Ebenen angesprochen werden
  - Direkt über SQL-Abfragen
  - Über ORM (Object-Relational Mapping) Bibliotheken

- Wenn möglich, sind ORM Bibliotheken zu bevorzugen
  - Abstraktion von Datenbank-Details \rightarrow{} DB leichter austauschbar
  - Weitgehender Schutz vor SQL-Injection
  - Definition von Datenmodellen im Code statt in SQL
  - Arbeit mit Objekten oft einfacher als SQL-Abfragen


## Drizzle ORM für TypeScript

