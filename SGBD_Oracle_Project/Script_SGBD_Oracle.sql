-- ============================================================
-- PROIECT SGBD ORACLE - Gestionarea unui Magazin Online
-- Student: Tendeleu Ricardo-Ianis
-- Specializare: Informatica Economica | An: 2 | Grupa: 1060
-- An universitar: 2025-2026
-- ============================================================


-- ============================================================
-- 0. STRUCTURA BAZEI DE DATE (DDL + DML)
-- ============================================================

--CATEGORII
CREATE TABLE CATEGORII (
  id_categorie NUMBER(10) PRIMARY KEY,
  denumire     VARCHAR2(50)  NOT NULL,
  descriere    VARCHAR2(200)
);

INSERT INTO CATEGORII VALUES (1, 'Electronice', 'Telefoane, laptopuri, televizoare');
INSERT INTO CATEGORII VALUES (2, 'Electrocasnice', 'Frigidere, masini de spalat, aspiratoare');
INSERT INTO CATEGORII VALUES (3, 'IT & Periferice', 'Tastaturi, mouse, imprimante');
INSERT INTO CATEGORII VALUES (4, 'Audio-Video', 'Boxe, casti, proiectoare');
INSERT INTO CATEGORII VALUES (5, 'Accesorii', 'Huse, cabluri, incarcatoare');

--CLIENTI
CREATE TABLE CLIENTI (
  id_client    NUMBER(10) PRIMARY KEY,
  nume         VARCHAR2(50)  NOT NULL,
  prenume      VARCHAR2(50),
  email        VARCHAR2(100) UNIQUE,
  telefon      VARCHAR2(20),
  adresa       VARCHAR2(200),
  oras         VARCHAR2(50),
  tara         VARCHAR2(50),
  data_nasterii DATE
);

INSERT INTO CLIENTI VALUES (1, 'Popescu', 'Andrei', 'andrei.p@gmail.com', '0722111001', 'Str. Unirii 10', 'Bucuresti', 'Romania', DATE '1990-05-14');
INSERT INTO CLIENTI VALUES (2, 'Ionescu', 'Maria', 'maria.i@yahoo.com', '0722111002', 'Str. Eroilor 5', 'Cluj-Napoca', 'Romania', DATE '1988-09-22');
INSERT INTO CLIENTI VALUES (3, 'Georgescu', 'Mihai', 'mihai.g@gmail.com', '0722111003', 'Bd. Revolutiei 3', 'Timisoara', 'Romania', DATE '1995-01-30');
INSERT INTO CLIENTI VALUES (4, 'Stan', 'Elena', 'elena.s@outlook.com', '0722111004', 'Str. Pacurari 18', 'Iasi', 'Romania', DATE '1992-11-08');
INSERT INTO CLIENTI VALUES (5, 'Dinu', 'Radu', 'radu.d@gmail.com', '0722111005', 'Str. Mamaia 22', 'Constanta', 'Romania', DATE '1985-03-17');

--FURNIZORI
CREATE TABLE FURNIZORI (
  id_furnizor NUMBER(10) PRIMARY KEY,
  nume        VARCHAR2(100) NOT NULL,
  tara        VARCHAR2(50),
  email       VARCHAR2(100),
  telefon     VARCHAR2(20)
);

INSERT INTO FURNIZORI VALUES (1, 'TechDistrib SRL', 'Romania', 'contact@techdistrib.ro', '0721000001');
INSERT INTO FURNIZORI VALUES (2, 'ElectroImport SA', 'Germania', 'office@electroimport.de', '0721000002');
INSERT INTO FURNIZORI VALUES (3, 'GlobalTech Ltd', 'SUA', 'sales@globaltech.com', '0721000003');
INSERT INTO FURNIZORI VALUES (4, 'SoundPro GmbH', 'Germania', 'info@soundpro.de', '0721000004');
INSERT INTO FURNIZORI VALUES (5, 'AccessoriiRO SRL', 'Romania', 'comenzi@accesorii.ro', '0721000005');

