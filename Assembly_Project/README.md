## Număr de vocale și de consoane - Assembly x86

Acest proiect este un program scris in limbaj de asamblare (Assembly x86, arhitectura 16-bit) conceput pentru a rula in medii DOS (precum DOSBox). Aplicatia analizeaza un sir de caractere introdus de utilizator si calculeaza numarul de vocale si consoane prezente.

## Descriere

Programul solicita utilizatorului introducerea unui sir de text (maxim 100 de caractere). Acesta proceseaza fiecare caracter in parte, verifica daca acesta face parte din alfabet (A-Z sau a-z) si il clasifica drept vocala sau consoana. La final, rezultatele sunt afisate pe ecran, fiind capabil sa randeze numere formate din una sau doua cifre prin conversia valorilor din registri in caractere ASCII.

## Functionalitati

* Citirea dinamica a input-ului de la tastatura pana la apasarea tastei Enter.
* Ignorarea automata a numerelor, spatiilor si a caracterelor speciale.
* Logica de comparare pentru ambele registre (litere mici si litere mari).
* Conversie matematica pentru afisarea corecta a numerelor (zeci si unitati).
* Utilizarea intreruperilor standard DOS (INT 21h).

## Detalii Tehnice

Proiectul foloseste modelul de memorie SMALL si este structurat in segmente de date (.DATA) si cod (.CODE).

* Registrul SI: Utilizat ca index pentru parcurgerea buffer-ului de memorie.
* Registrul AL/AH: Utilizat pentru operatii de intrare/iesire si calcule aritmetice (DIV).
* Buffer: Alocare de 100 de bytes pentru stocarea sirului.
* Set de comparatie: Definirea explicita a vocalelor (aeiouAEIOU) in segmentul de date.

## Instructiuni de Compilare si Rulare

Pentru a rula acest program, aveti nevoie de un asamblor (TASM sau MASM) si un emulator DOSBox.

1. Asamblarea fisierului sursa:
   tasm nume_fisier.asm

2. Crearea fisierului executabil:
   tlink nume_fisier.obj

3. Rularea aplicatiei:
   nume_fisier.exe

## Exemplu de Utilizare

Dupa rulare, interactiunea cu programul arata astfel:

Input:
Introduceti un sir de caractere: Test de verificare 2026

Output:
Numarul de vocale este: 7
Numarul de consoane este: 9
