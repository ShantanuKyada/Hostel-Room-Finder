<?php
//email plugins
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require('C:\xampp\htdocs\PHPMailer\src\PHPMailer.php');
require('C:\xampp\htdocs\PHPMailer\src\Exception.php');
require('C:\xampp\htdocs\PHPMailer\src\SMTP.php');

$conn = mysqli_connect("localhost", "root", "", "hr");
$db = mysqli_select_db($conn, "hr");


if (isset($_POST['get_username_submit'])) {
  $email = $_POST['email'];

  $query = "SELECT * FROM hr_admin WHERE email = '$email' ";
  $run = mysqli_query($conn, $query);
  $count = mysqli_num_rows($run);

  while ($row = mysqli_fetch_array($run)) {
    $hr_admin_email = $row['email'];
    $hr_admin_username = $row['username'];
    $hr_admin_fname = $row['fname'];


    if ($count == 1) {
      //email
      //$to = $User_email;
      //$to_name = $user_fname;

      $subject = "Your Username.";
      $message = "Your Username is '$hr_admin_username' ";

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

      header("Location: index.php");
    }
  }
} else {
  echo '<script type="text/javascript">
    window.onload = function () { alert("You are not a Registered User."); }
    </script>';
}