--PRODUSE
CREATE TABLE PRODUSE (
  id_produs    NUMBER(10) PRIMARY KEY,
  denumire     VARCHAR2(100) NOT NULL,
  descriere    VARCHAR2(200),
  pret         NUMBER(10,2)  NOT NULL,
  stoc         NUMBER(10),
  id_categorie NUMBER(10),
  id_furnizor  NUMBER(10),
  CONSTRAINT fk_prod_cat  FOREIGN KEY (id_categorie) REFERENCES CATEGORII(id_categorie),
  CONSTRAINT fk_prod_furn FOREIGN KEY (id_furnizor)  REFERENCES FURNIZORI(id_furnizor)
);

INSERT INTO PRODUSE VALUES (100, 'Samsung Galaxy S24', 'Telefon flagship Samsung 2024', 5900, 15, 1, 1);
INSERT INTO PRODUSE VALUES (101, 'iPhone 15 Pro', 'Telefon Apple cu chip A17', 8200, 3, 1, 3);
INSERT INTO PRODUSE VALUES (102, 'Laptop Lenovo IdeaPad', 'Laptop 15 inch, Intel i5, 16GB RAM', 4500, 8, 3, 2);
INSERT INTO PRODUSE VALUES (103, 'Frigider Bosch 350L', 'Frigider combinat NoFrost', 3200, 12, 2, 2);
INSERT INTO PRODUSE VALUES (104, 'Tastatura Logitech MX', 'Tastatura wireless ergonomica', 450, 25, 3, 3);
INSERT INTO PRODUSE VALUES (105, 'Casti Sony WH-1000XM5', 'Casti over-ear cu noise cancelling', 1800, 4, 4, 4);
INSERT INTO PRODUSE VALUES (106, 'Boxa JBL Charge 5', 'Boxa portabila waterproof 40W', 900, 20, 4, 4);
INSERT INTO PRODUSE VALUES (107, 'Husa Samsung S24', 'Husa silicon premium pentru S24', 120, 50, 5, 5);
INSERT INTO PRODUSE VALUES (108, 'Cablu USB-C 2m', 'Cablu USB-C to USB-C 100W', 45, 2, 5, 5);
INSERT INTO PRODUSE VALUES (109, 'Masina de spalat Indesit', 'Masina de spalat 7kg 1200rpm', 2100, 6, 2, 2);

--COMENZI
CREATE TABLE COMENZI (
  id_comanda   NUMBER(10) PRIMARY KEY,
  data_comanda DATE DEFAULT SYSDATE,
  status       VARCHAR2(25),
  total        NUMBER(10,2),
  id_client    NUMBER(10),
  CONSTRAINT fk_com_client FOREIGN KEY (id_client) REFERENCES CLIENTI(id_client)
);

INSERT INTO COMENZI VALUES (500, DATE '2024-11-10', 'Livrata', 5900, 1);
INSERT INTO COMENZI VALUES (501, DATE '2024-11-15', 'Livrata', 8200, 2);
INSERT INTO COMENZI VALUES (502, DATE '2024-12-01', 'Livrata', 4500, 1);
INSERT INTO COMENZI VALUES (503, DATE '2024-12-10', 'In procesare', 3200, 3);
INSERT INTO COMENZI VALUES (504, DATE '2024-12-20', 'Noua', 450, 4);
INSERT INTO COMENZI VALUES (505, DATE '2025-01-05', 'Noua', 1800, 5);
INSERT INTO COMENZI VALUES (506, DATE '2025-01-10', 'In procesare', 900, 2);
INSERT INTO COMENZI VALUES (507, DATE '2025-02-01', 'Anulata', 120, 3);

--DETALII_COMANDA
CREATE TABLE DETALII_COMANDA (
  id_detaliu  NUMBER(10) PRIMARY KEY,
  id_comanda  NUMBER(10),
  id_produs   NUMBER(10),
  cantitate   NUMBER(10),
  pret_unitar NUMBER(10,2),
  CONSTRAINT fk_det_com  FOREIGN KEY (id_comanda) REFERENCES COMENZI(id_comanda),
  CONSTRAINT fk_det_prod FOREIGN KEY (id_produs)  REFERENCES PRODUSE(id_produs)
);

