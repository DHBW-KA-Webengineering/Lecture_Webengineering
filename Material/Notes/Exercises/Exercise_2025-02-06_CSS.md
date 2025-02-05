---
title: Übungsaufgabe CSS
date: 2025-02-06
lang: de-DE
author: "Silas Schnurr"
...

# Übungsaufgabe CSS

## Lösungen der vorherigen Aufgaben zusammenführen

In dieser Übung führen Sie die in den vorherigen Aufgaben erstellten HTML-Dokumente zusammen, um eine einheitliche Webseite zu gestalten. Nutzen Sie dazu die Lösungen der Aufgaben HTML und HTML-Formulare.

### Anforderungen

- Integrieren Sie die Inhalte der vorherigen Aufgaben in eine konsistente Webseite (eine Nachrichtenseite mit einem Formular, über welches sich Benutzer registrieren können).
- Strukturieren Sie die Dateien sinnvoll (z.B. durch die Verwendung von Ordnern für CSS-Dateien, Bilder und HTML-Dateien).

## Styling der Nachrichtenseite

Gestalten Sie Ihre erstellte Seite mit CSS, um das Layout zu verbessern und die Benutzerfreundlichkeit zu erhöhen.

### Aufgaben

- Heben Sie die Überschriften besser hervor (z. B. andere Schriftgröße, andere Schriftart, andere Schriftfarbe)
- Die Seite soll im Darkmode dargestellt werden (dunkler Hintergrund, helle Schrift etc.)
- Artikel auf der Übersichtsseite sollen einen Rahmen bekommen
- Flexibles Layout: Verwenden Sie Flexbox, um ein responsives Layout zu erstellen, das sich an verschiedene Bildschirmgrößen anpasst.
- Abstand zwischen Artikeln: Sorgen Sie dafür, dass die Artikel auf der Übersichtsseite ausreichend Abstand zueinander haben, um die Lesbarkeit zu verbessern.
- Farbige Hinterlegung: Gestalten Sie die Artikel so, dass diese abwechselnd farbig hinterlegt sind, um die visuelle Abgrenzung zu betonen.- Bildgestaltung: Bilder in den Artikeln sollen einen Rahmen mit abgerundeten Ecken erhalten.
- Unterscheidbare Abschnitte: Gestalten Sie einzelne Abschnitte innerhalb der Artikel so, dass diese klar voneinander abgegrenzt sind. Dies kann durch den Einsatz von Farben, Rahmen oder Abständen erfolgen.

## Styling des Formulars

Optimieren Sie das in der vorherigen Übung erstellte Formular mit CSS, um die Benutzerfreundlichkeit zu verbessern.

### Aufgaben

- Gestalten Sie die Formularfelder einheitlich und benutzerfreundlich.
- Passen Sie die Abstände und Ausrichtung der Eingabefelder an.
- Fügen Sie Hover-Effekte für Buttons hinzu.
- Sorgen Sie dafür, dass das Formular auch auf mobilen Geräten gut nutzbar ist (Responsive Design).

1. Grundlegende Struktur

   - Verwenden Sie Flexbox, um die Formularfelder gleichmäßig auszurichten.
   - Setzen Sie den Box-Model-Ansatz um (mit padding, margin, border).

2. Formularfelder gestalten, definieren Sie für alle Eingabefelder:

   - Einheitliche Größe und Abstände zwischen den Feldern.
   - Hintergrundfarbe und Rahmen (border), um die Felder hervorzuheben.
   - `:focus`-Pseudoklasse verwenden, um den aktiven Zustand visuell hervorzuheben.

3. Beschriftungen (Labels)

- Positionieren Sie die Labels oberhalb der jeweiligen Eingabefelder.

4. Button gestalten

- Verwenden Sie einen Hover-Effekt für den Absenden Button mit der `:hover`-Pseudoklasse.
- Definieren Sie verschiedene Zustände für normal, hover und active (`:active`).
- Runden Sie die Ecken des Buttons mit `border-radius` ab.

5. Responsives Design

- Das Formular soll auf mobilen Geräten gut funktionieren.
- Passen Sie die Breiten der Felder mit max-width und flexiblen Einheiten (wie %, em, rem) an.

## Zusatzaufgabe (optional)

Implementieren Sie eine Validierung mit CSS, um ungültige Felder hervorzuheben (`:invalid`, `:valid`).

Fügen Sie eine animierte Fehlermeldung hinzu, wenn das Formular unvollständig abgesendet wird.

## Theoretische Fragen

Beantworten Sie die folgenden Fragen schriftlich:

1. Was ist der Unterschied zwischen HTML und CSS?
2. Wann sollte man in HTML `<strong>` verwenden und wann in CSS `font-weight: bold`? Begründen Sie Ihre Antwort.
3. Welche HTTP-Methoden können beim Absenden eines Formulars verwendet werden? Erklären Sie, in welchen Fällen welche Methode sinnvoll ist.
4. Erklären Sie den Unterschied zwischen class und id in CSS. Wann würden Sie welches verwenden?
5. Was ist das CSS-Box-Modell? Beschreiben Sie die Bestandteile und deren Einfluss auf die Layout-Berechnung.
6. Worin besteht der Unterschied zwischen em und rem als Maßeinheit? In welchen Fällen ist rem vorzuziehen?
7. Welche Vorteile bietet die Verwendung von Flexbox gegenüber klassischen Layout-Methoden (wie float)?
8. Wie funktionieren CSS-Pseudoklassen wie :hover und :focus, und warum sind sie wichtig für die Usability?
