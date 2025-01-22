---
title: "Vorlesung Webengineering 1 - Web Security"
topic: "Webengineering_1_2_8"
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

# Grundlagen (Web) Security

## Was ist Security? (1)

### Sicherheitsziele

- **Confidentiality** (Vertraulichkeit): Schutz vor unberechtigtem Zugriff
- **Integrity** (Integrität): Schutz vor unberechtigter Veränderung
- **Availability** (Verfügbarkeit): Schutz vor unberechtigter Unterbrechung der Funktion

## Was ist Security? (2)

### Bedrohung (Threat) und Angriff (Attack)

- **Threat**: Mögliche Verletzung eines Sicherheitsziels
- **Attack**: Versuch, Sicherheitsziele zu verletzen

## Was ist Security? (3)

### Sicherheitsmechanismen

- **Prevention**: Verhinderung von Angriffen vor Verletzung eines Sicherheitsziels
- **Detection**: Erkennung von (aktuellen) Angriffen
- **Recovery**: Wiederherstellung und Aufarbeitung nach einem Angriff

## Grundlagen Authentifizierung (1)

- **Authentifizierung**: Zuordnung einer Identität zu einem Individuum (i.d.R. Benutzer)
- **Autorisierung**: Festlegung von Rechten und Berechtigungen
- Identität bestätigen durch:
  - Wissen (z.B. Passwörter)
  - Besitz (z.B. Sicherheitstoken)
  - Eigenschaft (z.B. Biometrie)

## Grundlagen Authentifizierung (2)

### Passwörter

- Weit verbreitet, aber nicht optimal
- Größte Schwäche: Mensch
- **Best Practices**:
  - Passwort-Manager & Passwort-Genratoren
  - Kombination mit anderer Methode (Mehr-Faktor-Authentifizierung)
  - Serverseitig: sichere Speicherung
    - [Anerkannte Empfehlungen](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html) beachten

## Grundlagen Authentifizierung (3)

- Eigene Implementierung meist keine gute Idee
  - Bei Security-relevanten Themen generell
- Empfehlung: Etablierte Bibliotheken oder Frameworks nutzen
- Noch besser: Wenn möglich externe Authentifizierungsdienste nutzen
  - Dienste müssen vertrauenswürdig sein!
  - Einheitliche Schnittstellen (z.B. OpenID Connect)

## Transport Layer Security (TLS) (1)

- Verschlüsselte Kommunikation
  - HTTPS = HTTP + TLS
  - \rightarrow{} Schutz von Vertraulichkeit und Integrität
- Exkurs: Kryptografie
  - Symmetrisch: gleicher Schlüssel für Verschlüsselung und Entschlüsselung
  - Asymmetrisch: Schlüsselpaar (privater und öffentlicher Schlüssel)
    - Was mit einem Schlüssel verschlüsselt wurde, kann nur mit dem anderen entschlüsselt werden (geht in beide Richtungen!)

## TLS (2)

- **Zertifikate**:
  - Authentifizierung des Web-Servers gegenüber dem Browser
  - Enthält: Inhaber (Vereinfacht: Domain), Gültigkeit, öffentlicher Schlüssel, Signatur
  - Signatur: Certification Authority (CA) bestätigt die Echtheit des Zertifikat
  - Browser / Betriebssystem vertrauen bestimmten CAs (Root CAs)
  - Im Browser leicht einsehbar
- Sicherer Austausch eines temporären symmetrischen Schlüssels
  - Asymmetrische Verschlüsselung für Schlüsselaustausch
  - Symmetrische Verschlüsselung für Datenübertragung (schneller, meist hardware-beschleunigt)

## Injection Attacks

- _Untrusted Input_ wird als Teil von Befehlen oder Abfragen interpretiert und ausgeführt
- Untrusted Input: alles, was nicht vom System selbst (oder einem vertrauenswürdigen System) stammt
- Kaum eine Web-Anwendung ohne
  - SQL-Abfragen
  - Ausgabe von Nutzereingaben in HTML / JavaScript / CSS
- Problem: Benutzereingabe wird an Interpreter (z.B. DB, JS-Engine) weitergegeben
- Wichtige Typen:
  - SQL Injection (SQLi)
  - Cross-Site Scripting (XSS)

## SQLi Einführung (1)

**Funktionsweise**: Anwendung konstruiert SQL-Abfrage und fügt Nutzereingabe ungeprüft ein

Beispiel: Selektion von allen Posts mit einem Suchbegriff:

```sql
SELECT * FROM posts WHERE title LIKE '<Suchbegriff>';
```

- Suchbegriff kommt z.B. aus einem Suchfeld und wird in Variable `search` gespeichert
- JavaScript baut die SQL-Abfrage:

```javascript
const query = `SELECT * FROM posts WHERE title LIKE '${search}'`;
```

## SQLi Einführung (2)

### Was kann ein Angreifer tun?

## SQLi Einführung (3)

Einfaches Beispiel: `' OR '1'='1`
\rightarrow{} Erweitert die SQL-Abfrage zu:

```sql
SELECT * FROM posts WHERE title LIKE '' OR '1'='1';
```

