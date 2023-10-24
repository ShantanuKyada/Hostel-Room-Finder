<!DOCTYPE html>
<html lang="en">

<head>
  <!--Bootstrap-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


  <!--Style Sheet-->
  <style>
    .background {
      background-image: linear-gradient(to right, #aaf0d1, #68cac4, #23a2b6, #007aa4, #005187, #005187, #005187, #005187, #007aa4, #23a2b6, #68cac4, #aaf0d1);
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

    <!--SESSION START-->
    <?php
    session_start();
    $username = $_SESSION['username'];
    ?>

    <!--HEADER-->
    <header>

      <!--Log-Out-->
      <div>
        <a href="../index.php"><button class="btn m-1 float-end" style="background-color: #AAF0D1; color: #151B54; border-style: solid; border-color:#045E5E;" type="button"><b>Log Out</b></button></a>
      </div>

      <!--Title-->
      <div class="text-start">
        <h1 style="color: #151B54;">Hostel/Room Finder</h1>
      </div>

      <!--NavBar-->
      <nav id="navbar_top" style="background-color: #151B54;" class="navbar navbar-expand-lg">
        <button class="navbar-toggler " style="border-radius:10px; background-color: #800000; color:#800000; border:#FFFFFF solid;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler" style="color:#151B54;">Menu</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active " style="color: #AAF0D1;" aria-current="page" href="#"><b>Hello <?php echo "$username"; ?></b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #AAF0D1;" aria-current="page" href="bookings.php"><b>Bookings</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #AAF0D1;" aria-current="page" href="confirmations.php"><b>Confirmed Booking</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #AAF0D1;" aria-current="page" href="checked_in.php"><b>Checked-in</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #AAF0D1;" aria-current="page" href="hostels.php"><b>Hostels</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active " style="color: #AAF0D1;" aria-current="page" href="rooms.php"><b>Rooms</b></a>
            </li>
          </ul>

      </nav>
      <!--NavBar END-->
    </header>
    <!--HEADER END-->



    <!--CONTAINER FOR DISPLAYING HR DATA-->
    <div class="container py-5 h-auto">
      <div class="row justify-content-center align-items-center h-auto">
        <div class="col-xxl-11">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color:#151B54;">
            <div class="card-body p-4 p-md-5">
              <!--Program to fetch and display Hostel/Room Description-->
              <?php
              $conn = mysqli_connect("localhost", "root", "", "hr");
              $db = mysqli_select_db($conn, "hr");
              $hr_name = $_REQUEST['username'];
              $query = "SELECT * FROM hr_table WHERE username = '$hr_name' ";
              $run = mysqli_query($conn, $query);
              while ($result = mysqli_fetch_array($run)) {

                $_SESSION['hr_username'] = $result['username'];
                $_SESSION['hr_admin_name'] = $result['hr_admin_name'];
              ?>
                <!--Title-->
                <div class="jumbotron text-center">
                  <h2 style="color: #AAF0D1;"><?php echo $result['hr_name']; ?></h2>
                </div>
                <!--Carousel-->
                <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <img src="<?php echo $result['hr_build_img']; ?>" style="height:500px; width: 1000px;" class="img-fluid rounded mx-auto d-block">
                    </div>
                    <div class="carousel-item">
                      <img src="<?php echo $result['hr_reception_img']; ?>" style="height:500px; width: 1000px;" class="img-fluid rounded mx-auto d-block">
                    </div>
                    <div class="carousel-item">
                      <img src="<?php echo $result['hr_room_img01']; ?>" style="height:500px; width: 1000px;" class="img-fluid rounded mx-auto d-block">
                    </div>
                    <div class="carousel-item">
                      <img src="<?php echo $result['hr_room_img02']; ?>" style="height:500px; width: 1000px;" class="img-fluid rounded mx-auto d-block">
                    </div>
                    <div class="carousel-item">
                      <img src="<?php echo $result['hr_restroom01_img']; ?>" style="height:500px; width: 1000px;" class="img-fluid rounded mx-auto d-block">
                    </div>
                    <div class="carousel-item">
                      <img src="<?php echo $result['hr_restroom02_img']; ?>" style="height:500px; width: 1000px;" class="img-fluid rounded mx-auto d-block">
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true" style=" background-color:#800000"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true" style=" background-color:#800000"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>

                <br>

                <!--CONTAINER FOR DISPLAYING HR IMAGES-->
                <div class="container">
                  <div class="row g-2">
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Hostel / Room</b><br><?php echo $result['hr_type']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Boys / Girls</b><br><?php echo $result['hr_bg']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Address</b><br><?php echo $result['hr_address']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>City</b><br><?php echo $result['hr_city']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Phone Number</b><br><?php echo $result['hr_number']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px;background-color:#AAF0D1; color:#151B54"><b>Email</b><br><?php echo $result['hr_email']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Laundry</b><br><?php echo $result['hr_laundry']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Food</b><br><?php echo $result['hr_food_type']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Total Beds</b><br><?php echo $result['hr_total_beds']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Beds Available</b><br><?php echo $result['hr_beds_avail']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Price per Year</b><br><?php echo $result['hr_price_per_year']; ?></div>
                    </div>
                    <div class="col-6">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54"><b>Price per Month</b><br><?php echo $result['hr_price_per_month']; ?></div>
                    </div>
                  </div>
                  <button class="btn m-1" type="button" aria-current="page" data-bs-toggle="offcanvas" data-bs-target="#book" aria-controls="offcanvasTop" style="background-color: #AAF0D1; color: #151B54; border-style: solid; border-color:#045E5E;"><b>Book</b></button>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--END CONTAINER FOR DISPLAYING HR DATA-->
  <?php
              }
  ?>



  <!--CONTAINER FOR DISPLAYING HR REVIEWS-->
  <div class="container py-5 h-auto">
    <div class="row justify-content-center align-items-center h-auto">
      <div class="col-xxl-11">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color:#151B54;">
          <div class="card-body p-4 p-md-5">
            <!--Title-->
            <div class="jumbotron text-center">
              <h2 style="color: #AAF0D1;">Reviews</h2>
            </div>
            <!--Program to Display HR Reviews-->
            <?php
            $conn = mysqli_connect("localhost", "root", "", "hr");
            $db = mysqli_select_db($conn, "hr");
            $hr_name = $_REQUEST['username'];
            $query05 = "SELECT * FROM hr_feedback WHERE hr_name = '$hr_name' ";
            $run05 = mysqli_query($conn, $query05);
            $count = mysqli_num_rows($run05);
            if ($count >= 1) {
              while ($result05 = mysqli_fetch_array($run05)) {
            ?>
                <div class="container">
                  <div class="row g-2 m-3">
                    <div class="col-75">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#AAF0D1; color:#151B54">
                        <b><?php echo $result05['fname']; ?> <?php echo $result05['lname']; ?></b><br>
                        <?php echo $result05['message']; ?>
                      </div>
                    </div>
                  </div>
                </div>
              <?php
              }
            } else { ?>
              <div class="container">
                <div class="row g-2 m-3">
                  <div class="col-75">
                    <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000">
                      <b>
                        No Reviews
                      </b>
                    </div>
                  </div>
                </div>
              </div>
            <?php
            }
            ?>

          </div>
        </div>
      </div>
    </div>
  </div>
  <!--END CONTAINER FOR DISPLAYING HR REVIEWS-->



  <!--Off Canvas for BOOKING-->
  <div class="offcanvas offcanvas-top h-auto" tabindex="-1" id="book" aria-labelledby="offcanvasTopLabel">
    <div class="offcanvas-header">
      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body" style="background-color: #FFFFFF;">
      <div class="container  h-auto">
        <div class="row justify-content-center align-items-center h-auto">
          <div class="col-12 col-lg-9 col-xxl-7">
            <div class="card shadow-2-strong card-registration m-5" style="border-radius: 15px;">
              <div class="card-body p-4" style="background-color: #800000; border-radius: 15px;">
                <!--Center Text-->
                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;"><b>Booking Form</b></h3>
                <!--Form Tag-->
                <form action="book.php" method="post">
                  <!--Program-->
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
                        <input type="text" name="fname" style="background-color: #FFFFFF; color:#800000" id="fname" class="form-control form-control-md" />
                        <label class="form-label" style="color: #FFFFFF;" for="fname">First Name</label>
                      </div>
                    </div>
                  </div>
                  <!--Row 02-->
                  <div class="row justify-content-center">
                    <!--Last Name-->
                    <div class="col-md-6 mb-4 w-auto">
                      <div class="form-outline">
                        <input type="text" name="lname" style="background-color: #FFFFFF; color:#800000" id="lname" class="form-control form-control-md" />
                        <label class="form-label" style="color: #FFFFFF;" for="lname">Last Name</label>
                      </div>
                    </div>
                    <!--No. Of Beds-->
                    <div class="col-md-6 mb-4 w-auto">
                      <div class="form-outline">
                        <input type="number" name="no_of_beds" style="background-color: #FFFFFF; color:#800000" value="1" id="no_of_beds" class="form-control form-control-md" disabled />
                        <label class="form-label" style="color: #FFFFFF;" for="no_of_beds">No. Of Beds</label>
                      </div>
                    </div>
                  </div>
                  <!--Row 03-->
                  <div class="row justify-content-center">
                    <!--Check-in Date-->
                    <div class="col-md-6 mb-4 w-auto">
                      <div class="form-outline">
                        <input type="date" name="from_date" style="background-color: #FFFFFF; color:#800000" id="from_date" class="form-control form-control-md" />
                        <label class="form-label" style="color: #FFFFFF;" for="from_date">From</label>
                      </div>
                    </div>
                    <!--Check-Out Date-->
                    <div class="col-md-6 mb-4 w-auto">
                      <div class="form-outline">
                        <input type="date" name="to_date" style="background-color: #FFFFFF; color:#800000" id="to_date" class="form-control form-control-md" />
                        <label class="form-label" style="color: #FFFFFF;" for="to_date">To</label>
                      </div>
                    </div>
                  </div>
                  <!--Row 04-->
                  <div class="row justify-content-center">
                    <!--Submit-->
                    <div class="col-md-6 mb-4 w-auto">
                      <div class="form-outline">
                        <input class="btn btn-md" style="background-color: #FFFFFF; color:#800000;" name="submit" type="submit" value="Submit">
                      </div>
                    </div>
                  </div>
                  <!--Row 05 HIDDEN-->
                  <div class="row justify-content-center">
                    <!--hr_username-->
                    <div class="col-md-6 mb-4 w-auto">
                      <div class="form-outline">
                        <input type="hidden" name="hr_name" id="hr_name" value="<?php echo $_SESSION['hr_username']; ?>" class="form-control form-control-md" disabled />
                      </div>
                    </div>
                    <!--hr Admin username-->
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
  <!--offcanvas Complete-->



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