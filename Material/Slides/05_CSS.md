---
title: "Vorlesung Webengineering 1 - CSS"
topic: "Webengineering_1_5"
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

# CSS - Grundlagen

## Grundlagen

**C**ascading **S**tyle **S**heets

- Stylesheet-Sprache: Beschreibung von Darstellung und Layout
- Trennung von Inhalt (HTML) und Darstellung (CSS)
- "Cascading": Kaskadierung von Stylesheets
  - Kombination von Stylesheets
  - Überschreibung von Regeln
- Stylesheets werden vom Browser interpretiert und ergeben mit HTML das Layout der Webseite

## Syntax

- **Deklaration**: Paar aus Eigenschaft (Property) und Wert (Value)
  - `color: red;`
  - `font-size: 12px;`
- **Deklarationsblock**: Sammlung von zusammengehörigen Deklarationen
  ```css
   {
    color: red;
    font-size: 12px;
  }
  ```
- **Selektor**: Element, auf das sich eine Deklaration / ein Deklarationsblock bezieht
- Kombination aus Selektor und Deklarationsblock: **_Ruleset_**

## Selektoren

- Universal-Selektor `*` \rightarrow{} alle Elemente
- Elementname `p` \rightarrow{} alle `<p>`-Elemente
- Klassenname `.class` \rightarrow{} alle Elemente, bei denen das `class`-Attribut den Wert `class` **enthält**
  - Mehrere Klassen in HTML: `class="class1 class2 class3"`
  - Würde von `.class` und `.class2` und `.class3` selektiert werden
- ID `#id` \rightarrow{} alle Elemente, bei denen das `id`-Attribut den Wert `id` hat
  - IDs sollten eindeutig pro HTML-Dokument sein

## Selektoren

- Attribute `[attr]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` existiert
- Attribut mit Wert `[attr="value"]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` exakt den Wert `value` hat
  - Wert beginnt mit: `[attr^="value"]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` mit `value` _beginnt_
  - Wert endet mit: `[attr$="value"]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` mit `value` _endet_
  - Wert enthält: `[attr*="value"]` \rightarrow{} alle Elemente, bei denen das Attribut `attr` den Wert `value` _enthält_

