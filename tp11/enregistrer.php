<?php
include './db-config.php';

if (isset($_POST['submit'])) {
  // validate and sanitize input data
  $pseudo = filter_input(
  INPUT_POST,
    'pseudo',
  FILTER_SANITIZE_FULL_SPECIAL_CHARS
  );

  $message = filter_input(
  INPUT_POST,
    'message',
  FILTER_SANITIZE_FULL_SPECIAL_CHARS
  );

  if ($pseudo && $message) {
    // create prepared statement
    $stmt = mysqli_prepare($conn, "INSERT INTO messages (author, content) VALUES (?, ?)");

    if (!$stmt) {
      echo 'Error: ' . mysqli_error($conn);
    } else {
      // bind values to placeholders and execute statement
      mysqli_stmt_bind_param($stmt, 'ss', $pseudo, $message);
      if (mysqli_stmt_execute($stmt)) {
        // success
      } else {
        // error
        echo 'Error: ' . mysqli_error($conn);
      }
      // close statement and connection
      mysqli_stmt_close($stmt);
      mysqli_close($conn);

      // redirect to index.php
      header('Location: index.php');
    }
  }
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="utf-8" />
  <title>Enregistrer</title>
</head>

<body>
  <?php
  if (isset($_POST['submit'])) {
    if ($pseudo && $message) {
      //add to database
      $insert_query = "INSERT INTO messages (author, content) VALUES ('$pseudo', '$message');";

      if (mysqli_query($conn, $insert_query)) {
        //success
      } else {
        //error
        echo 'Error: ' . mysqli_error($conn);
      }
    }
    header('Location: index.php');
  }
  ?>
</body>

</html>