INSERT INTO DETALII_COMANDA VALUES (1, 500, 100, 1, 5900);
INSERT INTO DETALII_COMANDA VALUES (2, 501, 101, 1, 8200);
INSERT INTO DETALII_COMANDA VALUES (3, 502, 102, 1, 4500);
INSERT INTO DETALII_COMANDA VALUES (4, 503, 103, 1, 3200);
INSERT INTO DETALII_COMANDA VALUES (5, 504, 104, 1, 450);
INSERT INTO DETALII_COMANDA VALUES (6, 505, 105, 1, 1800);
INSERT INTO DETALII_COMANDA VALUES (7, 506, 106, 1, 900);
INSERT INTO DETALII_COMANDA VALUES (8, 507, 107, 1, 120);

--PLATI
CREATE TABLE PLATI (
  id_plata   NUMBER(10) PRIMARY KEY,
  data_plata DATE,
  metoda     VARCHAR2(25),
  suma       NUMBER(10,2),
  id_comanda NUMBER(10),
  CONSTRAINT fk_plata_com FOREIGN KEY (id_comanda) REFERENCES COMENZI(id_comanda)
);

INSERT INTO PLATI VALUES (1, DATE '2024-11-10', 'Card', 5900, 500);
INSERT INTO PLATI VALUES (2, DATE '2024-11-15', 'Card', 8200, 501);
INSERT INTO PLATI VALUES (3, DATE '2024-12-01', 'Transfer bancar', 4500, 502);
INSERT INTO PLATI VALUES (4, DATE '2024-12-10', 'Ramburs', 3200, 503);

--LIVRARI
CREATE TABLE LIVRARI (
  id_livrare     NUMBER(10) PRIMARY KEY,
  curier         VARCHAR2(50),
  data_livrare   DATE,
  status_livrare VARCHAR2(25),
  id_comanda     NUMBER(10),
  CONSTRAINT fk_livr_com FOREIGN KEY (id_comanda) REFERENCES COMENZI(id_comanda)
);

INSERT INTO LIVRARI VALUES (1, 'Fan Courier', DATE '2024-11-13', 'Livrata', 500);
INSERT INTO LIVRARI VALUES (2, 'DPD', DATE '2024-11-18', 'Livrata', 501);
INSERT INTO LIVRARI VALUES (3, 'Fan Courier', DATE '2024-12-04', 'Livrata', 502);
INSERT INTO LIVRARI VALUES (4, 'Cargus', NULL, 'In curs', 503);

COMMIT;


-- ============================================================
-- 1. STRUCTURI ALTERNATIVE SI REPETITIVE
-- ============================================================

-- 1.1 IF / ELSIF / ELSE - Verificare stoc produs
DECLARE
  v_stoc   PRODUSE.stoc%TYPE;
  v_produs PRODUSE.denumire%TYPE;
  v_id     PRODUSE.id_produs%TYPE := 101;
BEGIN
  SELECT stoc, denumire INTO v_stoc, v_produs
  FROM PRODUSE WHERE id_produs = v_id;
  IF v_stoc < 5 THEN
    DBMS_OUTPUT.PUT_LINE('STOC CRITIC pentru: ' || v_produs || ' - Stoc: ' || v_stoc);
  ELSIF v_stoc BETWEEN 5 AND 20 THEN
    DBMS_OUTPUT.PUT_LINE('Stoc scazut pentru: ' || v_produs || ' - Stoc: ' || v_stoc);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Stoc normal pentru: ' || v_produs || ' - Stoc: ' || v_stoc);
  END IF;
END;
/

-- 1.2 CASE - Status comanda
DECLARE
  v_status COMENZI.status%TYPE;
  v_mesaj  VARCHAR2(100);
  v_id     COMENZI.id_comanda%TYPE := 500;
BEGIN
  SELECT status INTO v_status
  FROM COMENZI WHERE id_comanda = v_id;
  v_mesaj := CASE v_status
    WHEN 'Noua'         THEN 'Comanda tocmai a fost plasata.'
    WHEN 'In procesare' THEN 'Comanda este in curs de pregatire.'
    WHEN 'Livrata'      THEN 'Comanda a ajuns la client.'
    WHEN 'Anulata'      THEN 'Comanda a fost anulata.'
    ELSE 'Status necunoscut.'
  END;
  DBMS_OUTPUT.PUT_LINE('Comanda ' || v_id || ': ' || v_mesaj);
END;
/

-- 1.3 LOOP simplu - Parcurgere categorii
DECLARE
  v_contor NUMBER := 1;
  v_den    CATEGORII.denumire%TYPE;
