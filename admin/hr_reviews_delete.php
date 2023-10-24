<?php

ob_start();

$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");
$id = $_REQUEST['id'];
$query = "DELETE FROM hr_feedback WHERE id = '$id' ";
$run = mysqli_query($conn, $query);
if ($conn->query($query) === TRUE) {
  header("Location: hr_reviews.php");
}


ob_flush();
