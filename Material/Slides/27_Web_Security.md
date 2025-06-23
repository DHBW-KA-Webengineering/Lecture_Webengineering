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

# Grundlagen Security

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

## Grundlagen Kryptografie (1)

- **Kryptografie**: Verschlüsselung / Entschlüsselung von Daten (Confidentiality)

### Symmetrische Kryptografie

- Mathematische Verfahren erlauben uns Daten (Plaintext) mit einem _Schlüssel_ ("Key") so zu verschlüsseln (ergibt Ciphertext), dass sie nur mit diesem wieder entschlüsselt werden können
- Einfaches Beispiel: Rotations-Chiffren
  - Verfahren: Buchstaben des Plaintext werden um bestimmte Anzahl rotiert
  - Schlüssel: Anzahl der Rotationen
  - Beispiel: Schlüssel 1 \rightarrow{} A wird zu B, B zu C, ... Z zu A
  - Entschlüsselung: Rotiere in die andere Richtung

## Grundlagen Kryptografie (2)

### Asymmetrische Kryptografie

- Weniger intuitiv, aber es gibt mathematische Verfahren, bei denen zwei Schlüssel zum Einsatz kommen (genannt Public und Private Key)
- Wird mit dem Public Key verschlüsselt, kann nur mit dem Private Key entschlüsselt werden und umgekehrt
- Wird der Public Key veröffentlicht (deshalb heißt er auch so) kann jeder Nachrichten für den Besitzer des Private Keys verschlüsseln, die nur dieser entschlüsseln kann
  - Umgekehrt kann jeder eine Nachricht entschlüsseln, die mit diesem Private Key verschlüsselt wurde
- Wie das funktioniert spielt in dieser Vorlesung keine Rolle

## Grundlagen Kryptografie (3)

### Signaturen mit asymmetrischer Kryptografie

- Asymmetrische Verfahren können auch für Signaturen genutzt werden
  - Signatur: Sicherstellen dass Daten nicht verändert wurden, und tatsächlich von bestimmtem Sender kommen (Integrity, kein Schutz der Confidentiality)
- Zusätzlich zu den Daten wird eine Signatur generiert:
  - Hashwert über die Daten (eine Art Fingerabdruck der Daten) 
  - Verschlüsselt mit Private Key
- Empfänger kann mit Public Key entschlüsseln und Hashwert über Daten berechnen
  - Stimmt der Hashwert mit dem entschlüsselten Wert überein, sind Daten unverändert 

## Transport Layer Security (TLS) (1)

- Verschlüsselte Kommunikation
  - HTTPS = HTTP + TLS
  - \rightarrow{} Schutz von Vertraulichkeit und Integrität

- **Zertifikate**:
  - Authentifizierung des Web-Servers gegenüber dem Browser
  - Enthält: Inhaber (Vereinfacht: Domain), Gültigkeit, öffentlicher Schlüssel, Signatur
  - Signatur: Certification Authority (CA) bestätigt die Echtheit des Zertifikat (Signatur mit Private Key der CA)
  - Browser / Betriebssystem vertrauen bestimmten CAs (Root CAs)
  - Im Browser leicht einsehbar

## TLS (2)

- **Handshake** (Vereinfacht):
  - Browser und Server einigen sich auf TLS Version und Krypto-Algorithmen (Cipher-Suites)
  - Server sendet Zertifikat um Identität zu bestätigen
  - Aus ausgetauschten zufälligen Daten generieren Server und Client unabhängig voneinander einen temporären Sitzungsschlüssel
  - Genauer Ablauf ist abhängig von TLS-Version und Cipher-Suites
