<?php

session_start();


$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");
if (isset($_POST['submit'])) {

  $hr_admin_name      = $_SESSION['username'];
  $hr_username        = $_POST['hr_username'];

  $hr_name            = $_POST['hr_name'];
  $hr_type            = $_POST['hr_type'];
  $hr_address         = $_POST['hr_address'];
  $hr_city            = $_POST['hr_city'];
  $hr_number          = $_POST['hr_number'];
  $hr_email           = $_POST['hr_email'];

  $hr_laundry         = $_POST['hr_laundry'];
  $hr_food_type       = $_POST['hr_food_type'];
  $hr_bg_type         = $_POST['hr_bg'];

  $hr_total_beds      = $_POST['hr_total_beds'];
  $hr_beds_avail      = $_POST['hr_beds_avail'];
  $hr_beds_occup      = $_POST['hr_beds_occup'];

  $hr_price_per_year  = $_POST['hr_price_per_year'];
  $hr_price_per_month = $_POST['hr_price_per_month'];
  $_hr_price_per_day  = $_POST['hr_price_per_day'];

  $hr_build_img       = $_FILES['hr_build_img'];
  $hr_reception_img   = $_FILES['hr_reception_img'];
  $hr_room_img01      = $_FILES['hr_room_img01'];
  $hr_room_img02      = $_FILES['hr_room_img02'];
  $hr_restroom_img01  = $_FILES['hr_restroom01_img'];
  $hr_restroom_img02  = $_FILES['hr_restroom02_img'];



  //HR Building Image
  $filename01 = $hr_build_img['name'];
  $fileerror01 = $hr_build_img['error'];
  $filetmp01 = $hr_build_img['tmp_name'];

  $fileext01 = explode('.', $filename01);
  $filecheck01 = strtolower(end($fileext01));

  $fileextstored01 = array('png', 'jpg', 'jpeg','jfif', 'jfif');

  if (in_array($filecheck01, $fileextstored01)) {
    $destinationfile01 = '../uploads/' . $filename01;
    move_uploaded_file($filetmp01, $destinationfile01);


    //HR Reception Image
    $filename02 = $hr_reception_img['name'];
    $fileerror02 = $hr_reception_img['error'];
    $filetmp02 = $hr_reception_img['tmp_name'];

    $fileext02 = explode('.', $filename02);
    $filecheck02 = strtolower(end($fileext02));

    $fileextstored02 = array('png', 'jpg', 'jpeg','jfif');

    if (in_array($filecheck02, $fileextstored02)) {
      $destinationfile02 = '../uploads/' . $filename02;
      move_uploaded_file($filetmp02, $destinationfile02);


      //HR Room Image 01
      $filename03 = $hr_room_img01['name'];
      $fileerror03 = $hr_room_img01['error'];
      $filetmp03 = $hr_room_img01['tmp_name'];

      $fileext03 = explode('.', $filename03);
      $filecheck03 = strtolower(end($fileext03));

      $fileextstored03 = array('png', 'jpg', 'jpeg','jfif');

      if (in_array($filecheck03, $fileextstored03)) {
        $destinationfile03 = '../uploads/' . $filename03;
        move_uploaded_file($filetmp03, $destinationfile03);


        //HR Room Image 02
        $filename04 = $hr_room_img02['name'];
        $fileerror04 = $hr_room_img02['error'];
        $filetmp04 = $hr_room_img02['tmp_name'];

        $fileext04 = explode('.', $filename04);
        $filecheck04 = strtolower(end($fileext04));

        $fileextstored04 = array('png', 'jpg', 'jpeg','jfif');

        if (in_array($filecheck04, $fileextstored04)) {
          $destinationfile04 = '../uploads/' . $filename04;
          move_uploaded_file($filetmp04, $destinationfile04);


          //HR Restroom Image 01
          $filename05 = $hr_restroom_img01['name'];
          $fileerror05 = $hr_restroom_img01['error'];
          $filetmp05 = $hr_restroom_img01['tmp_name'];

          $fileext05 = explode('.', $filename05);
          $filecheck05 = strtolower(end($fileext05));

          $fileextstored05 = array('png', 'jpg', 'jpeg','jfif');

          if (in_array($filecheck05, $fileextstored05)) {
            $destinationfile05 = '../uploads/' . $filename05;
            move_uploaded_file($filetmp05, $destinationfile05);


            //HR Restroom Image 02
            $filename06 = $hr_restroom_img02['name'];
            $fileerror06 = $hr_restroom_img02['error'];
            $filetmp06 = $hr_restroom_img02['tmp_name'];

            $fileext06 = explode('.', $filename06);
            $filecheck06 = strtolower(end($fileext06));

            $fileextstored06 = array('png', 'jpg', 'jpeg','jfif');

            if (in_array($filecheck06, $fileextstored06)) {
              $destinationfile06 = '../uploads/' . $filename06;
              move_uploaded_file($filetmp06, $destinationfile06);
            }
          }
        }
      }
    }


    $select = "SELECT * FROM hr_table WHERE username = '$hr_username' || hr_email = '$hr_email' ";
    $results = mysqli_query($conn, $select);
    $rows = mysqli_num_rows($results);

    if ($rows === 0) {

      $query = "INSERT INTO `hr_table` (`id`, `username`, `hr_admin_name`, `hr_name`, `hr_type`, `hr_address`, `hr_city`, `hr_number`, `hr_email`, `hr_laundry`, `hr_food_type`, `hr_bg`, `hr_total_beds`, `hr_beds_avail`, `hr_beds_occup`, `hr_price_per_year`, `hr_price_per_month`, `hr_price_per_day`, `hr_build_img`, `hr_reception_img`, `hr_room_img01`, `hr_room_img02`, `hr_restroom01_img`, `hr_restroom02_img`)
               VALUES ('$hr_username', '$hr_admin_name', '$hr_name', '$hr_type', '$hr_address', '$hr_city', '$hr_number', '$hr_email', '$hr_laundry', '$hr_food_type', '$hr_bg_type', '$hr_total_beds', '$hr_beds_avail', '$hr_beds_occup', '$hr_price_per_year', '$hr_price_per_month', '$_hr_price_per_day', '$destinationfile01', '$destinationfile02', '$destinationfile03', '$destinationfile04', '$destinationfile05', '$destinationfile06')";

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
}
