<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8" />
    <title>Mini-chat</title>
    <link rel="stylesheet" href="index.css">


</head>

<body>
    <div id="container">


        <form action="enregistrer.php" method="POST">
            <h1>Mini-Chat</h1>

            <label><b>Nom d'utilisateur</b></label>
            <input type="text" placeholder="Entrer le nom d'utilisateur" name="nom">

            <label><b>Message</b></label>
            <input type="text" placeholder="Entrer le Message" name="message">

            <input type="submit" id='submit' name="envoyer" value='Envoyer'>
            <?php


                $link = mysqli_connect("localhost", "root", "root", "minichat")
                    or die("Echec de connexion");


                $sql = "SELECT * FROM `minichat` ORDER BY id DESC LIMIT 10";
                $result = mysqli_query($link, $sql);

                while ($data = mysqli_fetch_assoc($result)) {
                    if ($data['Nom'] && $data['Message']) {
                        echo '<style> em
                                        {
                                            font-size: 18px;
                                            font-weight: bold;
                                            color: red;
                                        } </style>';
                        echo "<br><em>" . $data['Nom'] . " </em>: " . $data['Message'] . "<br>";
                    }
                }


                ?>
        </form>
    </div>

</body>

</html>