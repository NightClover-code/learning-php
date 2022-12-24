<?php include './db-config.php' ?>

<?php
$pseudoErr = isset($_GET['pseudoErr']) ? $_GET['pseudoErr'] : '';
$messageErr = isset($_GET['messageErr']) ? $_GET['messageErr'] : '';
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="index.css">
  <title>Mini-chat</title>
</head>

<body>
  <div class="container">
    <form action="enregistrer.php" method="POST">
      <?php if (!isset($_COOKIE['name'])): ?>
      <div class="input__container">
        <label for="pseudo">Pseudo: </label>
        <input type="text" name="pseudo" id="pseudo">
        <span style="color: red"><?php echo $pseudoErr ?></span>
      </div>
      <?php endif; ?>

      <div class="input__container">
        <label for="message">Message: </label>
        <input type="text" name="message" id="message">
        <span style="color: red"><?php echo $messageErr ?></span>
      </div>

      <input type="submit" name="submit" value="Envoyer">

      <?php
      $fetch_query = "SELECT author, content FROM messages ORDER BY id DESC LIMIT 10";
      $result = mysqli_query($conn, $fetch_query);

      if (mysqli_num_rows($result) == 0) {
        echo "<p>Pas de messages!</p>";
      } else {
        echo "
          <style>
            ul{
              list-style: none;
            }
            li{
              margin-top: 20px;
            }
            span{
              color: red;
              font-weight: bold;
            }
          </style>";
        echo "<ul>";
        while ($item = mysqli_fetch_assoc($result)) {
          echo "<li>";
          echo "<span>{$item['author']}: </span>";
          echo "{$item['content']}";
          echo "</li>";
        }
        echo "</ul>";
      }
      ?>
    </form>
  </div>
</body>

</html>