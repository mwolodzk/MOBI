# MOBI
Projekt 2-18Z,
Sprawozdanie dostępne pod [tym adresem](https://docs.google.com/document/d/1M5NSKCE3gOpBNNCxpjxObYETXZ9SFgV7HhfA5JLf4mE/edit?usp=sharing). Arkusz z wykresami do sprawozdania jest [tutaj](https://docs.google.com/spreadsheets/d/16ScwitgZi-EMqtNMCXtgcwLadb4m6FwMjptFiRQeXZ8/edit?usp=sharing).
## Zadanie
W projekcie należy obliczyć znormalizowany współczynnik małosygnałowego wzmocnienia w laserze paskowym F-P w funkcji współczynnika odbicia jednego ze zwierciadeł rezonatora dla różnych parametrów struktury laserowej. Do wykonania analizy małosygnałowego wzmocnienia konieczne jest wyznaczenie szerokości i grubości struktury paskowej zapewniającej pracę wielomodową. Uzyskane wyniki należy zaprezentować w formie raportu.

## Budowa struktury

![Struktura falowodowego lasera paskowego ze zwierciadłami F-P na końcach.](https://raw.githubusercontent.com/mwolodzk/MOBI/master/img/Budowa_struktury.png)

## Opis struktury
Warstwa falowodowa wykonana jest z kryształu ZBLAN domieszkowanego Er<sup>3+</sup> o współczynniku załamania n<sub>1</sub>=1,53. Podłoże to czysty kryształ ZBLAN o współczynniku załamania n<sub>2</sub>=1,529. Po bokach światłowód otacza również kryształ ZBLAN o współczynniku załamania n<sub>4</sub>=n<sub>5</sub>=1,529. Z góry z kolei występuje powietrze o współczynniku załamania n<sub>3</sub>=1. Laser emituje promieniowanie o długości &lambda;=1,54 &micro;m w wolnej przestrzeni. Długość struktury laserowej wynosi L=5 cm, t oznacza szerokość, a d grubość falowodu. Rezonator Fabry-Perot'a tworzą wyszlifowane końce światłowodu odpowiadające zwierciadłom. Każde z nich ma inny amplitudowy współczynnik odbicia, odpowiednio r<sub>1</sub> i r<sub>2</sub>.

| Szerokość t [&mu;m] | Grubość d [&mu;m] | Mody E<sup>x</sup><sub>mn</sub> | Stałe B<sup>x</sup><sub>mn</sub> modu E<sup>x</sup><sub>mn</sub>| Mody E<sup>y</sup><sub>mn</sub> | Stałe  B<sup>x</sup><sub>mn</sub> modu E<sup>x</sup><sub>mn</sub>|
|:----------------:|:--------------:|:---------:|:-------------------:|:---------:|:--------------------:|
|        1,00      |       1,20    |      E11  |                     |      E11  |                      |
|        1,51      |       1,90     |      E21  |                     |      E21  |                      |
|        2,01      |       2,60     |      E31  |                     |      E31  |                      |
|        2,51      |       3,31     |      E41  |                     |      E41  |                      |
|        3,02      |       4,00     |      E51  |                     |      E51  |                      |
                          
(Sprawdzić czy wartości d są ok)


Zanotowane na wszelki wypadek:

|Wartości przed skokiem|Po skoku|
|----------------------|--------|
|dx1 0,88              |   0,50 |
|dx2 1,59              |   1,20 |
|dx3 2,30              |   1,90 |
|dx4 3,01              |   2,60 |
|dx5 3,72              |   3,31 |
|dx6 4,43              |   4,00 |

|Co?                    | Wartość|
|-----------------------|--------|
|min dx1/dy1/tx1/ty1    |   0,51 |
|min dx2/dy2/tx2/ty2    |   1,00 |
|min dx3/dy3/tx3/ty3    |   1,51 |
|min dx4/dy4/tx4/ty4    |   2,01 |
|min dx5/dy5/tx5/ty5    |   2,52 |
|min dx6/dy6/tx6/ty6    |   3,02 |

