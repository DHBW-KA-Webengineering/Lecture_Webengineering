---
title: "Vorlesung Webengineering 1 - ASP.NET Core"
topic: "Webengineering_1_2_9"
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

# Einführung ASP.NET Core

## Grundlagen

- Webframework für .NET > 5.0
  - Webentwicklung mit C# \rightarrow{} Vor- und Nachteile gegenüber JavaScript
- Verwendbar für komplette Webanwendungen oder APIs
  - Fokus hier auf REST-APIs

## Installation

- Voraussetzungen: .NET SDK (aktuelle Version 9.0)
  - Windows: `winget install Microsoft.DotNet.SDK.9`
  - macOS (homebrew): `brew install --cask dotnet`
- Visual Studio Code oder Visual Studio
  - VS Code: [C#-Erweiterung](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)
  - VS: ASP.NET und Webentwicklung Workload (im Installer auswählen)

## API-Entwicklung mit ASP.NET Core

2 Ansätze:

### Controller-basierte APIs

- Klare, vorgegebene Struktur mit guter automatischer Codegenerierung
- Gut geeignet für komplexe Projekte

### Minimal APIs

- Weniger Struktur, höhere Flexibilität \rightarrow{} Struktur ähnlich zu Express
- Keine automatische Codegenerierung
- Gut geeignet für kleine/einfache Projekte
- Wir betrachten hier nur Minimal APIs

# Minimal APIs

## Projekt erstellen und Grundstruktur

`dotnet new webapi -o <NAME>` (oder über Visual Studio UI)

- Erzeugt Konfigurationen und `Program.cs`

```C#
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
app.MapGet("/", () => "Hello World!");
app.Run();
```

Ausführen mit `dotnet run` oder über die UI der IDE

## Minimal APIs - Routing

- Zuordnung von Handlern zu Routen ähnlich wie bei express
  - `app.MapGet("/route", <Handler-Function>);`
  - Analog für `MapPost`, `MapPut`, `MapDelete`, ...
- Handler-Funktionen meist als Lambda direkt in der Zuordnung
- Routenparameter und Rückgabewerte wie bei Controller-basierten APIs

## Minimal APIs - Datenbankverbindung

Analog zu Controller-basierten APIs

- NuGet-Paket für Datenbankverbindung hinzufügen & Verbindung konfigurieren
- Model-Klasse & Datenbankkontext erstellen
- Dependency Injection konfigurieren: `builder.Services.AddDbContext<...>(...);`
- Datenbankkontext in Handler-Funktionen nutzen: `MapGet("/", (Context context) => ...)`

## Minimal APIs - Beispiel

```C#

app.MapGet("/api/users/{id}", async (UserContext context, long id) =>
    await context.Users.FindAsync(id) is User user
        ? Results.Ok(user)
        : Results.NotFound());

app.MapPost("/api/users", async (UserContext context, User user) =>
{
    context.Users.Add(user);
    await context.SaveChangesAsync();
    return Results.Created($"/api/users/{user.Id}", user);
});
...
```
