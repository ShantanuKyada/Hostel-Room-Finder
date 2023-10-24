<?php

session_start();

$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");
if (isset($_POST['submit'])) {

  $username  = $_SESSION['username'];
  $fname  = $_POST['fname'];
  $lname  = $_POST['lname'];
  $no_of_beds = "1";
  $from_date = $_POST['from_date'];
  $to_date = $_POST['to_date'];
  $hr_name = $_SESSION['hr_username'];
  $hr_admin_name = $_SESSION['hr_admin_name'];


  $query = "INSERT INTO bookings (username, fname, lname, no_of_beds, from_date, to_date, hr_name, hr_admin_name) 
	VALUES('$username', '$fname', '$lname', '$no_of_beds', '$from_date', '$to_date', '$hr_name', '$hr_admin_name')";

  if ($from_date >= date("d-m-Y")) {
    echo '<script type ="text/JavaScript">';
    echo 'alert("Check-in Date must be greater then todays date! ")';
    echo '</script>';
  } elseif ($from_date == $to_date) {
    echo '<script type ="text/JavaScript">';
    echo 'alert("Booking must be done for atleast 24 hours! ")';
    echo '</script>';
  } elseif ($from_date > $to_date) {
    echo '<script type ="text/JavaScript">';
    echo 'alert("Check-in Date must be smaller then check-out date! ")';
    echo '</script>';
  } else {
    if ($conn->query($query) === TRUE) {

      //INSERTING INTO BOOKING HISTORY TBL
      $query009 = "INSERT INTO bookings_history (username, fname, lname, no_of_beds, from_date, to_date, hr_name, hr_admin_name) 
      VALUES('$username', '$fname', '$lname', '$no_of_beds', '$from_date', '$to_date', '$hr_name', '$hr_admin_name')";
      $run088 = mysqli_query($conn, $query009);

      header("Location: bookings.php");
    } else {
      echo '<script type ="text/JavaScript">';
      echo 'alert("error while registering")';
      echo '</script>';
    }
  }
}
