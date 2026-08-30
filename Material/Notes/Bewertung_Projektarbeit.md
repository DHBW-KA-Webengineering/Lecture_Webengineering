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

\pagebreak

# Abgabe

Die finale Abgabe erfolgt am Ende des zweiten Theoriesemesters (Juli/August). Ein genauer Termin wird noch bekanntgegeben (mindestens 3 Wochen im Voraus). Alle Termine (auch die für Zwischenabgaben) werden im Moodle als Ankündigung bekannt gegeben.

Das Projekt ist über beide Semester zu bearbeiten, nicht erst kurz vor der Abgabe. Daher gibt es folgende Zwischenabgaben, welche in die Bewertung mit einfließen. Die jeweiligen Termine werden ebenfalls rechtzeitig bekanntgegeben:

- 1.⁠ ⁠Zwischenabgabe (ca. 2 - 3 Wochen nach dem Start der Vorlesung)
  - Projektidee, GitHub Repository mit (leerem) Projekt, funktionierender GitHub Action für den Build und GitHub Pages (oder einem Äquivalent).
  - Kurz die Idee / das Konzept der Anwendung mit Mockups, Wireframes, Zeichnungen vorstellen
  - Präsentation ca. 5 - 10 Minuten pro Gruppe (zeigen dass alles geforderte da ist und funktioniert)

- 2.⁠ ⁠Zwischenabgabe am Ende des ersten Semesters
  - Inhalt ist je nach gewähltem Projekt vorgegeben (nur Frontend)
  - Präsentation ca. 10 Minuten pro Gruppe

- 3.⁠ ⁠Zwischenabgabe am Anfang des zweiten Semesters
  - Inhalt ist je nach gewähltem Projekt vorgegeben (nur Frontend)
  - Festlegen der Backend Technologien (Typescript ist Pflicht)
  - Präsentation ca. 10 Minuten pro Gruppe

- Finale Präsentation und Abgabe Quellcode + Dokumentation (15 Minuten pro Gruppe), genauer Termin folgt, Klausurwoche

Generell gilt für Zwischenabgaben und die Endabgabe:

- Es handelt sich um eine Prüfungssituation. Präsentationen sind entsprechend vorzubereiten
- Die gezeigten Folien müssen in Moodle abgegeben werden.
- Jede Präsentation ab der zweiten Zwischenabgabe entspricht grob der folgenden Struktur:
  - Allgemeiner Projektteil, sodass alle im Raum verstehen um was es geht.
  - Dann gibt es die personenspezifischen Teile. Hier wird **von jedem Gruppenmitglied** nacheinander gezeigt und erklärt, was und warum die Person etwas gemacht hat.
  - Abschließend gibt es wieder einen allgemeinen Teil mit einem Fazit und den nächsten Schritten
  - nach der Präsentation werden Fragen gestellt und es wird Feedback gegeben.

## Abzugebende Artefakte

Die Abgabe erfolgt in Moodle.

### Code

Die Bewertung im Fach Webengineering bezieht sich nur auf die technischen Aspekte der Umsetzung.
Dazu ist das **vollständige Git-Repository** abzugeben.
Die Abgabe erfolgt entweder als Zip/Tar im Moodle oder per Freischaltung der Accounts `lukaspanni` und `pa-ssch` für das Repository auf GitHub (Leserechte reichen aus).
Bei Abgabe per GitHub muss trotzdem die Abgabe im Moodle gemacht werden.
Für die Bewertung brauchen wir nur eure Matrikelnummern - keine Namen.
Klarnamen werden nicht benötigt und müssen daher nicht über Usernamen auf GitHub oder Namen + E-Mail Adressen der Committer in der Git-History preisgegeben werden. Solange wir nachvollziehen können, welche Matrikelnummer zu welchem Commit und welchem Code gehört reicht das.

Hinweis: Man kann bei Commits auch gerne mehrere Autoren angeben (siehe [Doku](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)).

Das Repository muss den vollständigen Quellcode, inkl. Frontend, Backend, Konfiguration und benötigter Skripte enthalten.

### Dokumentation

Die Dokumentation muss einige Punkte zwingend enthalten, da sie zentraler Bestandteil der Bewertung ist. Grundsätzlich bewerten wir zuerst die Dokmumentation und prüfen dann abhängig davon, ob das Projekt wirklich so wie beschrieben funktioniert. Das heißt: **Nur was in der Dokumentation beschrieben ist wird bewertet**. Wenn eine Anforderung im Projekt erfüllt, jedoch nicht in der Dokumentation beschrieben wurde, kann dieser Aspekt leider nicht mit in die Bewertung einfliesen.

