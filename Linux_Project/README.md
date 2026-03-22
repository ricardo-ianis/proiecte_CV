## Sistem de Gestiune Utilizatori (Bash)

Acest proiect reprezintă un sistem modular de administrare a conturilor de utilizator, scris în Shell Scripting. Include funcționalități de securitate, validare și monitorizare a resurselor.

## Functionalitati principale

* Inregistrare utilizator: Validarea numelui de utilizator, a adresei de email și a complexității parolei.
* Securitate sporita: Parolele sunt convertite în hash-uri SHA-256 pentru a preveni stocarea în clar.
* Autentificare: Verificarea identității prin compararea hash-urilor și actualizarea câmpului 'lastLogin'.
* Raportare resurse: Calcularea numărului de fișiere și a spațiului ocupat pe disc în mod asincron (background process).
* Mediu de lucru: La logare reușită, utilizatorul primește o instanță nouă de Bash în directorul său personal.

## Structura proiectului

* mainMenu.sh: Scriptul central care rulează meniul interactiv.
* logout.sh: Gestionează fluxul de creare a conturilor noi (user, mail, parola).
* autentificare.sh: Modulul care se ocupă de procesul de login.
* inregistrare.sh: Generează raportul de activitate (fisiere, directoare, dimensiune).
* verificareUtilizator.sh: Verifică dacă parola respectă regulile de securitate.
* verificareMail.sh: Validarea sintactică a adreselor de email.
* caractereSpeciale.sh: Verifică prezența simbolurilor speciale în șirurile de caractere.
* registruUtilizatori.csv: Sursa de date unde sunt stocate informațiile conturilor.

## Cerinte Sistem

* Sistem de operare: Linux / Unix / WSL.
* Utilitare necesare: bash, sha256sum, grep, sed, du, find.

## Instalare si Utilizare

1. Clonati proiectul si asigurati-va ca toate fisierele sunt in acelasi director.
2. Acordati drepturi de executie:
   chmod +x *.sh

3. Porniti aplicatia:
   ./mainMenu.sh

## Reguli de securitate parola

Pentru a fi acceptata, o parola trebuie sa indeplineasca urmatoarele:
* Minimum 8 caractere.
* Cel putin o litera mica (a-z).
* Cel putin o litera mare (A-Z).
* Cel putin o cifra (0-9).
* Cel putin un caracter special (ex: !, @, #, $, %).
