<!DOCTYPE html>
<html lang="en">

<head>
  <!--Bootstrap-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  <!--Style Sheet-->
  <style>
    .background {
      background-color: #FFFFFF;
      font-family: 'Times New Roman', Times, serif;
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

<body>
  <section class="background">
    <?php
    session_start();
    //ADMIN NAME 
    $username = $_SESSION['username'];
    ?>

    <header>
      <!--Log-Out-->
      <div>
        <a href="../index.php"><button class="btn m-1 float-end" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button"><b>Log Out</b></button></a>
      </div>

      <!--Title-->
      <div class="text-start">
        <h1 style="color: #800000;">Hostel/Room Finder</h1>
      </div>

      <!--NavBar-->
      <nav id="navbar_top" style="background-color: #800000;" class="navbar navbar-expand-lg">
        <button class="navbar-toggler " style="border-radius:10px; background-color: #800000; color:#800000; border:#FFFFFF solid;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler" style="color:#FFFFFF;">Menu</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active " style="color: #FFFFFF;" aria-current="page" href="homepage.php"><b>Hello <?php echo "$username"; ?></b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #FFFFFF;" aria-current="page" href="bookings.php"><b>Bookings</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #FFFFFF;" aria-current="page" href="confirmations.php"><b>Confirmed Booking</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #FFFFFF;" aria-current="page" href="checked_in.php"><b>Checked-in</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #FFFFFF;" aria-current="page" href="hostels.php"><b>Hostels</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #FFFFFF;" aria-current="page" href="rooms.php"><b>Rooms</b></a>
            </li>
      </nav>
      <!--NavBar END-->
    </header>



    <!--PHP Code For Connection-->
    <?php
    $conn = mysqli_connect("localhost", "root", "", "hr");
    $db = mysqli_select_db($conn, "hr");
    //EXTRACTING BOOKING ID
    $id = $_REQUEST['booking_id'];
    $_SESSION['booking_id'] = $id;
    $query = "SELECT * FROM confirmations WHERE booking_id = '$id'     ";
    $run = mysqli_query($conn, $query);
    ?>
    <div class="jumbotron text-center" style="color: #FFFFFF;">
      <h4><b>Details</b></h4>
    </div>
    <?php
    while ($result = mysqli_fetch_array($run)) {
      //HR USERNAME
      $_SESSION['hr_username'] = $result['hr_name'];
      //Username
      $user_name = $result['username'];

    ?>
      <div class="container py-5 h-auto">
        <div class="row justify-content-center align-items-center h-auto">
          <div class="col-xxl-11">
            <div class="container p-5 " style="background-color: #800000; border-radius: 15px;">
              <div class="jumbotron text-center" style="color: #FFFFFF;">
                <h4><b>Booking Details</b></h4>
              </div>
              <div class="row g-2">
                <div class="col-6">
                  <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>First Name</b><br><?php echo $result['fname']; ?></div>
                </div>
                <div class="col-6">
                  <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Last Name</b><br><?php echo $result['lname']; ?></div>
                </div>
                <div class="col-6">
                  <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>check-in Date</b><br><?php echo $result['from_date']; ?></div>
                </div>
                <div class="col-6">
                  <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Check-out Date</b><br><?php echo $result['to_date']; ?></div>
                </div>
                <div class="col-6">
                  <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>No Of Beds</b><br><?php echo $result['no_of_beds']; ?></div>
                </div>



                <!--User Details-->
                <div class="jumbotron text-center" style="color: #FFFFFF;">
                  <h4><b>User Details</b></h4>
                </div>
                <?php
                $conn = mysqli_connect("localhost", "root", "", "hr");
                $db = mysqli_select_db($conn, "hr");
                $query02 = "SELECT * FROM user_table WHERE username = '$user_name' ";
                $run02 = mysqli_query($conn, $query02);
                while ($result02 = mysqli_fetch_array($run02)) {
                ?>
                  <div class="col-6">
                    <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Mobile Number</b><br><?php echo $result02['number']; ?></div>
                  </div>
                  <div class="col-6">
                    <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Email</b><br><?php echo $result02['email']; ?></div>
                  </div>
                  <div class="col-6">
                    <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>City</b><br><?php echo $result02['city']; ?></div>
                  </div>
                  <div class="col-6">
                    <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Gender</b><br><?php echo $result02['gender']; ?></div>
                  </div>
                  <div class="col-6">
                    <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Guardian Number</b><br><?php echo $result02['g_num01']; ?></div>
                  </div>
                  <div class="col-6">
                    <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Guardian Number</b><br><?php echo $result02['g_num02']; ?></div>
                  </div>
              </div>

              <!--OPTIONS-->
              <br>
              <a class="btn " type="button" style="background-color: #FFFFFF;color: #800000; border-style: solid; border-color:#045E5E; color: #800000" <?php echo " href=confirmations.php>Go Back</a>"; ?> <button class="btn" type="button" style="background-color: #FFFFFF;color: #800000; border-style: solid; border-color:#045E5E; color: #800000" aria-current="page" data-bs-toggle="offcanvas" data-bs-target="#cancel" aria-controls="offcanvasTop">Cancel</button>

            </div>
          <?php
                }
          ?>
          </div>
        </div>
      </div>



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



    <?php } ?>



    <!-- Footer -->
    <footer class="text-center text-lg-start text-white" style="background-color:#800000; color:#FFFFFF;" style="align-content: center;">
      <!-- Section: Social media -->
      <section class="d-flex justify-content-between p-4" style="background-color: grey">
        <!-- Right -->
      </section>
      <!-- Section: Links  -->
      <section class="">
        <div class="container text-center text-md-start mt-5">
          <!-- Grid row -->
          <div class="row mt-3">
            <!-- Grid column -->
            <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
              <!-- Content -->
              <div class="text-uppercase fw-bold font-monospace" style="color:#FFFFFF;">Hostel Room Finder</div>
              <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; height: 2px" />
              <p style="color:#FFFFFF;">
                Best place to get your desired Hostel / Room according to your needs.
              </p>
            </div>
            <!-- Grid column -->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
              <!-- Links -->
              <div class="text-uppercase fw-bold font-monospace" style="color:#FFFFFF;">Add your Hostel/Room</div>
              <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; height: 2px" />
              <p>
                <a href="../hr_admin/registration.php" style="color:#FFFFFF;">Join Us</a>
              </p>
              <p>
                <a href="../hr_admin/login.php" style="color:#FFFFFF;">Log-in</a>
              </p>
            </div>
            <!-- Grid column -->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
              <!-- Links -->
              <div class="text-uppercase fw-bold font-monospace" style="color:#FFFFFF;">Useful links</div>
              <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; height: 2px" />
              <p>
                <a href="../get_username.php" style="color:#FFFFFF;">Get Username</a>
              </p>
              <p>
                <a href="../get_hr_admin_username.php" style="color:#FFFFFF;">Get HR Admin Username</a>
              </p>
              <p>
                <a href="../get_hr_username.php" style="color:#FFFFFF;">Get HR Username</a>
              </p>
            </div>
            <!-- Grid column -->
            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
              <!-- Contact Us -->
              <div class="text-uppercase fw-bold font-monospace" style="color:#FFFFFF;">Contact Us</div>
              <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;  height: 2px" />
              <p style="color:#FFFFFF;"><i class="fas fa-home mr-3"></i> Rajkot, Gujarat</p>
              <p style="color:#FFFFFF;"><i class="fas fa-envelope mr-3"></i> hrFinder@gmail.com</p>
              <p style="color:#FFFFFF;"><i class="fas fa-phone mr-3"></i> + 91 1234567890</p>
            </div>
          </div>
        </div>
      </section>
      <!-- Section: Links  -->
      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        <span style="color:#FFFFFF;">© 2022 Copyright:</span>
        <a href="index.php" style="color:#FFFFFF;">Hostel Room Finder</a>
      </div>
      <!-- Copyright END-->
    </footer>
    <!-- Footer END-->



  </section>
</body>

</html>

</html>