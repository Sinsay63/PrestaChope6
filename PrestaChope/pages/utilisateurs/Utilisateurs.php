<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="assets/css/utilisateurs.css"/>
    </head>
    <body>
        <main>
            <div class="page_users_container">
                <h1 >LISTE UTILISATEURS</h1>
                <?php
                $users = ControllerUtilisateurs::getAllUsers();

                foreach ($users as $value) {
                    echo ' Utilisateur -> ' . $value[0]->getPseudo() . '<br>';
                    echo $value[1][0] . ' commande(s) effectuée(s).';
                    ?>
                <a href="index.php?page=deleteUser&id=<?php echo $value[0]->getId(); ?>"><button style="color:red;">Supprimer l'utilisateur</button></a>
                    <br><br>
                    <?php
                }
                ?>
            </div>
        </main>
    </body>
</html>