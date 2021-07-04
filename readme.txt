Vrancea Oana Roxana, 312 CD

Algoritmul Iterative - in acest algoritm am citit mai intai numarul N care 
reprezinta numarul de noduri. Am construit o matrice auxiliara matrix
in care am pus toate elementele cu care se invecineaza fiecare nod i procedand
astfel : intr-un while de la 1 la N citesc indicele nodului, i , apoi numarul de
vecini pentru a folosi un alt while in cadrul caruie sa citsc de la 1 pana la
numar vecini toate elementele pana se termina o linie si sa le inserez in matricea
auxiliara matrix.Pe baza acestei matrici construiesc matricea de adiacenta A astfel :
pentru fiecare linie i, daca gasesc un element nenul pe aceasta cu valoarea aux, 
atunci valoarea A(i,aux) va fi 1 , deoarece am gasit un nod vecin pt i. Dupa ce ma
asigur ca A va avea doar 0 pe diagonala principala, construiesc matricea diagonala
K calculand numarul de elemente nenule de pe fiecare linie a matriei A si punand
elementele pe diagonala lui K. Astfel pot calcula R cu formula data folosind
un while care se intrerupe atunci cand gasim o eroare mai mica decat cea data.

Algoritmul Algebraic - folosesc acelasi algoritm ca la Iterative de citire si
constructie ale matricelor A si K. Descompun matricea in Q si R folosind 
Gram Schmidt si rezolv sistemul de ecuatii rezolvand un SST.Dupa care aplic 
algoritmul din cerinta pentru a afla R.

Algoritmul Page Rank - la citire de pana acum continui sa citesc si ultimele
2 valori, val1 si val 2. Construiesc cu strcat un nou fisier de tipul cerut 
pentru a scrie in el N, vectorii R1 si R2 dupa ce am aplicat Iterative si
Algebraic. Ordonez descrescator toate elementele lui R2 tinand cont si de
locul ocupat initial si calculez valorile folosind functia Apartenenta.
