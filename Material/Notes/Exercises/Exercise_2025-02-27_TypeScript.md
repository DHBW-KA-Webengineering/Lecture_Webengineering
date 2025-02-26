---
title: Übungsaufgabe TypeScript
date: 2025-02-27
lang: de-DE
author: "Silas Schnurr"
...

\clearpage

# Übungsaufgabe TypeScript

In dieser Übung lernen Sie die Grundlagen von TypeScript kennen, integrieren es in ein kleines Projekt und vertiefen Ihr Wissen mit theoretischen Fragen. Dadurch gewinnen Sie ein erstes Verständnis für die Vorteile von TypeScript und dessen praktische Anwendung.

## TypeScript Kennenlernen

1. Erstellen Sie ein neues TypeScript-Projekt oder erweitern Sie eine bestehende JavaScript-Anwendung aus vorherigen Praxisaufgaben.
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

Hinweis: Falls Sie in Ihrem Projekt keine JavaScript Funktionen haben, da Sie z. B. Angular verwenden, könne Sie folgende Funktion als Grundlage für die Aufgaber verwenden:

```javaScript
function getDriversWithPlates(people) {
    let drivers = [];

    for (let person of people) {
        const initials = person.name.split(" ").map(n => n[0]).join("");
        const birthDate = new Date(person.birthDate);
        const birthYear = birthDate.getFullYear();
        const birthMonth = (birthDate.getMonth() + 1).toString().padStart(2, '0');
        const birthDay = birthDate.getDate().toString().padStart(2, '0');

        // Standard-Kennzeichenoptionen
        let licensePlate1 = `KA-${initials}-${birthDay}${birthMonth}`;
        let licensePlate2 = `KA-${initials}-${birthYear}`;

        // H- oder E-Kennzeichen hinzufügen, falls angegeben
        if (person.carType === "oldtimer") {
            licensePlate1 += "H";
            licensePlate2 += "H";
        } else if (person.carType === "electric") {
            licensePlate1 += "E";
            licensePlate2 += "E";
        }

        const age = new Date().getFullYear() - birthYear - (new Date().setFullYear(new Date().getFullYear()) < birthDate ? 1 : 0);

        if (age >= 18) {
            drivers.push({ name: person.name, licensePlates: [licensePlate1, licensePlate2] });
        }
    }

    return drivers;
}

// Beispielnutzung
const people = [
    { name: "Max Mustermann", birthDate: "2003-05-15", carType: "oldtimer" },
    { name: "Lisa Schmidt", birthDate: "2010-11-22" },
    { name: "Hans Müller", birthDate: "1990-07-10", carType: "electric" }
];

console.log(getDriversWithPlates(people));
```