- Jeder HTTP Request wird mit dem Sitzungsschlüssel in einem symmetrischen Verfahren verschlüsselt übertragen
- Github Pages, Cloudflare Pages, Netflify, Vercel, ... verschlüsseln ohne Konfiguration standardmäßig 
- Kostenfreie TLS Zertifikate für Hosting auf eigenem Server: [Let's Encrypt](https://letsencrypt.org/)

## Theoretische Fragen

- Nennen Sie die drei zentralen Sicherheitsziele.
  - Erklären Sie den Begriff _Confidentiality_ / _Integrity_ / _Availability_.
- Was ist der Unterschied zwischen Threat und Attack?
- Nennen Sie die drei zentralen Sicherheitsmechanismen.
  - Erklären Sie den Begriff _Prevention_ / _Detection_ / _Recovery_.
- Was ist der Unterschied zwischen symmetrischer und asymmetrischer Kryptografie?


# Authentifizierung 

## Grundlagen Authentifizierung (1)

- **Authentifizierung**: Zuordnung einer Identität zu einem Individuum (i.d.R. Benutzer)
- Identität bestätigen durch:
  - Wissen (z.B. Passwörter)
  - Besitz (z.B. Sicherheitstoken)
  - Eigenschaft (z.B. Biometrie)
- **Autorisierung**: Festlegung von Rechten und Berechtigungen

## Grundlagen Authentifizierung (2)

### Passwörter

- Weit verbreitet, aber nicht optimal
- Größte Schwäche: Mensch
- **Best Practices**:
  - Passwort-Manager & Passwort-Genratoren
  - Kombination mit anderer Methode (Mehr-Faktor-Authentifizierung)
  - Sichere Übertragung
  - Serverseitig: sichere Speicherung
    - [Anerkannte Empfehlungen](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html) beachten

## Grundlagen Authentifizierung (3)

- Eigene Implementierung meist keine gute Idee
  - Bei Security-relevanten Themen generell
  - (gute) Authentifizierung ist schwierig
- Empfehlung: Etablierte Bibliotheken oder Frameworks nutzen
  - Verschiedene Abstraktionslevel: siehe weiter unten
- Noch besser: Wenn möglich externe Authentifizierungsdienste nutzen
  - Dienste müssen vertrauenswürdig sein!
  - Einheitliche Schnittstellen (z.B. OpenID Connect)

## Authentifizierung im Web (1)

HTTP ist **zustandslos**: Request-Response Paare sind unabhängig voneinander

\rightarrow{} Authentifizierungsinformationen müssen bei jedem Request mitgeschickt werden!

### HTTP Basic Auth

- Einfachstes passwortbasiertes Verfahren
- Benutzername und Passwort werden Base64-kodiert im `Authorization`-Header mitgeschickt

```http
GET / HTTP/1.1
Host: example.com
Authorization: Basic bHVrYXM6aW5zZWN1cmU=
```

## Authentifizierung im Web (2)

### Probleme HTTP Basic Auth

- Übertragung von Benutzername und Passwort im Klartext (Abhilfe: TLS)
  - Gleicher String wird bei jedem Request gesendet, macht Angriffe auf verschlüsselte Verbindungen einfacher
- Kein Logout
- Caching von Benutzername und Passwort im Browser
- Anfällig für CSRF (siehe unten)

### Session-Tokens

- Server generiert ein zufälliges Token (Session-Token)
  - Idealerweise mit kurzer Lebensdauer
- Token wird typischerweise als Cookie gespeichert
  - Browser sendet Cookies automatisch bei jedem Request

## Authentifizierung im Web (3)

### Probleme Session-Tokens

- JavaScript kann auf Cookies zugreifen (Abhilfe durch `HttpOnly`-Flag)
- Ähnlich wie bei Basic-Auth hängt die Sicherheit von einem Secret ab, das bei jedem einzelnen Request mitgeschickt werden muss
  - Explizite Logouts möglich
  - Server kann Gültigkeitsdauer der Tokens steuern: je kürzer, desto besser
  - Besserer Schutz gegen Brute-Force-Angriffe (Login-Formular ausgenommen!): Länge und Zufälligkeit des Tokens können vom Server definiert werden
- Horizontale Skalierung komplex

## Horizontale Skalierung und Session-Cookies (1)

![Session Token ein Server](media/singe-server-auth-token.png){width=70%}

## Horizontale Skalierung und Session-Cookies (2)

![Session Token mit Load Balancing](media/load-balanced-auth-token.png){width=70%}

## Horizontale Skalierung und Session-Cookies (3)

![Problem bei Session Token mit Load Balancing](media/load-balanced-auth-token-problems.png){width=65%}

## Horizontale Skalierung und Session-Cookies (4)

- **Problem**: Session-Tokens sind erstmal server-spezifisch!
  - Nur Server, der Token generiert hat, kennt das Token und kann es validieren
- **Lösungsansätze**
  - Token zentral speichern (z.B. zusätzliche (In-Memory)-Datenbank), aber: Single Point of Failure, Skalierbarkeit (insbesondere geografisch)
  - Sticky Sessions: Requests eines Clients gehen immer an gleichen Server, aber: Ausfallsicherheit, Lastverteilung
  - Public-Key-Kryptografie: Signaturen über Tokens, alle mit Public-Key können Token validieren, aber: Komplexität, Performance

## JSON Web Tokens (JWT) (1)

- Umsetzung des Signatur-Ansatzes ist mit JWTs möglich
- JWT: Base64-kodiertes JSON-Objekt mit Signatur
  - Header: Metadaten (Typ, Algorithmus)
  - Payload: Nutzdaten "Claims", standardisierte und benutzerdefinierte
  - Signatur: Signatur der Header- und Payload-Daten mit Public-Key Verfahren oder Secret
- Use-Case: Autorisierung
  - Token kann weitere Informationen (Claims) über den Nutzer enthalten

## JWT (2)

- Wichtige Standard-Claims ("registered Claims")
  - `iss`: Issuer = Aussteller des Tokens
  - `exp`: Expiration Time = Gültigkeitsdauer
  - `sub`: Subject = wen betrifft das Token (z.B. User-ID)
- Ansonsten z.B. Rolle, Username, E-Mail, ...
  - Achtung: Daten sind nicht standardmäßig verschlüsselt, also nicht geheim!
- JWT Tools: [jwt.io](https://jwt.io/)
- JWT Bibliotheken für praktisch jede Sprache: [Libraries](https://jwt.io/libraries)

## JWT (3)

### Implementierung TypeScript

- Bekannteste Bibliothek: [`jsonwebtoken`](https://github.com/auth0/node-jsonwebtoken)
  - Wird aber nicht mehr weiterentwickelt, letzter Commit August 23
  - Unterstützt nicht alle Algorithmen
- Moderner Alternative: [`jose`](https://github.com/panva/jose)
  - Aktive Entwicklung
  - Unterstützt auch JWE (Verschlüsselung) und JWS (Signatur) von beliebigen Daten
  - Installation:
    - `npm install jose`

## Jose Beispiel - Erstellen

```typescript
import * as jose from "jose";

const keypair = await jose.generateKeyPair("EdDSA");
// in der Praxis eher:
// const keyString = readFileSync('private-key.pem', 'utf-8');
// const privateKey = await jose.importPKCS8(keystring, "EdDSA");

const jwt = await new jose.SignJWT({ someClaim: "someValue" })
  .setProtectedHeader({ alg: "EdDSA" })
  .setIssuedAt()
  .setExpirationTime("1h")
  .sign(keypair.privateKey);
```

## Jose Beispiel - Verifizieren

```typescript
import * as jose from 'jose';

const keyString = readFileSync('public-key.pem', 'utf-8');
const key = await jose.importSPKI(keyString, "EdDSA");
const { payload: unparsed } = await jose.jwtVerify(token, key, {
  issuer: "urn:issuer",
});

```

- Dokumentation: [SignJWT](https://github.com/panva/jose/blob/main/docs/jwt/sign/classes/SignJWT.md)
- Dokumentation: [jwtVerify](https://github.com/panva/jose/blob/main/docs/jwt/verify/functions/jwtVerify.md)

## Zusammenfassung JWT

- Besser als Session-Cookies: jeder mit public key kann validieren
- Mächtig auch für Autorisierung (Claims)
- **ABER**: Authentifizierung und Autorisierung trotzdem besser den Profis überlassen
  - Grundprobleme bleiben bestehen: Passwörter, MFA, Passkeys
    - JWT setzt erst **nach** initialer Authentifizierung an und bietet einen einfachen Weg den Authentifizirungsstatus zu übermitteln
  - Session-Hijacking Gegenmaßnahmen (z.B. kurzlebige Tokens mit Refresh-Token) notwendig
  - Schlüsselverwaltung + Rotation


## Authentifizierung mit Bibliotheken und externen Services

- Übernehmen unterschiedlich viele Funktionen
  - Bis hin zu kompletter User-Verwaltung mit fertiger Oberfläche
  - Und alles dazwischen
- **Vorteile**:
  - Schnelle und Einfache Integration
  - Professionelle Implementierung (hoffentlich)
  - Login mit Social Media Accounts meist einfach einzurichten

## Beispiel-Bibliothek Auth.js

- [Auth.js](http://www.authjs.dev/) 
  - Unterstützt Authentifizierung über OAuth (Google, Apple, GitHub, ...), Magic Links, Benutzername/Passwort, WebAuthn
  - Übernimmt neben Login und Session-Verwaltung auch die Verwaltung der User-Daten in eigener Datenbank
    - Einfache Adapter für z.B. Drizzle ORM oder Prisma
  - Verwendet standardmäßig JWTs über Cookies für Session-Management
  - Kommt mit einfachen vorgefertigten Seiten für Login, Logout etc.
  - [Quickstart mit express](https://authjs.dev/getting-started/installation?framework=express)
- Vergleichbare Alternative [BetterAuth](https://better-auth.vercel.app)

## Beispiel-Service Clerk

- [Clerk](https://clerk.com/) ist eine komplette externe Authentifizierungslösung
  - User-Verwaltung, Authentifizierung über OAuth, gute UI-Komponenten, ...
  - Keine eigene Datenbank notwendig (ABER: weniger Kontrolle über User-Daten)
  - Kostenlose Version reicht für viele Fälle aus (10k monatliche aktive Nutzer)
    - im Dev-Mode sind auch alle Addons (z.B. MFA) kostenlos)
- Open Source Alternative: [StackAuth](https://stack-auth.com)
  - Noch nicht so ausgereift, aber grundsätzlich gleiche Features
  - Auch hier sind erste 10k Nutzer kostenlos 
    - Zusätzlich Self-Hosting, da vollständig Open Source


## Theoretische Fragen

- Erklären Sie den Unterschied zwischen _Authentifizierung_ und _Autorisierung_?
- Welche besondere Herausforderung gibt es bei der Authentifizierung im Web durch das HTTP-Protokoll?
- Erläutern Sie welche Probleme bei der Authentifizierung mit Session-Cookies bei horizontaler Skalierung auftreten können.


# Web-spezifische Sicherheitslücken

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
````

- Suchbegriff kommt z.B. aus einem Suchfeld und wird in Variable `search` gespeichert
- JavaScript baut die SQL-Abfrage:

```javascript
const query = `SELECT * FROM posts WHERE posts.title LIKE '${req.query.query}'`;
```

## SQLi Einführung (2)

### Was kann ein Angreifer tun?

## SQLi Einführung (3)

Einfaches Beispiel: `'OR 1=1 --` (`--` ist Kommentarzeichen in SQL)
\rightarrow{} Erweitert die SQL-Abfrage zu:

```sql
SELECT * FROM posts WHERE posts.title LIKE '' OR 1=1 --';
```

\rightarrow{} Implikationen?

## SQLi Einführung (4)

- **Problem**: Datenbank kennt den Unterschied zwischen Code und Daten (Nutzereingaben) nicht
- `OR 1=1` (o.ä.) ist eine der einfachsten Varianten, eine WHERE-Klausel zu umgehen
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

## Praxisaufgabe 1

1. Probiert die SQL-Injection im Beispiel-Code in `27_Web_Security/injections` wie zu triggern, um alle posts abzurufen. (_Hinweis_: ist in diesem Beispiel sogar noch einfacher)
2. Ruft zusätzlich die IDs und Namen aller Autoren ab (_Hinweis_: `UNION SELECT` und füll-Felder ;) )
3. Fixt die SQL-Injection im Beispiel-Code mit Hilfe der Doku: [https://www.npmjs.com/package/sqlite](https://www.npmjs.com/package/sqlite)

## Cross-Site Scripting (XSS) Einführung (1)

**Funktionsweise**: Anwendung fügt Nutzereingaben ungeprüft in HTML, JavaScript (oder CSS, SVG) ein

Verschiedene Arten:

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

## XSS Schutz

- **Grundlegend**: **niemals** Nutzereingaben ungeprüft in HTML einfügen
- **Input Validation**: Prüfen, ob Eingaben den erwarteten Formaten entsprechen
  - Validieren von Eingaben mit Positivlisten (erlaubte Zeichen) statt Negativlisten
- **Output Validation**: Prüfen, ob Ausgaben den erwarteten Formaten entsprechen
  - Es kann vorkommen, dass durch weitere Verarbeitungsschritte unerwartete Ausgaben entstehen!
- In der Regel vorhandene Bibliotheken nutzen, die XSS-Schutz bieten
  - Moderne Frontend Frameworks (React, Angular, Svelte, ...) bieten guten Schutz vor XSS

## Praxisaufgabe 2

Die Anwendung aus Praxisaufgabe 1 hat auch eine Stored XSS Lücke.
Zeigt, wie sich diese mit Hilfe von curl ausnutzen lässt und injiziert ein Script, dass den Hintergrund der Seite ändert.
(_Hinweis_: da das JavaScript der Suche den Code dynamisch einbindet, probiert es mit inline Event-Handlern in HTML Attributen oder javascript URLs)

## Cross-Site Request Forgery (CSRF)

- Ähnlich wie XSS
  - XSS täuscht den Nutzer, CSRF täuscht in erster Linie den Server
  - Angreifers sorgt dafür, dass der Browser einen Request an den angegriffenen Server sendet
  - Server hält den Request für legitim, da er von einem authentifizierten Nutzer kommt
- Angriffsvektoren
  - Aufbauend auf XSS
  - Von Angreifer kontrollierte Formulare
  - Links in E-Mails, Forenbeiträgen, etc.
- Heute durch moderne Browser und Web-Frameworks wenig verbreitet

## CSRF Schutz

- SameSite Cookies: Schutz der Authentifizierungs-Cookies

  - Cookie wird nur gesendet, wenn die Anfrage von der gleichen Seite kommt
  - `SameSite=Strict`: Nur von der gleichen Seite
  - `SameSite=Lax`: Auch von anderen Seiten, aber nur bei GET-Requests

- CSRF-Token
  - Server generiert Token und sendet es an den Client
  - Token wird bei jedem Request an den Server gesendet
  - Server prüft, ob Token korrekt ist
  - \rightarrow{} gefälschte Requests von anderen Seiten kennen das gültige Token nicht

## Wiederholung: Cross-Origin Resource Sharing (CORS)

- Same-Origin-Policy: JavaScript auf Website kann nur auf Ressourcen mit gleichem Origin zugreifen
  - **Same Origin**: gleiches **Protokoll**, gleicher **Port** und gleiche **Domain**
- Beispiel: https://example.com

| Beispiel | Domain                   | Same Origin? |
| -------- | ------------------------ | ------------ |
| 1        | https://example.com:443  | Ja           |
| 2        | https://example.com:8443 | Nein         |
| 3        | http://example.org       | Nein         |
| 4        | https://sub.example.com  | Nein         |

## CORS Header (1)

- Möglichkeit, Same-Origin-Policy (beschränkt) aufzuweichen
  - Angefragter Server kann Zugriff erlauben
  - Nur einsetzen, wenn wirklich nötig
- Steuerung über HTTP-Header `Access-Control-Allow-*`
  - `-Origin`: Von welchen (anderen) Origins aus, darf auf diese Ressource zugegriffen werden?
    - `ORIGIN` / `*`: Nur Zugriffe von `ORIGIN` / Alle Zugriffe erlaubt \rightarrow{} **vorsichtig einsetzen**
  - `-Methods`: Welche HTTP-Methoden sind für CORS erlaubt?
    - `METHOD` / `*`: Analog zu `Access-Control-Allow-Origin`

## CORS Header (2)

- `Access-Control-Allow-Credentials`: Dürfen Authentifizierungsdaten (z.B. Cookies) von anderen Origins mitgeschickt werden?
  - `true` / `false`
  - Auf Client Seite (`fetch`-API) muss zusätzlich `credentials: "include"` gesetzt werden
  - Erhöht Gefahr von [CSRF](https://developer.mozilla.org/en-US/docs/Glossary/CSRF)-Angriffen \rightarrow{} **vorsichtig einsetzen**

## Content Security Policy (CSP) (1)

- **Ziel**: Schutz XSS-Angriffen durch Trennung von Code und Daten
- Browser kann bei aktiver XSS-Lücke nicht unterscheiden, welcher Code von der Anwendung stammt und welcher von einem Angreifer

  - Script des Angreifers wird wie jedes andere auch ausgeführt

- **Funktionsweise**: Einschränkung von erlaubten Script-Quellen und Scripten
  - Inline-Scripte werden blockiert
  - \rightarrow{} JavaScript-Code sollte in eigene Dateien ausgelagert werden

## CSP (2)

- `Content-Security-Policy`-Header definiert die Direktiven, die für diese Seite gelten
  - `script-src`: Erlaubte Quellen für JavaScript
  - `style-src`: Erlaubte Quellen für CSS
  - `default-src`: Fallback für alle anderen Ressourcen
- Beispiel: `Content-Security-Policy: script-src 'self' img-src 'self' cdn.example.com`
  - Erlaubt JavaScript und Bilder von der gleichen Domain und Bilder auch von `cdn.example.com`
- Weitere Einschränkungen: nur Scripte mit bestimmten Hashes erlauben
  - Kann auch inline-Scripte wieder erlauben
- Mehr Informationen bei [MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)


## Theoretische Fragen

- Erklären Sie den Begriff _Injection Attack_.
  - Nennen Sie zwei Beispiele für Injection Attacks.
- Nennen Sie zwei Beispiele für _Untrusted Input_.
- Worin besteht das grundlegende Problem, das zur Möglichkeit einer SQL Injection führt?
- Was muss unbedingt vermieden werden, um SQL-Injections zu verhindern?
- Nennen Sie eine Schutzmaßnahme gegen SQL-Injections.
- Was versteht man unter dem Begriff _XSS_?
- Nennen Sie zwei Arten von XSS-Angriffen.
- Was kann ein Angreifer durch einen XSS-Angriff erreichen?
- Erklären Sie den Begriff _Content Security Policy_ und nennen Sie den Hauptvorteil der sich daraus ergibt.


# OWASP Top 10

## Grundlagen

- **OWASP**: Open Web Application Security Project
- **Top 10**: Liste der 10 häufigsten Sicherheitslücken in Web-Anwendungen
  - Projektwebsite: [https://owasp.org/www-project-top-ten/](https://owasp.org/www-project-top-ten/)
  - Basiert auf Schwachstellen in realen Web-Anwendungen
  - Vor allem um Awareness zu schaffen
  - Aktuelle [Stand 2021](https://owasp.org/Top10/), nächste Version H1/2025
  - Separate Listen für [APIs](https://owasp.org/API-Security/editions/2023/en/0x11-t10/), [Mobile](https://owasp.org/www-project-mobile-top-10/)
- OWASP bietet auch noch viele weitere hilfreiche Ressourcen
  - Insbesondere [Cheatsheets](https://cheatsheetseries.owasp.org/index.html)

## A01 - A03

### [A01:2021 - Broken Access Control](https://owasp.org/Top10/A01_2021-Broken_Access_Control/)

- Benutzer kann Aktionen ausführen, für die er nicht berechtigt ist (lesen/modifizieren)

### [A02:2021 - Cryptographic Failures](https://owasp.org/Top10/A02_2021-Cryptographic_Failures/)

- Schwache, fehlende oder falsch konfigurierte Verschlüsselung

### [A03:2021 - Injection](https://owasp.org/Top10/A03_2021-Injection/)

- Untrusted Input wird unzureichend geporüft an einen Interpreter übergeben \rightarrow{} SQL-Injection, Cross-site Scripting (XSS), ...

## A04 - A06

### [A04:2021 - Insecure Design](https://owasp.org/Top10/A04_2021-Insecure_Design/)

- Verschiedene Designentscheidungen, die zu Sicherheitslücken führen

### [A05:2021 - Security Misconfiguration](https://owasp.org/Top10/A05_2021-Security_Misconfiguration/)

- Falsche oder fehlende Sicherheitskonfiguration, z.B. nicht ausreichende Härtung, Standardpasswörter

### [A06:2021 - Vulnerable and Outdated Components](https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/)

- Veraltete 3rd-Party Komponenten (OSS und proprietär) oder Komponenten mit bekannten Schwachstellen

## A07 - A09

### [A07:2021 - Identification and Authentication Failures](https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/)

- Schwächen in Authentifizierung, z.B. keine Passwort-Policies, Schutz gegen Brute-Force-Angriffe, ...

### [A08:2021 - Software and Data Integrity Failures](https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/)

- Unzureichender Schutz gegen Integritätsverletzungen, z.B. fehlende Prüfung bei Updates

### [A09:2021 - Security Logging and Monitoring Failures](https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/)

- Unzureichendes Protokollieren von Sicherheits-relevanten Ereignissen, beeinträchtigt Erkennung und Aufarbeitung von Angriffen

## A10

### [A10:2021 - Server-Side Request Forgery](https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/)

- Zugriff (Serverseitig) auf unzureichend validierte URLs aus untrusted input
