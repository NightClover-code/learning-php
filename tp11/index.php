<?php include './db-config.php' ?>

<?php
$pseudoErr = $messageErr = '';

if (isset($_POST['submit'])) {
  if (empty($_POST['pseudo'])) {
    $pseudoErr = 'Pseudo is required!';
  }

  if (empty($_POST['message'])) {
    $messageErr = 'Message is required!';
  }
}
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
    <form
      action="<?php echo isset($_POST['submit']) && empty($pseudoErr) && empty($messageErr) ? 'enregistrer.php' : htmlspecialchars($_SERVER['PHP_SELF']); ?>"
      method="POST">
      <div class="in put__container">
        <label for="pseudo">Pseudo: </label>
        <input type="text" name="pseudo" id="pseudo">
        <span style="color: red"><?php echo $pseudoErr ?></span>
      </div>

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