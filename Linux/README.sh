# Kolos Przygotowania

Ile konsol dostępnych jest w systemie Linux?
- 7 konsol wirtualnych ALT+Fx, konsole - 7 - 11 środowisko graficzne

Czym różni się polecenie ls od polecenie ls *?
ls - bierzacy katalog, * - drzewo plików i katalogów w bierzącym katalogu



# 1. Utwórz użytkowników test1, test2 oraz test3
sudo useradd test1
sudo useradd test2
sudo useradd test3

# 2. Ustal hasła dla użytkowników test1 i test2 (identyczne jak nazwy)
echo "test1:test1" | sudo chpasswd
echo "test2:test2" | sudo chpasswd

# 3. Zaloguj się na użytkownika test1
su test1

# 4. Będąc zalogowanym na użytkownika test1 ustaw hasło użytkownikowi test3. Jest to możliwe? Skorzystaj z narzędzia nadającego Ci prawa administratora.
sudo passwd test3

# 5. Utwórz grupy grupa1 i grupa2
sudo groupadd grupa1
sudo groupadd grupa2

# 6. Przypisz użytkowników test1 i test2 do grupy grupa1
sudo usermod -aG grupa1 test1
sudo usermod -aG grupa1 test2

# 7. Przypisz użytkowników test2 i test3 do grupy grupa2. Czy użytkownik test2 może należeć do dwóch grup? Do jakiej grupy należą pliki zakładane przez użytkownika test2?
sudo usermod -aG grupa2 test2
sudo usermod -aG grupa2 test3

# 8. Ustaw grupę domyślną użytkownika test2 na grupa2. Do jakiej grupy należą pliki tworzone przez tego użytkownika?
sudo usermod -g grupa2 test2

# 9. Zmień powłokę użytkownika test2 na /bin/sh. Umiałbyś to zrobić edytując pliki konfiguracyjne?
sudo chsh -s /bin/sh test2

# 10. Zmień powłokę użytkownika test3 na /bin/passwd. Jest to możliwe? Jeśli zajdzie potrzeba zmodyfikuj odpowiednie pliki. W jakich okolicznościach takie ustawienie może mieć sens?
sudo chsh -s /bin/passwd test3

# 11. Przekształć konto test1 w „zapasowe” konto administracyjne.
sudo usermod -aG sudo test1

# 12. Zaloguj się zdalnie do komputera osoby siedzącej obok.
ssh username@remote_computer_ip

# 13. Z katalogu domowego wylistuj jednym poleceniem zawartość katalogu /etc
ls /etc

# 14. Utwórz strukturę katalogów
printenv

nano skrypt
```
#!/bin/bash

# Ustawienie katalogu domowego
HOME_DIR="$HOME/lab_d_g_n"

# Tworzenie głównego katalogu
mkdir -p "$HOME_DIR"

# Tworzenie podkatalogów
mkdir -p "$HOME_DIR/moje dokumenty/studia"
mkdir -p "$HOME_DIR/moje dokumenty/dom"
mkdir -p "$HOME_DIR/moje dokumenty/praca"
mkdir -p "$HOME_DIR/moje dokumenty/praca/janek"
mkdir -p "$HOME_DIR/moje dokumenty/praca/marek"
mkdir -p "$HOME_DIR/moje dokumenty/praca/umowy"
mkdir -p "$HOME_DIR/instalacje/"

echo "Struktura katalogów została utworzona."
```
chmod +x skrypt (chmod 764 skrypt - tylko dla właściciela wykonywanie)
./skrypt

# 15. Skopiuj wszystkie polecenia dwuliterowe, zaczynające się od litery d, z katalogu /bin do założonego wcześniej katalogu studia
cp /bin/d? ~/lab_d_g_n/moje\ dokumenty/studia/

# 16. Zmień nazwy tych plików, aby zaczynały się od słów stary_
cd ~/lab_d_g_n/moje\ dokumenty/studia/
for file in d?; do mv "$file" "stary_$file"; done

# 17. Załóż w swoim katalogu domowym plik info.txt, w którym zamieść podstawowe informacje o sobie – imię, nazwisko, parę słów o sobie
echo -e "Imię: Mateusz\nNazwisko: Mróz\nParę słów o sobie: Student informatyki, interesuję się AI i programowaniem." > ~/info.txt