BEGIN
  LOOP
    EXIT WHEN v_contor > 5;
    BEGIN
      SELECT denumire INTO v_den
      FROM CATEGORII WHERE id_categorie = v_contor;
      DBMS_OUTPUT.PUT_LINE('Categoria ' || v_contor || ': ' || v_den);
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Categoria ' || v_contor || ': nu exista.');
    END;
    v_contor := v_contor + 1;
  END LOOP;
END;
/

-- 1.4 WHILE LOOP - Suma cumulata comenzi client
DECLARE
  CURSOR c_comenzi IS
    SELECT total FROM COMENZI WHERE id_client = 1 ORDER BY data_comanda;
  v_total COMENZI.total%TYPE;
  v_suma  NUMBER := 0;
BEGIN
  OPEN c_comenzi;
  FETCH c_comenzi INTO v_total;
  WHILE c_comenzi%FOUND AND v_suma <= 10000 LOOP
    v_suma := v_suma + v_total;
    DBMS_OUTPUT.PUT_LINE('Suma cumulata: ' || v_suma || ' RON');
    FETCH c_comenzi INTO v_total;
  END LOOP;
  CLOSE c_comenzi;
  DBMS_OUTPUT.PUT_LINE('Total final: ' || v_suma || ' RON');
END;
/

-- 1.5 FOR LOOP - Comenzi din decembrie 2024
BEGIN
  FOR rec IN (
    SELECT id_comanda, status, total
    FROM COMENZI
    WHERE EXTRACT(MONTH FROM data_comanda) = 12
      AND EXTRACT(YEAR  FROM data_comanda) = 2024
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Comanda #' || rec.id_comanda ||
      ' | Status: ' || rec.status ||
      ' | Total: '  || rec.total || ' RON');
  END LOOP;
END;
/


-- ============================================================
-- 2. TRATAREA EXCEPTIILOR
-- ============================================================

-- 2.1 Exceptie implicita - NO_DATA_FOUND
DECLARE
  v_nume    CLIENTI.nume%TYPE;
  v_prenume CLIENTI.prenume%TYPE;
BEGIN
  SELECT nume, prenume INTO v_nume, v_prenume
  FROM CLIENTI WHERE id_client = 9999;
  DBMS_OUTPUT.PUT_LINE('Client: ' || v_nume || ' ' || v_prenume);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('EROARE: Nu exista niciun client cu ID-ul 9999.');
END;
/

-- 2.2 Exceptie implicita - TOO_MANY_ROWS
DECLARE
  v_produs PRODUSE.denumire%TYPE;
BEGIN
  SELECT denumire INTO v_produs
  FROM PRODUSE WHERE id_categorie = 1;
  DBMS_OUTPUT.PUT_LINE('Produs: ' || v_produs);
EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('EROARE: Categoria 1 contine mai multe produse. Folositi un cursor pentru a le parcurge.');
END;
/

-- 2.3 Exceptie explicita - Stoc insuficient
DECLARE
  e_stoc_insuficient EXCEPTION;
  v_stoc_disponibil  NUMBER;
  v_cantitate_ceruta NUMBER := 50;
  v_id_produs        NUMBER := 104;
BEGIN
  SELECT stoc INTO v_stoc_disponibil
  FROM PRODUSE WHERE id_produs = v_id_produs;
  IF v_cantitate_ceruta > v_stoc_disponibil THEN
    RAISE e_stoc_insuficient;
  END IF;
  DBMS_OUTPUT.PUT_LINE('Comanda poate fi procesata. Stoc ramas: ' ||
                       (v_stoc_disponibil - v_cantitate_ceruta));
EXCEPTION
  WHEN e_stoc_insuficient THEN
    DBMS_OUTPUT.PUT_LINE('EROARE EXPLICITA: Stoc insuficient!' ||
      ' Disponibil: ' || v_stoc_disponibil ||
      ', Cerut: '     || v_cantitate_ceruta);
END;
/

-- 2.4 Exceptie explicita - Suma plata negativa
DECLARE
  v_suma NUMBER := -200;
