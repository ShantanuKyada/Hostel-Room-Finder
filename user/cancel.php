<?php

//email plugins
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require('C:\xampp\htdocs\PHPMailer\src\PHPMailer.php');
require('C:\xampp\htdocs\PHPMailer\src\Exception.php');
require('C:\xampp\htdocs\PHPMailer\src\SMTP.php');



//SESSION START
session_start();

//FETCHING DATA
$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");
if (isset($_POST['submit'])) {

  $id = $_SESSION['id'];
  $username  = $_SESSION['username'];
  $fname  = $_POST['fname'];
  $lname  = $_POST['lname'];
  $no_of_beds = $_POST['no_of_beds'];
  $from_date = $_POST['from_date'];
  $to_date = $_POST['to_date'];
  $hr_name = $_SESSION['hr_username'];
  $hr_admin_name = $_SESSION['hr_admin_name'];

  //DELETING FROM BOOKINGS TBL
  $delete_from_bookings_query = "DELETE FROM bookings WHERE id = '$id' ";

  //INSERTING INTO CANCELLATIONS TBL
  $insert_query = "INSERT INTO cancellations (booking_id, username, fname, lname, no_of_beds, from_date, to_date, hr_name, hr_admin_name) 
  VALUES($id, '$username', '$fname', '$lname', '$no_of_beds', '$from_date', '$to_date', '$hr_name', '$hr_admin_name')";
  $insert_run = mysqli_query($conn, $insert_query);

  if ($conn->query($delete_from_bookings_query) === TRUE) {

    //getting hr_Admin_email
    $get_email_query = "SELECT * FROM hr_table WHERE username = '$hr_name' ";
    $get_email_run = mysqli_query($conn, $get_email_query);
    //fetching email & fname
    while ($get_email_result = mysqli_fetch_array($get_email_run)) {
      $hr_admin_email = $get_email_result['email'];
      $hr_fname = $get_email_result['fname'];
    }
    //email
    //$to = $hr_admin_email;
    //$to_name = $hr_fname;

    $subject = "Cancellation of Hotel Room Reservation";
    $message = " $fname $lname have cancelled their booking from your Hostel/Room. ";

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

    header("Location: bookings.php");
  } else {
    echo '<script type ="text/JavaScript">';
    echo 'alert("error while registering")';
    echo '</script>';
  }
}
