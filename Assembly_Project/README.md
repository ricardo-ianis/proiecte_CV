## Sistem de Monitorizare si Alerta Senzori - Assembly x86

Acest proiect reprezinta o aplicatie realizata in limbaj de asamblare (Assembly x86) destinata monitorizarii si gestionarii datelor provenite de la senzori de temperatura, umiditate si presiune. Sistemul este conceput sa detecteze depasirea pragurilor critice si sa emita alerte vizuale pentru utilizator.

## Functionalitati principale

* Monitorizare senzori: Prelucrarea valorilor citite de la senzorii de temperatura, umiditate si presiune.
* Validare praguri: Compararea automata a datelor de intrare cu limitele de siguranta predefinite in segmentul de date.
* Sistem de alerta: Generarea de mesaje de avertizare specifice in consola atunci cand se detecteaza anomalii.
* Gestionare stari: Afisarea statusului "Sistem OK" sau a detaliilor despre tipul de alerta declansata.
* Optimizare hardware: Utilizarea eficienta a registrilor procesorului pentru viteza maxima de executie si consum minim de memorie.

## Structura proiectului

* proiect_assembly.asm: Fisierul sursa principal care contine segmentele de date, stiva si logica de control a programului.
* Explicații proiect Assembly-BTI.docx: Documentatia tehnica ce descrie arhitectura sistemului, functionarea algoritmilor si utilizarea registrilor.

## Detalii tehnice

* Arhitectura: Intel x86 (8086).
* Registri utilizati: AX, BX, CX, DX pentru operatii aritmetice si logice; DS, SS, CS pentru gestionarea segmentelor de memorie.
* Control flux: Implementarea deciziilor prin instructiuni de comparare (CMP) si salturi conditionale (JE, JNE, JG, JL).
* Structura memoriei: Organizare riguroasa pe segmente de date (data segment), stiva (stack segment) si cod (code segment).

## Instalare si Rulare

1. Utilizati un emulator precum DOSBox impreuna cu utilitarele TASM (Turbo Assembler) sau NASM.
2. Asamblati fisierul sursa:
   tasm proiect_assembly.asm
3. Realizati link-ul fisierului obiect:
   tlink proiect_assembly.obj
4. Rulati programul executabil:
   proiect_assembly.exe

## Parametri supravegheati

* Temperatura: Prevenirea defectiunilor cauzate de caldura excesiva in sistem.
* Umiditate: Asigurarea conditiilor optime de functionare pentru componentele electronice.
* Presiune: Monitorizarea constanta pentru evitarea avariilor mecanice sau a exploziilor.