BEGIN
  IF v_suma <= 0 THEN
    RAISE_APPLICATION_ERROR(-20001,
      'EROARE: Suma platii nu poate fi negativa sau zero! Suma introdusa: '
      || v_suma || ' RON');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Plata de ' || v_suma || ' RON a fost inregistrata.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/


-- ============================================================
-- 3. GESTIONAREA CURSORILOR
-- ============================================================

-- 3.1 Cursor implicit (SQL%)
BEGIN
  UPDATE PRODUSE
  SET pret = pret * 0.85
  WHERE stoc < 5;
  IF SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('Nu exista produse cu stoc critic.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Reducere aplicata pentru ' ||
      SQL%ROWCOUNT || ' produs(e) cu stoc critic.');
  END IF;
  ROLLBACK;
END;
/

-- 3.2 Cursor explicit fara parametri
DECLARE
  CURSOR c_comenzi_noi IS
    SELECT co.id_comanda, co.data_comanda, co.total,
           cl.nume, cl.prenume
    FROM COMENZI co
    JOIN CLIENTI cl ON co.id_client = cl.id_client
    WHERE co.status = 'Noua';
  v_rec c_comenzi_noi%ROWTYPE;
BEGIN
  OPEN c_comenzi_noi;
  LOOP
    FETCH c_comenzi_noi INTO v_rec;
    EXIT WHEN c_comenzi_noi%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Comanda #' || v_rec.id_comanda ||
      ' | Client: '  || v_rec.nume || ' ' || v_rec.prenume ||
      ' | Total: '   || v_rec.total || ' RON' ||
      ' | Data: '    || TO_CHAR(v_rec.data_comanda, 'DD-MM-YYYY'));
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Total comenzi noi: ' || c_comenzi_noi%ROWCOUNT);
  CLOSE c_comenzi_noi;
END;
/

-- 3.3 Cursor explicit cu parametri
DECLARE
  CURSOR c_produse_cat(p_id_categorie NUMBER) IS
    SELECT p.denumire, p.pret, p.stoc, f.nume AS furnizor
    FROM PRODUSE p
    JOIN FURNIZORI f ON p.id_furnizor = f.id_furnizor
    WHERE p.id_categorie = p_id_categorie
    ORDER BY p.pret DESC;
  v_rec c_produse_cat%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('=== Produse Electronice ===');
  OPEN c_produse_cat(1);
  LOOP
    FETCH c_produse_cat INTO v_rec;
    EXIT WHEN c_produse_cat%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_rec.denumire ||
      ' | Pret: '     || v_rec.pret    || ' RON' ||
      ' | Stoc: '     || v_rec.stoc    ||
      ' | Furnizor: ' || v_rec.furnizor);
  END LOOP;
  CLOSE c_produse_cat;

  DBMS_OUTPUT.PUT_LINE('=== Produse IT & Periferice ===');
  OPEN c_produse_cat(3);
  LOOP
    FETCH c_produse_cat INTO v_rec;
    EXIT WHEN c_produse_cat%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_rec.denumire ||
      ' | Pret: '     || v_rec.pret    || ' RON' ||
      ' | Stoc: '     || v_rec.stoc    ||
      ' | Furnizor: ' || v_rec.furnizor);
  END LOOP;
  CLOSE c_produse_cat;
END;
/

-- 3.4 Cursori imbricati
DECLARE
  CURSOR c_comenzi IS
    SELECT id_comanda, data_comanda
    FROM COMENZI
    WHERE status = 'Livrata'
    ORDER BY id_comanda;
  CURSOR c_produse(p_id_comanda NUMBER) IS
    SELECT p.denumire, dc.cantitate, dc.pret_unitar
    FROM DETALII_COMANDA dc
    JOIN PRODUSE p ON dc.id_produs = p.id_produs
    WHERE dc.id_comanda = p_id_comanda;
BEGIN
  FOR rec_com IN c_comenzi LOOP
    DBMS_OUTPUT.PUT_LINE('=== Comanda #' || rec_com.id_comanda ||
      ' | Data: ' || TO_CHAR(rec_com.data_comanda, 'DD-MM-YYYY') || ' ===');
    FOR rec_prod IN c_produse(rec_com.id_comanda) LOOP
      DBMS_OUTPUT.PUT_LINE('  Produs: ' || rec_prod.denumire ||
        ' | Cantitate: ' || rec_prod.cantitate ||
        ' | Pret: ' || rec_prod.pret_unitar || ' RON');
    END LOOP;
  END LOOP;
