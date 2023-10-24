<!DOCTYPE html>
<html lang="en">

<head>
  <!--Bootstrap Links-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
  <!-- Bootstrap Font Icon CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">


  <!--Style Sheet-->
  <style>
    .background {
      background: #FFFFFF;
      font-family: 'Times New Roman', Times, serif;
    }
  </style>

  <!--STYLE FOR FEEDBACK STAR-->
  <style>
    div.stars {
      width: 270px;
      display: inline-block
    }

    .mt-200 {
      margin-top: 200px
    }

    input.star {
      display: none
    }

    label.star {
      float: right;
      padding: 10px;
      font-size: 36px;
      color: #FFFFFF;
      transition: all .2s
    }

    input.star:checked~label.star:before {
      content: '\f005';
      color: #FD4;
      transition: all .25s
    }

    input.star-5:checked~label.star:before {
      color: #FE7;
      text-shadow: 0 0 20px #952
    }

    input.star-1:checked~label.star:before {
      color: #F62
    }

    label.star:hover {
      transform: rotate(-15deg) scale(1.3)
    }

    label.star:before {
      content: '\f006';
      font-family: FontAwesome
    }
  </style>

  <!--JavaScript Program for Sticky NavBar-->
  <script>
    document.addEventListener("DOMContentLoaded", function() {
      window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
          document.getElementById('navbar_top').classList.add('fixed-top');
          // add padding top to show content behind navbar
          navbar_height = document.querySelector('.navbar').offsetHeight;
          document.body.style.paddingTop = navbar_height + 'px';
        } else {
          document.getElementById('navbar_top').classList.remove('fixed-top');
          // remove padding top from body
          document.body.style.paddingTop = '0';
        }
      });
    });
  </script>
</head>

