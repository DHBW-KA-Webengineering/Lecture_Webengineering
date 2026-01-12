---
title: Bewertung Projektarbeit
date: 2026-01-12
lang: de-DE
author: "Lukas Panni & Silas Schnurr"
...

\clearpage

# Grundsätzliches

Lest dieses Dokument sehr gründlich durch! Es ist sowohl für euch, als auch für uns schade, wenn eine gute Leistung schlechter benotet werden muss, wenn die Rahmenbedingungen nicht stimmen.

Es gibt Einschränkungen bezüglich der zu verwendenden Technologien, mehr dazu siehe unten.
Es geht nicht darum ein besonders innovatives Projekt umzusetzen oder eine produktionsreife Anwendung zu entwickeln.
Ziel ist es zu zeigen, dass die Grundlagen der Webentwicklung beherrscht werden und in der Praxis genutzt werden können.

Das Projekt wird in Gruppen von 4 bis 7 Personen bearbeitet, jeder muss dabei in etwa gleich viel beitragen.
Es ist klar, dass der Umfang eines Beitrags nicht immer einfach gemessen werden kann, Code-Zeilen werden z.B. nicht zur Überprüfung herangezogen.
Genauso entscheidet auch bei mehreren Projekten nicht der jeweilige Umfang über die endgültige Note.
Eigenleistungen müssen klar ersichtlich sein, dazu nutzen wir vor allem die Git-History, die anzufertigende Dokumentation und die Präsentationen (siehe unten).

Für die Bewertung sind die folgenden Punkte relevant (Details siehe unten):

- Dokumentation
- Konzept & Umsetzung der Webanwendung
- Einhaltung vorgestellter Best-Practices
- Regelmäßige Vorstellung aktueller Zwischenstände

# Abgabe

Die finale Abgabe erfolgt am Ende des zweiten Theoriesemesters (Juli/August). Ein genauer Termin wird noch bekanntgegeben (mindestens 3 Wochen im Voraus). Alle Termine (auch die für Zwischenabgaben) werden im Moodle als Ankündigung bekannt gegeben.

Das Projekt ist über beide Semester zu bearbeiten, nicht erst kurz vor der Abgabe. Daher gibt es folgende Zwischenabgaben, welche in die Bewertung mit einfließen. Die jeweiligen Termine werden ebenfalls rechtzeitig bekanntgegeben:

1.⁠ ⁠Zwischenabgabe (ca. 2 - 3 Wochen nach dem Start der Vorlesung)
1.1 Projektidee, GitHub Repository mit (leerem) Projekt, funktionierender GitHub Action für den Build und GitHub Pages (oder einem Äquivalent).
1.2 Kurz die Idee / das Konzept der Anwendung mit Mockups, Wireframes, Zeichnungen vorstellen
1.3 Präsentation ca. 5 - 10 Minuten pro Gruppe (zeigen dass alles geforderte da ist und funktioniert)

2.⁠ ⁠Zwischenabgabe am Ende des ersten Semesters
2.1 Inhalt ist je nach gewähltem Projekt vorgegeben (nur Frontend)
2.2 Präsentation ca. 10 Minuten pro Gruppe

3.⁠ ⁠Zwischenabgabe am Anfang des zweiten Semesters
3.1 Inhalt ist je nach gewähltem Projekt vorgegeben (nur Frontend)
3.2 Festlegen der Backend Technologien (Typescript ist Pflicht)
3.3 Präsentation ca. 10 Minuten pro Gruppe

4.⁠ Finale Präsentation und Abgabe Quellcode + Dokumentation (15 Minuten pro Gruppe), genauer Termin folgt, Klausurwoche

## Abzugebende Artefakte

Die Bewertung im Fach Webengineering bezieht sich nur auf die technischen Aspekte der Umsetzung.
Dazu ist das **vollständige Git-Repository** abzugeben.
Die Abgabe erfolgt entweder als Zip/Tar per Mail oder per Freischaltung der Accounts `lukaspanni` und `pa-ssch` für das Repository auf GitHub (Leserechte reichen aus).
Bei Abgabe per GitHub bitte trotzdem eine kurze Mail zur Erinnerung.
Für die Bewertung brauchen wir nur eure Matrikelnummern - keine Namen.
Ihr müsst eure Klarnamen nicht über Usernamen auf GitHub oder Namen + E-Mail Adressen der Committer in der Git-History preisgeben.
Solange wir nachvollziehen können, welche Matrikelnummer zu welchem Commit und welchem Code gehört reicht das.

