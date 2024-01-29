#!/bin/bash
rm -f data.db
sqlite-utils insert data.db doeblin-werke data/doeblin-werke.json --alter --pk=id
sqlite-utils enable-fts data.db doeblin-werke display
sqlite-utils insert data.db doeblin-bibliothek-titel data/doeblin-bibliothek-titel.json --alter --pk=id
sqlite-utils enable-fts data.db doeblin-bibliothek-titel display
sqlite-utils insert data.db doeblin-bibliothek-exemplare data/doeblin-bibliothek-exemplare.json --alter --pk=id
sqlite-utils enable-fts data.db doeblin-bibliothek-exemplare display
sqlite-utils insert data.db doeblin-bibliographie data/doeblin-bibliographie.json --alter --pk=id
sqlite-utils enable-fts data.db doeblin-bibliographie display
sqlite-utils optimize data.db
