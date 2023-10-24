<?php
session_start();

$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");

if (isset($_POST['submit'])) {

  $_SESSION['username'] = $_POST['username'];
  $_SESSION['password'] = $_POST['password'];


  $username = $_POST['username'];
  $password = $_POST['password'];

  $query = "SELECT * FROM user_table WHERE username = '$username' && password = '$password' ";

  $run = mysqli_query($conn, $query);
  $count = mysqli_num_rows($run);
  if ($count == 1) {
    header("Location: homepage.php");
  } else {
    echo '<script type="text/javascript">
    window.onload = function () { alert("You are not a Registered User."); }
    </script>';
  }
}
