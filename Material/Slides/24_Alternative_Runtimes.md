---
title: "Vorlesung Webengineering 1 - Alternative Runtimes"
topic: "Webengineering_1_2_5"
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


# Alternative Runtimes für JavaScript/TypeScript

## Deno (1)

[deno.land](https://deno.land)

- Runtime für JavaScript und TypeScript
- Basiert wie Node.js auf V8-Engine
- idR. Performanter als Node.js
- Standardfunktionalität bereits eingebaut (z.B. HTTP-Server)
- Direkte Unterstützung von TypeScript, mitgelieferte Lint und Test-Tools
- Kein Package Manager (Module über URLs eingebunden)
  - Nutzung von NPM-Paketen meist problemlos möglich

## Deno (2)

- [Installation](https://docs.deno.com/runtime/manual#install-deno): `curl -fsSL https://deno.land/x/install/install.sh | sh` / `irm https://deno.land/install.ps1 | iex`
- Einfacher Webserver:

```typescript
Deno.serve((_request: Request) => {
  return new Response("Hello, world!");
});
```
Ausführen: `deno run --allow-net server.ts`

<!-- TODO: Änderungen mit Deno 2.0 -->

## Bun (1)

[bun.sh](https://bun.sh/)

- Runtime + Bundler + Package Manager + Test-Runner für JavaScript und TypeScript
- Basiert auf `JavaScriptCore` Engine aus Apple WebKit
- idR. Performanter als Node.js und Deno
- Standardfunktionalität bereits eingebaut (z.B. HTTP-Server)
- Nutzung von NPM-Paketen mit eigenem NPM-Client

## Bun (2)

- [Installation](https://bun.sh/docs/installation):
  - MacOS/Linux: `curl -fsSL https://bun.sh/install | bash`
  - Windows: powershell -c "irm bun.sh/install.ps1|iex"

- Einfacher Webserver:
    
```typescript
const server = Bun.serve({
  port: 8000,
  fetch(request) {
    return new Response("Welcome to Bun!");
  },
});
```

## Fazit Alternative Runtimes

- Alle Runtimes entwickeln sich ständig weiter
- Node-Ökosystem ist am größten: Pakete, Tools, Anleitungen, Stackoverflow-Beiträge, ...
- Bun etabliert sich aktuell immer mehr

\rightarrow{} Gerne alles ausprobieren und eigene Meinung bilden!

# Bun als moderne TypeScript-Runtime

## Warum Bun?

- Für neue TypeScript Projekte häufig sinnvoll
  - Keine Kompilation mit `tsc` notwendig
  - In Kombination mit `bun --watch` Funktionalität sehr angenehm für schnelle Iteration
  - Eigener Bundler und Test-Runner
- Performance-Gewinne können für größere Projekte relevant sein

## Bun TypeScript Projekt setup (1)

![bun init](media/bun-init.png){height=70%}

##  Bun TypeScript Projekt setup (2)

- Erstellt automatisch alle nötigen Dateien
  - `package.json` mit metadaten
  - `tsconfig.json` für TypeScript-Konfiguration \rightarrow{} erlaubt spätere Kompilation und IDE-Unterstützung
- `src/index.ts` als Einstiegspunkt

## Elysia - express Alternative für Bun

- express lässt sich in Bun genauso nutzen wie in Node.js
- [Elysia](https://elysiajs.com/) nutzt Bun-APIs und Features um eine performantere Alternative zu express zu bieten
  - Einfache API
  - Bessere Typsicherheit und TypeScript-Unterstützung  
  - Bessere Performance
  - Viele Funktionen out-of-the-box, weniger zusätzliche Pakete nötig
- Läuft auch unter Node.js, ist aber nicht unbedingt zu empfehlen

## Elysia setup

- Neues Projekt auf Basis von offiziellem Template: `bun create elysia app`
- Code Beispiel in [`elysia-sample`](https://github.com/TINF23B5-Webengineering/Lecture_Code/tree/2025/24_Alternative_Runtimes/elysia-sample)

## Sample Server Code 

```typescript
import { Elysia } from "elysia";

const app = new Elysia()
    .get("/", () => "Hello Elysia")  // Siehe Route Handler bei express
    .listen(3000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
```

## express vs. Elysia

- Syntax ist allgemein sehr ähnlich zu express
  - Pfad-Parameter mit `:param`
  - HTTP-Methoden als Methoden des App-Objekts
- Verschiedene Verbesserungen
  - Pfad-Parameter sind Parameter der Route-Handler-Funktion
  - Einfacher Streaming-Support über generator Functions
- Typsicherheit allgemein besser
  - z.B. bei Pfad-Parametern


<!--TODO, insbesondere auf Parameter-Typ von handler Funktionen eingehen -->

## Zugriff auf Pfad-Parameter

## Zugriff auf Query-Parameter




## Input-Validierung

- Elysia unterstützt Input-Validierung mit [TypeBox](https://github.com/sinclairzx81/typebox)
  - allgemein ähnlich zu `zod`

```typescript
import {  t } from "elysia";

app.get('/id/:id', ({ params: { id } }) => id, {
    params: t.Object({
        id: t.Number()
    })
})
````

