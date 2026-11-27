| ID   | Test                         | Jeu          | Résultat attendu | Résultat obtenu | Statut |
| ---- | ---------------------------- | ------------ | ---------------- | --------------- | ------ |
| P-01 | Insertion de 5 membres       | Positif      | Réussite         | Réussite        | PASS   |
| P-02 | Insertion de 5 livres        | Positif      | Réussite         | Réussite        | PASS   |
| P-03 | Insertion de 5 emprunts      | Positif      | Réussite         | Réussite        | PASS   |
| N-01 | Numéro de carte en double    | Négatif      | Refus            | Refus           | PASS   |
| N-02 | Email invalide               | Négatif      | Refus            | Refus           | PASS   |
| N-03 | ISBN incorrect               | Négatif      | Refus            | Refus           | PASS   |
| N-04 | Prix négatif                 | Négatif      | Refus            | Refus           | PASS   |
| N-05 | Membre inexistant            | Négatif      | Refus            | Refus           | PASS   |
| N-06 | Date incohérente             | Négatif      | Refus            | Refus           | PASS   |
| L-01 | Email de 100 caractères      | Limite       | Réussite         | Réussite        | PASS   |
| L-02 | ISBN de 10 caractères        | Limite       | Réussite         | Réussite        | PASS   |
| L-03 | Zéro exemplaire disponible   | Limite       | Réussite         | Réussite        | PASS   |
| L-04 | Prix maximal (999999.99)     | Limite       | Réussite         | Réussite        | PASS   |
| L-05 | Année minimale (1000)        | Limite       | Réussite         | Réussite        | PASS   |
| L-06 | Statut perdu                 | Limite       | Réussite         | Réussite        | PASS   |
| V-01 | Unicité des numéros de carte | Vérification | PASS             | PASS            | PASS   |
| V-02 | Format des emails            | Vérification | PASS             | PASS            | PASS   |
| V-03 | FK emprunts→membres          | Vérification | PASS             | PASS            | PASS   |
| V-04 | Disponibles ≤ total          | Vérification | PASS             | PASS            | PASS   |
| V-05 | Dates cohérentes             | Vérification | PASS             | PASS            | PASS   |
