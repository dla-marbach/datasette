#!/bin/bash
# Download vom DLA Datendienst
wget "https://dataservice.dla-marbach.de/v1/records?q=noteBibliography_mv:D%C3%B6blin-Bibliographie" -O data/doeblin-bibliographie.json # https://dataservice.dla-marbach.de/v1/collection/2.json
wget "https://dataservice.dla-marbach.de/v1/records?q=category:Werktitel%20AND%20personBy_id_mv:PE00006675" -O data/doeblin-werke.json # https://dataservice.dla-marbach.de/v1/collection/4.json
wget "https://dataservice.dla-marbach.de/v1/records?q=item_holding_id_mv:BF00019097" -O data/doeblin-bibliothek-titel.json # https://dataservice.dla-marbach.de/v1/collection/6.json
wget "https://dataservice.dla-marbach.de/v1/records?q=holding_id_mv:BF00019097" -O data/doeblin-bibliothek-exemplare.json # https://dataservice.dla-marbach.de/v1/collection/8.json
# Datenbank neu aufbauen
rm -f data.db
sqlite-utils insert data.db doeblin-werke data/doeblin-werke.json --alter --pk=id
sqlite-utils enable-fts data.db doeblin-werke display
sqlite-utils insert data.db doeblin-bibliothek-titel data/doeblin-bibliothek-titel.json --alter --pk=id
sqlite-utils enable-fts data.db doeblin-bibliothek-titel display
sqlite-utils insert data.db doeblin-bibliothek-exemplare data/doeblin-bibliothek-exemplare.json --alter --pk=id
sqlite-utils enable-fts data.db doeblin-bibliothek-exemplare display
sqlite-utils insert data.db doeblin-bibliographie data/doeblin-bibliographie.json --alter --pk=id
sqlite-utils enable-fts data.db doeblin-bibliographie display
sqlite-utils add-foreign-keys data.db \
    doeblin-bibliothek-exemplare manifestation_id doeblin-bibliothek-titel id
sqlite-utils index-foreign-keys data.db
sqlite-utils optimize data.db