END;
/


-- ============================================================
-- 4. FUNCTII, PROCEDURI SI PACHETE
-- ============================================================

-- 4.1 Functia fn_total_comenzi_client
CREATE OR REPLACE FUNCTION fn_total_comenzi_client(
  p_id_client IN CLIENTI.id_client%TYPE
) RETURN NUMBER IS
  v_total NUMBER;
BEGIN
  SELECT NVL(SUM(total), 0) INTO v_total
  FROM COMENZI
  WHERE id_client = p_id_client;
  RETURN v_total;
EXCEPTION
  WHEN OTHERS THEN RETURN -1;
END fn_total_comenzi_client;
/

-- Testare fn_total_comenzi_client
BEGIN
  DBMS_OUTPUT.PUT_LINE('Total client 1: ' || fn_total_comenzi_client(1) || ' RON');
  DBMS_OUTPUT.PUT_LINE('Total client 2: ' || fn_total_comenzi_client(2) || ' RON');
END;
/

-- 4.2 Functia fn_categorie_pret
CREATE OR REPLACE FUNCTION fn_categorie_pret(
  p_pret IN PRODUSE.pret%TYPE
) RETURN VARCHAR2 IS
BEGIN
  IF p_pret < 500 THEN
    RETURN 'Accesibil';
  ELSIF p_pret BETWEEN 500 AND 3000 THEN
    RETURN 'Standard';
  ELSE
    RETURN 'Premium';
  END IF;
END fn_categorie_pret;
/

-- Testare fn_categorie_pret
SELECT denumire, pret, fn_categorie_pret(pret) AS categorie_pret
FROM PRODUSE
ORDER BY pret;

-- 4.3 Functia fn_zile_livrare
CREATE OR REPLACE FUNCTION fn_zile_livrare(
  p_id_comanda IN COMENZI.id_comanda%TYPE
) RETURN NUMBER IS
  v_data_comanda DATE;
  v_data_livrare DATE;
BEGIN
  SELECT c.data_comanda, l.data_livrare
  INTO v_data_comanda, v_data_livrare
  FROM COMENZI c
  LEFT JOIN LIVRARI l ON c.id_comanda = l.id_comanda
  WHERE c.id_comanda = p_id_comanda;
  IF v_data_livrare IS NULL THEN
    RETURN NULL;
  END IF;
  RETURN TRUNC(v_data_livrare - v_data_comanda);
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;
END fn_zile_livrare;
/

-- Testare fn_zile_livrare
SELECT id_comanda, status, fn_zile_livrare(id_comanda) AS zile_livrare
FROM COMENZI
ORDER BY id_comanda;

-- 4.4 Procedura proc_actualizeaza_stoc
CREATE OR REPLACE PROCEDURE proc_actualizeaza_stoc(
  p_id_produs IN PRODUSE.id_produs%TYPE,
  p_cantitate IN NUMBER
) IS
  v_stoc_curent NUMBER;
  e_stoc_insuf  EXCEPTION;
BEGIN
  SELECT stoc INTO v_stoc_curent
  FROM PRODUSE WHERE id_produs = p_id_produs;
  IF p_cantitate > v_stoc_curent THEN
    RAISE e_stoc_insuf;
  END IF;
  UPDATE PRODUSE
  SET stoc = stoc - p_cantitate
  WHERE id_produs = p_id_produs;
  DBMS_OUTPUT.PUT_LINE('Stoc actualizat pentru produsul ' || p_id_produs ||
    '. Stoc nou: ' || (v_stoc_curent - p_cantitate));
  COMMIT;
EXCEPTION
  WHEN e_stoc_insuf THEN
    DBMS_OUTPUT.PUT_LINE('EROARE: Stoc insuficient! Disponibil: ' ||
      v_stoc_curent || ', Cerut: ' || p_cantitate);
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('EROARE: Produsul ' || p_id_produs || ' nu exista.');
END proc_actualizeaza_stoc;
/

-- Testare proc_actualizeaza_stoc
EXEC proc_actualizeaza_stoc(104, 2);   -- apel valid
EXEC proc_actualizeaza_stoc(101, 999); -- apel invalid (stoc insuficient)

