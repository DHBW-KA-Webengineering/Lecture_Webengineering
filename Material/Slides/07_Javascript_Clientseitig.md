---
title: "Vorlesung Webengineering 1 - Dynamische Webseiten Clientseitig"
topic: "Webengineering_1_7"
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

# JavaScript einbinden

## JavaScript einbinden

- JavaScript-Code wird in HTML-Dokument eingebunden
  - entweder direkt im HTML-Code
  - oder in externer Datei

```html
<!-- direkt -->
<script>
  // JavaScript-Code
</script>

<!-- extern, beliebige URL zu einer JavaScript-Datei -->
<script src="script.js"></script>
```

# Manipulation von HTML Dokumenten

## Clientseitige Dynamik mit JavaScript

- Manipulation des HTML-Dokuments
- Abruf von Daten vom Server
- Senden von Daten an den Server (ohne Neuladen der Seite)
- Animationen
- ...

## HTML Manipulation - DOM

### DOM = Document Object Model

- Baumstruktur für HTML-Dokumente \rightarrow{} Objektorientierte Repräsentation des Dokuments
- Für jedes Element (Tag) ein Node
- DOM-Methoden erlauben Zugriff auf Nodes und deren Attribute und Funktionen mit JavaScript
  - Ändern von Inhalten, HTML-Attributen, CSS-Eigenschaften, ...
  - Hinzufügen und Entfernen von Nodes und Kindern

## DOM - Beispiel

- Gelb: _element nodes_
- Blau: _attribute nodes_
- Rot: _text nodes_
- Grün: _comment nodes_

