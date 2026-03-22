
.MODEL SMALL         

.DATA               
  
    mesaj db 'Introduceti un sir de caractere: $'        
    mesaj_vocale db 13, 10, 'Numarul de vocale este: $' 
    mesaj_consoane db 13, 10, 'Numarul de consoane este: $'
    sir db 100 DUP(?)        ; Buffer de 100 bytes pentru stocarea caracterelor 
    vocale db 'aeiouAEIOU$'  ; Lista vocalelor pentru comparație
    nr_vocale db 0           ; Contor pentru vocale
    nr_consoane db 0         ; Contor pentru consoane
    
.CODE               
START:
    ; Inițializare segment de date
    mov ax, @data           ; Încărcăm adresa segmentului de date în AX
    mov ds, ax             ; și o mutăm în DS (Data Segment)

    ; Afișare mesaj pentru introducerea șirului
    mov ah, 09h            ; Funcția DOS 09h 
    lea dx, mesaj          ; Încărcăm adresa efectivă a mesajului în DX
    int 21h                ; Întrerupere DOS pentru afișare

    ; Citirea caracterelor
    mov si, 0              ; Inițializăm indexul șirului cu 0
citire_caracter:
    mov ah, 01h            ; Funcția DOS 01h - citire caracter cu echo
    int 21h                ; Citim caracter de la tastatură
    
    cmp al, 13             ; Verificăm dacă s-a apăsat ENTER 
    je procesare           ; Dacă da, trecem la procesarea șirului
    
    mov sir[si], al        ; Salvăm caracterul în buffer
    inc si                 ; Incrementăm indexul
    jmp citire_caracter    ; Citim următorul caracter

procesare:
    mov sir[si], 13       ; Marcăm sfârșitul șirului
    mov si, 0              ; Resetăm indexul pentru procesare

verifica_caracter:
    mov al, sir[si]        ; Încărcăm caracterul curent
    cmp al, 13            ; Verificăm dacă am ajuns la sfârșit
    je afisare_rezultate   ; Dacă da, afișăm rezultatele
    
    ; Verificăm dacă caracterul este literă (A-Z sau a-z)
    cmp al, 'A'            ; Comparăm cu 'A'
    jb urmatorul_caracter  ; Dacă e mai mic, nu e literă
    cmp al, 'z'            ; Comparăm cu 'z'
    ja urmatorul_caracter  ; Dacă e mai mare, nu e literă
    
    ; Verificăm zona între 'Z' și 'a'
    cmp al, 'Z'
    ja verifica_zona_speciala
    jmp verifica_daca_vocala

verifica_zona_speciala:
    cmp al, 'a'            ; Verificăm dacă caracterul este mai mic decât 'a'
    jb urmatorul_caracter  ; Dacă da, nu este literă validă
    
verifica_daca_vocala:
    push si                 ; Salvăm indexul șirului pe stivă
    mov si, offset vocale   ; Pregătim verificarea cu lista de vocale
    mov cx, 10              ; Setăm contorul pentru 10 vocale

verifica_vocala:
    cmp al, [si]           ; Comparăm cu vocala curentă
    je gasit_vocala        ; Dacă e vocală, sărim la procesarea ei
    inc si                 ; Trecem la următoarea vocală
    loop verifica_vocala   ; Repetăm pentru toate vocalele
    
    ; Dacă am ajuns aici, e consoană
    pop si                 ; Recuperăm indexul șirului
    inc nr_consoane        ; Incrementăm numărul de consoane
    jmp urmatorul_caracter ; Trecem la următorul caracter

gasit_vocala:
    pop si                 ; Recuperăm indexul șirului
    inc nr_vocale          ; Incrementăm numărul de vocale

urmatorul_caracter:
    inc si                 ; Trecem la următorul caracter
    jmp verifica_caracter  ; Revenim la verificare

afisare_rezultate:
    ; Afișare mesaj pentru vocale
    mov ah, 09h            ; Funcția DOS pentru afișare șir
    lea dx, mesaj_vocale
    int 21h
    
    ; Procesare și afișare număr vocale
    xor ax, ax             ; Curățăm registrul AX
    mov al, nr_vocale      ; Punem numărul de vocale în AL
    mov bl, 10             ; Pregătim împărțirea la 10
    div bl                 ; AL = cât, AH = rest
    
    ; Verificăm dacă avem o cifră sau două
    cmp al, 0              ; Comparăm câtul cu 0
    je o_cifra_vocale      ; Dacă e 0, afișăm doar o cifră
    
    ; Afișăm două cifre pentru vocale
    mov dl, al             ; Prima cifră (câtul)
    add dl, '0'            ; Convertim în ASCII
    push ax
    mov ah, 02h            ; Funcția de afișare caracter
    int 21h
    pop ax
    
    mov dl, ah             ; A doua cifră (restul)
    add dl, '0'            ; Convertim în ASCII
    mov ah, 02h
    int 21h
    jmp afisare_consoane   ; Trecem la afișarea consoanelor
    
o_cifra_vocale:
    mov dl, ah             ; Afișăm singura cifră (restul)
    add dl, '0'            ; Convertim în ASCII
    mov ah, 02h
    int 21h
    
afisare_consoane:    
    ; Afișare mesaj pentru consoane
    mov ah, 09h
    lea dx, mesaj_consoane
    int 21h
    
    ; Procesare și afișare număr consoane
    xor ax, ax             ; Curățăm registrul AX
    mov al, nr_consoane    ; Punem numărul de consoane în AL
    mov bl, 10             ; Pregătim împărțirea la 10
    div bl                 ; AL = cât, AH = rest
    
    ; Verificăm dacă avem o cifră sau două
    cmp al, 0              ; Comparăm câtul cu 0
    je o_cifra_consoane    ; Dacă e 0, afișăm doar o cifră
    
    ; Afișăm două cifre pentru consoane
    mov dl, al             ; Prima cifră (câtul)
    add dl, '0'            ; Convertim în ASCII
    push ax
    mov ah, 02h
    int 21h
    pop ax
    
    mov dl, ah             ; A doua cifră (restul)
    add dl, '0'            ; Convertim în ASCII
    mov ah, 02h
    int 21h
    jmp final_program
    
o_cifra_consoane:
    mov dl, ah             ; Afișăm singura cifră (restul)
    add dl, '0'            ; Convertim în ASCII
    mov ah, 02h
    int 21h
    
final_program:    
    mov ah, 4ch            ; Funcția DOS pentru terminare program
    int 21h                
end start                  