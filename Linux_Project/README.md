@Sistem de Gestiune Utilizatori - Bash

Acest proiect conține o suită de scripturi Bash pentru administrarea utilizatorilor într-un mediu Linux, incluzând module pentru înregistrare, autentificare și raportare.

@Functionalitati

# Inregistrare utilizatori noi cu validarea adresei de email
# Verificarea complexitatii parolei: minimum 8 caractere, litere mari, litere mici, cifre si caractere speciale
# Stocarea securizata a parolelor folosind hash SHA-256
# Autentificare cu verificarea credentialelor si actualizarea campului lastLogin in registru
# Generarea de rapoarte in fundal (background) despre fisierele si spatiul utilizat de un user
# Interfata interactiva prin meniu pentru accesarea functiilor

@Structura fisierelor

# mainMenu.sh: Scriptul principal care afiseaza meniul si directioneaza catre celelalte module
# logout.sh: Gestioneaza procesul de creare a unui cont nou (nume, email, parola)
# autentificare.sh: Realizeaza logarea si deschide o sesiune de lucru in directorul utilizatorului
# inregistrare.sh: Calculeaza numarul de fisiere si dimensiunea directorului home
# verificareUtilizator.sh: Contine regulile de validare pentru parola
# verificareMail.sh: Valideaza formatul sintactic al adresei de email
# caractereSpeciale.sh: Verifica existenta simbolurilor speciale in parola
# registruUtilizatori.csv: Fisier text tip baza de date pentru stocarea informatiilor

@Instructiuni de utilizare

# Acordati permisiuni de executie tuturor fisierelor .sh: chmod +x *.sh
# Rulati meniul principal pentru a incepe: ./mainMenu.sh

@Cerinte tehnice

# Sistem de operare: Linux / Unix.
# Utilitare necesare: bash, grep, sed, sha256sum, du, find.
