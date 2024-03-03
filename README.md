# Datasette Demonstrator

[Datasette](https://datasette.io/) Demonstrator im Rahmen des [Text+-Kooperationsprojekts DLA Data+](https://www.dla-marbach.de/bibliothek/projekte/text-kooperationsprojekt-dla-data/)

Die Entwicklung erfolgt exemplarisch am Corpus des Quellenrepertoriums der Exilbibliothek von [Alfred Döblin](https://www.dla-marbach.de/bibliothek/projekte/quellenrepertorium-der-exil-bibliotheken-im-deutschen-literaturarchiv-marbach-modul-1-alfred-doeblin/). Für die folgenden Beispiele werden die entsprechenden Collections vom Datendienst des DLA bezogen. Diese Ausgangsdaten liegen im Ordner [data](data).

## Datasette Lite mit JSON

Datasette Lite läuft lokal im Browser über die WebAssembly-Technologie. Es ermöglicht die Anzeige und Exploration der Daten mit SQL-Queries.

JSON-Daten können direkt angezeigt werden. Damit können beliebige Live-Daten aus dem Datendienst des DLA präsentiert werden. Beispiel:

https://dla-marbach.github.io/datasette/?json=https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019097#/data/records

Bei der Nutzung von Facetten, Filtern und weiteren Funktionen werden diese als Parameter in der URL vermerkt. Diese URLs können als Direktlinks für spezifische Sichten verwendet und geteilt werden. Beispiel mit drei ausgewählten Spalten und einer vorausgewählten Facette:

https://dla-marbach.github.io/datasette/?json=https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019097#/data/records?_col=id&_col=display&_col=personBy_display_mv&_facet=category

## Datasette Lite mit SQLite-Datenbank

Weitere Funktionen wie Volltextsuchen und Fremdschlüssel-Beziehungen sind verfügbar, wenn eine SQLite-Datenbank bereitgestellt wird. Dazu gibt es vom gleichen Entwickler (Simon Willison) das begleitende Tool [sqlite-utils](https://sqlite-utils.datasette.io). Das Script [build.sh](build.sh) enthält ein Beispiel für das Quellenrepertorium der Exilbibliothek von Alfred Döblin und generiert die SQLite-Datenbank `data.db`. Diese Datenbank kann dann direkt mit Datasette Lite aufgerufen werden:

https://dla-marbach.github.io/datasette/?url=https://github.com/dla-marbach/datasette/blob/main/data.db

Durch die Bereitstellung einer weiteren Datei [metadata.yaml](metadata.yaml) können Beschreibungstexte sowie Lizenz- und Quellenangaben für die Datenbank und die Tabellen ergänzt werden. Beispiel:

https://dla-marbach.github.io/datasette/?url=https://github.com/dla-marbach/datasette/blob/main/data.db&metadata=https://github.com/dla-marbach/datasette/blob/main/metadata.yaml

## Datasette Vollversion mit Installation

Noch mehr Funktionen als Datasette Lite bietet die Vollversion von Datasette. Diese erfordert jedoch eine Installation lokal oder auf einem Server. Damit können die vielen [Plugins](https://datasette.io/plugins) genutzt werden, beispielsweise datasette-vega zur Visualisierung von Geokoordinaten.

Zum Ausprobieren kann GitHub Codespaces verwendet werden. Dieses Repository ist so vorbereitet, dass beim Starten des Codespace eine Datasette-Instanz gestartet und die SQLite-Datenbank frisch generiert wird.

https://codespaces.new/dla-marbach/datasette