\rightarrow{} Implikationen?

## SQLi Einführung (4)

- **Problem**: Datenbank kennt den Unterschied zwischen Code und Daten (Nutzereingaben) nicht
- `'OR 1=1;` ist eine der einfachsten Varianten, eine WHERE-Klausel zu umgehen
  - Kann z.B. auch zu Umgehung von Passwort-Prüfungen verwendet werden
- Beliebige SQL-Befehle können eingeschleust werden
  - `'); DROP TABLE ...; --` löschen von Tabellen
  - `UNION SELECT ...` Daten aus anderen Tabellen abfragen, wenn diese ausgegeben werden

## SQLi Schutz (1)

- Grundlegend: **niemals** Eingaben ungeprüft an SQL-Strings anhängen
- Trennung von Daten und Code über sogenannte **prepared statements** oder **stored procedures**
  - Daten werden als Parameter übergeben
  - Datenbank bzw. Client-Bibliothek kann Code und Daten unterscheiden und Daten entsprechend behandeln
- Beispiel:

```javascript
const query = "SELECT * FROM posts WHERE title LIKE ?";
db.execute(query, [search]);
```

## SQLi Schutz (2)

- ORMs (siehe Datenbanken-Kapitel) bieten Schutz vor SQLi
  - Vertrauenswürdige, etablierte Bibliotheken nutzen!
- Abstrahieren in vielen Fällen SQL komplett
- Beispiel Drizzle-Abfrage: `db.select().from(posts).where(like(posts.title, search))`
- Drizzle kann auch beliebige SQL-Abfragen sicher ausführen, Siehe auch [Drizzle-Dokumentation](https://orm.drizzle.team/docs/sql)

  ```javascript
  db.sql`SELECT * FROM ${posts} WHERE ${posts.title} LIKE ${search}
  ```

## Cross-Site Scripting (XSS) Einführung (1)

**Funktionsweise**: Anwendung fügt Nutzereingaben ungeprüft in HTML, JavaScript (oder CSS, SVG) ein

- Verschiedene Arten:
- Reflected: Eingabe wird vom Server an Nutzer zurückgegeben, aber nicht gespeichert
  - Stored: Eingabe wird gespeichert und später ausgegeben
  - DOM-Based: Eingabe wird durch JavaScript fehlerhaft verarbeitet

## XSS Einführung (2)

Beispiel Reflected: Suchformular, Suchbegriff wird auf Results-Seite angezeigt:

```html
<h1>SUCHBEGRIFF</h1>
...
```

z.B. durch Serverseitige HTML-Generierung:

```javascript
const search = getSearchFromURL();
const results = await searchPosts(search);
return `<h1>${search}</h1><br>${formatResults(results)}`;
```

## XSS Einführung (3)

### Was kann ein Angreifer tun?

## XSS Einführung (4)

Einfaches Beispiel: `<script>alert('XSS')</script>` als Suchbegriff

\rightarrow{} JavaScript wird ausgeführt und ein Alert-Fenster geöffnet

- Der Browser kann nicht wissen, dass hier kein Script erwartet wird
- Implikationen?

## XSS Bedrohungen

- Injiziertes JavaScript hat prinzipiell die gleichen Rechte wie jedes andere Script der Seite
  - Zugriff auf Cookies
    - Wenn Authentifizierung über "normale" Cookies erfolgt, kann ein Angreifer sich als Nutzer ausgeben (Session Hijacking)
  - Zugriff auf DOM und gesamten Seiteninhalt
    - Lesen von Daten, die eigentlich nicht für den Nutzer bestimmt sind
    - Manipulation von Inhalten

## XSS weitere Arten

- Stored XSS: Beispielsweise in Kommentaren, Forenbeiträgen
  - Eingeschleustes JavaScript wird bei jedem Aufruf der Seite ausgeführt
  - Reflected betrifft im Gegensatz dazu erstmal nur den Nutzer, der die Eingabe gemacht hat
    - ABER: Eingaben häufig über URL-Query-Parameter gemacht!
- DOM basiertes XSS: unsichere Verarbeitung von Nutzereingaben
  - Eingabe wird nicht an Server gesendet, sondern direkt im Browser verarbeitet
  - z.B. `element.innerHTML`, `eval()` verwendet

## XSS Schutz (1)

- **Grundlegend**: **niemals** Nutzereingaben ungeprüft in HTML einfügen
- **Input Validation**: Prüfen, ob Eingaben den erwarteten Formaten entsprechen
  - Validieren von Eingaben mit Positivlisten (erlaubte Zeichen) statt Negativlisten
- **Output Validation**: Prüfen, ob Ausgaben den erwarteten Formaten entsprechen
  - Es kann vorkommen, dass durch weitere Verarbeitungsschritte unerwartete Ausgaben entstehen!
- In der Regel vorhandene Bibliotheken nutzen, die XSS-Schutz bieten
  - Moderne Frontend Frameworks (React, Angular, Svelte, ...) bieten guten Schutz vor XSS

## Cross-Site Request Forgery (CSRF) und Server-Side Request Forgery (SSRF)