# 18. Załóż drugi plik o nazwie email.txt, w którym umieść swój adres e-mail
echo "matty_mroz@example.com" > ~/email.txt

# 19. Utwórz w katalogu instalacje katalog rpm korzystając ze ścieżki bezwzględnej
mkdir -p ~/lab_d_g_n/instalacje/rpm

# 20. Utwórz w katalogu instalacje katalog deb korzystając ze ścieżki względnej
cd ~/lab_d_g_n/instalacje
mkdir -p deb

# 21. Przejdź do katalogu deb (w katalog instalacje) a następnie przejdź za pomocą jednego polecenia do katalogu umowy znajdującego się w katalogu praca
cd deb
cd ../../moje\ dokumenty/praca/umowy

# 22. Przenieś plik email.txt do katalogu studia
mv ~/email.txt ~/lab_d_g_n/moje\ dokumenty/studia/

# 23. Załóż nowy plik, a następnie stwórz link symboliczny do niego. Co się stanie z linkiem, jeśli usuniesz plik bazowy?
touch ~/nowy_plik.txt
ln -s ~/nowy_plik.txt ~/link_do_nowego_pliku.txt
# Jeśli usuniesz plik bazowy (nowy_plik.txt), link symboliczny (link_do_nowego_pliku.txt) będzie wskazywał na nieistniejący plik.

