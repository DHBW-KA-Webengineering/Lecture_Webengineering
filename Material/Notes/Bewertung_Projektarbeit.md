---
title: Bewertung Projektarbeit
date: 2024-01-08
lang: de-DE
author: "Lukas Panni"
...

\clearpage

# Grundsätzliches

Es gibt Einschränkungen bezüglich der zu verwendenden Technologien, mehr dazu siehe unten.
Es geht nicht darum ein besonders innovatives Projekt umzusetzen oder eine produktionsreife Anwendung zu entwickeln.
Ziel ist es zu zeigen, dass die Grundlagen der Webentwicklung beherrscht werden und in der Praxis genutzt werden können.

Das Projekt wird in Gruppen von 3 bis 5 Personen bearbeitet, jeder muss dabei in etwa gleich viel beitragen.
Es ist klar, dass der Umfang eines Beitrags nicht immer einfach gemessen werden kann, Code-Zeilen werden z.B. nicht zur Überprüfung herangezogen.
Genauso entscheidet auch bei mehreren Projekten nicht der jeweilige Umfang über die endgültige Note.
Eigenleistungen müssen klar ersichtlich sein, dazu nutzen wir vor allem die Git-History, die anzufertigende Dokumentation und die Präsentationen (siehe unten).

Für die Bewertung sind die folgenden Punkte relevant (Details siehe unten): - Konzept & Umsetzung der Webanwendung - Einhaltung vorgestellter Best-Practices - Regelmäßige Vorstellung aktueller Zwischenstände

# Abgabe

Die finale Abgabe erfolgt am Ende des zweiten Theoriesemesters (Juli/August).
Ein genauer Termin wird noch bekanntgegeben (mindestens 3 Wochen im Voraus).

Das Projekt ist jedoch über beide Semester zu bearbeiten, nicht erst kurz vor der Abgabe. Daher gibt es folgende Zwischenabgaben, welche in die Bewertung mit einfließen. Die jeweiligen Termine werden ebenfalls rechtzeitig bekanntgegeben:

1.⁠ ⁠Zwischenabgabe am 30.01.2025: GitHub Repository mit (leerem) Projekt, funktionierender GitHub Action für den Build und GitHub Pages (oder einem Äquivalent).

- Präsentation ca. 5 Minuten pro Gruppe (zeigen dass alles geforderte da ist und funktioniert)

  2.⁠ ⁠Zwischenabgabe: Zwischenstand (vorgegeben je nach gewähltem Projekt, nur Frontend). Ende erstes Semester (Termin ca. 2 - 3 Wochen vor den Klausuren).

- Präsentation ca. 10 Minuten pro Gruppe

  3.⁠ ⁠Zwischenabgabe: Zwischenstand (vorgegeben je nach gewähltem Projekt). Anfang des zweiten Semesters (Termin folgt).

- Präsentation ca. 10 Minuten pro Gruppe
- Festlegen der Backend Technologien

  4.⁠ Finale Präsentation und Abgabe Quellcode + Dokumentation (15 Minuten pro Gruppe)

## Abzugebende Artefakte

Die Bewertung im Fach Webengineering bezieht sich nur auf die technischen Aspekte der Umsetzung.
Dazu ist das **vollständige Git-Repository** abzugeben.
Die Abgabe erfolgt entweder als Zip/Tar per Mail oder per Freischaltung der Accounts `lukaspanni` und `pa-ssch` für das Repository auf GitHub (Leserechte reichen aus).
Bei Abgabe per GitHub bitte trotzdem eine kurze Mail zur Erinnerung.
Für die Bewertung brauchen wir nur eure Matrikelnummern.
Ihr müsst eure Klarnamen nicht über Usernamen auf GitHub oder Namen + E-Mail Adressen der Committer in der Git-History preisgeben.
Solange wir nachvollziehen können, welche Matrikelnummer zu welchem Commit und welchem Code gehört reicht das.