siehe auch [selfhtml.org](https://wiki.selfhtml.org/wiki/CSS/Tutorials/Selektoren/einfacher_Selektor#Attributselektor)

## Eigenschaften

- Komplette Liste: [CSS Properties](https://www.w3schools.com/cssref/index.php)
- Wichtige Eigenschaften
  - `color`: Textfarbe
  - `background-color`: Hintergrundfarbe
  - `font-size`: Schriftgröße
  - `font-weight`: Schriftstärke
  - `margin`: Abstand zum Nachbarelement (`top right bottom left`, Als Ersatz für `margin-...`)
  - `padding`: Abstand vom Rand des Elements zum Inhalt (`top right bottom left`)
  - `border`: Rahmen um das Element (`width style color`, Als Ersatz für `border-...`)

## Vererbung

- Rulesets werden vom Selektor auf Kind-Elemente vererbt:
  ```css
  body {
    color: red;
  }
  ```
  \rightarrow{} Alle Kind-Elemente des `body` (=gesamtes HTML Dokumente) bekommen standardmäßig roten Text

# CSS nutzen

## Einbindung in HTML

- Inline-Style: Angabe im `style`-Attribut
  ```html
  <p style="color: red;">Hallo Welt</p>
  ```
- Header-Style: Angabe im `<style>`-Element im `<head>`
  ```html
  <style>
    p {
      color: red;
    }
  </style>
  ```
- Externes Stylesheet: Verweis über `<link>`-Element im `<head>`
  ```html
  <link rel="stylesheet" href="style.css" />
  ```

# CSS Fortgeschritten

## Kombination von Selektoren

- Verschiedene Möglichkeiten der Kombination
  - `A, B` \rightarrow{} Alle Elemente, die entweder mit `A` **oder** mit `B` selektiert werden
  - `AB` \rightarrow{} Alle Elemente, die mit `A` **und** mit `B` selektiert werden
  - `A B` \rightarrow{} Alle Elemente, die mit `B` selektiert werden und ein **transitives** Kind (auch Nachfahre genannt) von `A` sind
  - `A > B` \rightarrow{} Alle Elemente, die mit `B` selektiert werden und ein **direktes** Kind von `A` sind
  - `A + B` \rightarrow{} Alle Elemente, die mit `B` selektiert werden und **direkt** nach `A` stehen (direkte Nachbarelemente)
  - `A ~ B` \rightarrow{} Alle Elemente, die mit `B` selektiert werden und nach `A` stehen

siehe auch [selfhtml.org](https://wiki.selfhtml.org/wiki/CSS/Tutorials/Selektoren/Kombinator)

## Pseudoklassen

- Klassen, die nicht im HTML-Code angegeben werden, sondern vom Browser gesetzt werden
  - Werden direkt an Selektor angehängt (z.B. `p:hover`)
- Wichtige Pseudoklassen
  - `:hover` \rightarrow{} Mauszeiger ist aktuell über Element
  - `:active` \rightarrow{} Element wird aktuell angeklickt
  - `:focus` \rightarrow{} Element hat aktuell den Fokus (z.B. durch Tabulator-Taste oder Mausklick)

## Struktur-Pseudoklassen

- Beziehen sich auf die Struktur des HTML-Dokuments
  - `:first-child` \rightarrow{} Element ist das erste Kind seines Elternelements
  - `:last-child` \rightarrow{} Element ist das letzte Kind seines Elternelements
  - `:nth-child(n)` \rightarrow{} Element ist das `n`-te Kind seines Elternelements
    - `n` kann auch als Formel angegeben werden: `2n+1` \rightarrow{} Alle ungeraden Kindelement
  - Analog für den Typ des Elements: `:first-of-type`, `:last-of-type`, `:nth-of-type(n)`

## Maßeinheiten

- Absolute Maßeinheiten
  - `px` \rightarrow{} Pixel
  - `cm` \rightarrow{} Zentimeter
  - `mm` \rightarrow{} Millimeter
- Relative Maßeinheiten
  - `em` \rightarrow{} ungefähre Breite des Buchstaben `M`, abhängig von Schriftart und Größenfestlegung des Elternelements
  - `rem` \rightarrow{} wie `em`, aber nicht vom Elternelement abhängig, sondern vom Root-Element
  - `vw` \rightarrow{} prozentualer Anteil der Breite des Viewports
  - `vh` \rightarrow{} prozentualer Anteil der Höhe des Viewports

## CSS Maßeinheiten

- Relative Maßeinheiten sind zu bevorzugen
  - Skalieren mit der Schriftgröße
  - Skalieren mit der Bildschirmgröße \rightarrow{} responsives Design, mobile Webseiten

## CSS Box-Modell

- CSS betrachtet alle HTML-Elemente als rechteckige Boxen
- Der Inhalt (Content) wird jeweils umschlossen von:
  - Padding: Abstand zum Rand
  - Border: Rahmen um das Element
  - Margin: Abstand zum Nachbarelement
- Die Gesamtgröße bei der Darstellung eines Elements ergibt sich aus der Summe von Inhalt, Padding, Border und Margin

## CSS Box-Modell

![Box-Modell](./media/Boxmodell-detail.png)

## CSS Box-Modell

- CSS-Eigenschaften
  - `width` / `height`: Breite / Höhe des **Inhalts**
  - `padding-top` / `padding-right` / `padding-bottom` / `padding-left`
    - Kurzschreibweise: `padding: 10px 20px 30px 40px;` \rightarrow{} `top right bottom left`
  - Analog für `margin`
  - `border`: Rahmen um das Element
    - Kurzschreibweise: `border: 1px solid black;` \rightarrow{} `width style color`

## CSS Box-Modell Größe

- `width` und `height` beziehen sich nicht auf die Gesamtgröße
  - Bei `width: 100px;` \rightarrow{} Gesamtgröße = 100px + Padding + Border + Margin
  - Kann zu unerwarteten Ergebnissen führen
- `overflow` Eigenschaft steuert das Verhalten, wenn der Inhalt "zu groß" ist
  - `auto`: Browser entscheidet
  - `hidden`: Inhalt wird abgeschnitten
  - `scroll`: Scrollbalken wird angezeigt
  - `visible`: Inhalt wird über den Rand hinaus angezeigt

## CSS Box-Modell Rahmen

- Kurzschreibweise `width style color` wie oben beschrieben
  - `style`: Darstellung des Rahmens (`solid`, `dotted`, `dashed`, `double`, ...)
- `border-radius`: Ecken abrunden
  - `border-radius: 10px;` \rightarrow{} Alle Ecken werden mit einem Radius von 10px abgerundet
  - `border-radius: 10px 20px 30px 40px;` \rightarrow{} `top-left top-right bottom-right bottom-left`
- `border-collapse`: benachbarte Rahmen zusammenfassen, Werte `collapse` und `separate`

## Positionierung - `position`

- Verschiedene Möglichkeiten Elemente zu positionieren
- Einfache Positionierung mit `position` Eigenschaft
  - `absolute`: Position bezogen auf Rand des nächsten Elternelements bei dem `position` nicht `static` ist
  - `relative`: Position relativ zur Anfangsposition (relative Verschiebung)
  - `fixed`: Position bezogen auf den Viewport

## Positionierung - `z-index`

- "Dreidimensionale" Positionierung
- `z-index` gibt die relative "Tiefe" eines Elements an
  - Elemente mit höherem `z-index` werden über Elementen mit niedrigerem `z-index` dargestellt
  - `z-index` kann auch negativ sein

## Positionierung - Flexbox

- Layout-Modell, das Elemente in Zeilen/Spalten anordnet
- Elemente können sich dynamisch anpassen
  - Wachsen (flex) bei verfügbarem Platz
  - Schrumpfen (shrink) bei zu wenig Platz
- Macht responsive Layouts deutlich einfacher

## Positionierung - Flexbox Grundbegriffe

![Flexbox Grundlagen](https://css-tricks.com/wp-content/uploads/2018/11/00-basic-terminology.svg)

## Positionierung - Flexbox Containr

- Wird die CSS-Eigenschaft `display` auf `flex` gesetzt, wird das Element zum **Flex-Container** und alle Kind-Elemente zu **Flex-Items**
- Flex-Container selbst verhält sich gegenüber anderen Elementen wie ein Block-Element
  - `inline-flex`, damit der Container sich wie ein Inline-Element verhält

## Positionierung - Flexbox Container

- Eigenschaften für den Container
  - `flex-direction`: Anordnung der Elemente (Festlegung der Hauptachse) \rightarrow{} `row` / `column`, oder jeweils `-reverse`
  - `flex-wrap`: Verhalten bei zu wenig Platz \rightarrow{} `nowrap`, `wrap`
  - `justify-content`: Ausrichtung der Elemente auf der Hauptachse \rightarrow{} `flex-start`, `flex-end`, `center`, `space-between`, `space-around`

## Positionierung - Flexbox Container `justify-content`

![CSS-Tricks: A Complete Guide to Flexbox](https://css-tricks.com/wp-content/uploads/2018/10/justify-content.svg){height=90%}

## Positionierung - Flexbox Container

- Eigenschaften für den Container
  - `align-items`: Ausrichtung der Elemente auf der Querachse \rightarrow{} `flex-start`, `flex-end`, `center`, `baseline`, `stretch`

## Positionierung - Flexbox Container `align-items`

![CSS-Tricks: A Complete Guide to Flexbox](https://css-tricks.com/wp-content/uploads/2018/10/align-items.svg){height=85%}

## Positionierung - Flexbox Items

- Eigenschaften für die Items:
  - `order`: Reihenfolge der Elemente überschreiben
  - `flex-grow`: Erlaubt Element zu wachsen, wenn Platz vorhanden ist
    - Alle Elemente mit gleicher `flex-grow`-Eigenschaft wachsen gleichmäßig
    - Alle Elemente `flex-grow: 1` \rightarrow{} Verfügbarer Platz wird gleichmäßig aufgeteilt
  - `flex-shrink`: Wie `flex-grow`, aber fürs Schrumpfen

![](https://css-tricks.com/wp-content/uploads/2018/10/flex-grow.svg){height=50%}

## Positionierung - Flexbox Items

- Eigenschaften für die Items:
  - `flex-basis`: Breite des Elements, bevor zusätzlicher Platz verteilt wird
  - `flex`: Kurzschreibweise für `flex-grow`, `flex-shrink` und `flex-basis`, (setzt nur `flex-basis` wenn nur ein Wert mit Maßeinheit angegeben wird!)
    - **Kurzschreibweise wird empfohlen!**
  - `align-self`: Überschreibt Standard-Alignment (von `align-items`) für einzelnes Element

## Positionierung - Flexbox weitere Infos

- [CSS-Tricks: A Complete Guide to Flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
- [MDN: Flexbox](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Flexbox)
