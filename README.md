
Ce projet consiste à créer un domaine et à générer un problème PDDL à partir d'un fichier JSON. Voici les étapes à suivre :

1. Placez le fichier "sokoban" dans le répertoire "pddl4j".

2. Dans le fichier "Reader.java", remplacez la variable "obj" par le test de votre choix. Assurez-vous de faire la même modification dans le fichier "Agent.java" (les deux doivent contenir le même test).

3. Exécutez le fichier "Reader.pddl" pour générer votre solution. Une fois cette étape terminée, copiez la série d'actions générées et collez-la dans le fichier "actions.txt".

4. Exécutez le fichier "Action Handler" qui générera une chaîne de caractères représentant une séquence d'actions. Copiez cette chaîne de caractères dans la variable "solution" de la classe "Agent".

5. Exécutez le fichier (cliquez sur le lien affiché dans la console). Il vous dirigera vers le jeu dans le navigateur de votre choix. Cliquez sur "Play" pour voir le garde résoudre le niveau.