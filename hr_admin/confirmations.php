<!DOCTYPE html>
<html lang="en">

<head>
  <!--Bootstrap Links-->
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

    <!--SESSION START-->
    <?php
    session_start();
    $username = $_SESSION['username'];
    ?>

    <header>
      <!--Log-out-->
      <div>
        <a href="../index.php"><button style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" class="btn m-1 float-end" type="button"><b>Log Out</b></button></a>
      </div>

      <!--Title-->
      <div class="text-start">
        <h1 style="color: #800000;">Hostel/Room Finder</h1>
      </div>

      <!--Nav-Bar-->
      <nav id="navbar_top" style="background-color: #800000;" class="navbar navbar-expand-lg ">
        <b> <a class="navbar-brand" style="color: #FFFFFF;" href="homepage.php">Hello <?php echo $_SESSION['username']; ?></a></b>
        <button class="navbar-toggler " style="border-radius:10px; background-color: #800000; color:#800000; border:#FFFFFF solid;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler" style="color:#FFFFFF;">Menu</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="../hr_admin/addHR_registration.php"><b>Add HR</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="../hr_admin/bookings.php"><b>Bookings</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="../hr_admin/confirmations.php"><b>Confirmations</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="../hr_admin/checked_in.php"><b>Checked-In</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="../hr_admin/cancellations.php"><b>Cancellations</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="../hr_admin/bookings_history.php"><b>Booking History</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="../hr_admin/checked_in_history.php"><b>Checked-In History</b></a>
            </li>
          </ul>
      </nav>
    </header>

    <!--Bookings-->
    <h2 class=" text-center" style=" color: #800000;"><b>Confirmations</b></h2>
    <!--PROGRAM TO DISPLAY CURRENT BOOKINGS-->
    <?php
    $conn = mysqli_connect("localhost", "root", "", "hr");
    $db = mysqli_select_db($conn, "hr");
    $query = "SELECT * FROM confirmations WHERE hr_admin_name = '$username' ";
    $result = mysqli_query($conn, $query);
    while ($row = mysqli_fetch_array($result)) {
    ?>
      <div class="container px-4">
        <div class="row gx-5">
          <div class="col g-4">
            <div class="p-3 border " style="background-color: #c0c0c0; border-radius: 15px; color: #800000;">
              <h5> <b><?php echo "<td>" . $row['fname'] . "</td>"; ?></b><br>
                Last Name : <?php echo "<td>" . $row['lname'] . "</td>"; ?><br>
                Check-in Date : <?php echo "<td>" . $row['from_date'] . "</td>"; ?><br>
                Check-out Date : <?php echo "<td>" . $row['to_date'] . "</td>"; ?><br>
                No of Beds : <?php echo "<td>" . $row['no_of_beds'] . "</td>"; ?><br>
                <a class="btn btn-secondary" style="background-color:#800000;" role="button" <?php echo " href=confirmations_description.php?booking_id=" . $row['booking_id'] . ">Details</a>"; ?> </h5>
            </div>
          </div>
        </div>
      </div>
      </div>
    <?php
    }
    ?>
    <!--END-->

    <!-- Footer -->
    <footer class="text-center text-lg-start text-white" style="background-color: #800000" style="align-content: center;">
      <!-- Section: Social media -->
      <section class="d-flex justify-content-between p-4" style="background-color: #c0c0c0">
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
              <div class="text-uppercase fw-bold font-monospace">Hostel Room Finder</div>
              <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; height: 2px" />
              <p>
                Best place to get your desired Hostel / Room according to your needs.
              </p>
            </div>
            <!-- Grid column -->
            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
              <!-- Links -->
              <div class="text-uppercase fw-bold font-monospace">Add your Hostel/Room</div>
              <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; height: 2px" />
              <p>
                <a href="../hr_admin/registration.php" class="text-white">Join Us</a>
              </p>
              <p>
                <a href="../hr_admin/login.php" class="text-white">Log-in</a>
              </p>
            </div>
            <!-- Grid column -->
            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
              <!-- Links -->
              <div class="text-uppercase fw-bold font-monospace">Useful links</div>
              <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; height: 2px" />
              <p>
                <a href="../get_username.php" class="text-white">Get Username</a>
              </p>
              <p>
                <a href="../get_hr_admin_username.php" class="text-white">Get HR Admin Username</a>
              </p>
              <p>
                <a href="../get_hr_username.php" class="text-white">Get HR Username</a>
              </p>
            </div>
            <!-- Grid column -->
            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
              <!-- Contact Us -->
              <div class="text-uppercase fw-bold font-monospace">Contact Us</div>
              <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;  height: 2px" />
              <p><i class="fas fa-home mr-3"></i> Rajkot, Gujarat</p>
              <p><i class="fas fa-envelope mr-3"></i> hrFinder@gmail.com</p>
              <p><i class="fas fa-phone mr-3"></i> + 91 1234567890</p>
            </div>
          </div>
        </div>
      </section>
      <!-- Section: Links  -->
      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        © 2022 Copyright:
        <a class="text-white" href="">Hostel Room Finder</a>
      </div>
      <!-- Copyright END-->
    </footer>
    <!-- Footer END-->


  </section>
</body>

</html>