- Es muss pro Gruppe ein PDF-Dokument abgegeben werden.
- Auf dem Deckblatt müssen mindestens folgende Informationen sein: Gruppenname, Projekt-Thema, Matrikelnummern und zugehörige Git Usernames, Ggf. link zum Repo und Link zur Anwendung
- Die Dokumentation **muss** dabei der folgenden Gliderung entsprechen. Es ist erlaubt weitere Unterkapitel hinzuzufügen, wenn dies der Strukturierung hilft.

- **1. Anwendung**
  - Inhalte des Kapitels: Kurze Dokumentation, was die Anwendung kann und wie sie zu verwenden / bedienen ist (mit Screenshots und Beschreibungen dazu)
- **2. Entwicklungsumgebung**
  - Inhalte des Kapitels:
    - Anweisungen zur Vorbereitung der Entwicklungsumgebung: Alles was installiert / gestartet werden mus, damit das Projekt lokal ausführbar ist.
    - welche Tools benötigt werden und wie diese installiert werden können (am besten Setup-Skript bereitstellen)
    - Folgende Tools können vorausgesetzt werden und dürfen in einem Setup-Skript genutzt werden: `docker, node, npm, bash/Powershell-Core`
    - Anweisungen zum Starten der Anwendung: der Build des _kompletten_ Projekts muss **mit einem einzelnen Befehl** möglich sein (nach Installation der benötigten Tools)
    - Die Anwendung darf nicht von einem konkreten Betriebssystem abhängen

- **3. Allgemeine technische Dokumentation**
  - Inhalte des Kapitels: Erläuterung der grundsätzlichen Struktur: z.B. wo befindet sich der Frontend/Backend-Code, welche externen Bibliotheken/Frameworks werden genutzt, ...

- **4. Eigenleistung von MatrNr / git username**
  - Jede Person muss eine Funktion Ende-zu-Ende, Frontend + Backend, umsetzen und entsprechend dokumentieren.
  - **4.1. Erklärung zur Eigenleistung**
    - mit folgendem Inhalt: _Hiermit versichere ich (Matrikelnummer: [Nummer]), dass ich das vorliegende Projekt sowie die dazugehörige Dokumentation selbstständig und ohne unzulässige Hilfe Dritter verfasst bzw. implementiert habe. Sämtliche Textpassagen, Programmcode-Abschnitte, Konzepte oder Abbildungen, die im Wortlaut oder Sinn aus externen Quellen übernommen wurden (z. B. aus Fachliteratur, Online-Plattformen wie GitHub oder Stack Overflow), sind unter Angabe der Quelle eindeutig als Zitat bzw. Fremdleistung gekennzeichnet. Der Einsatz von generativer Künstlicher Intelligenz (z. B. Chat GPT, Claude, ...) erfolgte ausschließlich im Rahmen der zulässigen Hilfsmittel (z. B. zur Recherche, Ideenfindung, Rechtschreib- und Grammatikprüfung oder Fehlersuche). Jeglicher durch KI-Systeme generierte Programmcode oder Textabschnitt, der in das Projekt eingeflossen ist, wurde als solcher explizit kenntlich gemacht. Mir ist bewusst, dass die Bewertung ausschließlich auf meiner eigenen, originären Leistung beruht. Fremde oder generierte Inhalte stellen keine Eigenleistung dar. Ich nehme zur Kenntnis, dass jede nicht deklarierte Übernahme fremder oder generierter Leistungen als Täuschungsversuch (Plagiat) gewertet wird und entsprechende prüfungsrechtliche Konsequenzen nach sich zieht._
  - **4.2. Fachliche Beschreibung der Funktion**
    - Wann kommt die Funktion wie zum Einsatz, wie ist die Anwendung an der entsprechende Stelle zu bedienen. Beschreibung mithilfe von Screenshots
  - **4.3. Einbindung in das Gesamtprojekt**
  - **4.4. Webdesign**
    - Hier soll auf die grundsätzlichen Ideen und Ziele des UI-Designs eingegangen werden. Anhand der entwickelten Funktion sollen in der Vorlesung behandelte Grundprinzipien analysiert werden
  - **4.5. Zugrundeliegende Ideen und Entscheidungen**
    - Welche Ideen und Entsheidungen haben dafür gesorgt, dass die Funktion so umgesetzt wurde wie sie vorliegt?
  - **4.6. Entwickelter Frontend Code**
    - Erklärung relevanter Teile des Frontend Codes. Der Code muss entweder durch Screenshots in der Dokumentation sein, oder ein klickbarer Link zur entsprechenden Code-Datei
  - **4.7. Schnittstelle zwischen backend und Frontend**
    - Darstellung der REST-API als Tabelle wie in den Folien / Übungsaufgaben mit Erklärungen zur Funktionsweise
  - **4.8. Entwickelter Backend Code**
    - Erklärung relevanter Teile des Backend Codes. Der Code muss entweder durch Screenshots in der Dokumentation sein, oder ein klickbarer Link zur entsprechenden Code-Datei
  - **4.9. Reflexion**
    - Was sind die größten learnings aus dem Projekt, welche für das weitere Studium und weitere Projekte hilfreich sind

