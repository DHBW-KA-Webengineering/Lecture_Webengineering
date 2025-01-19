---
title: "Vorlesung Webengineering 1 - Deployment"
topic: "Webengineering_1_2_6"
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


# Backend-Deployment

## Deployment

- **Deployment**: Bereitstellung von Software auf einem Zielsystem
- Zielsystem: Server, Cloud, IoT-Gerät, ...
- Deployment-Prozess: Wie kommt die Software von der Entwicklungsumgebung auf das Zielsystem?
  - Verschiedene Ansätze der grundlegenden Organisation
  - Heute i.d.R. stark automatisiert, sodass mehrere Deployments pro Tag problemlos möglich sind

## Unterschiede Frontend- und Backend-Deployment (1)

(klassisches) Frontend:

- Statische Dateien (HTML, CSS, JS) und Assets (Bilder, Videos, ...)
- Auslieferung der Dateien über klassischen Webserver (Nginx, Apache2, ...) oder CDN
- Noch einfachere Lösung: Bereitstellung über Object-Storage (z.B. AWS S3)
- Skalierbarkeit vergleichsweise einfach über Replikation der Daten und Caching mit CDNs
- Für kleine Projekte: Kostenloses Hosting z.B. über GitHub Pages, Cloudflare, AWS S3, Netlify, Vercel, ...


## Unterschiede Frontend- und Backend-Deployment (2)
Backend:

- Antwort auf HTTP-Requests, Verarbeitung von Daten, Zugriff auf Datenbanken, ...
- \rightarrow{} dynamische Inhalte und Logik
- Skalierbarkeit komplexer, reine Replikation und Caching reichen nicht aus bzw. sind komplexer
  - Load-Balancing muss Konsistenz sicherstellen (z.B. Login-Zustand etc.)
  - Sollte von Anfang an in der Architektur berücksichtigt werden

## Continuous Integration, Continuous Delivery / Deployment (CI/CD)

- **Continuous Integration (CI)**: Häufiges zusammenführen von Code, Verifikation durch automatisierte Builds und Tests
- **Continuous Delivery (CD)**: Software so zu entwickeln, dass sie jederzeit ausgeliefert werden kann (erfordert u.A. CI mit automatisierten Tests)
- **Continuous Deployment (CD)**: Software wird kontinuierlich automatisiert ausgeliefert (nach erfolgreichen Tests, eventuellen Staging-Umgebungen etc.)

- Vorteile: Schnellere Entwicklungszyklen, geringe Deployment-Risiken, schnelles User-Feedback, ...


## CI/CD-Tools und Praktiken

- Tools: GitHub Actions, GitLab CI/CD, Azure Pipelines, Travis CI, ...
- Praktiken:
  - Fokus auf Deployability anstatt auf fertige Features 
  - **Automatisierte Tests**: Unit-Tests, Integrationstests, End-to-End-Tests, ...
  - **Feature-Flags**: Neue Features können unabhängig von Deployment aktiviert werden
    - Auch unfertige Features werden deployed, aber noch nicht aktiviert
  - **Monitoring**: Überwachung der Anwendung, z.B. mit Sentry, Grafana, Prometheus, ...

## Serverless Deployment

- **Serverless**: Abstraktion von Servern, Load-Balancing, CDN, ...
- Keine Verwaltung von Servern, Service übernimmt Infrastruktur 
- Abrechnung nach Nutzung, keine Fixkosten
- Automatische Skalierung
- Viele Services bieten auch CI/CD Integration
- Beispiele für Webanwendungen: Netlify, Vercel

## Serverless Deployment Node.js + express Backend - Netlify (1)

