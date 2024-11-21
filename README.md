### Wywoływanie RPGLE z CLLE z rzutowaniem parametrów

#### **Opis projektu**
Ten projekt demonstruje, jak przekazywać parametry pomiędzy programem CLLE a RPGLE, w szczególności w sytuacjach, gdy wymagane jest rzutowanie typów danych, takich jak **CHAR** na **DEC** lub **CHAR** na **DATE**.

---

### **Pliki projektu**

1. **MYRPGPGM.rpgle**  
   Program RPGLE, który przyjmuje trzy parametry:
   - **Param1**: Tekstowy ciąg znaków (CHAR 10),
   - **Param2**: Liczba dziesiętna (DEC 7,2),
   - **Param3**: Data (DATE).  

2. **MYCLPGM.clle**  
   Program CLLE, który wywołuje program RPGLE, przekazując mu odpowiednie parametry:
   - Konwertuje dane tekstowe na liczby dziesiętne i daty przed wywołaniem RPGLE.

---

### **Instrukcje użycia**

#### **Kompilacja programów**
1. Skompiluj program RPGLE:
   ```bash
   CRTBNDRPG PGM(MYRPGPGM) SRCFILE(QRPGLESRC)
   ```
2. Skompiluj program CLLE:
   ```bash
   CRTBNDCL PGM(MYCLPGM) SRCFILE(QCLSRC)
   ```

#### **Uruchamianie programu**
Uruchom program CLLE, który automatycznie wywoła RPGLE:
```bash
CALL PGM(MYCLPGM)
```

---

### **Struktura kodów**

#### **MYRPGPGM.rpgle**
Program RPGLE odbiera trzy parametry i wyświetla ich wartości w dzienniku systemowym.

---

#### **MYCLPGM.clle**
Program CLLE przygotowuje dane wejściowe dla RPGLE, wykonując odpowiednie rzutowania.

---

### **Przykład działania**

#### **Wynik działania programu RPGLE:**
Po uruchomieniu programu CLLE w dzienniku systemowym wyświetlą się wartości przekazane do RPGLE:
```
Param1: HELLO    
Param2: 123.45
Param3: 2024-11-20
```

---

### **Uwagi**

1. **Walidacja danych w CLLE:**
   - Przed rzutowaniem upewnij się, że dane wejściowe są zgodne z oczekiwaniami, np. liczba ma poprawny format (`123.45`), a data jest zgodna z systemowym formatem (`YYYY-MM-DD`).

2. **Rozszerzalność:**
   - Możesz dostosować ten przykład, dodając więcej parametrów lub pracując z bardziej złożonymi strukturami w RPGLE.

3. **Debugowanie:**
   - Jeśli wystąpią problemy, użyj komendy `STRDBG` w RPGLE lub CLLE, aby prześledzić wywołanie i sprawdzić przekazywane wartości.

4. **Log błędów:**
   - Jeśli błąd się powtarza, użyj komendy DSPJOBLOG zaraz po kompilacji, aby uzyskać szczegółowe informacje