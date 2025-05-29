---
title: "Vorlesung Webengineering 1 - TypeScript"
topic: "Webengineering_1_2_4"
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

# Wiederholung TypeScript


## Basics

- Typprüfung zur Entwicklungszeit, keine Prüfung zur Laufzeit!
- TypeScript ist ein Superset von JavaScript
  - Gültiges JavaScript ist immer auch gültiges TypeScript
  - Explizite Typangaben sind optional
- TypeScript-Compiler `tsc` übersetzt TypeScript-Code in JavaScript-Code
- Vorteile
  - Vermeidung/Früherkennung von Fehlern
  - Verbesserung der Codequalität


## Type Annotations

Explizite Typangaben für Variablen, Funktionen, Parameter, Rückgabewerte, etc.

```typescript
const message: string = "Hello, World!";

function greet(name: string): string {
  return `Hello, ${name}!`;
}
```
Type-Inferenz sorgt dafür, dass viele Typangaben nicht notwendig sind und Typsicherheit trotzdem gegeben ist.


## Klassen und Interfaces 

- Klassen und Interfaces auch zur Strukturierung von Code
- Code-Beispiel: [`typescript-classes.ts`](https://github.com/TINF23B5-Webengineering/Lecture_Code/blob/2025/23_Typescript/typescript-example/typescript-classes.ts)
- Generics: Typen als Parameter
  - Beispiel: `class List<T> { ... }` zur Beschreibung einer Liste vom Typ `T`, der tatsächliche Typ (z.B. `number`) wird erst bei Instanziierung festgelegt (bzw. automatisch erkannt)
  - Beispiel: `type Result<T> = { success: true, data: T } | { success: false, error: Error }`


# TypeScript - Anwendung in der Praxis


## TypeScript in der Praxis

- Viele der TypeScript-Features sind in der Praxis sehr nützlich
  - Insbesondere durch steigende Verbreitung von TypeScript in Bibliotheken und Frameworks
- Es gibt aber auch praktische Probleme:
  - Konfiguration `tsconfig.json` ist nicht immer einfach 
    - Projekt-Templates helfen hier
  - Zusätzlicher Build-Schritt notwendig 
  - Typdefinitionen für Bibliotheken sind nicht immer vorhanden oder unvollständig


## express mit TypeScript

- [`DefinitelyTyped`-Projekt](https://github.com/DefinitelyTyped/DefinitelyTyped) stellt Typdefinitionen für viele JavaScript-Bibliotheken bereit
  - Viele Bibliotheken kommen inzwischen direkt mit TypeScript-Unterstützung
- Installation von typen für express
  - `npm install express @types/express`

## express mit TypeScript - Beispiel User Router (1)

```typescript
const users: User[] = [
  { id: 1, name: "Lukas" },
  { id: 2, name: "Silas" },
];

router.get("/", (_, response) => {
  response.json(users);
});
```

## express mit TypeScript - Beispiel User Router (2)

```typescript
router.get("/:id", (request, response) => {
  const id = parseInt(request.params.id);
  const user = users.find((user) => user.id === id);

  if (user) {
    response.json(user);
  } else {
    response.status(404).json({ message: "User not found" });
  }
});
```

## express mit TypeScript - Beispiel User Router (3)

![Typsicherheit bei Pfad-Parametern](media/path-param-types-express.png)


## express mit TypeScript - Beispiel Caching Middleware

- Siehe [cache-middleware.ts](https://github.com/TINF23B5-Webengineering/Lecture_Code/blob/2025/23_Typescript/typescript-express/cache-middleware.ts)
- Vorteile:
  - Stellt kompatible `getCacheKey` Funktion zur Entwicklungszeit sicher
  - Typsicherheit bei Verwendung
  - Allgemein bessere Developer Experience (DX)

## Beispiel: Repository Pattern mit TypeScript (1)

- Eventuell relevant für Projektarbeit!
- Repository Pattern: Abstraktion von Datenzugriff
  - Ermöglicht Austausch von Datenquellen (z.B. verschiedene Datenbanksysteme, Mock-Implementierungen)
  - Entkoppelt Datenspeicherung von restlicher Logik
  - \rightarrow{} Einfaches Testen von Daten-abhängiger Logik ohne echte Datenbank

## Beispiel: Repository Pattern mit TypeScript (2)

![repository pattern visualization](media/repository-visualization.png){height=80%}

## Beispiel: Repository Pattern mit TypeScript (3)

```typescript
// user-repository.ts
export interface UserRepository {
  getUserById(id: number): User | undefined;
  addUser(user: User): void;
  ...
}
// index.ts
const userStore: UserRepository = new InMemoryUserRepository();
app.get("/user/:id", (req, response) => {
  response.json(userStore.getUserById(req.params.id));
});
```

## Beispiel: Repository Pattern mit TypeScript(4)

- Realistischere Implementierung
  - User-Routen werden z.B. über `createUserRouter(userStore: UserRepository)` erzeugt
  - Parameter `userStore` wird je nach Konfiguration entsprechend initialisiert
  - \rightarrow{} Einfacher Austausch von Datenquellen anhand von z.B. Umgebungsvariablen

## Praxisaufgabe 1

Erweitert den User Router um eine Implementierung des Repository Pattern. Es sollen die klassischen CRUD Operationen implementiert werden. Als konkrete Implementierung des Repositories reicht ein In-Memory Speicher auf Basis eines Arrays aus.

# Typ-Validierung mit zod

## Input und Typ-Validierung zur Laufzeit mit zod

- [zod](https://zod.dev/) ist eine Bibliothek zur Input-Validierung
- Validierung basiert auf erwartetem _Schema_
- Erlaubt Validierung von primitiven Typen und komplexen Objekten zur Laufzeit
- Erzeugt aus Schema TypeScript-Typen zur statischen Typisierung zur Entwicklungszeit
- Installation: `npm install zod`

## zod - Version

- Aktuell Umstellung von Major-Version 3 auf 4
- In der Umstellungsphase sind beide Versionen parallel verfügbar (Version > 3.25)
  - Import von `zod` importiert Version 3
  - Import von Version 4 über `zod/v4`
- Alle hier gezeigten Beispiele sind auch mit Version 4 kompatibel
  - Einige Funktionen sind in Version 4 aber als `deprecated` markiert! 

## Warum Typ-Validierung zur Laufzeit?

- TypeScript bietet statische Typisierung **nur** zur Entwicklungszeit
- Code interagiert zur Laufzeit häufig mit externen Datenquellen (APIs, User-Input, Dateisystem, ...)
  - Daten externer Datenquellen sind immer als _untrusted input_ anzusehen!
  - Man kann sich nicht auf die Datentypen verlassen
- Typ-Validierung hilft, unerwartete Daten zu erkennen und entsprechend zu behandeln
  - \rightarrow{} Vermeidung von Laufzeitfehlern

## zod - Beispiel Strings

```typescript
import { z } from "zod";

// String mit Länge 1-20
const helloWorldSchema = z.string().min(1).max(20);
const string1 = helloWorldSchema.parse("Hello, World!"); // ok
const string2 = helloWorldSchema.parse("");
// Error: { code: 'too_small', message: ... }
const { success, data, error } = helloWorldSchema.safeParse("");
// ok, success = false
```

## zod - Primitive Typen

- [Primitive-Typen](https://zod.dev/?id=primitives)
  - `z.string()`
  - `z.number()`
  - `z.boolean()`
  - `z.date()`
  - ...
- Zusätzlich mit Support für Typumwandlung (Coercion) zur Laufzeit
  - `z.coerce.number().parse("1")` \rightarrow{} `1`
  - Keine vorherige Umwandlung von User-Input (strings) nötig

## zod - Einschränkungen für Primitive Typen (1)

- Einfache Einschränkungen für Wertebereiche möglich
- [Zahlen](https://zod.dev/?id=numbers)
  - Beispiel `z.number().gt(0).lte(100)` \rightarrow{} Zahl > 0 und <= 100
  - `gt`: greater than \rightarrow{} >
  - `gte`: greater than or equal \rightarrow{} >= alias `min`
  - `lt`: less than \rightarrow{} <
  - `lte`: less than or equal \rightarrow{} <= alias `max`
  - `int`: integer
  - `multipleOf`: Vielfaches von Zahl
  - `positive`, `negative`, `nonpositive`, `nonnegative` ...

## zod - Einschränkungen für Primitive Typen (2)

- [Strings](https://zod.dev/?id=strings) sehr viele Möglichkeiten, z.B.:
  - `min`, `max`: Länge
  - `email`: E-Mail-Adresse
  - `url`: URL
  - `uuid`: UUID
  - `ip`: IP-Adressen
  - `regex`: Validierung anhand von Regex
  - `includes`: String muss bestimmten Substring enthalten
  - `startsWith`, `endsWith`: String muss mit bestimmtem Substring beginnen/endigen
  - `trim`: Leerzeichen entfernen
  - `toLowerCase`, `toUpperCase`: Groß-/Kleinschreibung
  - `date`: ISO-Datum
  - ...

## zod - Einschränkungen für Primitive Typen (3)

- Einige string Einschränkungen sind in Version 4 `deprecated`
- Stattdessen gibt es jetzt die Funktionen `z.email()`, `z.url()`
- Siehe [zod v4 Dokumentation](https://zod.dev/v4?id=top-level-string-formats) für Details

## zod - Enums, optionale und undefinierte Werte

- Feste Wertemengen mit `z.enum()`
  - `z.enum(["red", "green", "blue"])`
- Bei schon vorhandenem Enum-Typ: `z.nativeEnum(MyEnum)`
- Optionale Werte mit `z.optional()` und `schema.optional()`
  - `z.optional(z.string())` \rightarrow{} = `z.string().optional()`

## zod - Komplexe Typen (1)

- Arrays mit `z.array()`
  - `min`, `max`: Minimale / Maximale Länge
  - `length`: Exakte Länge
  - `nonempty`: Nicht leer
- Tupel mit `z.tuple()`
  - `z.tuple([...])`
  - Feste Anzahl von Elementen
  - Typen der Elemente können unterschiedlich sein

## zod - Komplexe Typen (2)

- Definition von [Objekten](https://zod.dev/?id=objects) mit `z.object()`
  - `z.object({ key1: <zodSchema>, key2: ... })`

```typescript
const userSchema = z.object({
  id: z.number(),
  name: z.string(),
  email: z.string().email(),
});
```

- zod Schema kann in TypeScript-Typ für Verwendung bei Parameter- und Rückgabetypen konvertiert werden
  - `type SchemaType = z.infer<typeof schema>`
- Durch Type-Inference oft nicht nötig

## zod - Komplexe Typen (3)

- Weitere komplexe Typen:
  - [Unions](https://zod.dev/?id=unions)
  - [Discriminated Unions](https://zod.dev/?id=discriminated-unions)
  - [Records](https://zod.dev/?id=records)
  - [Maps](https://zod.dev/?id=maps)

## zod - Komplexe Typen (4)

- Komplexe zod Schemata können verschachtelt werden
- Beispiel:

```typescript
const userSchema = z.object({
  ...
  emails: z.array(z.string().email()),
  address: z.object({
    street: z.string(),
    city: z.string(),
  }),

});
```

## zod - Sonstiges

- Viele weitere hilfreiche Funktionen:

  - `transform`: Transformation von Werten
  - `refine`: Benutzerdefinierte Validierungsfunktionen
  - ...

- Wenn Input-Validierung benötigt wird, ist zod in der Regel einer eigenen Implementierung vorzuziehen!

## zod - Fehlerbehandlung

- `.parse()` wirft bei Fehlern Exceptions vom Typ `ZodError`
- `.safeParse()` gibt ein Objekt zurück mit Feldern `success`, `data` und `error`
  - `success`: `true` bei Erfolg, `false` bei Fehlern
  - `data`: Geparste Daten bei Erfolg
  - `error`: `ZodError` bei Fehlern
- `ZodError`: `issues` Array mit allen Fehlern in der Form
- Siehe [zod Dokumentation zu Error Handling](https://zod.dev/ERROR_HANDLING)

## Praxisaufgabe 2


Erweitert den User Router um eine Implementierung der Input-Validierung mit zod. Es sollen alle Daten, die vom Client kommen validiert werden. Gebt bei fehlerhaften Daten einen Statuscode _422 Unprocessable Entity_ mit Details zum Fehler und der erwarteten Eingabe zurück.

## Theoretische Fragen

- Welche Aufgabe(n) erfüllt die Bibliothek _zod_?
- Erstellen Sie ein einfaches _zod_-Schema für _Message_-Objekte. Jedes Objekt hat eine positive Ganzzahl als _id_ einen nichtleeren Text (_content_) optional einen Liste von Autor-Namen (_authors_) und ein Erstellungsdatum (_createdAt_), das als string übermittelt wird.
- Warum sollten trotz Verwendung von TypeScript die Datentypen zur Laufzeit validiert werden?
- Für welche Art von Daten ist Typ-Validierung zur Laufzeit besonders wichtig?
- Wie kann ein _zod_-Schema in einen TypeScript-Typen umgewandelt werden?

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
- Konfiguration von Regeln und Verahlten in `eslint.config.js` (oder `.mjs`)
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
- Installation: `npm install --save-dev vitest` (Installation als Dev-Dependency, da nur zur Entwicklungszeit benötigt)
  - Ausfürhen von Tests: `npx vitest`
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