Hinweis: ihr könnt bei Commits gerne mehrere Autoren angeben (siehe [Doku](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)), solange noch genügend Code/Commits einer einzigen Person zugeordnet werden kann.

Das Repository muss enthalten:

- vollständigen Quellcode (Frontend + Backend + Konfiguration + Skripte)
- begleitende Dokumentation

Die Dokumentation muss einige Punkte zwingend enthalten, da sie einen wichtigen Teil der Bewertungsgrundlage darstellen wird:

- Anweisungen zur Vorbereitung der Entwicklungsumgebung: ihr könnt nicht davon ausgehen, dass ich alle Tools bereits installiert habe.
  - Daher ist zunächst zu dokumentieren welche Tools benötigt werden und wie diese installiert werden können (am besten Setup-Skript bereitstellen)
  - Folgende Tools können vorausgesetzt werden und dürfen in einem Setup-Skript genutzt werden: `docker, node, npm, bash/Powershell-Core`
  - Die Anwendung darf nicht von einem konkreten Betriebssystem abhängen
- Anweisungen zum Starten der Anwendung: der Build des _kompletten_ Projekts muss mit einem einzelnen Befehl möglich sein (nach Installation der benötigten Tools)
- Erläuterung der grundsätzlichen Struktur: z.B. wo befindet sich der Frontend/Backend-Code, welche externen Bibliotheken/Frameworks werden genutzt, ...
- Dokumentation des Webdesigns (am besten als separates Dokument): hier soll kurz auf die grundsätzlichen Ideen und Ziele eures Designs eingegangen werden. An **zwei** Beispielseiten sollen in der Vorlesung behandelte Grundprinzipien analysiert werden
- Dokumentation der Eigenleistung: Jede Person muss eine Funktion Ende-zu-Ende (gesmater Frontend + Backend-Code) umsetzen und entsprechend dokumentieren.
  - Der Umfang einer "Funktion" ist abhängig vom konkreten Projekt, z.B. für ToDo-Anwendung: Login/Logout, Erstellen von ToDo's, Anzeige von ToDo's (z.B. auch verschiedene Oberflächen), ...
  - Die Dokumentation umfasst die Beschreibung der Funktion, die Einbindung in das Gesamtprojekt, die Angabe des entwickelten Codes, die zugrundeliegenden Ideen und die Funktionsweise, Entscheidungen, die bei der Entwicklung getroffen wurden, ...

# Technologien

- Frontend:
  - TypeScript verpflichtend
  - Framwork wählen aus: Angular, React, Vue, Svelte
- Backend:
  - Java, Node, C#,

# Bewertungskriterien

Bewertet wird alles was im abgegebenen Repository enthalten ist. Die Zwischenstände fließen auch in die Bewertung ein, man kann jedoch trotzdem eine 1,0 bekommen, wenn die Zwischenstände Fehler aufgewiesen haben, wenn das Endergebnis entsprechend gut ist. Ein fehlender Zwischenstand kann nicht nachgeholt oder ausgebessert werden.

Die oben beschriebenen Anforderungen zur Dokumentation müssen zwingend eingehalten werden.
Insbesondere muss das Projekt der Dokumentation entsprechend lauffähig sein - ich kann keine gute Note vergeben, wenn das Projekt nicht wie beschrieben gestartet werden kann.

Die Anwendung wird nicht nach Originalität, Ästhetik oder ähnlichem bewertet.
Entscheidend ist die **Qualität** des abgegebenen Projekts.
Dies schließt beispielsweise die syntaktische Korrektheit des Codes und die korrekte Nutzung von gelerntem Fachwissen mit ein.

Neben den Zwischenabgaben gibt es ebenfalls regelmäßig die Möglichkeit einen Zwischenstand zu zeigen und dazu ein kurzes Feedbackgespräch zu führen.
Diese Möglichkeit besteht bis 2 Wochen vor Abgabe, der letzte mögliche Termin wird noch bekannt gegeben.