<body class="background">
  <section>

    <!--SESSION START-->
    <?php
    session_start();
    ob_start();
    $username = $_SESSION['username'];
    ?>


    <!--CONTAINER-->
    <div class="container py-5 h-auto">
      <div class="row justify-content-center align-items-center h-auto">
        <div class="col-xxl-11">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
            <div class="card-body p-4" style="background-color: #800000; border-radius: 15px;">

              <!--Program to fetch and display bookings details-->
              <?php
              $conn = mysqli_connect("localhost", "root", "", "hr");
              $db = mysqli_select_db($conn, "hr");
              $id = $_REQUEST['id'];
              $_SESSION['id'] = $id;
              $query = "SELECT * FROM bookings WHERE id = '$id' ";
              $run = mysqli_query($conn, $query);
              while ($result = mysqli_fetch_array($run)) {
                $_SESSION['hr_username'] = $result['username'];
                $_SESSION['hr_admin_name'] = $result['hr_admin_name'];
                $hr_name = $result['hr_name'];
              ?>
                <!--Title-->
                <h2 class=" text-center" style=" color: #FFFFFF;"><b>Details</b></h2>
                <!--DETAILS-->
                <div class="row justify-content-around ">
                  <div class="col-md-6 mb-4 w-50">
                    <div class="p-3 border" style="border-radius: 15px; background-color: #FFFFFF; color:#800000"><b>First Name</b><br><?php echo $result['fname']; ?></div>
                  </div>
                  <div class="col-md-6 mb-4 w-50">
                    <div class="p-3 border" style="border-radius: 15px; background-color: #FFFFFF; color:#800000;"><b>Last Name</b><br><?php echo $result['lname']; ?></div>
                  </div>
                  <div class="col-md-6 mb-4 w-50">
                    <div class="p-3 border" style="border-radius: 15px; background-color: #FFFFFF; color:#800000;"><b>Check-in Date</b><br><?php echo $result['from_date']; ?></div>
                  </div>
                  <div class="col-md-6 mb-4 w-50">
                    <div class="p-3 border" style="border-radius: 15px; background-color: #FFFFFF; color:#800000;"><b>Check-out Date</b><br><?php echo $result['to_date']; ?></div>
                  </div>
                  <div class="col-md-6 mb-4 w-50">
                    <div class="p-3 border" style="border-radius: 15px; background-color: #FFFFFF; color:#800000;"><b>Beds Booked</b><br><?php echo $result['no_of_beds']; ?></div>
                  </div>
                  <div class="col-md-6 mb-4 w-50">
                    <!--Program to get User Details-->
                    <?php
                    $conn = mysqli_connect("localhost", "root", "", "hr");
                    $db = mysqli_select_db($conn, "hr");
                    $query02 = "SELECT * FROM hr_table WHERE username = '$hr_name' ";
                    $run02 = mysqli_query($conn, $query02);
                    while ($result02 = mysqli_fetch_array($run02)) {
                    ?>
                      <div class="p-3 border border" style="border-radius: 15px; background-color: #FFFFFF; color:#800000;"><b>Hostel/Room Name</b><br><?php echo $result02['hr_name']; ?></div>
                    <?php } ?>
                  </div>
                  <a class="btn w-25" type="button" style="background-color: #FFFFFF;color: #800000; border-style: solid; border-color:#045E5E; color: #800000" <?php echo " href=bookings.php>Go Back</a>"; ?> <button class="btn w-25" type="button" style="background-color: #FFFFFF;color: #800000; border-style: solid; border-color:#045E5E; color: #800000" aria-current="page" data-bs-toggle="offcanvas" data-bs-target="#cancel" aria-controls="offcanvasTop">Cancel</button>

                </div>
                <!--DETAILS END-->



                <!--Off Canvas Cancellation-->
                <div class="offcanvas offcanvas-top h-auto" tabindex="-1" id="cancel" aria-labelledby="offcanvasTopLabel">
                  <div class="offcanvas-header">
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                  </div>
                  <div class="offcanvas-body" style="background-color: #FFFFFF;">
                    <div class="container  h-auto">
                      <div class="row justify-content-center align-items-center h-auto">
                        <div class="col-9 col-lg-9 col-xxl-5">
                          <div class="card shadow-2-strong card-registration " style="border-radius: 15px;">
                            <div class="card-body p-4" style="background-color: #800000; border-radius: 15px;">
                              <!--Center Text-->
                              <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;"><b>Cancellation Form</b></h3>
                              <!--Form Tag-->
                              <form action="cancel.php" method="post">
                                <?php
                                $username = $_SESSION['username'];
                                ?>
                                <!--Row 01-->
                                <div class="row justify-content-center">
                                  <!--Username-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input type="text" name="username" style="background-color: #FFFFFF; color:#800000" id="UserName" value="<?php echo "$username"; ?>" class="form-control form-control-md" disabled />
                                      <label class="form-label" style="color: #FFFFFF;" for="UserName">Username</label>
                                    </div>
                                  </div>
                                  <!--First Name-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input type="text" name="fname" style="background-color: #FFFFFF; color:#800000" id="fname" value="<?php echo $result['fname']; ?>" class="form-control form-control-md" disabled />
                                      <label class="form-label" style="color: #FFFFFF;" for="fname">First Name</label>
                                    </div>
                                  </div>
                                </div>
                                <!--Row 02-->
                                <div class="row justify-content-center">
                                  <!--Last Name-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input type="text" name="lname" style="background-color: #FFFFFF; color:#800000" id="lname" value="<?php echo $result['lname']; ?>" class="form-control form-control-md" disabled />
                                      <label class="form-label" style="color: #FFFFFF;" for="lname">Last Name</label>
                                    </div>
                                  </div>
                                  <!--No Of Beds-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input type="number" style="background-color: #FFFFFF; color:#800000" name="no_of_beds" id="no_of_beds" value="<?php echo $result['no_of_beds']; ?>" class="form-control form-control-md" disabled />
                                      <label class="form-label" style="color: #FFFFFF;" for="no_of_beds">No. Of Beds</label>
                                    </div>
                                  </div>
                                </div>
                                <!--Row 03-->
                                <div class="row justify-content-center">
                                  <!--Check-In Date-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input type="date" style="background-color: #FFFFFF; color:#800000" name="from_date" value="<?php echo $result['from_date']; ?>" id="from_date" class="form-control form-control-md" disabled />
                                      <label class="form-label" style="color: #FFFFFF;" for="from_date">From</label>
                                    </div>
                                  </div>
                                  <!--Check-Out Date-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input type="date" style="background-color: #FFFFFF; color:#800000" name="to_date" value="<?php echo $result['to_date']; ?>" id="to_date" class="form-control form-control-md" disabled />
                                      <label class="form-label" style="color: #FFFFFF;" for="to_date">To</label>
                                    </div>
                                  </div>
                                </div>
                                <!--Row 04-->
                                <div class="row justify-content-center">
                                  <!--Submit Button-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input class="btn btn-md" style="background-color: #FFFFFF; color:#800000;" name="submit" type="submit" value="Submit">
                                    </div>
                                  </div>
                                </div>
                                <!--Row 05 HIDDEN DETAILS-->
                                <div class="row justify-content-center">
                                  <!--HR USERNAME-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input type="hidden" name="hr_name" id="hr_name" value="<?php echo $_SESSION['hr_username']; ?>" class="form-control form-control-md" disabled />
                                    </div>
                                  </div>
                                  <!--HR ADMIN Username-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="form-outline">
                                      <input type="hidden" name="hr_admin_name" id="hr_admin_name" value="<?php echo $_SESSION['hr_admin_name']; ?>" class="form-control form-control-md" disabled />
                                    </div>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--Off Canvas for Cancellation END-->



                <!--Off Canvas Feedback-->
                <div class="offcanvas offcanvas-top h-auto" tabindex="-1" id="feedback" aria-labelledby="offcanvasTopLabel">
                  <div class="offcanvas-header">
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                  </div>
                  <div class="offcanvas-body" style="background-color: #FFFFFF;">
                    <div class="container  h-auto">
                      <div class="row justify-content-center align-items-center h-auto">
                        <div class="col-9 col-lg-9 col-xxl-5">
                          <div class="card shadow-2-strong card-registration " style="border-radius: 15px;">
                            <div class="card-body p-4" style="background-color: #800000; border-radius: 15px;">
                              <!--Center Text-->
                              <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;"><b>Feedback</b></h3>
                              <form action="" method="post">
                                <?php
                                $username = $_SESSION['username'];
                                ?>
                                <!--Row 01-->
                                <div class="row justify-content-center">
                                  <!--Rate-->
                                  <div class="col-md-6 mb-4 w-auto">
                                    <div class="stars">
                                      <input class="star star-5" value="5" id="star-5" type="radio" name="star" /> <label class="star star-5" for="star-5"></label> <input class="star star-4" id="star-4" value="4" type="radio" name="star" /> <label class="star star-4" for="star-4"></label> <input class="star star-3" value="3" id="star-3" type="radio" name="star" /> <label class="star star-3" for="star-3"></label> <input class="star star-2" id="star-2" value="2" type="radio" name="star" /> <label class="star star-2" for="star-2"></label> <input class="star star-1" id="star-1" value="1" type="radio" name="star" /> <label class="star star-1" for="star-1"></label>
                                    </div>
                                    <input type="text" name="message" style="background-color: #FFFFFF; color:#800000" id="message" class="form-control form-control-md" required />
                                    <label class="form-label" style="color: #FFFFFF;" for="message">Message</label>
                                  </div>
                                </div>
                                <!--HIDDEN DETAILS-->
                                <div class="row justify-content-center">
                                  <input type="hidden" name="username" value="<?php echo $result['username'] ?>">
                                  <input type="hidden" name="hr_name" value="<?php echo $result['hr_name'] ?>">
                                  <input type="hidden" name="hr_admin_name" value="<?php echo $result['hr_admin_name'] ?>">
                                  <input type="hidden" name="fname" value="<?php echo $result['fname']; ?>" class="text-box">
                                  <input type="hidden" name="lname" value="<?php echo $result['lname']; ?>" class="text-box">
                                  <button class="btn w-25" type="submit" name="feedback_submit" style="background-color: #FFFFFF;color: #800000; border-style: solid; border-color:#045E5E; color: #800000">Rate</button>
                                </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--Off Canvas for Feedback END-->



                <!--Feedback LOGIC-->
                <?php
                $conn  = mysqli_connect("localhost", "root", "", "hr");
                $db = mysqli_select_db($conn, "hr");

                if (isset($_POST['feedback_submit'])) {
                  $username = $_POST['username'];
                  $fname = $_POST['fname'];
                  $lname = $_POST['lname'];
                  $message = $_POST['message'];
                  $rating = $_POST['star'];
                  $hr_name = $_POST['hr_name'];
                  $hr_admin_name = $_POST['hr_admin_name'];
                  $id =  $_REQUEST['id'];

                  $check_query = "SELECT * FROM hr_feedback WHERE booking_id = '$id' ";
                  $query = "INSERT INTO hr_feedback (username, booking_id, fname, lname, rating, message, hr_name, hr_admin_name) VALUES ('$username', '$id', '$fname', '$lname', '$rating', '$message', '$hr_name', '$hr_admin_name')";
                  $run02 = mysqli_query($conn, $check_query);
                  $count = mysqli_num_rows($run02);

                  if ($count >= 1) {
                    echo '<script type ="text/JavaScript">';
                    echo 'alert("You have already rated this hr")';
                    echo '</script>';
                  } elseif ($conn->query($query) === TRUE) {
                    header("Location: bookings.php");
                  } else {
                    echo '<script type ="text/JavaScript">';
                    echo 'alert("error while registering your feedback")';
                    echo '</script>';
                  }
                }
                ?>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--CONTAINER END-->


    <!--SESSION END-->
  <?php
              }
              ob_flush();
  ?>
  </section>
</body>

</html>