Hinweis: ihr könnt bei Commits gerne mehrere Autoren angeben (siehe [Doku](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)), solange noch genügend Code/Commits einer einzigen Person zugeordnet werden kann.

Das Repository muss enthalten:

- vollständigen Quellcode (Frontend + Backend + Konfiguration + Skripte)
- begleitende Dokumentation

Die Dokumentation muss einige Punkte zwingend enthalten, da sie zentraler Bestandteil der Bewertung ist. Grundsätzlich bewerten wir zuerst die Dokmumentation und prüfen dann, abhängig davon, ob das Projekt wirklich so wie beschrieben funktioniert. Das heißt: **Nur was in der Dokumentation beschrieben ist wird bewertet**. Wenn eine Anforderung im Projekt erfüllt, jedoch nicht in der Dokumentation beschrieben wurde, kann dieser Aspekt leider nicht mit in die Bewertung einfliesen.

- Kurze Dokumentation, was die Anwendung kann und wie sie zu verwenden / bedienen ist (z. B. mit Screenshots und kurzen Beschreibungen dazu)
- Anweisungen zur Vorbereitung der Entwicklungsumgebung: ihr könnt nicht davon ausgehen, dass wir alle Tools bereits installiert haben.
  - Daher ist zunächst zu dokumentieren welche Tools benötigt werden und wie diese installiert werden können (am besten Setup-Skript bereitstellen)
  - Folgende Tools können vorausgesetzt werden und dürfen in einem Setup-Skript genutzt werden: `docker, node, npm, bash/Powershell-Core`
  - Die Anwendung darf nicht von einem konkreten Betriebssystem abhängen
- Anweisungen zum Starten der Anwendung: der Build des _kompletten_ Projekts muss mit einem einzelnen Befehl möglich sein (nach Installation der benötigten Tools)
- Erläuterung der grundsätzlichen Struktur: z.B. wo befindet sich der Frontend/Backend-Code, welche externen Bibliotheken/Frameworks werden genutzt, ...
- Dokumentation des Webdesigns als separates Kapitel: hier soll kurz auf die grundsätzlichen Ideen und Ziele eures Designs eingegangen werden. An **zwei** Beispielseiten sollen in der Vorlesung behandelte Grundprinzipien analysiert werden
- Dokumentation der Eigenleistung: Jede Person muss eine Funktion Ende-zu-Ende (gesmater Frontend + Backend-Code) umsetzen und entsprechend dokumentieren.
  - Der Umfang einer "Funktion" ist abhängig vom konkreten Projekt, z.B. für ToDo-Anwendung: Login/Logout, Erstellen von ToDo's, Anzeige von ToDo's (z.B. auch verschiedene Oberflächen), ...
  - Die Dokumentation umfasst die Beschreibung der Funktion, die Einbindung in das Gesamtprojekt, die Angabe des entwickelten Codes, die zugrundeliegenden Ideen und die Funktionsweise, Entscheidungen, die bei der Entwicklung getroffen wurden, ...

# Technologische Vorgaben

- Frontend: TypeScript und React/Next.js
- Backend: TypeScript
- Weitere Technologien und Bibliotheken immer nur nach Absprache

# Bewertungskriterien

Bewertet wird alles was im abgegebenen Repository enthalten ist. Die Zwischenstände fließen auch in die Bewertung ein, man kann jedoch trotzdem eine 1,0 bekommen, wenn die Zwischenstände Fehler aufgewiesen haben, wenn das Endergebnis entsprechend gut ist. Ein fehlender Zwischenstand kann nicht nachgeholt oder ausgebessert werden.

Die oben beschriebenen Anforderungen zur Dokumentation müssen zwingend eingehalten werden.
Insbesondere muss das Projekt der Dokumentation entsprechend lauffähig sein - wir können keine gute Note vergeben, wenn das Projekt nicht wie beschrieben gestartet werden kann.

Die Anwendung wird nicht nach Originalität, Ästhetik oder ähnlichem bewertet.
Entscheidend ist die **Qualität** der abgegebenen Dokumentation und des abgegebenen Projekts.
Dies schließt beispielsweise die syntaktische Korrektheit des Codes und die korrekte Nutzung von gelerntem Fachwissen mit ein.

Neben den Zwischenabgaben gibt es ebenfalls regelmäßig die Möglichkeit einen Zwischenstand zu zeigen und dazu ein kurzes Feedbackgespräch zu führen.
Diese Möglichkeit besteht bis 2 Wochen vor der jeweiligen Abgabe, der letzte mögliche Termin wird noch bekannt gegeben.
