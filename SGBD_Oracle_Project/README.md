## Sistem de Gestiune a unui Magazin Online - Proiect SGBD Oracle

Acest proiect reprezinta proiectarea si implementarea unei baze de date relationale pentru gestionarea unui magazin online, utilizand Oracle Database si limbajul PL/SQL. Aplicatia acopera principalele functionalitati ale unui magazin: gestiunea produselor si a stocurilor, plasarea si urmarirea comenzilor, administrarea clientilor, procesarea platilor si monitorizarea livrarilor.

## Functionalitati principale

* Design Relational: 8 tabele interconectate prin chei primare si chei externe (Categorii, Furnizori, Produse, Clienti, Comenzi, Detalii_Comanda, Plati, Livrari).
* Integritatea Datelor: Constrangeri de tip PRIMARY KEY, FOREIGN KEY si reguli de validare CHECK pentru consistenta datelor.
* Cursori: Utilizarea cursorilor impliciți (SQL%) si expliciți (cu si fara parametri), inclusiv cursori imbricati pentru parcurgerea comenzilor si a produselor asociate.
* Subprograme PL/SQL: Minim 3 functii si 2 proceduri stocate grupate intr-un pachet unitar (pkg_magazin_online), accesibil printr-o interfata publica.
* Gestionarea Exceptiilor: Tratarea erorilor predefinite si a exceptiilor utilizator definite pentru robustetea aplicatiei.
* Triggere: Automatizarea actiunilor la nivel de baza de date pentru mentinerea integritatii si consistentei datelor.

## Structura proiectului

* Proiect SGBD Oracle.docx: Documentatie completa care include schema bazei de date, dictionarul de date, codul PL/SQL comentat si rezultatele executiei.
* Schema proiectata: Organizarea logica a tabelelor pentru a asigura normalizarea si eliminarea redundantei.

## Obiecte de Baza de Date Implementate

* Tabele (TABLE): Definirea structurilor pentru stocarea informatiilor despre produse, clienti, comenzi, plati si livrari.
* Cursori Expliciti: Parcurgerea rezultatelor cu si fara parametri, inclusiv cursori imbricati.
* Functii (FUNCTION): Calcul total comenzi per client, verificare stoc disponibil, calcul valoare comanda.
* Proceduri (PROCEDURE): Actualizare stocuri, generare rapoarte de activitate.
* Pachete (PACKAGE): Gruparea functiilor si procedurilor in pachetul pkg_magazin_online.
* Triggere (TRIGGER): Automatizarea operatiunilor la modificarea datelor.

## Tehnologii Utilizate

* Limbaj: PL/SQL (Procedural Language / Structured Query Language).
* Baza de date: Oracle Database.
* Concepte: Gestiunea tranzactiilor, Normalizare (3NF), Programare procedurala in baze de date.

## Instructiuni de Rulare

1. Importati scripturile SQL/PLSQL intr-un mediu Oracle (ex: Oracle SQL Developer, Oracle Live SQL).
2. Executati instructiunile de tip CREATE TABLE pentru a genera structura bazei de date.
3. Populati tabelele folosind comenzile INSERT furnizate in documentatie.
4. Compilati si executati subprogramele PL/SQL (functii, proceduri, pachete, triggere).
5. Rulati blocurile anonime de test pentru a verifica functionarea corecta a fiecarui obiect.
