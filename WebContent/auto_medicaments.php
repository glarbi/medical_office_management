<?php
// si on re�oit une donn�e
if(isset($_GET['q'])) {
    $q = htmlentities($_GET['q']); // protection
     
    // connexion � la base de donn�es
    try {
        $bdd = new PDO('mysql:host=localhost;dbname=GCMDB', 'root', '');
    } catch(Exception $e) {
        exit('Impossible de se connecter � la base de donn�es.');
    }
    // �criture de la requ�te
    $requete = "SELECT NOM_MEC FROM MEDICAMENT WHERE NOM_MEC LIKE '". $q ."%'";
    // ex�cution de la requ�te
    $resultat = $bdd->query($requete) or die(print_r($bdd->errorInfo()));
    // affichage des r�sultats
    while($donnees = $resultat->fetch(PDO::FETCH_ASSOC)) {
        echo $donnees['NOM_MEC'] ."\n";
    }
}
?>