- [Netlify](https://www.netlify.com/): Service für Serverless-Deployment für Webanwendungen
- Einfacher Import von Git-Repositories von GitHub, GitLab, Azure Repos, ...
- Automatischer Build und Deployment bei Änderungen im Repository
- Keine Verwaltung von Server, Load-Balancing, CDN etc. notwendig
- Abrechung nach Nutzung, kostenloser Tarif für kleine Projekte ausreichend

## Serverless Deployment Node.js + express Backend - Netlify (2)

- Siehe [Dokumentation](https://docs.netlify.com/frameworks/express/)
- Anwendungscode muss in `/netlify/functions` liegen
  - Jede Datei in diesem Verzeichnis wird als eigene Serverless-Funktion behandelt
  - Beispiel: `api.js` wird unter `/.netlify/functions/api` erreichbar
- Zusätzliche Dependency: [`serverless-http`](https://www.npmjs.com/package/serverless-http) installieren
  - Erlaubt einfache Nutzung von Node-Servern in Serverless-Umgebungen
  - Anpassung von Anwendung: `app.listen` durch `export const handler = serverless(app)` ersetzen
  - Für TypeScript noch `@netlify/functions` und  `@types/express` installieren

## Serverless Deployment Node.js + express Backend - Netlify (3)

Erstellen einer `netlify.toml`-Konfigurationsdatei im Projekt-Root:
  
- Konfiguration von Redirects (damit die express-Anwendung keine netlify-spezifischen URLs verwenden muss)

```toml
[functions]
  external_node_modules = ["express"]
  node_bundler = "esbuild"
[[redirects]]
  force = true
  from = "/api/*"
  status = 200
  to = "/.netlify/functions/api/:splat"
``` 
  

## Serverless Deployment Node.js + express Backend - Netlify (4)

- Deployment über Web-UI oder netlify CLI einrichten
  - In Web-UI GitHub-Repository verknüpfen, fertig
  - CLI (Installation `npm i -g netlify-cli`): `netlify init` und Schritte befolgen

**Live-Demo**

## Serverless Deployment Node.js + express Backend - Vercel (1)

- [Vercel](https://vercel.com/): Service für Serverless-Deployment für Webanwendungen
- Viele Features ähnlich zu Netlify: Automatischer Build und Deployment bei Git-Änderungen, keine Server-Verwaltung, ...
- Bessere Integration in GitHub: Deployment-Status einfach im Repository sichtbar, gute Integration in Pull-Requests, ...
- Kostenloser Tarif reicht auch hier für kleine Projekt aus

## Serverless Deployment Node.js + express Backend - Vercel (2)

- Siehe [Dokumentation](https://vercel.com/guides/using-express-with-vercel)
- Beispiel-Template von Vercel auf [GitHub](https://github.com/vercel/examples/tree/main/solutions/express)
- Anwendungscode muss in `api` liegen, Einstiegspunkt ist `api/index.js` oder `.ts`
  - Datei braucht einen default export der express-App
- Zusätzliche Konfigurationsdatei `vercel.json` (rewrites zu API Endpunkten):

```json
{ "version": 2, "rewrites": [{ "source": "/(.*)", "destination": "/api" }]}

```

## CI / CD für Node.js + express Backend - Vercel (3)

- Deployment über Web-UI oder Vercel CLI einrichten
  - In Web-UI GitHub-Repository verknüpfen, fertig
  - CLI (Installation `npm i -g vercel`): `vercel login`, Deployment über `vercel`-Befehl
    - Lokales Testen über `vercel dev` sinnvoll um Verhalten in Vercel-Umgebungen zu testen

**Live-Demo**


## Einschränkungen von Serverless-Deployments

- Kein durchgehend laufender Server, Instanz wird bei Bedarf gestartet
  - \rightarrow{} Kein Zustand zwischen Requests, z.B. keine Sessions, kein simples In-Memory-Caching möglich
- Limitierte Laufzeit (Request-Bearbeitung muss in dieser Zeit abgeschlossen sein)
- Für euer Projekt bedeutet das: In-Memory Datenhaltung zum Testen funktioniert nur lokal, nicht in der Serverless-Umgebung!
  - Falls nötig gibt es [VercelKV](https://vercel.com/docs/storage/vercel-kv), [Netlify Blobs](https://docs.netlify.com/blobs/overview/)
  - Für die finale Abgabe ist sowieso eine Datenbank-Integration notwendig, auch hierfür gibt es Serverless-Lösungen (z.B. [Vercel Postgres](https://vercel.com/integrations/postgres) über [Neon](https://neon.tech/) Integration)


# Grundlagen Docker

## Was ist Docker?

- Open Source Software für Containervirtualisierung
  - Aber auch Firma Docker Inc.
- `docker` heute als Synonym für Containervirtualisierung

## Containervirtualisierung Recap (1)

- Grundlagen bekannt aus Kapitel Webarchitekturen - Deployment
- **Container** sind isolierte Umgebungen für Anwendungen
  - Enthalten Anwendungscode, Abhängigkeiten, Laufzeitumgebung
  - Laufen auf einem Host-Betriebssystem
  - Isoliert von anderen Containern und dem Host
- Vorteile:
  - Konsistente Umgebung für Anwendung: lokales Testen und Produktivumgebung sind gleich
  - Einfache Verteilung von Anwendungen


## Docker Verwendung (1)

### Installation

- Docker Desktop für [Windows](https://docs.docker.com/desktop/install/windows-install/), [macOS](https://docs.docker.com/desktop/install/mac-install/) und [Linux](https://docs.docker.com/desktop/install/linux-install/)
  - GUI für Arbeit mit Docker, einfachster Weg Docker (auch CLI) zu installieren
  - Kommerzielle Nutzung kostenpflichtig!
  - Alternativen: Podman Desktop, Rancher Desktop

## Docker Verwendung (2)

### CLI

- Nach der Installation sollte die Docker CLI über die Kommandozeile verfügbar sein
  - Testen: `docker --version`, `docker run hello-world`
- Wichtige Befehle:
  - `docker run`: Starten eines Containers
  - `docker build`: Erstellen eines Images aus einem Dockerfile
  - `docker ps`: Anzeigen laufender Container
  - `docker images`: Anzeigen vorhandener Images

## Docker Verwendung (3)

### Eigene Images erstellen - Dockerfiles

```dockerfile
FROM debian:bookworm-slim

COPY . /app

WORKDIR /app

CMD ["cat", "test.txt"]
```

- `docker build -t <my-image> .` erstellt ein Image aus dem Dockerfile im aktuellen Verzeichnis
- `docker run <my-image>` startet einen Container mit dem Image

## Docker Verwendung (4)

### Erklärung Dockerfile

- Jede Zeile erzeugt ein Layer
- `FROM debian:bookworm-slim`: Basisimage für das neue Image, hier Debian in der Variante "bookworm-slim"
  - "Basis" für das neue Image, bringt Standard-Tools und -Bibliotheken mit
  - [Docker Hub](https://hub.docker.com/) ist die Standard-Quelle für Images
- `COPY . /app`: Kopiert den Inhalt des aktuellen Verzeichnisses in das Image-Verzeichnis `/app`
- `WORKDIR /app`: Arbeitsverzeichnis für den Container auf `/app` setzen, alle weiteren Befehle in diesem Verzeichnis 
- `CMD ["cat", "test.txt"]`: Führt `cat test.txt` im Container aus (bei Start) \rightarrow{} gibt Inhalt von `test.txt` aus

## Docker Verwendung (5)

### Ausführung von Containern

`docker run [OPTIONS] <image> [COMMAND]`

- Häufige Optionen
  - `-d`: Container im Hintergrund starten
  - `-p <host-port>:<container-port>`: Portweiterleitung
  - `-v <host-path>:<container-path>`: Volumen-Mounting, Dateien des Hosts im Container verfügbar machen -> Container kann Daten so persistent speichern
  - `--rm`: Container nach Beenden automatisch löschen
  - `-it`: Interaktiver Modus, z.B. für Shell-Zugriff / Debugging
- COMMAND: Befehl, der im Container ausgeführt wird, z.B. `bash` für Shell-Zugriff 

## Zusammenfassung Grundlagen

- Docker ermöglicht Containervirtualisierung
- **Images** sind Vorlagen für **Container**, **Dockerfiles** beschreiben **Images**
- Docker CLI für Interaktion mit Docker (Bauen, Starten, Stoppen, ...)
- Vorgefertigte Images aus dem [Docker Hub](https://hub.docker.com/) können genutzt werden

# Deployment von Webanwendungen mit Docker

## Vorteile von Docker für Deployment

- **Portabilität**: Image kann einfach auf andere Systeme gebracht werden, z.B. über öffentliche Registries wie Docker Hub oder als einzelne Datei (tar)
- **Konsistente Umgebung**: Entwicklungs- und Produktionsumgebung sind identisch
  - Klar definierte Abhängigkeiten, keine "It works on my machine"-Probleme
  - Wenn die Anwendung lokal im Container läuft, läuft sie auch auf einem Server im Container
- **Isolation**: Container sind voneinander isoliert
- **Skalierbarkeit**: Container können einfach dupliziert werden, z.B. für Lastverteilung

## Deployment von statischen Webseiten (1)

Statische Webseite = ohne Server-Logik, nur Auslieferung von HTML, CSS, JS

### Was brauchen wir dazu im Image?

## Deployment von statischen Webseiten (2)

### Inhalt Image

- HTML, CSS, JS-Dateien
- Möglichkeit HTTP-Requests mit diesen Dateien zu beantworten
  - \rightarrow{} Webserver wie Nginx, Apache2 ...
  - \rightarrow{} Node.js, Python, Ruby, ... mit entsprechenden Frameworks
- + Konfiguration für den Webserver, z.B. Port, Verzeichnis der Dateien, ...

## Deployment von statischen Webseiten (3)

### Dockerfile für statische Webseite mit Nginx

```dockerfile
FROM nginx:alpine

COPY static/ /usr/share/nginx/html
```

- Vorgefertigtes Image `nginx:alpine` erleichtert vieles: Nginx installiert, Standard-Konfiguration vorhanden, ...
- `COPY static /usr/share/nginx/html`: Kopiert den Inhalt des aktuellen Verzeichnisses in das Verzeichnis, das Nginx als Webroot nutzt
- `docker build -t my-static-website .` erstellt das Image

## Deployment von statischen Webseiten (4)

### Ausführen des Containers

`docker run -p 8080:80 my-static-website` 

- Nginx verwendet den Standard-Port 80
- Um Zugriffe von außen (auch Host) zu ermöglichen, wird der Port 80 des Containers auf den Port 8080 des Hosts weitergeleitet 
- Webseite ist unter `http://localhost:8080` erreichbar


## Deployment von REST-APIs (1)

### Was brauchen wir dazu im Image für JavaScript / TypeScript?

## Deployment von REST-APIs (2)

### Inhalt Image

- JavaScript / TypeScript-Dateien mit Server-Logik
  - Verarbeitung von HTTP-Requests, Zugriff auf Datenbanken / lokale Daten, ...
  - **Abhängigkeiten** (Bibliotheken, Frameworks, ...)!
- JavaScript / TypeScript-Laufzeitumgebung
  - Node.js
  - Deno
  - Bun

## Deployment von REST-APIs (3)

### Dockerfile für REST-API mit Node.js

```dockerfile
FROM node:lts

COPY . /app
WORKDIR /app
CMD ["node", "src/index.js"]
```

- `node:lts` als Basisimage, bringt Node.js mit
- `COPY . /app`: Kopiert den Inhalt des aktuellen Verzeichnisses in das Image-Verzeichnis `/app`
  - Voraussetzung: `npm install` wurde vorher ausgeführt

## Deployment von REST-APIs (4)

### Multi-Stage-Dockerfile

```dockerfile
FROM node:lts AS build

COPY package*.json .
RUN npm ci --only=production

FROM node:lts AS app

WORKDIR /app
COPY --from=build node_modules node_modules
COPY package.json src /app/

CMD ["node", "index.js"]
```

## Deployment von REST-APIs (5)

### Multi-Stage-Dockerfile - Erklärung

- Trennung von Build- und Laufzeitumgebung
  - Build: Installation von Abhängigkeiten (hier: `express`)
  - Laufzeit: Nur das Nötigste (hier: `node_modules`, `src` und `package.json`) wird kopiert

\rightarrow{} Laufzeit-Image kann kleiner sein, da Development-Tools (z.B. `typescript`, `eslint`, ...) nicht benötigt werden.
\rightarrow{} In der Regel zu bevorzugen!


## Deployment von REST-APIs (6)

### Dockerfile für REST-API mit Bun

```dockerfile
FROM oven/bun as build

COPY package.json bun.lockb /
RUN bun install --frozen-lockfile

FROM oven/bun as app
WORKDIR /app

COPY --from=build node_modules node_modules
COPY package.json src /app/

CMD ["bun", "run", "."]
```