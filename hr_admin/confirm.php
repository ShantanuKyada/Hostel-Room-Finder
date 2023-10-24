<?php

//email plugins
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require('C:\xampp\htdocs\PHPMailer\src\PHPMailer.php');
require('C:\xampp\htdocs\PHPMailer\src\Exception.php');
require('C:\xampp\htdocs\PHPMailer\src\SMTP.php');

session_start();

// Connection
$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");

//REQUESTING BOOKING ID
$id = $_REQUEST['booking_id'];

//SELECTING QUERY
$query12 = "SELECT * FROM bookings_history WHERE booking_id = '$id' ";
$run = mysqli_query($conn, $query12);
while ($result = mysqli_fetch_array($run)) {

  //STORING DATA IN VARIABLES
  $username  = $result['username'];
  $fname  = $result['fname'];
  $lname  = $result['lname'];
  $no_of_beds = "1";
  $from_date =  $result['from_date'];
  $to_date = $result['to_date'];
  $hr_name = $result['hr_name'];
  $hr_admin_name = $result['hr_admin_name'];

  //INSERT QUERY
  $query = "INSERT INTO confirmations (booking_id, username, fname, lname, no_of_beds, from_date, to_date, hr_name, hr_admin_name) 
  VALUES($id, '$username', '$fname', '$lname', $no_of_beds, '$from_date', '$to_date', '$hr_name', '$hr_admin_name')";

  if ($conn->query($query) === TRUE) {

    //DELETING FROM BOOKING
    $query02 = "DELETE FROM bookings WHERE id = '$id' ";
    $run02 = mysqli_query($conn, $query02);


    //getting hr_Admin_email
    $query03 = "SELECT * FROM hr_table WHERE username = '$hr_name' ";
    $run03 = mysqli_query($conn, $query03);
    //fetching email & fname
    while ($result03 = mysqli_fetch_array($run03)) {
      $hr_admin_email = $result03['hr_email'];
      $hr_fullName = $result03['hr_admin_name'];
    }


    //email
    //$to = $hr_admin_email;
    //$to_name = $hr_fname;

    $subject = "Booking Confirmed";
    $message = "Thank you for staying with us!";

    $to = "philemanpiusk@gmail.com";
    $to_name = "Phileman";


    $mail = new PHPMailer(true);
    try {
      //Server settings
      $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
      $mail->isSMTP();                                            //Send using SMTP
      $mail->Host       = 'smtp.gmail.com';                       //Set the SMTP server to send through
      $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
      $mail->Username   = 'koolaphileman@gmail.com';              //SMTP username
      $mail->Password   = 'IamKoolaPhilemanPius04';               //SMTP password
      $mail->SMTPSecure = 'tls';                                  //Enable implicit TLS encryption
      $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

      //Recipients
      $mail->setFrom('koolaphileman@gmail.com', 'Phileman');
      $mail->addAddress($to, $to_name);     //Add a recipient
      //$mail->addAddress('ellen@example.com');                          //Name is optional
      $mail->addReplyTo('no-reply@gmail.com', 'No-reply');
      //$mail->addCC('cc@example.com');
      //$mail->addBCC('bcc@example.com');

      //Attachments
      //$mail->addAttachment('/var/tmp/file.tar.gz');                     //Add attachments
      //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');                //Optional name

      //Content
      $mail->isHTML(true);                                                //Set email format to HTML
      $mail->Subject = $subject;
      $mail->Body    = $message;
      //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

      $mail->send();
      echo 'Message has been sent';
    } catch (Exception $e) {
      echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
    }

    header("Location: confirmations.php");
  } else {
    echo '<script type ="text/JavaScript">';
    echo 'alert("error while registering")';
    echo '</script>';
  }
}
