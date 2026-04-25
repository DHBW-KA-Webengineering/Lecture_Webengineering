---
title: "Vorlesung Webengineering 1 - Lint & Test"
topic: "Webengineering_1_2_XX"
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


# Hilfreiche Entwicklungstools

## ESLint - Grundlagen

- [ESLint](https://eslint.org/) ist ein Linting-Tool für JavaScript und TypeScript
  - Analyse des Quellcodes, kann potenzielle Fehler und Code-Qualitätsprobleme erkennen
  - Konfigurierbare Regeln
- Vorteile:
  - Erkennung potenzieller Fehler
  - Verbesserte Code-Qualität
  - Konsistenter Code-Style im Team

## ESLint - Setup mit TypeScript

- [Quickstart](https://eslint.org/docs/latest/use/getting-started): `npm init @eslint/config@latest`
  - Dem Setup-Dialog folgen
- Ausführen von ESLint: `npx eslint .`
- Tipp: Script in `package.json` hinzufügen:
  - `"lint": "eslint --fix"` (`--fix` kann bestimmte Probleme direkt lösen) \rightarrow{} `npm run lint`
- Konfiguration von Regeln und Verhalten in `eslint.config.js` (oder `.mjs`)
  - Abhängig von Angaben aus dem Setup-Dialog

## ESLint - Konfiguration TypeScript + Node

- Automatisch erzeugte Konfiguration ist gut für den Einstieg
- Erweiterte TypeScript-Regeln nutzen tiefergreifende Typ-Informationen von Typescript
  - Sind dadurch mächtiger, aber auch langsamer
- Weitere Informationen und Setup: [Doku](https://typescript-eslint.io/getting-started/typed-linting/)
- Auch hilfreich ist die Config `eslint-config-prettier`, um Probleme bei der Verwendung von `prettier` zur Code-Formatierung zu vermeiden
- Eine gute Basiskonfiguration (mit passender `tsconfig.json`) ist auch in [Template_Node_Express](https://github.com/DHBW-KA-Webengineering/Template_Node_Express) zu finden

## ESLint - Regeln

- [Regeln](https://eslint.org/docs/rules/) sind konfigurierbar
  - `off` oder `0`: Regel deaktiviert
  - `warn` oder `1`: Regel als Warnung
  - `error` oder `2`: Regel als Fehler
  - Weitere Optionen je nach Regel
- In der automatisch erstellten Konfiguration für Typescript werden auch Regeln von `@typescript-eslint` genutzt
- Beispiel: 

```typescript
"@typescript-eslint/no-unused-vars": [
  "error", 
  { "varsIgnorePattern": "^_", "argsIgnorePattern": "^_" }
]
```
 
## Testing mit Vitest

### Grundlagen Testing

- Automatisierte Tests sind essenziell für Softwarequalität
- Früherkennung von Fehlern und Sicherstellen der Funktionalität
- Verschiedene Testarten:
  - Unit Tests: Einzelne Funktionen/Komponenten
  - Integration Tests: Zusammenspiel mehrerer Komponenten
  - End-to-End Tests: Gesamtes System

- Was sollte getestet werden?
  - Fokus auf zentrale Funktionalität
  - Idealerweise sollte alles getestet werden, in der Praxis aber oft nicht möglich
  - Nicht nur der "Happy Path" testen, sondern auch Fehlerfälle


## Vitest Installation und Setup

- [Vitest](https://vitest.io/) ist ein Test-Framework für JavaScript und TypeScript
  - Einfach und intuitiv zu benutzen
  - Kompatibel mit eventuell schon bekannter Jest-Syntax
- Installation: `npm install --save-dev vitest` (als Dev-Dependency, da nur zur Entwicklungszeit benoetigt)
  - Ausfuehren von Tests: `npx vitest`
    - Standardmäßig werden Tests bei Änderungen automatisch neu ausgeführt
  - Auch hier ein Script in `package.json` sinnvoll: `"test": "vitest"`
    - eventuell kommen weitere flags dazu
- Oft gar keine Konfiguration notwendig

## Arrange Act Assert Pattern

```typescript
import { expect, test } from "vitest";
test('should create new user', () => {
  // Arrange: Vorbereitung
  const userService = new UserService();
  const userData = { name: 'Test User' };

  // Act: zu testende Aktion ausführen
  const newUser = userService.createUser(userData);

  // Assert: Ergebnis prüfen
  expect(newUser).toHaveProperty('id');
  expect(newUser.name).toBe('Test User');
});
```

## Vitest  Assertions

- `expect(value).toBe(expected)`: Wert ist gleich erwartetem Wert (mit `===`)
- `expect(value).toEqual(expected)`: Wert ist gleich erwartetem Wert (`==`, rekursiv für Objekte)
- Siehe [Dokumentation](https://vitest.dev/api/expect.html) 

## Vitest - Mocking

- Tests sollen nicht unbedingt das Verhalten von Abhängigkeiten testen
  - z.B. Funktionen mit Seiteneffekten (Dateisystem, Datenbanken), oder externe Bibliotheken
- Mocking: Ersetzen von Abhängigkeiten durch kontrollierbare Dummy-Implementierungen
- Mock für npm package: `vi.mock('package-name', () => ({ ... }))`
  - Zweiter Parameter: Factory-Funktion, return-Wert ersetzt das Package. Nützlich um Funktionen beliebig zu überschreiben
- Mock für Funktion: `vi.fn()`
  - Aufrufe werden aufgezeichnet und können geprüft werden
- Siehe [Dokumentation](https://vitest.dev/api/vi.html)


## Vitest - Mocking Beispiel

```typescript
import { readFileSync } from 'fs';

vi.mock('fs', () => ({
  readFileSync: () => 'Hello, World!',
}));

test('should read file', () => {
  const content = readFileSync('test.txt');
  expect(content).toBe('Hello, World!');
});
```

## Vitest UI

- CLI Output ist oft nicht sehr übersichtlich
- Vitest stellt eine Web-UI zur einfacheren Visualisierung von Testergebnissen bereit
  - Installation: `npm install --save-dev @vitest/ui`
  - Starten `vitest --ui`
- Weitere Infos siehe [Vitest UI](https://vitest.dev/guide/ui.html)

## Theoretische Fragen

- Nennen Sie Vorteile beim Einsatz eines Linters.
- Nennen Sie Vorteile von automatisierten Tests.
- Warum schlägt folgender Test fehl? Was müsste geändert werden?
- Bonus: Welches Pattern wird beim Schreiben von Unit-Tests häufig verwendet?

## Beispiel Code-Aufgabe: Testing Basics

```typescript
class UserService {
  private idCounter = 0;
  public createUser(userData: { name: string }) {
    return { id: ++this.idCounter, ...userData };
  }
}

test('should create new user', () => {
  const userService = new UserService();
  const userData = { name: 'Test User' };
  const newUser = userService.createUser(userData);
  const expectedUser = { id: 1, name: 'Test User' };
  expect(newUser).toBe(expectedUser);
});
```

# AI in der Entwicklung

- AI Autocomplete a la Copilot
- Copilot für Studenten, VSCode Integration

- Agentic Development
  - Claude Code + OpenCode
  - Best Practices
  - Guardrails: AGENTS.md, typecheck, lint, test