Beispiel von [SelfHTML Wiki](https://wiki.selfhtml.org/wiki/Datei:DOM-1.svg), CC-BY-SA-3.0

## DOM - Beispiel

![DOM Visualisierung](https://wiki.selfhtml.org/images/0/01/DOM-1.svg){height=90%}

## DOM Zugriff

- Zugriff auf DOM-Elemente über `document`-Objekt
  - Bildet Wurzel des DOM-Baums
  - Alle anderen Elemente sind Nachfahren von `document`
- Verschiedene Zugriffsmethoden
  - `getElementById()`
  - `getElementsByClassName()`
  - `getElementsByTagName()`
  - `querySelector()` \rightarrow{} CSS-Selektor
  - `querySelectorAll()` \rightarrow{} CSS-Selektor, mehrere Elemente

## DOM Zugriff - Beispiel

```html
...
<article>
  <h1 id="title">Artikelüberschrift</h1>
  ...
</article>
...
```

```javascript
const title = document.getElementById("title");
console.log(title); // -> <h1 id="title">
console.log(title.innerHTML); // -> Artikelüberschrift
```

## DOM Zugriff - Beispiel

```html
...
<article><section id="s-1" class="intro">...</section></article>
<article><section id="s-2" class="intro">...</section></article>
...
```

```javascript
const intros = document.getElementsByClassName("intro");
console.log(intros); // -> HTMLCollection {0: section#s-1.intro,
// 1: section#s-2.intro, ...}
console.log(intros[0]); // -> <section id="s-1" class="intro">
```

## DOM Zugriff - Beispiel

```html
...
<article id="art-1">...</article>
<article id="art-2">...</article>
...
```

```javascript
const articles = document.getElementsByTagName("article");
console.log(articles); // -> HTMLCollection {0: article#art-1,
// 1: article#art-2, ...}
console.log(articles[0]); // -> <article id="art-1">
```

## DOM Zugriff - Beispiel

```html
...
<article>
  <section id="s-1">...</section>
  <section id="s-2">...</section>
  <section id="s-3">...</section>
</article>
```

```javascript
const s1 = document.querySelector("section:last-child");
console.log(s1); // -> <section id="s-3">
```

## DOM Zugriff - Beispiel

```html
...
<article>
  <h1 id="h-1">...</h1>
  <section id="s-1">...</section>
  <section id="s-2">...</section>
</article>
```

```javascript
const elements = document.querySelectorAll("article > *");
console.log(elements); // -> NodeList {0: h1#h-1, 1: section#s-1,
// 2: section#s-2}
// -> alle direkten Kinder von article
```

## DOM Traversierung

- DOM-Elemente sind miteinander verknüpft
  - Alle sind Nachfahren von `document`
  - Jedes Element hat 1 Elternelement und 0..\* Kindknoten
- Zugriff auf
  - Kindknoten über `node.childNodes`
  - Elternknoten über `node.parentNode`
  - Eigenschaften über `node.nodeName`, `node.nodeType`, `node.nodeValue`, `node.textContent`, `node.innerHTML`, ...

## DOM Manipulation

- Ändern von Inhalten, HTML-Attributen, CSS-Eigenschaften, ...
- Hinzufügen und Entfernen von Nodes

## DOM Manipulation Text

Über `textContent` kann Text auch geändert werden

```html
...
<article>
  <h1 id="h-1">...</h1>
  <section id="s-1">...</section>
  <section id="s-2">...</section>
</article>
```

```javascript
const h1 = document.getElementById("h-1");
h1.textContent = "Neuer Text";
```

## DOM Manipulation HTML

- Über `innerHTML` kann **HTML** geändert werden
- _ACHTUNG_: neues HTML wird interpretiert (betrifft auch eingefügte scripte)!

```javascript
const article = document.getElementByTagName("article")[0];
article.innerHTML = "<h1>Neuer Titel</h1>";
```

## DOM Manipulation Neue Elemente

- Besserer Weg für neue Elemente: `document.createElement()`
  - Neues Element muss erst noch in DOM eingefügt werden, z.B. mit `appendChild()` / `insertBefore()` / `replaceChild()` / ...
  - Mehr Code, aber sicherer!

```javascript
const element = document.createElement("h1");
element.textContent = "Neuer Titel";
article = document.getElementByTagName("article")[0];
article.insertBefore(element, article.childNodes[0]);
```

## DOM Manipulation Attribute

- Zugriff auf Attribute über `element.getAttribute()` und `element.setAttribute()`
  - Zugriff auf `id` und `class` aber auch über `element.id` und `element.className`
- Entfernen über `element.removeAttribute()`
- Zugriff auf CSS-Eigenschaften über `element.style`

```javascript
const article = document.getElementByTagName("article")[0];
article.setAttribute("id", "art-1"); // == article.id = "art-1"
```

# Reaktion auf Benutzerinteraktion

## Event-Handler

- Browser löst bei Benutzerinteraktion Events aus
  - z.B. Klick auf Button, Änderung eines Formularfeldes, ...
- JavaScript kann auf Events reagieren \rightarrow{} Event-Handler
- Event-Handler werden mit `element.addEventListener(type, handler)` registriert
  - `element` Element, das das Event auslöst
  - `event` Name des Events, z.B. `click`, `change`, `keyup`, ...
  - `handler` auszuführende Funktion

```javascript
document.getElementById("button").addEventListener("click", handler);
```

## Event-Handler

- Beim Auslösen des Events wird der Handler mit `event` Argument aufgerufen
  - `event.target` auslösendes Element
  - `event.type` Name des Events

```javascript
function handler(event) {
  console.log(event.target); // -> <button id="button">
  console.log(event.type); // -> click
}
```

## Event-Handler setzen

- Event-Handler können auch direkt im HTML-Code gesetzt werden

  - Attribute `onclick`, `onchange`, `onkeyup`, ...
  - `this` ist das auslösende Element

- Solche Vermischung von HTML und JavaScript ist aber nicht empfehlenswert!

## Praxisaufgabe 1

Erweitert die Nachrichtenseite um ein Formular zum Schreiben neuer Artikel (mit Titel, Bild und Text). Beim Absenden des Formulars soll ein neuer Artikel auf der Seite eingefügt werden und das Formular geleert werden.

# `fetch` API

## Abruf externer Daten

- Moderne Browser unterstützen asynchrone HTTP-Requests über die `fetch` API
- Ersatz für die ältere `XMLHttpRequest` API
- Seit 2016 in allen gängigen Browsern verfügbar
- Immer vorzuziehen gegenüber `XMLHttpRequest`!

## `fetch` Funktion

- `fetch(resource, options): Promise<Response>`
  - `resource`: URL der abzurufenden Ressource
  - `options`: Optionen für den Request in Objektform
    - `method`, `headers`, `body`, ...
  - \rightarrow{} [Dokumentation](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)

## `fetch` Beispiel: Abruf von Daten

```javascript
const websiteResponse = await fetch("https://lukaspanni.de/")
console.log(await websiteResponse.text()); // -> HTML-Code

const apiResponse = await fetch("https://api.github.com
				/users/lukaspanni")
const data = await apiResponse.json(); // -> Objekt
console.log(data.location); // -> "Karlsruhe, Germany"
```

## Einschub: JSON

= JavaScript Object Notation

- Format zur Beschreibung von (JavaScript)-Objekten
- Im Prinzip jedes gültige Objekt- (oder Array-) Literal in JavaScript
- Häufig als Datenaustauschformat im Web

```json
{
  "name": "Lukas Panni",
  "age": 23,
  "location": "Karlsruhe, Germany"
}
```

## JSON erzeugen und parsen

- Umwandlung von JavaScript-Objekt in JSON-String: `JSON.stringify()`
- Umwandlung von JSON-String in JavaScript-Objekt: `JSON.parse()`

## `fetch` Beispiel: Senden von Daten

```javascript
// httpbin.org spiegelt die empfangenen Daten zurück
const response = await fetch("https://httpbin.org/post", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({ name: "Lukas Panni", location: "Karlsruhe" }),
});

console.log(await response.json());
```

## `fetch` Beispiel: Fehlerbehandlung

- `fetch` schlägt nur bei Netzwerkfehlern fehl
- HTTP-Status muss manuell auf Erfolg geprüft werden

```javascript
const response = await fetch("https://httpbin.org/status/404");
console.log(response.ok); // -> false
console.log(response.status); // -> 404
```

## Praxisaufgabe 2

Erstellt eine neue Seite, die eine Zusammenfassung über Pokémon auf Basis der Pokédex-Nummer anzeigen kann. Die Daten sollen von der [PokéAPI](https://pokeapi.co/) abgerufen werden.
Die Seite soll ein Suchfeld für die Pokédex-Nummer haben und nach Absenden mindestens folgende Informationen anzeigen:

- Name
- Bild(er)
- Typen
- Attacken (Auswahl)
