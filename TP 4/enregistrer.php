<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="utf-8" />
        <title>Enregistrer</title>
        
      
    </head>
	<body>
       <?php 

            if(isset($_POST["envoyer"]))

         {         $link=mysqli_connect("localhost","root","root","minichat")
                        or die("Echec de connexion");
                    if($_POST["nom"] && $_POST["message"])
                    {$nom=$_POST["nom"];
                    $message=$_POST["message"];
                    $sql="INSERT INTO `minichat`(`id`, `Nom`, `Message`) VALUES (NULL,'$nom','$message')";
                    $result=mysqli_query($link,$sql);
                    
                    }
                    header('Location: index.php');

        
        }
        


       
       
       
       ?>
    </body>
</html>
