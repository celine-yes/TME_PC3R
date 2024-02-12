# TME2

binômes: FAN Céline 28706052, Babanazarova Dilyara 28709428



On a essayé de l'implémenter avec des évènements dans ancienSystem.c 
mais on remarquera que generate ne débloque jamais le await, notamment
lorsque le consommateur doit défiler son tapis, on a donc un deadlock.
On devrait aussi protéger l'accès à l'écriture dans les fichiers journal
et au compteur mais on a le même problème, c'est pour cela qu'on l'a commenté
pour tester entre temps.
Mais en ajoutant un sleep dans la boucle conditionnelle du consommateur, on remarquera
que les consommateurs consomment quelques fruits avant de se retrouver dans une boucle infinie.

Dans systeme.c, on a essayé de combiner pthread et fthread, 
mais on se retrouve toujours avec un deadlock cela est peut être du au fait qu'
on a créé un mutex et 2 conditions mais on gère les 4 opérations avec seulement ces deux 
conditions.


