---
title: "Vorlesung Webengineering 1 - JavaScript"
topic: "Webengineering_1_5"
date: 2026-02-10
author: "Lukas Panni"
theme: "metropolis"
fonttheme: "structurebold"
fontsize: 12pt
urlcolor: BrickRed
linkcolor: BrickRed
aspectratio: 169
lang: de-DE
section-titles: true
plantuml-format: svg
...

# JavaScript Grundlagen

## Grundlagen

- Dynamisch schwach typisierte, objektorientierte Skriptsprache
- Kann in jedem modernen Browser ausgeführt werden
  - \rightarrow{} Clientseitige Programmierung
  - Wird heute auch häufig auf Serverseite eingesetzt (Node.js)

## Anwendungsfälle Clientseitig

- Dynamisches Verändern von HTML-Dokumenten \rightarrow{} Hinzufügen, Entfernen, Verändern von HTML-Elementen
  - Nachladen von Inhalten
  - Feedback an Nutzer ohne Neuladen der Seite
  - Eingabevorschläge
- Caching von Daten im Browser
- Ausführen von Berechnungen im Browser

## Anwendungsfälle Severseitig

- Dynamisches Erzeugen von HTML-Dokumenten
- Ausgabe von Daten in sonstigen Formaten (JSON, XML, ...) \rightarrow{} REST-APIs
  - Zugriff auf Datenbanken
- Vorteile durch gleiche Sprache auf Client- und Serverseite
  - Wiederverwendung von Code
  - Einfacher für Entwickler

## Ausführung im Browser

- JavaScript-Code wird im Browser ausgeführt
- Isolation über Browser-Sandbox
  - Zugriff auf HTML-Dokument
  - Zugriff auf Browser-APIs (DOM, Web Storage, ...)
  - **Kein Zugriff** auf andere Webserver, Dateisystem, Netzwerk, ...

## Ausführung auf dem Server

- JavaScript benötigt eine Runtime = Laufzeitumgebung, Code kann nicht nativ ausgeführt werden
- Typische Runtime: Node.js
  - Basiert auf der V8-Engine von Chromium (Chrome, Edge, ...)
  - Weniger Isolation als im Browser, Zugriff auf Dateisystem, Netzwerk, etc. möglich
- Andere Serverseitige Runtimes verfügbar
  - Deno: basiert auch auf V8, verschiedene Verbesserungen (z.B. TypeScript-Support, Sicherheitsfeatures)
  - Bun: sehr neu (Version 1.0 vom September 2023), basiert auf JavaScriptCore (Apple JS-Engine), kombiniert Bundler, Package Manager, Runtime, ...

# Grundlegende Syntax

## Grundlegende Syntax - Variablen

- Deklaration mit `var`, `let` oder `const` oder komplett ohne Schlüsselwort (nicht zu empfehlen!)
- Typisierung _dynamisch_
- `var` und `let` können neu zugewiesen werden
- `const` kann nicht neu zugewiesen werden
- `let` und `const` sind Block-Scoped, `var` Funktions-Scoped

\rightarrow{} `let` und `const` sind vorzuziehen!

## Grundlegende Syntax - Variablen

```javascript
let a = 1;
const b = 2;
var c = 3;

a = 3; // ok
a = "Hallo"; // ok -> Typen sind dynamisch!!
b = 4; // TypeError: invalid assignment to const 'b'

let a = 4; // SyntaxError: redeclaration of let a
```

## Grundlegende Syntax - Datentypen

- Datentypen werden automatisch ermittelt und automatisch konvertiert!
- Folgende Datentypen gibt es:
  - `number` (Gleitkommazahl)
  - `string` (Zeichenkette)
  - `boolean` (Wahrheitswert)
  - `undefined` (nicht definiert)
  - `null` (nicht vorhanden)
  - `object` (Objekt)
  - `symbol` (Symbol)
  - `bigint` (Ganzzahl beliebiger größe, Größer als `number`)

## Grundlegende Syntax - Datentypen

### Automatische Typkonvertierung

- Die automatische Typkonvertierung kann zu unerwarteten Ergebnissen führen:

