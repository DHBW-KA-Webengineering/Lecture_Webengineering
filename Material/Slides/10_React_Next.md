---
title: "Vorlesung Webengineering 1 - React & Next"
topic: "Webengineering_1_10"
date: 2026-02-18
author: "Silas Schnurr"
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

# Starten mit React & Next.js

## Was ist React?

- React ist eine JavaScript-Bibliothek zur Erstellung interaktiver Benutzeroberflächen.
- React-Komponenten sind wie JavaScript-Funktionen, die Eingaben (Props) entgegennehmen und React-Elemente zurückgeben, welche das UI beschreiben.
- React ist sehr unopinioniert und fokussiert sich hauptsächlich auf das Rendern von UI-Komponenten; für ein vollständiges App-Setup werden andere Tools (Build-System, Routing etc.) oft zusätzlich eingesetzt.
- React nutzt JSX: eine HTML-ähnliche Syntax, die direkt in JavaScript eingebettet wird.
- React verwendet ein virtuelles DOM (Virtual DOM): Eine interne Darstellung des UI im Arbeitsspeicher, die mit dem echten Browser-DOM abgeglichen und aktualisiert wird.

## Was ist Next.js?

- Next.js ist ein Framework basierend auf React, das zusätzliche Bausteine für Webanwendungen bereitstellt.
  - Damit ist es genau ein solches Tool, um auf Basis von React ein vollständiges App-Setup zu erreichen.
- Next.js kümmert sich um Tooling und Konfiguration für React und bringt Struktur, Funktionen und Optimierungen mit.

## Unterschiede: React vs. Next.js

- React ist eine reine UI-Bibliothek; Routing und Server-Rendering kommen nicht von selbst. Typischerweise startet man mit create-react-app oder ähnlichen Tools.
- Mit Next.js entsteht schnell eine strukturierte App, während man weiterhin in React bekannte Konzepte wie Komponenten und Hooks verwendet.
- Next.js verbessert oft SEO (durch statisches Pre-Rendering) und Performance (durch Caching und SSR) im Vergleich zu einer reinen React-SPA.

## Virtuelles DOM und Rendering

- React erstellt ein virtuelles DOM im Arbeitsspeicher und vergleicht Änderungen dort mit dem echten DOM.
- Entwickler geben nur an, wie das UI in einem bestimmten Zustand aussehen soll; React kümmert sich selbsttätig um die notwendigen DOM-Updates (Reconciliation).
- Dieser declarative Ansatz macht die UI-Entwicklung einfacher und reduziert Fehler, da man nicht manuell DOM-Operationen durchführen muss.

## Neues Projekt erstellen und ausführen

- `npx create-next-app@latest` ausführen. Ein Assistent begleitet die Projekterstellung.
- `npm run dev` im Projektverzeichnis ausführen

> Hinweis: Node muss installiert sein.

