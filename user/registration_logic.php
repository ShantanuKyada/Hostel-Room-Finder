<?php
session_start();

$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");
if (isset($_POST['submit'])) {

  $username  = $_POST['username'];
  $password = $_POST['user_password'];

  $_SESSION['username'] = $_POST['username'];
  $_SESSION['password'] = $_POST['user_password'];

  $fname = $_POST['fname'];
  $lname = $_POST['lname'];
  $number   = $_POST['user_number'];
  $email  = $_POST['user_email'];
  $city = $_POST['user_city'];
  $gender  = $_POST['gender'];
  $g_num01    = $_POST['GNumber01'];
  $g_num02    = $_POST['GNumber02'];

  $select = "SELECT * FROM user_table WHERE username = '$username' || email = '$email' ";
  $results = mysqli_query($conn, $select);
  $rows = mysqli_num_rows($results);

  if ($rows === 0) {

    $query = "INSERT INTO user_table (username, password, fname, lname, number, email, city, gender, g_num01, g_num02) 
    VALUES('$username', '$password', '$fname', '$lname', $number, '$email', '$city', '$gender', $g_num01, $g_num02)";

    if ($conn->query($query) === TRUE) {
      header("Location: homepage.php");
    } else {
      echo '<script type ="text/JavaScript">';
      echo 'alert("error while registering")';
      echo '</script>';
    }
  } else {
    echo '<script type ="text/JavaScript">';
    echo 'alert("UserName or Email Already Exists")';
    echo '</script>';
  }
}