```javascript
let a = 1;
let b = "2";

console.log(a + b); // "12"
console.log(a - b); // -1
console.log(a * b); // 2
console.log(a / b); // 0.5
```

## Grundlegende Syntax - Operatoren

- Operatoren wie in vielen anderen Sprachen auch (C/C++, Java, C#, ...)
  - Arithmetische Operatoren: `+`, `-`, `*`, `/`, `%`
  - Vergleichsoperatoren: `==`, `!=`, `>`, `<`, `>=`, `<=`
    - Besonderheit: `===` und `!==` vergleichen **ohne** automatische Typkonvertierung!
    - Ansonsten wird bei unterschiedlichen Typen immer in `number` konvertiert
- Logische Operatoren: `&&`, `||`, `!`

## Grundlegende Synax - Strings (1)

- Deklaration mit `'` oder `"`
- Konkatenation (Zusammenfügen) mit `+`
- Eigenschaften / Funktionen:
  - `length`: Länge des Strings
  - `charAt(index)`: Zeichen an Position `index`
  - `indexOf(string)`: Position von `string` im String
  - `substring(start, end)`: Teilstring von `start` bis `end` (exklusive)
  - `split(separator)`: Zerlegen an `separator`, ergibt Array
- Interpolation mit Backticks: `` `Hallo ${name}` ``
  - Alles zwischen `${` und `}` wird als JavaScript-Code interpretiert und Ergebnis in String eingefügt

## Grundlegende Syntax - Schleifen

- `for`-Schleife: `for (let i = 0; i < 10; i++) { ... }`
- `for ... of`-Schleife: `for (let i of collection) { ... }`
  - Über **Werte** der collection
- `for ... in`-Schleife: `for (let i in {a: 1, b: 2}) { ... }`
  - Über **Schlüssel** der collection
- `while`-Schleife: `while (condition) { ... }`

## Exkurs: `for ... of` vs. `for ... in`

```javascript
let arr = [1, 2, 3, 4, 5]; // Array-Deklaration

for (let i of arr) {
  console.log("of", i);
}

for (let i in arr) {
  console.log("in", i);
}
```

### Ausgabe?

## Exkurs: `for ... of` vs. `for ... in`

### Ausgabe

```
of 1
of 2
of 3
of 4
of 5
in 0
in 1
in 2
in 3
in 4
```

### Warum?

## Exkurs: `for ... of` vs. `for ... in` Erklärung

- In JavaScript ist ein Array ein **Objekt**, Indizes sind die Schlüssel!

  ```
  Array(5) [1, 2, 3, 4, 5]
    0: 1
    1: 2
    2: 3
    3: 4
    4: 5
    length: 5
  ```

- `for ... of` iteriert über die **Werte** der collection \rightarrow{} gibt die Werte aus!
- `for ... in` iteriert über die **Schlüssel** der collection \rightarrow{} gibt also nur die Indizes aus!

## Grundlegende Syntax - Arrays

- Deklaration: `let arr = [1, 2, 3, 4, 5];`
  - Oder: `let arr = new Array(1, 2, 3, 4, 5);`
  - Oder natürlich auch ohne Initialisierung: `let arr = [];` / `let arr = new Array();`
- Zugriff auf Elemente: `arr[0]`
- Länge des Arrays: `arr.length`
- Typen der Elemente können unterschiedlich sein

## Grundlegende Syntax - If-Abfragen

- If-Abfragen wie in vielen anderen Sprachen auch (C/C++, Java, C#, ...)
  - `if (condition) { ... }`
  - `if (condition) { ... } else { ... }`
- `if (condition) { ... } else if (condition) { ... } else { ... }`

## Grundlegende Syntax - Funktionen

- Deklaration: `function name(parameter1, parameter2, ...) { ... }`
- Aufruf: `name(argument1, argument2, ...)`
- Anzahl der Parameter muss nicht mit Anzahl der Argumente übereinstimmen
  - Zu viele Argumente werden ignoriert (bzw. in implizitem Parameter `arguments` gespeichert)
  - Zu wenige Argumente werden mit `undefined` aufgefüllt
  - \rightarrow{} Kein Überladen von Funktionen möglich!
- Funktionsnamen sind optional (anonyme Funktionen)
  - Alternativ speichern der Funktion als Variable

## Grundlegende Syntax - Funktionen

```javascript
// "Normale" Funktionsdeklaration
function add(a, b) {
  return a + b;
}

// Anonyme Funktion
const add2 = function (a, b) {
  return a + b;
};
```

## Grundlegende Syntax - Funktionen

```javascript
// Arrow-Function / Lambda
const add3 = (a, b) => {
  return a + b;
};
// Noch kürzer schreiben (nur für einzelne Ausdrücke):
const add4 = (a, b) => a + b;
```

Syntax ist weitgehend Geschmackssache, aber:

- "Normale" Funktionsdeklarationen werden "gehoisted" (werden vom Interpreter an den Anfang des Scopes verschoben \rightarrow{} können vor der Deklaration aufgerufen werden)

## Grundlegende Syntax - Funktionen

```javascript
add(1, 2); // ok
add2(1, 2); // ReferenceError: can't access lexical declaration
// 'add2' before initialization

function add(a, b) {
  return a + b;
}

const add2 = function (a, b) {
  return a + b;
};
```

# Objektorientierung

## Grundlagen

- Objekte sind eine Sammlung von Eigenschaften
  - Name-Wert-Paare
  - Kein Methodenkonzept: Eigenschaften vom Typ `function` können wie eine Methode genutzt werden
  - Können zur Laufzeit hinzugefügt werden

## Objekte erstellen

Objekte können auf verschiedene Arten erstellt werden:

```javascript
let obj = { a: 1, b: 2 }; // Objekt-Literal
let obj2 = new Object(); // Object-Konstruktor

// Konstruktor-Funktion
function Obj() {
  this.a = 1;
  this.b = 2;
}
let obj3 = new Obj();
```

## Klassen

Objekte können auch über Klassen erstellt werden:

```javascript
// Klasse (moderne JavaScript-Versionen)
class Obj2 {
  constructor() {
    this.a = 1;
    this.b = 2;
  }
}

let obj4 = new Obj2();
```

## Klassen

- Syntaxvereinfachung für Konstruktor-Funktionen
  - `typeof(Obj2)` = `"function"`
- "Methoden": ohne `function`-Schlüsselwort
  - `sum() { return this.a + this.b; }`
  - Oder anonyme Funktion in Objekt-Eigenschaft speichern
- Echte private Eigenschaften erst seit Mitte 2021 in Browsern unterstützt!
  - `#` vor Eigenschaftsnamen, Zugriff nur innerhalb der Klasse möglich

## Objekte nutzen

- Weitgehend wie in anderen Sprachen auch
  - Zugriff auf Eigenschaften: `obj.a`
  - Zugriff auf Methoden: `obj.sum()`
- Zusätzlich: Zugriff über `[]`-Operator
  - `obj["a"]`
  - `obj["sum"]()`

## Objekte verändern

```javascript
let obj = { a: 1, b: 2 };

// Achtung: geht nicht mit Arrow-Functions
// -> nutzen anderen Scope für `this`
obj.sum = function () {
  this.c = this.a + this.b;
};
obj.sum();
console.log(obj.c); // 3
```

## Vererbung

- In modernen JavaScript-Versionen kann das `extends`-Schlüsselwort genutzt werden
  - `class Obj2 extends Obj { ... }`
  - Erbt alle Eigenschaften und Methoden von `Obj`
- Alternativ: `Object.create(prototype)`
  - Erzeugt neues Objekt basierend auf `prototype` als **Prototyp**
  - \rightarrow{} "_In modern code, the class syntax should be preferred in any case._" (MDN)

## Vererbung

```javascript
// class Obj { constructor(a,b); a; b; sum() { return a+b };
//             print() { console.log(this.sum()); } }

class Obj2 extends Obj {
  constructor(a, b, c) {
    super(a, b); // Aufruf des Konstruktors der Elternklasse
    this.c = c;
  }

  sum() {
    return super.sum() + this.c;
  }
}
```

## Vererbung

```javascript
...

let obj = new Obj(10, 20);
console.log(obj); // Object { a: 10, b: 20 }
console.log(obj.sum()); // 30
obj.print(); // 30

let obj2 = new Obj2(1, 2, 3);
console.log(obj2); // Object { a: 1, b: 2, c: 3 }
console.log(obj2.sum()); // 6
obj2.print(); // 6
```

# JavaScript Fortgeschritten

## Destructuring

- JavaScript kann Objekte und Arrays automatisch in ihre Einzelteile "zerlegen"

```javascript
const obj = { a: 1, b: 2, c: 3 };
const arr = [1, 2, 3];

// komplett
var { a, b, c } = obj; // a = 1, b = 2, c = 3
var [a, b, c] = arr; // a = 1, b = 2, c = 3

// teilweise
var { a, ...rest } = obj; // a = 1, rest = {b: 2, c: 3}
var [a, ...rest] = arr; // a = 1, rest = [2, 3]
```

_Hier mit `var`, um alles in ein Beispiel zu packen, schlechter Stil!_

## Higher-Order Functions

- Funktionen können in JavaScript
  - Als Variable gespeichert werden
  - Als Parameter übergeben werden
  - Als Rückgabewert zurückgegeben werden
- _Higher-Order Functions_ = Funktionen, die selbst Funktionen als Parameter annehmen oder eine Funktion zurückgeben

## Higher-Order Functions - Beispiel

```javascript
const add = (a, b) => a + b;
const sub = (a, b) => a - b;

const calc = (a, b, op) => op(a, b);
calc(1, 2, add); // 3
calc(1, 2, sub); // -1
```

## `map` und `filter`

- Higher-Order Functions auf Arrays \rightarrow{} erleichtern die Arbeit mit Arrays
- `map`: erzeugt neues Array mit Ergebnis der Funktion für jedes Element des Arrays
- `filter`: erzeugt neues Array mit allen Elementen, für die die Funktion `true` zurückgibt

## `map` und `filter` - Beispiel

```javascript
const arr = [1, 2, 3, 4, 5];

const squareFn = (x) => x * x;
const isEvenFn = (x) => x % 2 == 0;

const squares = arr.map(squareFn); // [1, 4, 9, 16, 25]
const even = arr.filter(isEvenFn); // [2, 4]

const squaresEven = arr.filter(isEvenFn).map(squareFn); // [4, 16]
```

## Weitere Higher-Order Functions

- `forEach`: Führt Funktion für jedes Element aus
- `some`: Gibt `true` zurück, wenn Funktion für mindestens ein Element `true` zurückgibt
- `every`: Gibt `true` zurück, wenn Funktion für alle Elemente `true` zurückgibt
- `find`: Gibt erstes Element zurück, für das die Funktion `true` zurückgibt
- `reduce`: Reduziert Array auf einen Wert
- ...

\rightarrow{} Verwendung bei Bedarf nachschlagen

## Promises

- Asynchrone Programmierung in JavaScript
- Asynchrone Funktionen geben ein Promise zurück
  - Promise kann später einen Wert zurückgeben (oder nichts) oder fehlschlagen
  - Während der Ausführung können andere Code-Teile ausgeführt werden
- Nützlich für Operationen mit viel Wartezeit: Netzwerk, Dateisystem, ...

## Promises - Beispiel

```javascript
const promise = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve("World!"); // resolve() = Promise erfolgreich
  }, 1000); // 1000ms = 1s warten, bevor Code ausgeführt wird
});

promise.then((value) => {
  // Dieser Code wird erst nach Abschluss des Promises ausgeführt
  console.log(value);
});

// Ausführung geht direkt hier weiter!
console.log("Hello");
```

## Promises - `async` und `await`

- Syntaxerweiterung für einfachere Handhabung von Promises
- `async` Funktionen geben automatisch ein Promise zurück
- `await` blockiert Ausführung bis Promise fertig ist

## Promises - `async` und `await` - Beispiel

```javascript
async function greeting() {
  // setTimeout gibt kein Promise zurück! eigenes erzeugen
  await new Promise((resolve) => setTimeout(resolve, 1000));
  return "World!";
}

const promise = greeting();
console.log("Hello");
console.log(await promise);
```
