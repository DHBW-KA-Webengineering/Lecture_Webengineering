---
title: Übungsaufgabe Produkt-API mit express und TypeScript
date: 2025-06-05
lang: de-DE
author: "Lukas Panni"
...

# Lösung

## 1. API Endpunkte

| HTTP-Methode | Endpunkt               | Beschreibung                                                                                                    |
| :----------- | :--------------------- | :-------------------------------------------------------------------------------------------------------------- |
| GET          | /products              | Gibt eine Liste aller Produkte zurück.                                                                          |
| GET          | /products?name=:name   | Filtert Produkte nach dem angegebenen Namen (enthält).                                                          |
| GET          | /products?price=:price | Filtert Produkte nach dem angegebenen Preis (exakt).                                                            |
| GET          | /products?currency=:cur | Filtert Produkte nach der angegebenen Währung (exakt).                                                          |
| GET          | /products/:id          | Gibt ein bestimmtes Produkt anhand seiner ID zurück.                                                            |
| POST         | /products              | Erstellt ein neues Produkt.                                                                                    |
| PUT          | /products/:id          | Aktualisiert ein bestehendes Produkt anhand seiner ID.                                                          |
| DELETE       | /products/:id          | Löscht ein Produkt anhand seiner ID.                                                                            |

_Achtung_: Query-Parameter wie `name`, `price` und `currency` werden in express nicht automatisch validiert und können nicht in der URL angegeben werden (hier nur als Beispiel)

## Rest: [GitHub](https://github.com/DHBW-KA-Webengineering/Product_API)

1. Typen erstellen: `Product`, `Currency`
2. Repository interface erstellen: `ProductRepository`
3. Repository implementieren: `InMemoryProductRepository`
  - Einfache Array-basierte Implementierung, wie in der Vorlesung schon gezeigt
4. Implementierung der Endpunkte unter Verwendung des Repositories
5. Refactoring der Endpunkte in express Router 
  - Funktion `buildProductRouter` um Router mit Dependency Injection für das Repository zu erstellen 