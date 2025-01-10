---
title: "Vorlesung Webengineering 1 - Exkurs: Deployment mit Docker"
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


# Grundlagen 

## Was ist Docker?

- Open Source Software für Containervirtualisierung
  - Aber auch Firma Docker Inc.
- `docker` heute als Synonym für Containervirtualisierung

## Containervirtualisierung (1)

### Recap: Webarchitekturen - Deployment 

- Leichtgewichtige Virtualisierung auf **Prozessebene**
  - Betriebssystem(-Kern) von allen _Containern_ gemeinsam genutzt
- Isolation über Linux Kernel-Features
  - Namespaces: Isolation von Prozessen, eigene "Sicht" auf System (Dateisystem, Netzwerk, ...)
  - Cgroups (Control Group): Beschränkung von Hardware-Ressourcen (CPU, RAM, ...)
  - \rightarrow{} Container voneinander isoliert, bringen eigene Umgebung (Binaries, Bibliotheken, Konfiguration, ...) mit

## Containervirtualisierung (2)

### Begriffe

- _Container_: Instanz eines Images (ähnlich zu Objekt in OOP)
- _Image_: "Vorlage" für Container eines Typs (ähnlich zu Klasse in OOP)
  - _Layer_: Teil eines Images (entfernt ähnlich zu Vererbung in OOP)
  - Mehrere Layer bilden zusammen das Image, jedes fügt Dateien hinzu oder ändert bzw. entfernt bestehende
- _Dockerfile_: Beschreibung des Images, Build-Script für ein Image


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