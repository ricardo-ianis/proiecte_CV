## Sistem de Gestiune a unui Magazin Online - Proiect SQL

Acest proiect reprezinta proiectarea si implementarea unei baze de date relationale destinate gestionarii fluxurilor operationale dintr-un magazin online. Aplicatia acopera toate etapele, de la definirea structurii tabelelor pana la interogari complexe si obiecte avansate de baze de date.

## Functionalitati principale

* Design Relational: Structura ierarhica si optimizata pentru entitati precum Clienti, Produse, Comenzi si Livrari.
* Integritatea Datelor: Implementarea constrangerilor de tip cheie primara (PRIMARY KEY), cheie straina (FOREIGN KEY) si reguli de validare (CHECK).
* Operatii DML Complete: Scripturi pentru inserarea, actualizarea si stergerea datelor (INSERT, UPDATE, DELETE).
* Analiza si Raportare: Interogari complexe care utilizeaza JOIN-uri, functii de grup (SUM, AVG, COUNT) si subcereri imbricate.
* Logica Avansata: Utilizarea functiilor conditionale (CASE, DECODE) si a operatorilor de set (UNION, MINUS, INTERSECT).

## Structura proiectului

* Proiect Baze de Date.docx: Documentatie detaliata care include schema conceptuala, dictionarul de date si explicarea fiecarei instructiuni SQL utilizate.
* Schema proiectata: Organizarea logica a tabelelor pentru a asigura normalizarea si eliminarea redundantei.

## Obiecte de Baza de Date Implementate

* Tabele (TABLE): Definirea structurilor pentru stocarea informatiilor despre angajati, produse si facturi.
* Indici (INDEX): Optimizarea performantei cautarilor (ex: cautarea rapida dupa email-ul clientului).
* Secvente (SEQUENCE): Generarea automata si unica a identificatorilor pentru livrari si comenzi.
* Sinonime (SYNONYM): Simplificarea accesului la tabelele frecvent utilizate (ex: STOC pentru PRODUSE).
* Partitii: Organizarea eficienta a datelor voluminoase (ex: arhivarea platilor pe ani).

## Tehnologii Utilizate

* Limbaj: SQL (Structured Query Language).
* Concepte: Gestiunea tranzactiilor, Normalizare (1NF, 2NF, 3NF), Structuri ierarhice.

## Instructiuni de Rulare

1. Importati scripturile SQL intr-un mediu de gestiune a bazelor de date (ex: Oracle SQL Developer, MySQL Workbench).
2. Executati instructiunile de tip CREATE pentru a genera structura.
3. Populati tabelele folosind comenzile INSERT furnizate in documentatie.
4. Rulati interogarile de tip SELECT pentru a genera rapoartele de activitate.
