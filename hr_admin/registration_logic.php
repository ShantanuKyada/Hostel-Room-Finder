<?php

session_start();

$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");
if (isset($_POST['submit'])) {

  $_SESSION['username'] = $_POST['username'];
  $username  = $_POST['username'];
  $password = $_POST['user_password'];
  $fname = $_POST['fname'];
  $lname = $_POST['lname'];
  $number   = $_POST['user_number'];
  $email  = $_POST['user_email'];
  $city = $_POST['user_city'];
  $gender  = $_POST['gender'];

  $select = "SELECT * FROM hr_admin WHERE username = '$username' || email = '$email' ";
  $results = mysqli_query($conn, $select);
  $rows = mysqli_num_rows($results);

  if ($rows === 0) {

    $query = "INSERT INTO hr_admin (username, password, fname, lname, number, email, city, gender) 
    VALUES('$username', '$password', '$fname', '$lname', $number, '$email', '$city', '$gender')";

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
