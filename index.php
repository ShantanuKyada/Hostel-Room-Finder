<!DOCTYPE html>
<html>

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

    <!--Header-->
    <header>

      <!--SignUp & Login-->
      <div>
        <a href="user/login.php"><button class="btn m-1 float-end" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#800000;" type="button"><b>Login</b></button></a>
        <a href="user/registration.php"><button class="btn m-1 float-end" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#800000;" type="button"><b>SignUp</b></button></a>
      </div>

      <!--Title-->
      <div class="text-start">
        <h1 style="color:#800000;">Hostel/Room Finder</h1>
      </div>


      <!--NavBar-->
      <nav id="navbar_top" style="background-color: #800000;" class="navbar navbar-expand-lg">
        <button class="navbar-toggler " style="border-radius:10px; background-color: #800000; color:#FFFFFF; border:#FFFFFF solid;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler" style="color:#FFFFFF; ">Menu</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="#"><b>Hostels</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="#"><b>Rooms</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="#"><b>About Us</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="#"><b>Contact Us</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" data-bs-toggle="offcanvas" data-bs-target="#filters" aria-controls="offcanvasTop" href="#"><b>Filters</b></a>
            </li>
          </ul>
          <div class="d-flex">
            <input class="form-control me-2" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:black;" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-primary me-2" data-bs-toggle="modal" data-bs-target="#message" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:black;" type="button"><b>Search</b></button>
          </div>
      </nav>
    </header>

    <!--Carousel-->
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="HOSTEL_IMG_NEW02.jpg" class="img-fluid rounded mx-auto d-block">
        </div>
        <div class="carousel-item">
          <img src="HOSTEL_IMG_NEW01.jpg" class="img-fluid rounded mx-auto d-block">
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



    <!--Off Canvas for Filters-->
    <div class="offcanvas offcanvas-top h-auto" tabindex="-1" id="filters" aria-labelledby="offcanvasTopLabel">
      <div class="offcanvas-header">
        <h5 id="offcanvasTopLabel">Filters</h5>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <div class="row">
          <!--Cities-->
          <div class="col">
            Choose City :
            <form action="" method="post">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Ahmedabad" checked>
                <label class="form-check-label" for="exampleRadios2">
                  Ahmedabad
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Bhavnagar">
                <label class="form-check-label" for="exampleRadios2">
                  Bhavnagar
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Bharuch">
                <label class="form-check-label" for="exampleRadios2">
                  Bharuch
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Gandhinagar">
                <label class="form-check-label" for="exampleRadios2">
                  Gandhinagar
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Gandhidham">
                <label class="form-check-label" for="exampleRadios2">
                  Gandhidham
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Gondal">
                <label class="form-check-label" for="exampleRadios2">
                  Gondal
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Jamnagar">
                <label class="form-check-label" for="exampleRadios2">
                  Jamnagar
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Junagadh">
                <label class="form-check-label" for="exampleRadios2">
                  Junagadh
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Morbi">
                <label class="form-check-label" for="exampleRadios2">
                  Morbi
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Nadiad">
                <label class="form-check-label" for="exampleRadios2">
                  Nadiad
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Porbandar">
                <label class="form-check-label" for="exampleRadios2">
                  Porbandar
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Rajkot">
                <label class="form-check-label" for="exampleRadios2">
                  Rajkot
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Surat">
                <label class="form-check-label" for="exampleRadios2">
                  Surat
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="city" id="exampleRadios2" value="Vadodara">
                <label class="form-check-label" for="exampleRadios2">
                  Vadodara
                </label>
              </div>
          </div>
          <!--Row End!-->

          <!--HR_Type-->
          <div class="col">
            Choose Hostel / Room :
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="hr_type" type="radio" id="hr_type" value="Hostel" checked />
              <label class="form-check-label" for="hr_type">Hostel</label>
            </div>
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="hr_type" type="radio" id="hr_type" value="Room" />
              <label class="form-check-label" for="hr_type">Room</label>
            </div>
          </div>

          <!--BG_Type-->
          <div class="col">
            Choose Boys / Girls HR :
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="bg_type" type="radio" id="bg_type" value="Boys" checked />
              <label class="form-check-label" for="bg_type">Boys</label>
            </div>
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="bg_type" type="radio" id="bg_type" value="Girls" />
              <label class="form-check-label" for="bg_type">Girls</label>
            </div>
          </div>

          <!--Food_Type-->
          <div class="col">
            Choose Food type :
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="hr_food_type" type="radio" id="hr_food_type" value="Veg" checked />
              <label class="form-check-label" for="hr_food_type">Veg</label>
            </div>
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="hr_food_type" type="radio" id="hr_food_type" value="Non-Veg" />
              <label class="form-check-label" for="hr_food_type">Non-Veg</label>
            </div>
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="hr_food_type" type="radio" id="hr_food_type" value="Jain" />
              <label class="form-check-label" for="hr_food_type">Jain</label>
            </div>
          </div>

          <!--Laundry-->
          <div class="col">
            Choose Laundry :
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="hr_laundry" type="radio" id="hr_laundry" value="Yes" checked />
              <label class="form-check-label" for="hr_laundry">Yes</label>
            </div>
            <br>
            <div class="form-check form-check-inline">
              <input class="form-check-input" name="hr_laundry" type="radio" id="hr_laundry" value="No" />
              <label class="form-check-label" for="hr_laundry">No</label>
            </div>
            <br>
            <input type="submit" value="Submit" name="submit">
            </form>
          </div>
        </div>
      </div>
    </div>
    <!--Off Canvas Complete-->



    <!--Program to display data according to Filters-->
    <?php
    $conn = mysqli_connect("localhost", "root", "", "hr");
    $db = mysqli_select_db($conn, "hr");
    if (isset($_POST['submit'])) {
      $filters_query = "SELECT * FROM hr_table WHERE hr_city = '" . $_POST["city"] . "' AND hr_type = '" . $_POST["hr_type"] . "' AND hr_bg = '" . $_POST["bg_type"] . "' AND hr_food_type = '" . $_POST["hr_food_type"] . "' AND  hr_laundry = '" . $_POST["hr_laundry"] . "' ";
      $filters_run = mysqli_query($conn, $filters_query); ?>
      <!--Filters Title-->
      <h1 class=" text-center">Data According To Your Filters</h1>
      <?php
      while ($filters_row = mysqli_fetch_array($filters_run)) {
      ?>
        <!--Card Group-->
        <div class="card mb-1 mx-auto w-75">
          <!--Hostel/Room Name-->
          <div class="card-body">
            <h5 class="card-title">
              <?php echo "<td>" . $filters_row['hr_name'] . "</td>"; ?>
            </h5>
          </div>
          <!--Hostel/Room Details-->
          <ul class="list-group list-group-flush">
            <li class="list-group-item">
              Mobile Number : <?php echo "<td>" . $filters_row['hr_number'] . "</td>"; ?>
            </li>
            <li class="list-group-item">
              Address : <?php echo "<td>" . $filters_row['hr_address'] . "</td>"; ?>
            </li>
            <li class="list-group-item">
              City : <?php echo "<td>" . $filters_row['hr_city'] . "</td>"; ?>
            </li>
          </ul>
          <div class="card-body">
            <?php echo "<td> <a href=hr_description.php?username=" . $filters_row['username'] . "> Details </a> </td>"; ?>
          </div>
        </div>
    <?php
      }
    }
    ?>



    <!--Program to display data according to Searches-->
    <?php
    $con = mysqli_connect("localhost", "root", "", "hr");
    if (isset($_GET['search'])) {
      $filtervalues = $_GET['search'];
      $queryq = "SELECT * FROM hr_table WHERE CONCAT(hr_name) LIKE '%$filtervalues%' ";
      $query_run = mysqli_query($con, $queryq); ?>
      <!--Searches Title-->
      <h1 class=" text-center">Data According To Your Searches</h1>
      <?php
      if (mysqli_num_rows($query_run) > 0) {
        foreach ($query_run as $items) {
      ?>
          <!--Card Group-->
          <div class="card mb-1 mx-auto w-75">
            <!--Hostel/Room Name-->
            <div class="card-body">
              <h5 class="card-title">
                <?php echo "<td>" . $items['hr_name'] . "</td>"; ?>
              </h5>
            </div>
            <!--Hostel/Room Details-->
            <ul class="list-group list-group-flush">
              <li class="list-group-item">
                Mobile Number : <?php echo "<td>" . $items['hr_number'] . "</td>"; ?>
              </li>
              <li class="list-group-item">
                Address : <?php echo "<td>" . $items['hr_address'] . "</td>"; ?>
              </li>
              <li class="list-group-item">
                City : <?php echo "<td>" . $items['hr_city'] . "</td>"; ?>
              </li>
            </ul>
            <div class="card-body">
              <?php echo "<td> <a href=hr_description.php?username=" . $items['username'] . "> Details </a> </td>"; ?>
            </div>
          <?php
        }
      } else {
          ?>
          <h1 class=" text-center">Data According To Your Searches</h1>
          <h5 class="text-center">No Record Found</h5>
      <?php
      }
    }
      ?>
          </div>



          <!--Displaying Hostels and Rooms-->
          <div class="container py-5 h-auto">
            <div class="row justify-content-center align-items-center h-auto">
              <!--Displaying Hostels-->
              <div class="col-xxl-6">
                <!--Hostels Title-->
                <h2 class=" text-center" style="color: #800000;"><b>Hostels</b></h2>
                <!--Program-->
                <?php
                $conn = mysqli_connect("localhost", "root", "", "hr");
                $db = mysqli_select_db($conn, "hr");
                $hostel_query = "SELECT * FROM hr_table WHERE hr_type = 'Hostel' LIMIT 5 ";
                $hostel_result = mysqli_query($conn, $hostel_query);
                while ($hostel_row = mysqli_fetch_array($hostel_result)) {
                ?>
                  <div class="container px-4">
                    <div class="row gx-5">
                      <div class="col">
                        <div class="p-3 border " style="background-color: #c0c0c0; border-radius: 15px; color: #800000;">
                          <h5> <b><?php echo "<td>" . $hostel_row['hr_name'] . "</td>"; ?></b><br>
                            City : <?php echo "<td>" . $hostel_row['hr_city'] . "</td>"; ?><br>
                            Boys / Girls : <?php echo "<td>" . $hostel_row['hr_bg'] . "</td>"; ?><br>
                            Beds Available : <?php echo "<td>" . $hostel_row['hr_beds_avail'] . "</td>"; ?><br>
                            <a class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#message" style="background-color: #800000; color:#FFFFFF; border:#800000;">Details</a>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
              </div>



              <!--Displaying Rooms-->
              <div class="col-xxl-6">
                <!--Rooms Title-->
                <h2 class=" text-center" style="color: #800000;"><b>Rooms</b></h2>
                <!--Program-->
                <?php
                $conn = mysqli_connect("localhost", "root", "", "hr");
                $db = mysqli_select_db($conn, "hr");
                $room_query = "SELECT * FROM hr_table WHERE hr_type = 'Room' LIMIT 5 ";
                $room_result = mysqli_query($conn, $room_query);
                while ($room_row = mysqli_fetch_array($room_result)) {
                ?>
                  <div class="container px-4">
                    <div class="row gx-5">
                      <div class="col">
                        <div class="p-3 border " style="background-color: #c0c0c0; border-radius: 15px; color: #800000;">
                          <h5> <b><?php echo "<td>" . $room_row['hr_name'] . "</td>"; ?></b><br>
                            City : <?php echo "<td>" . $room_row['hr_city'] . "</td>"; ?><br>
                            Boys / Girls : <?php echo "<td>" . $room_row['hr_bg'] . "</td>"; ?><br>
                            Beds Available : <?php echo "<td>" . $room_row['hr_beds_avail'] . "</td>"; ?><br>
                            <a class="btn btn-secondary" type="button" data-bs-toggle="modal" data-bs-target="#message" style="background-color: #800000; color:#FFFFFF; border:#800000">Details</a>
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



          <!-- Modal for displaying Message to Register-->
          <div class="modal fade" id="message" tabindex="-1" aria-labelledby="message" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content" style="color:#800000; background-color:#FFFFFF;">
                <div class="modal-header">
                  <h5 class="modal-title" style="color:#800000" id="exampleModalLabel"><b>Message</b></h5>
                  <button type="button" class="btn-close" style="background-color:#FFFFFF" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="color:#800000">
                  Register yourself to see the details.
                </div>
                <div class="modal-footer">
                  <button type="button" style="background-color:#FFFFFF; color:#800000; border:#800000 1px solid;" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                  <a class="btn btn-primary" style="background-color:#FFFFFF; color:#800000; border:#800000 1px solid;" role="button" <?php echo " href=user/registration.php >Register</a>"; ?> </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Modal END for displaying Message to Register-->



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
                      <a href="hr_admin/registration.php" style="color:#FFFFFF;">Join Us</a>
                    </p>
                    <p>
                      <a href="hr_admin/login.php" style="color:#FFFFFF;">Log-in</a>
                    </p>
                  </div>
                  <!-- Grid column -->
                  <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <div class="text-uppercase fw-bold font-monospace" style="color:#FFFFFF;">Useful links</div>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto" style="width: 60px; height: 2px" />
                    <p>
                      <a href="get_username.php" style="color:#FFFFFF;">Get Username</a>
                    </p>
                    <p>
                      <a href="get_hr_admin_username.php" style="color:#FFFFFF;">Get HR Admin Username</a>
                    </p>
                    <p>
                      <a href="get_hr_username.php" style="color:#FFFFFF;">Get HR Username</a>
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