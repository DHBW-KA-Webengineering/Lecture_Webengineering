---
title: Übungsaufgabe JavaScript und TypeScript
date: 2026-02-16
lang: de-DE
author: "Silas Schnurr"
...

\clearpage

# Übungsaufgabe JavaScript

## JavaScript code verstehen

Ihr Team entwickelt eine Anwendung zur Erfassung von Arbeitszeiten. Um die gesetzlichen Bestimmungen bezüglich der Pausenzeiten einzuhalten, hat ein Teammitglied den folgenden JavaScript Code geschrieben. Sie schauen sich den Code im Rahmen eines Reviews an.

```javascript
const requiredBreaks = [
  { age: 18, workingHours: 10, requiredBreak: Infinity },
  { age: 18, workingHours: 9, requiredBreak: 0.75 },
  { age: 18, workingHours: 6, requiredBreak: 0.5 },
  { age: 18, workingHours: 0, requiredBreak: 0 },
  { age: 15, workingHours: 8, requiredBreak: Infinity },
  { age: 15, workingHours: 6, requiredBreak: 1 },
  { age: 15, workingHours: 4.5, requiredBreak: 0.5 },
  { age: 15, workingHours: 0, requiredBreak: 0 },
  { age: 0, workingHours: 0, requiredBreak: Infinity },
];

function getRequiredBreakTime(age, workingHours) {
  return requiredBreaks.find(
    (a) => age >= a.age && workingHours > a.workingHours,
  ).requiredBreak;
}
```

### Beschreiben des Quellcodes

Beschreiben Sie in eigenen Worten, was die Funktion getRequiredBreakTime macht und wie sie funktioniert. Erklären Sie dabei wie genau die Funktion vorgeht und gehen Sie auch auf mögliche Probleme beim vorliegenden Code ein.

### Schreibtischtest

Bestimmen Sie das Ergebnis der acht folgenden Codeschnipsel im Kontext des obenstehenden Programmcodes.

| **Funktionsaufruf**                  | **Ergebnis des Aufrufs** |
| ------------------------------------ | ------------------------ |
| `getRequiredBreakTime("14", "2")`    |                          |
| `getRequiredBreakTime(9, true+true)` |                          |
| `getRequiredBreakTime(45, 4)`        |                          |
| `getRequiredBreakTime(20, 9)`        |                          |
| `getRequiredBreakTime(22, -1)`       |                          |
| `getRequiredBreakTime(-45, 0)`       |                          |
| `typeof requiredBreaks`              |                          |
| `typeof requiredBreaks.halloWelt`    |                          |

## `fetch` API