# 24. Skopiuj do katalogu janek wszystkie pliki z katalogu studia
cp ~/lab_d_g_n/moje\ dokumenty/studia/* ~/lab_d_g_n/instalacje/janek/

# 25. Przenieś katalog praca wraz z podkatalogami do katalogu instalacje za pomocą jednego polecenia
mv ~/lab_d_g_n/moje\ dokumenty/praca ~/lab_d_g_n/instalacje/

# 26. Ustaw dla katalogu moje dokumenty i wszystkich jego podkatalogów następujące uprawnienia: właściciel: odczyt, zapis, wykonanie, grupa: brak uprawnień, pozostali: odczyt, zapis.
chmod -R 703 ~/lab_d_g_n/moje\ dokumenty

# 27. Wygeneruj listę wszystkich plików w systemie, posortuj a następnie usuń duplikaty. Zapisz to do pliku
find / -type f 2>/dev/null | sort | uniq > ~/lista_plikow.txt

# 28. Z listy, którą otrzymałeś w poprzednim ćwiczeniu, wygeneruj listę plików nagłówkowych (*.h) i zapisz do kolejnego pliku
grep "\.h$" ~/lista_plikow.txt > ~/lista_plikow_naglowkowych.txt

# 29. Sprawdź parametry polecenia sort – czy pozwala ono na sortowanie według innych zasad niż „alfabetycznie”?
man sort
# lub
sort --help


# 1. Co to jest skrypt?
# Skrypt to plik tekstowy zawierający sekwencję poleceń, które są wykonywane przez interpreter (np. Bash, Python). Skrypty są używane do automatyzacji zadań.

# 2. W jaki sposób można wykorzystać mechanizm śledzenia skryptów?

# Mechanizm śledzenia skryptów (ang. script tracing) można wykorzystać do debugowania skryptów. W Bashu można użyć opcji -x do śledzenia wykonywanych poleceń:
bash -x skrypt.sh

# 3. Jakie uprawnienia powinien posiadać plik zawierający skrypt, aby możliwe było jego
# uruchomienie?
# Plik zawierający skrypt powinien mieć uprawnienia do wykonania (execute). Można to ustawić za pomocą polecenia:
# chmod +x skrypt.sh

# 4. Co oznacza zmienna środowiskowa $USER ?
# Zmienna środowiskowa $USER przechowuje nazwę aktualnie zalogowanego użytkownika.

# 5. Zmienne specjalne:

$0  # Nazwa bieżącego skryptu lub powłoki
$1..$9  # Parametry przekazane do skryptu
$@  # Wszystkie parametry przekazane do skryptu jako oddzielne argumenty
$#  # Liczba wszystkich parametrów przekazanych do skryptu
$?  # Kod powrotu ostatnio wykonywanego polecenia
$$  # PID bieżącego skryptu lub powłoki
$!  # PID ostatniego uruchomionego procesu w tle
$*  # Wszystkie parametry przekazane do skryptu jako jeden ciąg znaków
$-  # Aktualne opcje powłoki ustawione za pomocą polecenia `set`
$_  # Ostatni argument poprzedniego polecenia


# 6. Co oznacza znak # w skrypcie?
# Znak # w skrypcie oznacza komentarz. Wszystko, co znajduje się po #, jest ignorowane przez interpreter.


# 7. Co powoduje dodanie do polecenia echo opcji -e?
# Dodanie opcji -e do polecenia echo powoduje, że sekwencje specjalne (np. \n dla nowej linii) są interpretowane.

# 8. Gdzie zostanie umieszczony wprowadzony tekst po wydaniu polecenia read -e ?
# Wprowadzony tekst zostanie umieszczony w zmiennej, która jest podana po poleceniu read -e.

# 9. Napisz skrypt, który wypisze na ekran twoje imię i nazwisko oraz zawartość twojego katalogu domowego.
```
#!/bin/bash
echo "Imię: Mateusz"
echo "Nazwisko: Mróz"
echo "Zawartość katalogu domowego:"
ls ~
lub
ls $HOME
```

# 10. Napisz skrypt, który będzie Cię pytał o datę urodzin, a następnie wyświetlał ją na ekranie w postaci komunikatu: Urodziłeś się ….
```
#!/bin/bash
echo "Podaj datę urodzin (dd-mm-yyyy):"
read birthdate
echo "Urodziłeś się $birthdate"
```

# 11. Skrypt z poprzedniego zadania zmodyfikuj tak, aby data urodzin była wprowadzana w postaci parametru.
```
#!/bin/bash
if [ -z "$1" ]; then
    echo "Użycie: $0 <data urodzin (dd-mm-yyyy)>"
    exit 1
fi
echo "Urodziłeś się $1"
```

# 12. Napisz skrypt, który poprosi Cię o wpisanie dowolnego zdania, następnie poprosi o numer wyrazu w zdaniu i wyświetli ten wyraz.
```
#!/bin/bash
echo "Wpisz dowolne zdanie:"
read sentence
echo "Podaj numer wyrazu:"
read word_number
word=$(echo $sentence | cut -d ' ' -f $word_number)
echo "Wyraz numer $word_number to: $word"
```

# 13. Napisz skrypt wyświetlający bieżący czas.
```
#!/bin/bash
echo "Bieżący czas: $(date +"%T")"
```

# 14. Napisz skrypt, który będzie pytał się o nazwę użytkownika a następnie zakładał mu konto wraz z katalogiem domowym.
```
#!/bin/bash
echo "Podaj nazwę użytkownika:"
read username
sudo useradd -m $username
echo "Konto użytkownika $username zostało utworzone."
```

# 15. Napisz skrypt, który będzie kopiował wybrany plik do katalogu, o nazwie w formacie daty: yy.mm.dd. Nazwa pliku ma być podawana jako parametr skryptu.
```
#!/bin/bash
if [ -z "$1" ]; then
    echo "Użycie: $0 <nazwa pliku>"
    exit 1
fi
filename=$1
date_dir=$(date +"%y.%m.%d")
mkdir -p $date_dir
cp $filename $date_dir/
echo "Plik $filename został skopiowany do katalogu $date_dir."
```




# 1. Podaj ogólną składnie polecenia ‘case’.
```
case $variable in
    pattern1)
        commands1
    ;;
    pattern2)
        commands2
    ;;
    *)
        default_commands
    ;;
esac
```

# 2. Co to jest znak EOF?
# EOF (End Of File) to specjalny znak oznaczający koniec pliku. W kontekście skryptów i programowania, EOF jest używany do oznaczenia końca danych wejściowych.


# 3. Jaki operator oznaczony jest za pomocą -ge ?
-eq  # Równy (equal to)
-ne  # Nie równy (not equal to)
-gt  # Większy niż (greater than)
-ge  # Większy lub równy (greater than or equal to)
-lt  # Mniejszy niż (less than)
-le  # Mniejszy lub równy (less than or equal to)

# 4. Czy możliwe jest umieszczenie funkcji w oddzielnym pliku?
# Tak, możliwe jest umieszczenie funkcji w oddzielnym pliku. Można je załadować do skryptu za pomocą polecenia source lub . (kropka).

# 5. Podaj ogólną składnię polecenia ‘for’.
```
for variable in list
do
    commands
done
```

# 6. Napisz skrypt wyświetlający bieżący czas. Skrypt powinien działać do momentu przerwania przy pomocy Ctrl-C
```
#!/bin/bash
while true
do
    echo "Bieżący czas: $(date +"%T")"
    sleep 1
done
```

# 7. Napisz skrypt wyświetlający wszystkie katalogi w bieżącym katalogu.
```
#!/bin/bash
for dir in */
do
    echo "$dir"
