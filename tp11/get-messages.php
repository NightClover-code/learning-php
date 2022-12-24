<?php include './db-config.php' ?>

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