-- 4.5 Procedura proc_raport_vanzari
CREATE OR REPLACE PROCEDURE proc_raport_vanzari IS
  CURSOR c_raport IS
    SELECT cat.denumire AS categorie,
           COUNT(DISTINCT dc.id_produs) AS nr_produse,
           SUM(dc.cantitate * dc.pret_unitar) AS venit_total
    FROM CATEGORII cat
    JOIN PRODUSE p ON cat.id_categorie = p.id_categorie
    JOIN DETALII_COMANDA dc ON p.id_produs = dc.id_produs
    GROUP BY cat.denumire
    ORDER BY venit_total DESC;
BEGIN
  DBMS_OUTPUT.PUT_LINE('====== RAPORT VANZARI PE CATEGORII ======');
  DBMS_OUTPUT.PUT_LINE(RPAD('Categorie', 20) ||
    RPAD('Nr. Produse', 15) || 'Venit Total (RON)');
  DBMS_OUTPUT.PUT_LINE(RPAD('-', 50, '-'));
  FOR rec IN c_raport LOOP
    DBMS_OUTPUT.PUT_LINE(
      RPAD(rec.categorie, 20) ||
      RPAD(rec.nr_produse, 15) ||
      rec.venit_total);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('=========================================');
END proc_raport_vanzari;
/

-- Testare proc_raport_vanzari
EXEC proc_raport_vanzari;

-- 4.6 Pachetul pkg_magazin_online - Specificatie
CREATE OR REPLACE PACKAGE pkg_magazin_online IS
  FUNCTION fn_total_comenzi_client(
    p_id_client IN CLIENTI.id_client%TYPE
  ) RETURN NUMBER;
  FUNCTION fn_categorie_pret(
    p_pret IN PRODUSE.pret%TYPE
  ) RETURN VARCHAR2;
  FUNCTION fn_zile_livrare(
    p_id_comanda IN COMENZI.id_comanda%TYPE
  ) RETURN NUMBER;
  PROCEDURE proc_actualizeaza_stoc(
    p_id_produs IN PRODUSE.id_produs%TYPE,
    p_cantitate IN NUMBER
  );
  PROCEDURE proc_raport_vanzari;
END pkg_magazin_online;
/

-- Pachetul pkg_magazin_online - Corp
CREATE OR REPLACE PACKAGE BODY pkg_magazin_online IS

  FUNCTION fn_total_comenzi_client(p_id_client IN CLIENTI.id_client%TYPE)
  RETURN NUMBER IS
    v_total NUMBER;
  BEGIN
    SELECT NVL(SUM(total), 0) INTO v_total
    FROM COMENZI WHERE id_client = p_id_client;
    RETURN v_total;
  EXCEPTION
    WHEN OTHERS THEN RETURN -1;
  END;

  FUNCTION fn_categorie_pret(p_pret IN PRODUSE.pret%TYPE)
  RETURN VARCHAR2 IS
  BEGIN
    IF p_pret < 500 THEN RETURN 'Accesibil';
    ELSIF p_pret BETWEEN 500 AND 3000 THEN RETURN 'Standard';
    ELSE RETURN 'Premium';
    END IF;
  END;

  FUNCTION fn_zile_livrare(p_id_comanda IN COMENZI.id_comanda%TYPE)
  RETURN NUMBER IS
    v_data_comanda DATE;
    v_data_livrare DATE;
  BEGIN
    SELECT c.data_comanda, l.data_livrare
    INTO v_data_comanda, v_data_livrare
    FROM COMENZI c
    LEFT JOIN LIVRARI l ON c.id_comanda = l.id_comanda
    WHERE c.id_comanda = p_id_comanda;
    IF v_data_livrare IS NULL THEN RETURN NULL; END IF;
    RETURN TRUNC(v_data_livrare - v_data_comanda);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN NULL;
  END;

  PROCEDURE proc_actualizeaza_stoc(
    p_id_produs IN PRODUSE.id_produs%TYPE,
    p_cantitate IN NUMBER) IS
    v_stoc  NUMBER;
    e_insuf EXCEPTION;
  BEGIN
    SELECT stoc INTO v_stoc FROM PRODUSE WHERE id_produs = p_id_produs;
    IF p_cantitate > v_stoc THEN RAISE e_insuf; END IF;
    UPDATE PRODUSE SET stoc = stoc - p_cantitate WHERE id_produs = p_id_produs;
    DBMS_OUTPUT.PUT_LINE('Stoc actualizat. Stoc nou: ' || (v_stoc - p_cantitate));
    COMMIT;
  EXCEPTION
    WHEN e_insuf THEN DBMS_OUTPUT.PUT_LINE('EROARE: Stoc insuficient!');
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('EROARE: Produs inexistent!');
  END;

  PROCEDURE proc_raport_vanzari IS
    CURSOR c_r IS
      SELECT cat.denumire, COUNT(DISTINCT dc.id_produs) AS nr_p,
             SUM(dc.cantitate * dc.pret_unitar) AS venit
      FROM CATEGORII cat
      JOIN PRODUSE p ON cat.id_categorie = p.id_categorie
      JOIN DETALII_COMANDA dc ON p.id_produs = dc.id_produs
      GROUP BY cat.denumire ORDER BY venit DESC;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('=== RAPORT VANZARI ===');
    FOR rec IN c_r LOOP
      DBMS_OUTPUT.PUT_LINE(rec.denumire || ': ' || rec.nr_p ||
        ' produse, ' || rec.venit || ' RON');
    END LOOP;
  END;