- **5. Eigenleistung von...** Für jedes Gruppenmitglied ein Kapitel wie bei 4...

\pagebreak

# Technologische Vorgaben

- Frontend: TypeScript und React/Next.js
- Backend: TypeScript
- Weitere Technologien und Bibliotheken immer nur nach Absprache im Moodleforum "Fragen zum Projekt".

# Bewertungskriterien

Bewertet wird alles was im abgegebenen Repository enthalten ist. Die Zwischenstände fließen auch in die Bewertung ein, man kann jedoch trotzdem eine 1,0 bekommen, wenn die Zwischenstände Fehler aufgewiesen haben, wenn das Endergebnis entsprechend gut ist. Ein fehlender Zwischenstand kann nicht nachgeholt oder ausgebessert werden.

Die oben beschriebenen Anforderungen zur Dokumentation müssen zwingend eingehalten werden.
Insbesondere muss das Projekt der Dokumentation entsprechend lauffähig sein - wir können keine gute Note vergeben, wenn das Projekt nicht wie beschrieben gestartet werden kann.

Die Anwendung wird nicht nach Originalität, Ästhetik oder ähnlichem bewertet.
Entscheidend ist die **Qualität** der abgegebenen Dokumentation und des abgegebenen Projekts.
Dies schließt beispielsweise die syntaktische Korrektheit des Codes und die korrekte Nutzung von gelerntem Fachwissen mit ein.

Neben den Zwischenabgaben gibt es ebenfalls regelmäßig die Möglichkeit einen Zwischenstand zu zeigen und dazu ein kurzes Feedbackgespräch zu führen.
Diese Möglichkeit besteht bis 2 Wochen vor der jeweiligen Abgabe, der letzte mögliche Termin wird noch bekannt gegeben.

# Verwendung von KI und anderen Hilfsmitteln

Das Projekt und die dazugehörige Ausarbeitung sind von euch selbst zu erstellen. LLMs sind ein Werkzeug, welches man in der Softwareentwicklung einsetzt und ihr daher auch in euren Projekten einsetzen könnt. Dabei müsst ihr jedoch akribisch auf folgendes achten:

Code, der nicht von euch stammt (egal ob KI-generiert oder kopiert von Stack Overflow, GitHub etc.), muss explizit als solcher gekennzeichnet werden (z. B. durch Kommentare direkt am Codeblock; inkl. Quelle).

Grundlage der Benotung ist eure eigene Leistung. Fremder Code wird nicht als eure Leistung gewertet, ist jedoch nicht verboten.

Nicht gekennzeichnete Fremdleistung wird als Plagiat gewertet. Egal ob der Code generiert, kopiert oder von einem anderen Teammitglied als angegeben geschrieben wurde.
Wenn ihr euch unsicher seid, ob die Nutzung von KI in einer spezifischen Situation zulässig ist, fragt bitte rechtzeitig bei uns nach, bevor ihr den Code einreicht. Grundsätzlich gilt das gleiche wie für Wissenschaftliche Arbeiten. Daher ist zum Beispiel ein Ghostwriter verboten, eine Rechtschreib- und Grammatikprüfung wäre jedoch erlaubt. Genau so wie es erlaubt ist KI zum recherchieren zu verwenden, jedoch nicht um die eigentliche Leistung zu erbringen. Ihr müsst das entsprechend nur auf die Softwareentwicklung übertragen.