> [Referenz von nextjs.org](https://nextjs.org/docs/app/getting-started/installation)

## Projektstruktur

Struktur eines neu erstellten Projekts:

- public [(Statische Inhalte, welche bereitgestellt werden sollen)](https://nextjs.org/docs/app/api-reference/file-conventions/public-folder)
  - Bild 1
  - Bild 2
- src/app
  - globals.css
  - layout.tsx / layout.jsx (Haupteinstiegspunkt der Anwendung)
  - page.module.css
  - page.tsx / page.jsx (Startseite)
- next.config.js [(Konfigurationsdatei für Next.js)](https://nextjs.org/docs/app/api-reference/config/next-config-js)
- package.json (Projektreferenzen und Skripte)

> [Referenz von nextjs.org](https://nextjs.org/docs/app/getting-started/project-structure)

# Komponenten

## Beispiel Komponente

Eine Komponente ist eine JavaScript-Funktion, die props (Eigenschaften) als Argument annimmt und JSX zurückgibt. Beispiel:

```jsx
import React from "react";
function SimpleComponent() {
  const greeting = "Hallo, React! ";
  return (
    <div>
      <h1>{greeting}</h1> Dies ist eine einfache React-Komponente mit JSX.
    </div>
  );
}
export default SimpleComponent;
```

## Verwenden einer Komponente (1)

- Komponenten können nach einem import in anderen komponenten oder Layouts verwendet werden
- Komponenten-Namen beginnen mit Großbuchstaben (z.B. SimpleComponent), andernfalls interpretiert React sie als DOM-Tags.
- JSX erlaubt das Verschachteln von Elementen wie in HTML.
  - Fragments (<> ... </>) erlauben es, mehrere JSX-Elemente zurückzugeben, ohne zusätzliche Wrapper-Elemente im DOM zu erzeugen.
- Komponenten können beliebig verschachtelt und wiederverwendet werden (Komposition)

## Verwenden einer Komponente (2)

```jsx
import SimpleComponent from "./simple";
export default function RootLayout({children,}: Readonly<{children: React.ReactNode;}>) {
  return (
    <html lang="de">
      <body>
          <SimpleComponent></SimpleComponent>
      </body>
    </html>
  );
}
```

## Props und State

- Props sind Eingaben für Komponenten und per Konvention unveränderlich (immutable).
- State speichert veränderliche Daten innerhalb einer Komponente. Er gibt der Komponente „Gedächtnis“ für Daten, die sich ändern können.
- In Funktions-Komponenten nutzt man den Hook useState(), um State zu definieren.

## Hooks (1)

[Hooks](https://react.dev/reference/react/hooks) bieten eine mächtige Möglichkeit, Zustand und Nebeneffekte in funktionalen Komponenten zu verwalten.

- sind spezielle Funktionen, die React-Features nutzbar machen. Erkennbar am Präfix "use", z. B.:
  - useState
  - useEffect
  - useContext
  - useRef

- Wichtige Regeln [(Rule of Hooks)](https://react.dev/reference/rules/rules-of-hooks):
  - Only call Hooks at the top level
  - Only call Hooks from React functions

## Hooks (2)

Beispiel ohne Hook:

```jsx
function Counter() {
  let count = 0;
  return <button onClick={() => count++}>Count: {count}</button>;
}
```

Probleme:

- count wird bei jedem Rendern neu gesetzt
- React weiß nicht, dass sich etwas geändert hat
- Keine automatische Neuberechnung des UI

## Hooks (3): useState

- useState ist ein State hook und ermöglicht es einer Komponente, Informationen wie Benutzereingaben zu „speichern“.
- Beispielsweise kann eine Formular-Komponente den Status verwenden, um den Eingabewert zu speichern, während eine Bildergalerie-Komponente den Status verwenden kann, um den ausgewählten Bildindex zu speichern.
- useState deklariert eine sogenannte Statusvariable, welche aktualisiert werden kann

```jsx
function ImageGallery() {
  const [index, setIndex] = useState(0);
  //...
```

> [Referenz von react.dev](https://react.dev/reference/react/hooks#state-hooks)

## Hooks (4): useEffect

Effekte sorgen dafür, dass eine React-Komponente mit der „Außenwelt“ sprechen kann.

Die Außenwelt kann zum Beispiel sein:

- eine API im Internet (Daten laden)
- das Browser-DOM
- eine andere JavaScript-Bibliothek

Normalerweise kümmert sich React nur um das Darstellen der Oberfläche.
Mit einem Effekt kann eine Komponente zusätzlich etwas außerhalb von React machen.

## Hooks (5): useEffect

```jsx
function ChatRoom({ roomId }) {
  useEffect(() => {
    const connection = createConnection(roomId);
    connection.connect();
    return () => connection.disconnect();
  }, [roomId]);
  // ...
```

> [Referenz von react.dev](https://react.dev/reference/react/hooks#effect-hooks)

## Styling mit SASS

- Sass (Syntactically Awesome Stylesheets) ist eine Erweiterung von CSS
- Erlaubt mehr Struktur, Variablen, verschachtelte Regeln und Funktionen
- Vorteile:
  - Variablen: Farben, Abstände, Schriftgrößen einmal definieren und überall nutzen
  - Verschachtelung: Styles direkt in Hierarchien schreiben, wie im HTML
  - Mixins & Funktionen: Wiederverwendbare Style-Blöcke erstellen
  - Bessere Struktur: Große Projekte lassen sich leichter organisieren
  - Kompatibel mit CSS-Modulen: SCSS-Dateien können pro Komponente genutzt werden

- `npm install sass`
- css Dateiendungen in scss umbenennen und Referenzen anpassen

## Styling mit SASS - Beispiel

```scss
// SCSS
$primary-color: olive;

.button {
  background-color: $primary-color;
  &:hover {
    background-color: darken($primary-color, 10%);
  }
}
```

## Styling mit SASS - Beispiel

```css
/* CSS */
.button {
  background-color: olive;
}
.button:hover {
  background-color: #556b2f;
}
```

# Navigation

## Dateibasiertes Routing (1)

- Next.js nutzt dateibasierte Routen: Dateien im app- bzw. pages-Verzeichnis definieren automatisch URL-Routen.
- Beispiel: Die Datei app/page.tsx (index-Seite) erzeugt die Route /. Darin exportiert man eine React-Komponente als Standard-Export:
- Layouts (z.B. app/layout.tsx) definieren gemeinsame UI-Elemente (Header, Footer, etc.) für alle oder mehrere Seiten. Layouts behalten beim Navigieren ihren Zustand bei.
- Unterordner im app-Verzeichnis erzeugen verschachtelte Routen.

## Dateibasiertes Routing (2)

Beispiel: app/blog/page.tsx entspricht der Route /blog.

- app/
  - page.tsx → Route: "/"
  - about/page.tsx → Route: "/about"
  - blog/page.tsx → Route: "/blog"

## Dynamische Routen im dateibasierten Routing

- Ordner oder Dateien mit eckigen Klammern [param] werden dynamische Parameter

- app/
  - blog/
    - [id]/page.tsx → Route: "/blog/:id"

```jsx
// app/blog/[id]/page.tsx
export default function BlogPost({ params }) {
  return <h1>Beitrag: {params.id}</h1>;
}
```

## Dateien und Ordner aus Routing ausschließen

- Dateien oder Ordner, die mit \_ beginnen, werden nicht als Route veröffentlicht
- Häufig für Hilfs-Komponenten, Templates oder Layouts

- app/
  - components/
    - Button.tsx (nicht über URL erreichbar)

## Navigation zwischen Seiten

- Zur Navigation zwischen Seiten nutzt man in Next.js die Link-Komponente.
- Link erweitert das HTML-a-Tag um clientseitiges Routing und Prefetching (im Hintergrund vorgeladene Links).

```jsx
import Link from "next/link";
export default function Navbar() {
  return (
    <nav>
      <Link href="/">Start</Link>
      <Link href="/about">Über uns</Link>
      <Link href="/blog/123">Blog-Beitrag</Link>
    </nav>
  );
}
```

## Navigation programmatisch

- next/link deckt die meisten Routing-Anforderungen ab
- Wenn dennoch imperativ navigiert werden muss, ist useRouter zu verwenden

```jsx
import { useRouter } from "next/router";
export default function ReadMore() {
  const router = useRouter();
  return (
    <button onClick={() => router.push("/about")}>
      Click here to read more
    </button>
  );
}
```

> [Referenz von nextjs.org](https://nextjs.org/docs/pages/building-your-application/routing/linking-and-navigating)