END pkg_magazin_online;
/

-- Testare pachet
BEGIN
  DBMS_OUTPUT.PUT_LINE('Total client 1: ' ||
    pkg_magazin_online.fn_total_comenzi_client(1) || ' RON');
  DBMS_OUTPUT.PUT_LINE('Categoria pret 8200: ' ||
    pkg_magazin_online.fn_categorie_pret(8200));
  pkg_magazin_online.proc_raport_vanzari;
END;
/


-- ============================================================
-- 5. DECLANSATORI (TRIGGERS)
-- ============================================================

-- 5.1 Trigger - Actualizare stoc dupa comanda
CREATE OR REPLACE TRIGGER trg_actualizare_stoc
BEFORE INSERT ON DETALII_COMANDA
FOR EACH ROW
DECLARE
  v_stoc_curent NUMBER;
BEGIN
  SELECT stoc INTO v_stoc_curent
  FROM PRODUSE WHERE id_produs = :NEW.id_produs;
  IF :NEW.cantitate > v_stoc_curent THEN
    RAISE_APPLICATION_ERROR(-20010,
      'TRIGGER ERROR: Stoc insuficient pentru produsul ' ||
      :NEW.id_produs || '. Disponibil: ' || v_stoc_curent ||
      ', Cerut: ' || :NEW.cantitate);
  END IF;
  UPDATE PRODUSE
  SET stoc = stoc - :NEW.cantitate
  WHERE id_produs = :NEW.id_produs;
END;
/

-- Testare trigger trg_actualizare_stoc
INSERT INTO DETALII_COMANDA VALUES (9, 504, 106, 2, 900);  -- test valid
SELECT stoc FROM PRODUSE WHERE id_produs = 106;
ROLLBACK;
INSERT INTO DETALII_COMANDA VALUES (10, 504, 101, 999, 8200); -- test invalid

-- 5.2 Tabela de audit pentru preturi
CREATE TABLE LOG_PRETURI (
  id_log      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  id_produs   NUMBER(10),
  denumire    VARCHAR2(100),
  pret_vechi  NUMBER(10,2),
  pret_nou    NUMBER(10,2),
  data_modif  DATE DEFAULT SYSDATE,
  utilizator  VARCHAR2(50) DEFAULT USER
);

-- Trigger - Log modificari pret
CREATE OR REPLACE TRIGGER trg_log_modificari_pret
AFTER UPDATE OF pret ON PRODUSE
FOR EACH ROW
BEGIN
  IF :OLD.pret != :NEW.pret THEN
    INSERT INTO LOG_PRETURI (id_produs, denumire, pret_vechi, pret_nou)
    VALUES (:OLD.id_produs, :OLD.denumire, :OLD.pret, :NEW.pret);
  END IF;
END;
/

-- Testare trigger trg_log_modificari_pret
UPDATE PRODUSE SET pret = pret * 1.05 WHERE id_categorie = 1;
SELECT * FROM LOG_PRETURI;
