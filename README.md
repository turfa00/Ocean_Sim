# Mise en correspondance d'images parallèle

La mise en correspondance d'images est une tâche fondamentale dans de nombreux domaines.\
L'objectif de ce projet est de développer un système de mise en correspondance d'images robuste en utilisant l'algorithme de somme de différences au carré (SSD).\
Cependant, la complexité computationnelle de cet algorithme peut être élevée, en particulier pour de grandes images ou un grand nombre de correspondances.\
Donc ce programme est parallélisé avec OpenMp pour accélérer le calcul en répartissant la charge de travail entre plusieurs threads.

### Exécution
Notre code est écrit en Processing, un logiciel flexible et un langage qui se rapproche du java pour coder dans le contexte des arts visuels. 
Pour exécuter le code et voir son résultat, vous devrez télécharger et installer Processing à partir du site officiel. 
Une fois Processing installé sur votre ordinateur, vous pouvez simplement ouvrir le fichier de code dans l'IDE Processing et l'exécuter pour visualiser les résultats. 
