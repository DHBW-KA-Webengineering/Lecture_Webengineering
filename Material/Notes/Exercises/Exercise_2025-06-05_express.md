---
title: Übungsaufgabe Produkt-API mit express und TypeScript
date: 2025-06-05
lang: de-DE
author: "Lukas Panni"
...

\clearpage

# Produkt-API mit express und TypeScript

Entwickelt eine einfache _REST_-API zur Verwaltung von Produkten unter Verwendung von express und TypeScript.

## Gewünschte Funktionen:

- Abrufen einer Liste aller Produkte.
  - Filtern muss möglich sein nach Name, Preis, Währung
- Erstellen eines neuen Produkts.
- Abrufen eines bestimmten Produkts anhand seiner ID.
- Aktualisieren eines bestehenden Produkts.
- Löschen eines Produkts

## Anforderungen:

- Die API muss mit TypeScript und express implementiert werden.
- Die Daten müssen vorerst nicht persistiert werden, d.h. sie können im Arbeitsspeicher gehalten werden.
- Eine spätere Persistierung soll einfach einbaubar sein

## Aufgaben:

1. Vervollständigt die folgende Tabelle zu den Endpunkten der API:
   (Parameter in der gleichen Syntax wie bei `express` angeben)

| HTTP-Methode | Endpunkt                    | Beschreibung                           |
| ------------ | --------------------------- | -------------------------------------- |
| GET          | /products                   | Gibt eine Liste aller Produkte zurück. |


2. Erstellt die notwendigen Typdefinitionen (`class` / `interface` / `type`) für die API. Überlegt euch sinnvolle Eigenschaften für Produkte (mindestens: Produkt ist identifizierbar, hat einen Namen, eine Beschreibung und einen Preis (+ Währung)).
3. Implementiert die Endpunkte der API mit express und TypeScript.
4. Testet die API mit einem Tool wie Postman, Posting, Bruno, ... oder ganz einfach mit cURL.
