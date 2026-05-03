---
title: Gruppenarbeit - Aufgaben Frontend / Backend
date: 2026-05-XX
lang: de-DE
author: "Lukas Panni"
...

\clearpage

# Gruppenarbeit - Aufgaben Frontend / Backend

## Aufgabe

Analysiert den folgenden Anwendungsfall "Ich möchte ein neues MacBook kaufen" in eurer Gruppe.
Überlegt euch für jeden Schritt welche Aufgaben im Frontend und welche Aufgaben im Backend anzusiedeln sind und begründet eure Entscheidungen.
Betrachtet dabei auch die Daten die zwischen Frontend und Backend ausgetauscht werden müssen.
Erstellt ein grobes Schaubild (z.B. Sequenzdiagramm), um die Interaktionen zwischen Frontend und Backend zu visualisieren.

**Zeit**: 20 Minuten

### Folge-Auftrag

Im Anschluss: Besprecht eure Ergebnisse mit einer anderen Gruppe und diskutiert mögliche Unterschiede in euren Ergebnissen.
Erstellt eine kurze verallgemeinerte Zusammenfassung der wichtigsten Aufgaben für Frontend und Backend.

**Zeit**: 15 Minuten


# Use Case: "Ich möchte ein neues MacBook kaufen"

## 1. Startseite öffnen

- Nutzer öffnet den Online-Shop
- Sieht eine Liste von Produkten (z. B. verschiedene MacBooks)

## 2. Produkt suchen / filtern

- Nutzer nutzt die Suche (z. B. „MacBook“)
- Filtert nach:
  - Preis
  - Modell
  - Speichergröße

## 3. Produkt auswählen

- Nutzer klickt auf ein MacBook
- Produktdetailseite öffnet sich

## 4. Produkt konfigurieren

- Nutzer wählt:
  - RAM (z. B. 16 GB / 32 GB)
  - Speicher (z. B. 512 GB / 1 TB)
- Preis passt sich an


## 5. In den Warenkorb legen

- Nutzer klickt auf „In den Warenkorb“
- Warenkorb-Anzeige wird aktualisiert


## 6. Warenkorb öffnen

- Nutzer öffnet den Warenkorb
- Sieht:
  - ausgewähltes Produkt
  - Konfiguration
  - Gesamtpreis


## 7. Checkout starten

- Nutzer klickt auf „Zur Kasse“


## 8. Daten eingeben

- Nutzer gibt ein:
  - Name
  - Adresse
  - Zahlungsinformationen


## 9. Bestellung abschicken

- Nutzer klickt auf „Jetzt kaufen“


## 10. Bestätigung

- Nutzer sieht eine Bestellbestätigung
- Optional: erhält eine E-Mail