done
```

# 8. Korzystając z wcześniejszego skryptu napisz skrypt wyświetlający katalogi w bieżącym katalogu i jego podkatalogach. (Należy przerobić wcześniejszy skrypt na procedurę, która będzie rekursywnie wywoływała samą siebie).
```
#!/bin/bash
function list_dirs {
    for dir in "$1"/*
    do
        if [ -d "$dir" ]; then
            echo "$dir"
            list_dirs "$dir"
        fi
    done
}

list_dirs .
```

# 9. Napisz skrypt wykonujący cztery podstawowe działania arytmetyczne. Skrypt ma pytać jakie działanie użytkownik chce wykonać a następnie o operandy tego działania. Skrypt powinien działać w nieskończonej pętli (szczegóły dotyczące działań arytmetycznych można odnaleźć w manualu funkcji expr lub bash).
```
#!/bin/bash
while true
do
    echo "Wybierz działanie: dodawanie (+), odejmowanie (-), mnożenie (*), dzielenie (/)"
    read operation
    echo "Podaj pierwszy operand:"
    read operand1
    echo "Podaj drugi operand:"
    read operand2
    
    case $operation in
        +)
            result=$(expr $operand1 + $operand2)
        ;;
        -)
            result=$(expr $operand1 - $operand2)
        ;;
        \*)
            result=$(expr $operand1 \* $operand2)
        ;;
        /)
            result=$(expr $operand1 / $operand2)
        ;;
        *)
            echo "Nieznane działanie"
            continue
        ;;
    esac
    
    echo "Wynik: $result"
done
```

# 10. Napisz skrypt, który będzie sprawdzał czy w wywołaniu wystąpiły 3 argumenty. Jeśli nie, to ma prosić o ich podanie.
```
#!/bin/bash
if [ $# -ne 3 ]; then
    echo "Podaj trzy argumenty:"
    read arg1 arg2 arg3
else
    arg1=$1
    arg2=$2
    arg3=$3
fi

echo "Argumenty: $arg1, $arg2, $arg3"
```


# 11. Napisz skrypt, który sprawdzi aktualny czas systemowy, a następnie w zależności od wartości
# godziny wypisze odpowiedni komunikat:
# ▪ <00-06) – „Dobranoc”
# ▪ <06-12) – „Milego dnia”
# ▪ <12-18) – „Dzien dobry”
# ▪ <18-24) – „Dobranoc”
```
#!/bin/bash

# Pobranie aktualnej godziny
hour=$(date +"%H")

# Wyświetlenie aktualnej godziny
echo "Aktualna godzina: $(date +"%T")"

# Wyświetlenie odpowiedniego komunikatu w zależności od przedziału czasowego
if (( hour >= 0 && hour < 6 )); then
    echo "Dobranoc"
    elif (( hour >= 6 && hour < 12 )); then
    echo "Dzień dobry"
    elif (( hour >= 12 && hour < 18 )); then
    echo "Miłego dnia"
else
    echo "Dobry wieczór"
fi
```

# 12. Napisz skrypt obliczający silnię podanej liczby.
```
#!/bin/bash
echo "Podaj liczbę:"
read number

factorial=1
for (( i=1; i<=number; i++ ))
do
    factorial=$((factorial * i))
done

echo "Silnia $number wynosi $factorial"
```

# 13. Napisz skrypt wyświetlający dwójkową reprezentację liczby podanej w systemie dziesiętnym.
```
#!/bin/bash
echo "Podaj liczbę dziesiętną:"
read decimal

binary=$(echo "obase=2; $decimal" | bc)
echo "Dwójkowa reprezentacja liczby $decimal to $binary"
```


# 1. W pliku /etc/group zamień słowo root na admin

sed 's/root/admin/g' /etc/group

# 2. W pliku /etc/group zamień wszystkie cyfry/liczby na ciąg 'xxxx'
sed 's/[0-9]\+/xxxx/g' /etc/group

# 3. W pliku /etc/group zamień grupę root na admins - nazwy grup występują jedynie na początku wiersza, dalsze wpisy oznaczają użytkowników
sed 's/^root/admins/' /etc/group

# 4. W pliku /etc/passwd wyszukaj ścieżki bezwzględne (zaczynające się od "/") i zastąp je ciągiem "-------". Czy wszystkie ścieżki w linii zostały zastąpione?

sed 's|/[^:]*|-------|g' /etc/passwd

# 5. W pliku /etc/passwd wyszukaj ścieżki bezwzględne (zaczynające się od "/") umieść je w nawiasach "[" oraz "]" (należy skorzystać z podstawiania)
sed 's|/\([^:]*\)|[\1]|g' /etc/passwd





# 1. Z plików /usr/share/X11/xorg.conf.d/*.conf wyświetl sekcje rozpoczynające się od Section "OutputClass" a kończące EndSection
sed -n '/Section "OutputClass"/,/EndSection/p' /usr/share/X11/xorg.conf.d/*.conf

# 2. Z pliku /etc/hosts wyświetl linie nie zaczynające się od znaków "#" i ":"
grep -v '^[#:]' /etc/hosts


# 3. Wyświetl listę plików i katalogów z katalogu /etc, które zakończone są .d. Zastąp .d ciągiem  .config.
ls /etc/*.d | sed 's/\.d$/.config/'


# 4. Napisz skrypt, który z plików /usr/share/X11/xorg.conf.d/*.conf zapisze sekcje "OutputClass" do pliku outputs.txt, a sekcje "InputClass" do pliku inputs.txt.
```
#!/bin/bash

# Zapisz sekcje "OutputClass" do pliku outputs.txt
sed -n '/Section "OutputClass"/,/EndSection/p' /usr/share/X11/xorg.conf.d/*.conf > outputs.txt

# Zapisz sekcje "InputClass" do pliku inputs.txt
sed -n '/Section "InputClass"/,/EndSection/p' /usr/share/X11/xorg.conf.d/*.conf > inputs.txt
```


# 1. Z pliku /etc/passwd wyświetl tylko nazwy użytkowników, ich katalogi domowe oraz powłokę
awk -F: '{print $1, $6, $7}' /etc/passwd

# 2. Do danych z poprzedniego punktu dodaj nagłówki "Użytkownik", "Katalog" oraz "Powłoka"
echo -e "Użytkownik\tKatalog\t\t\tPowłoka"
awk -F: '{print $1, $6, $7}' /etc/passwd


# 3. Do danych z poprzedniego punktu dodaj numery wierszy (i odpowiedni nagłówek).
echo -e "Nr\tUżytkownik\tKatalog\t\t\tPowłoka"
awk -F: '{print NR, $1, $6, $7}' /etc/passwd


# 4. Do danych z poprzedniego punktu dodaj ramki (posłuż się znakami "-" "|" oraz znakiem tabulacji)
echo -e "Nr\tUżytkownik\tKatalog\t\t\tPowłoka"
echo -e "---------------------------------------------"
awk -F: '{printf "%-2d\t%-10s\t%-20s\t%-10s\n", NR, $1, $6, $7}' /etc/passwd
echo -e "---------------------------------------------"



# 5. Napisz skrypt rysujący wykres słupkowy dla pliku z liczbami. Na przykład dla pliku
```
#!/bin/bash

# Przypisanie nazwy pliku do zmiennej
filename="$1"

# Sprawdź, czy plik istnieje
if [ ! -f "$filename" ]; then
    echo "Plik $filename nie istnieje."
    exit 1
fi

# Rysowanie wykresu słupkowego
while IFS= read -r line; do
    # Rysowanie słupka
    printf "|"
    for ((i=0; i<line; i++)); do
        printf "*"
    done
    echo ""
done < "$filename"
```

```
#!/bin/bash

# Wczytywanie liczb z pliku do tablicy
echo "Podaj nazwę pliku z liczbami:"
read filename
declare -a numbers_array  # Deklaracja tablicy

while IFS= read -r line; do
    numbers_array+=("$line")
done < "$filename"

# Wypisanie zawartości tablicy
for number in "${numbers_array[@]}"; do
    echo "$number"
done
```

```
#!/bin/bash

# Sprawdzenie, czy podano katalog jako parametr
if [ -z "$1" ]; then # czy długość parametru nie jest równa 0
    echo "Użycie: $0 <katalog>"
    exit 1
fi

# Przypisanie katalogu do zmiennej
directory="$1"

# Poproszenie użytkownika o podanie nazwy pliku do zapisu
echo "Podaj nazwę pliku do zapisu wyniku:"
read output_file

# Wyświetlenie wszystkich podkatalogów i zapisanie do pliku
find "$directory" -type d > "$output_file"

# Wyświetlenie zawartości pliku
cat "$output_file"
```

```
if [ -f "plik.txt" ]; then # czy plik istnieje
    echo "Plik istnieje"
else
    echo "Plik nie istnieje"
fi
```

```
#!/bin/bash

while true; do
    # Pytanie o działanie arytmetyczne
    echo "Wybierz działanie: dodawanie (+), odejmowanie (-), mnożenie (*), dzielenie (/)"
    read operation
    
    # Pytanie o operandy
    echo "Podaj pierwszy operand:"
    read operand1
    echo "Podaj drugi operand:"
    read operand2
    
    # Wykonanie wybranego działania
    case $operation in
        +)
            result=$(expr $operand1 + $operand2)
        ;;
        -)
            result=$(expr $operand1 - $operand2)
        ;;
        \*)
            result=$(expr $operand1 \* $operand2)
        ;;
        /)
            result=$(expr $operand1 / $operand2)
        ;;
        *)
            echo "Nieznane działanie"
            continue
        ;;
    esac
    
    # Wyświetlenie wyniku
    echo "Wynik: $result"
done
```

```
#!/bin/bash

# Sprawdzenie, czy podano trzy parametry
if [ $# -ne 3 ]; then
    echo "Użycie: $0 <nazwa_użytkownika> <grupa> <powłoka>"
    exit 1
fi

# Przypisanie parametrów do zmiennych
username="$1"
group="$2"
shell="$3"

# Zakładanie konta użytkownika wraz z katalogiem domowym, grupą i powłoką
sudo useradd -m -g "$group" -s "$shell" "$username"

# Sprawdzenie, czy konto zostało utworzone
if [ $? -eq 0 ]; then
    echo "Konto użytkownika $username zostało utworzone."
else
    echo "Wystąpił błąd podczas tworzenia konta użytkownika $username."
fi
```


```
#!/bin/bash

# Sprawdzenie, czy podano dwa parametry
if [ $# -ne 2 ]; then
    echo "Użycie: $0 <katalog> <prefiks>"
    exit 1
fi

# Przypisanie parametrów do zmiennych
directory="$1"
prefix="$2"

# Sprawdzenie, czy katalog istnieje
if [ ! -d "$directory" ]; then
    echo "Katalog $directory nie istnieje."
    exit 1
fi

# Zliczanie plików zaczynających się od prefiksu
file_count=$(find "$directory" -type f -name "${prefix}*" | wc -l)

# Wyświetlenie wyniku
echo "Liczba plików w katalogu $directory zaczynających się od $prefix: $file_count"
```

```
#!/bin/bash

# Sprawdzenie, czy podano jeden parametr
if [ $# -ne 1 ]; then
    echo "Użycie: $0 <liczba_binarną>"
    exit 1
fi

# Przypisanie parametru do zmiennej
binary_number="$1"

# Konwersja liczby binarnej na dziesiętną
decimal_number=$((2#$binary_number))

# Wyświetlenie wyniku
echo "Liczba dziesiętna: $decimal_number"
```

```
#!/bin/bash

# Wyświetlenie aktualnej daty i godziny
echo "Aktualna data i godzina: $(date +"%Y-%m-%d %H:%M:%S")"
```