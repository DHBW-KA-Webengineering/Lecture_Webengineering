---
title: Übungsaufgabe TypeScript
date: 2025-02-27
lang: de-DE
author: "Silas Schnurr"
...

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

## TypeScript in Gruppenprojekt einbauen

1. Wählen Sie in Ihrem Gruppenprojekt eine bestehende JavaScript-Codebasis und erweitern Sie diese um TypeScript.
2. Benennen Sie mindestens eine .js-Datei in .ts um und passen Sie den Code entsprechend an (z. B. durch das Hinzufügen von Typannotationen).
3. Achten Sie darauf, dass das Projekt weiterhin lauffähig bleibt und keine TypeScript-Fehler auftreten.
4. Dokumentieren Sie kurz, welche Anpassungen Sie vorgenommen haben und warum diese notwendig waren.

Hinweis: Falls Sie in Ihrem Projekt keine JavaScript Funktionen haben, da Sie z. B. Angular verwenden, könne Sie folgende Funktion als Grundlage für die Aufgaber verwenden:

```javaScript
function TaskManager() {
    this.tasks = [];

    this.addTask = function(name, priority) {
        const task = {
            id: this.tasks.length + 1,
            name: name,
            priority: priority || 'normal',
            completed: false
        };
        this.tasks.push(task);
        console.log(`Aufgabe hinzugefügt: ${name}`);
    };

    this.completeTask = function(id) {
        const task = this.tasks.find(t => t.id === id);
        if (task) {
            task.completed = true;
            console.log(`Aufgabe ${task.name} abgeschlossen.`);
        } else {
            console.log(`Aufgabe mit ID ${id} nicht gefunden.`);
        }
    };

    this.getTasks = function() {
        return this.tasks;
    };

    this.getIncompleteTasks = function() {
        return this.tasks.filter(task => !task.completed);
    };
}
```