Erstellen Sie eine neue Seite, welche eine Zusammenfassung über Pokémon auf Basis der Pokédex-Nummer anzeigen kann. Die Daten sollen von der [PokéAPI](https://pokeapi.co/) abgerufen werden.
Die Seite soll ein Suchfeld für die Pokédex-Nummer haben und nach Absenden mindestens folgende Informationen anzeigen:

- Name
- Bild(er)
- Typen
- Attacken (Auswahl)

## Theoretische Fragen

Beantworten Sie die folgenden Fragen schriftlich:

1. Was ist JavaScript und wie unterscheidet es sich von HTML und CSS?
2. Was ist der Unterschied zwischen var, let und const bei der Variablendeklaration?
3. Wie funktionieren Funktionen in JavaScript, und was ist der Unterschied zwischen einer normalen Funktion und einer Arrow Function (`=>`)?
4. Was versteht man unter “Hoisting” in JavaScript, und wie beeinflusst es die Code-Ausführung?
5. Warum ist das Ergebnis von `parseInt(0.0000005)` 5? (Tipp: Automatische Typkonvertierung)

\clearpage

# React Tutorial

Im Rahmen der Vorlesung wurde bereits mit den Lernpfaden zu den Themen React und Next begonnen. Die Inhalte zu diesen Themen sind zwar nicht klausurrelevant, jedoch umso wichtiger für Ihr Projekt. Aus diesem Grund ist Folgendes für ein erfolgreiches Projekt durchzuführen:

- Absolvieren Sie alle Zehn Kapitel des [React Foundation Lernpfads](https://nextjs.org/learn/react-foundations)
- Absolvieren Sie mindestens die Kapitel 1 - 19 und 28 - 32 des Lernpfads [Pages Router](https://nextjs.org/learn/pages-router). Dieser Lernpfad vermittelt die Grundlagen von Next und wie innerhalb der Anwendung navigiert wird.

\clearpage

# Übungsaufgabe TypeScript

In dieser Übung lernen Sie die Grundlagen von TypeScript kennen, integrieren es in ein kleines Projekt und vertiefen Ihr Wissen mit theoretischen Fragen. Dadurch gewinnen Sie ein erstes Verständnis für die Vorteile von TypeScript und dessen praktische Anwendung.

## TypeScript Kennenlernen

1. Erstellen Sie ein neues TypeScript-Projekt oder erweitern Sie die Poké-API-Fetch-Anwendung aus der vorherigen Aufgabe.
2. Zeigen Sie anhand von drei konkreten Beispielen, welche Vorteile die Nutzung von TypeScript bietet (z. B. Typensicherheit, bessere Code-Vervollständigung, Fehlervermeidung).
3. Stellen Sie sicher, dass das Projekt mit den folgenden Befehlen funktioniert:
   • npm run build zum Kompilieren
   • npm run start zum Starten

Hinweis: Verwenden Sie die “scripts”-Sektion in der package.json, falls erforderlich.

## Theoretische Fragen

Beantworten Sie die folgenden Fragen mithilfe des bereitgestellten Vorlesungsskripts oder des Internets:

1. Warum kann die dynamische Typisierung in JavaScript zu Problemen führen? Nennen Sie ein Beispiel.
2. Was versteht man unter Type Coercion, und welche unerwarteten Ergebnisse kann dies verursachen?
3. Welche Vorteile bietet die statische Typisierung in TypeScript?
4. Warum müssen TypeScript-Dateien kompiliert werden, bevor sie im Browser ausgeführt werden können?
5. Welche Konfigurationsmöglichkeiten bietet die tsconfig.json-Datei, und warum ist die Option strict besonders nützlich?
6. Was ist Type Inference, und wie unterscheidet es sich von expliziten Typannotationen?
7. Welche zusätzlichen Klassenfeatures bietet TypeScript im Vergleich zu JavaScript (ES6)?
8. Wofür werden Utility Types wie Partial<T> oder Readonly<T> verwendet?

Schreiben Sie Ihre Antworten in Stichpunkten oder kurzen Sätzen auf.

\clearpage

## TypeScript in Gruppenprojekt einbauen

1. Wählen Sie in Ihrem Gruppenprojekt eine bestehende JavaScript-Codebasis und erweitern Sie diese um TypeScript.
2. Benennen Sie mindestens eine .js-Datei in .ts um und passen Sie den Code entsprechend an (z. B. durch das Hinzufügen von Typannotationen).
3. Achten Sie darauf, dass das Projekt weiterhin lauffähig bleibt und keine TypeScript-Fehler auftreten.
4. Dokumentieren Sie kurz, welche Anpassungen Sie vorgenommen haben und warum diese notwendig waren.

Hinweis: Falls Sie in Ihrem Projekt bereits Typecript verwenden, könne Sie folgende Funktion als Grundlage für die Aufgabe verwenden:

```javaScript
function getDriversWithPlates(people) {
  let drivers = [];

  for (let person of people) {
    const initials = person.name
      .split(' ')
      .map((n) => n[0])
      .join('');
    const birthDate = new Date(person.birthDate);
    const birthYear = birthDate.getFullYear();
    const birthMonth = (birthDate.getMonth() + 1).toString().padStart(2, '0');
    const birthDay = birthDate.getDate().toString().padStart(2, '0');

    // Standard-Kennzeichenoptionen
    let licensePlate1 = `KA-${initials}-${birthDay}${birthMonth}`;
    let licensePlate2 = `KA-${initials}-${birthYear}`;

    // H- oder E-Kennzeichen hinzufügen, falls angegeben
    if (person.carType === 'oldtimer') {
      licensePlate1 += 'H';
      licensePlate2 += 'H';
    } else if (person.carType === 'electric') {
      licensePlate1 += 'E';
      licensePlate2 += 'E';
    }

    const age =
      new Date().getFullYear() -
      birthYear -
      (birthMonth < new Date().getMonth() + 1
      || (birthMonth == new Date().getMonth() + 1
      && new Date().getDate() <= birthDay) ? 0 : 1);

    if (age >= 18) {
      drivers.push({
        name: person.name,
        licensePlates: [licensePlate1, licensePlate2],
      });
    }
  }

  return drivers;
}

// Beispielnutzung
const people = [
  { name: 'Max Mustermann', birthDate: '2003-05-15', carType: 'oldtimer' },
  { name: 'Lisa Schmidt', birthDate: '2010-11-22' },
  { name: 'Hans Müller', birthDate: '1990-07-10', carType: 'electric' },
];

console.log(getDriversWithPlates(people));
```
