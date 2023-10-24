<!DOCTYPE html>
<html lang="en">

<head>
  <!--Bootstrap Links-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  <!--Style Sheet-->
  <style>
    .background {
      background: #FFFFFF;
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
    ob_start();
    session_start();
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



    <!--CONTAINER-->
    <div class="container py-5 h-auto">
      <div class="row justify-content-center align-items-center h-auto">
        <div class="col-xxl-11">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color:#800000;">
            <div class="card-body p-4 p-md-5">
              <!--PROGRAM TO FETCH AND DISPLAY DATA-->
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
                  <h2 style="color: #FFFFFF;"><?php echo $result['hr_name']; ?></h2>
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

                <!--DETAILS CONTAINER-->
                <div class="container">
                  <div class="row g-2">


                    <!--HR TYPE-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000">
                        <b>Hostel / Room</b><br>
                        <?php echo $result['hr_type']; ?>
                      </div>
                    </div>
                    <!--HR TYPE EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_type" aria-expanded="false" aria-controls="hr_type">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR TYPE FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_type">
                          <div class="card card-body" style="border-radius: 15px">
                            <h6 class="mb-2 pb-1" style="color: #800000;"><b>Hostel / Room </b> </h6>
                            <!--Hostel-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_type" style="color: #800000;" type="radio" id="hr_type_h" value="Hostel" />
                              <label class="form-check-label" style="color: #800000;" for="hr_type_h">Hostel</label>
                            </div>
                            <!--Room-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_type" style="color: #800000;" type="radio" id="hr_type_r" value="Room" />
                              <label class="form-check-label" style="color: #800000;" for="hr_type_r">Room</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_type_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR TYPE LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_type_submit'])) {
                        $hr_type = $_POST['hr_type'];
                        $hr_type_query = "UPDATE hr_table SET hr_type = '$hr_type' WHERE username = '$hr_name'";
                        $hr_type_run = mysqli_query($conn, $hr_type_query);
                        if ($hr_type_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR TYPE END-->


                    <!--HR BG-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Boys / Girls</b><br><?php echo $result['hr_bg']; ?></div>
                    </div>
                    <!--HR BG EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_bg" aria-expanded="false" aria-controls="hr_bg">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR BG FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_bg">
                          <div class="card card-body" style="border-radius: 15px">
                            <h6 class="mb-2 pb-1" style="color: #800000;"><b>Boys / Girls</b> </h6>
                            <!--BOYS-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_bg" style="color: #800000;" type="radio" id="hr_bg" value="Boys" />
                              <label class="form-check-label" style="color: #800000;" for="hr_type_h">Boys</label>
                            </div>
                            <!--GIRLS-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_bg" style="color: #800000;" type="radio" id="hr_bg" value="Girls" />
                              <label class="form-check-label" style="color: #800000;" for="hr_type_r">Girls</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_bg_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR BG LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_bg_submit'])) {
                        $hr_bg = $_POST['hr_bg'];
                        $hr_bg_query = "UPDATE hr_table SET hr_bg = '$hr_bg' WHERE username = '$hr_name'";
                        $hr_bg_run = mysqli_query($conn, $hr_bg_query);
                        if ($hr_bg_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR BG END-->


                    <!--HR ADDRESS-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Address</b><br><?php echo $result['hr_address']; ?> </div>
                    </div>
                    <!--HR ADDRESS EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_address" aria-expanded="false" aria-controls="hr_address">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR ADDRESS FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_address">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="text" name="hr_address" style="color: #800000;" id="hr_address" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="hr_address">Address</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_address_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR ADDRESS LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_address_submit'])) {
                        $hr_address = $_POST['hr_address'];
                        $hr_address_query = "UPDATE hr_table SET hr_address = '$hr_address' WHERE username = '$hr_name'";
                        $hr_address_run = mysqli_query($conn, $hr_address_query);
                        if ($hr_address_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR ADDRESS END-->


                    <!--HR CITY-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>City</b><br><?php echo $result['hr_city']; ?></div>
                    </div>
                    <!--HR CITY EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_city" aria-expanded="false" aria-controls="hr_city">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR CITY FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_city">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="text" name="hr_city" style="color: #800000;" id="hr_city" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="hr_city">City</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_city_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR CITY LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_city_submit'])) {
                        $hr_city = $_POST['hr_city'];
                        $hr_city_query = "UPDATE hr_table SET hr_city_ = '$hr_city' WHERE username = '$hr_name'";
                        $hr_city_run = mysqli_query($conn, $hr_city_query);
                        if ($hr_city_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR CITY END-->


                    <!--HR NUMBER-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Phone Number</b><br><?php echo $result['hr_number']; ?></div>
                    </div>
                    <!--HR NUMBER EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_number" aria-expanded="false" aria-controls="hr_number">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR NUMBER FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_number">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="number" name="hr_number" style="color: #800000;" id="hr_number" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="hr_number">Number</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_number_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR NUMBER LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_number_submit'])) {
                        $hr_number = $_POST['hr_number'];
                        $hr_number_query = "UPDATE hr_table SET hr_number = '$hr_number' WHERE username = '$hr_name'";
                        $hr_number_run = mysqli_query($conn, $hr_number_query);
                        if ($hr_number_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR NUMBER END-->


                    <!--HR EMAIL-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Email</b><br><?php echo $result['hr_email']; ?></div>
                    </div>
                    <!--HR EMAIL EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_email" aria-expanded="false" aria-controls="hr_email">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR EMAIL FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_email">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="text" name="hr_email" style="color: #800000;" id="hr_email" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="hr_email">Email</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_email_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR EMAIL LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_email_submit'])) {
                        $hr_email = $_POST['hr_number'];
                        $hr_email_query = "UPDATE hr_table SET hr_email = '$hr_email' WHERE username = '$hr_name'";
                        $hr_email_run = mysqli_query($conn, $hr_email_query);
                        if ($hr_email_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR EMAIL END-->


                    <!--HR LAUNDRY-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Laundry</b><br><?php echo $result['hr_laundry']; ?></div>
                    </div>
                    <!--HR LAUNDRY EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_laundry" aria-expanded="false" aria-controls="hr_laundry">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR LAUNDRY FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_laundry">
                          <div class="card card-body" style="border-radius: 15px">
                            <h6 class="mb-2 pb-1" style="color: #800000;"><b>Laundry</b> </h6>
                            <!--Available-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_laundry" style="color: #800000;" type="radio" id="hr_laundry" value="Available" />
                              <label class="form-check-label" style="color: #800000;" for="hr_laundry">Available</label>
                            </div>
                            <!--Not Available-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_laundry" style="color: #800000;" type="radio" id="hr_type_r" value="Not-Available" />
                              <label class="form-check-label" style="color: #800000;" for="hr_laundry">Not Available</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_laundry_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR LAUNDRY LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_laundry_submit'])) {
                        $hr_laundry = $_POST['hr_laundry'];
                        $hr_laundry_query = "UPDATE hr_table SET hr_laundry = '$hr_laundry' WHERE username = '$hr_name'";
                        $hr_laundry_run = mysqli_query($conn, $hr_laundry_query);
                        if ($hr_laundry_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR LAUNDRY END-->


                    <!--HR FOOD TYPE-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Food</b><br><?php echo $result['hr_food_type']; ?></div>
                    </div>
                    <!--HR FOOD EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_food_type" aria-expanded="false" aria-controls="hr_food_type">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR FOOD FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_food_type">
                          <div class="card card-body" style="border-radius: 15px">
                            <h6 class="mb-2 pb-1" style="color: #800000;"><b>Food</b> </h6>
                            <!--Veg-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_food_type" style="color: #800000;" type="radio" id="hr_food_type" value="Veg" />
                              <label class="form-check-label" style="color: #800000;" for="hr_food_type">Veg</label>
                            </div>
                            <!--Non-Veg-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_food_type" style="color: #800000;" type="radio" id="hr_food_type" value="Non-Veg" />
                              <label class="form-check-label" style="color: #800000;" for="hr_food_type">No-Veg</label>
                            </div>
                            <!--Jain-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="hr_food_type" style="color: #800000;" type="radio" id="hr_food_type" value="Jain" />
                              <label class="form-check-label" style="color: #800000;" for="hr_food_type">Jain</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_food_type_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR FOOD LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_food_type_submit'])) {
                        $hr_food_type = $_POST['hr_food_type'];
                        $hr_food_type_query = "UPDATE hr_table SET hr_food_type = '$hr_food_type' WHERE username = '$hr_name'";
                        $hr_food_type_run = mysqli_query($conn, $hr_food_type_query);
                        if ($hr_food_type_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR FOOD END-->


                    <!--Total Beds-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Total Beds</b><br><?php echo $result['hr_total_beds']; ?></div>
                    </div>
                    <!--HR Total Beds EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_total_beds" aria-expanded="false" aria-controls="hr_total_beds">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR Total Beds FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_total_beds">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="number" name="hr_total_beds" style="color: #800000;" id="hr_total_beds" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="hr_food_type">Total Beds</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_total_beds_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR Total Beds LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_total_beds_submit'])) {
                        $hr_total_beds = $_POST['hr_total_beds'];
                        $hr_total_beds_query = "UPDATE hr_table SET hr_total_beds = '$hr_total_beds_type' WHERE username = '$hr_name'";
                        $hr_total_beds_run = mysqli_query($conn, $hr_total_beds_query);
                        if ($hr_total_beds_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR Total Beds END-->


                    <!--BEDS AVAILABLE-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Beds Available</b><br><?php echo $result['hr_beds_avail']; ?></div>
                    </div>
                    <!--HR BEDS AVAILABLE EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_beds_avail" aria-expanded="false" aria-controls="hr_beds_avail">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--HR BEDS AVAILABLE FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_beds_avail">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="number" name="hr_beds_avail" style="color: #800000;" id="hr_beds_avail" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="hr_beds_avail">Beds Available</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_beds_avail_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR BEDS AVAILABLE LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_beds_avail_submit'])) {
                        $hr_beds_avail = $_POST['hr_beds_avail'];
                        $hr_beds_avail_query = "UPDATE hr_table SET hr_beds_avail = '$hr_beds_avail_type' WHERE username = '$hr_name'";
                        $hr_beds_avail_run = mysqli_query($conn, $hr_beds_avail_query);
                        if ($hr_beds_avail_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--HR BEDS AVAILABLE END-->


                    <!--PRICE PER YEAR-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Price per Year</b><br><?php echo $result['hr_price_per_year']; ?></div>
                    </div>
                    <!--PRICE PER YEAR EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_price_per_year" aria-expanded="false" aria-controls="hr_price_per_year">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--PRICE PER YEAR FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_price_per_year">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="number" name="hr_price_per_year" style="color: #800000;" id="hr_price_per_year" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="hr_price_per_year">Price Per Year</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_price_per_year_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--PRICE PER YEAR LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_price_per_year_submit'])) {
                        $hr_price_per_year = $_POST['hr_price_per_year'];
                        $hr_price_per_year_query = "UPDATE hr_table SET hr_price_per_year = '$hr_price_per_year' WHERE username = '$hr_name'";
                        $hr_price_per_year_run = mysqli_query($conn, $hr_price_per_year_query);
                        if ($hr_price_per_year_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--PRICE PER YEAR END-->


                    <!--PRICE PER MONTH-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Price per Month</b><br><?php echo $result['hr_price_per_month']; ?></div>
                    </div>
                    <!--PRICE PER MONTH EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#hr_price_per_month" aria-expanded="false" aria-controls="hr_price_per_month">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--PRICE PER MONTH FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="hr_price_per_month">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="number" name="hr_price_per_month" style="color: #800000;" id="hr_price_per_month" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="hr_price_per_month">Price Per Month</label>
                            </div>
                            <button class="btn float-end w-25" name="hr_price_per_month_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--PRICE PER MONTH LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['hr_price_per_month_submit'])) {
                        $hr_price_per_month = $_POST['hr_price_per_month'];
                        $hr_price_per_month_query = "UPDATE hr_table SET hr_price_per_month = '$hr_price_per_month' WHERE username = '$hr_name'";
                        $hr_price_per_month_run = mysqli_query($conn, $hr_price_per_month_query);
                        if ($hr_price_per_month_run == TRUE) {
                          echo "<script>";
                          echo "(function()
                            {
                              if( window.localStorage )
                              {
                                if( !localStorage.getItem('firstLoad') )
                                {
                                  localStorage['firstLoad'] = true;
                                  window.location.reload();
                                }  
                                else
                                  localStorage.removeItem('firstLoad');
                              }
                            })();";
                          echo "</script>";
                        }
                      }
                      ?>
                    </div>
                    <!--PRICE PER MONTH END-->


                    <!--DELETE BUTTON-->
                    <form method="POST" action="">
                      <button type="button" class="btn w-100" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" data-bs-toggle="modal" data-bs-target="#delete">
                        <b>DELETE</b>
                      </button>

                      <!-- Modal -->
                      <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="delete" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" style=" color:#800000;" id="delete">Delete <?php echo $result['hr_name']; ?></h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color:#800000">
                              Are you sure, you want to delete this HR named <?php echo $result['hr_name']; ?> ?
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color: #800000;" data-bs-dismiss="modal"><b>No</b></button>
                              <button type="submit" name="delete" class="btn" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color: #800000;"><b>Yes</b></button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </form>
                    <!--DELETE LOGIC-->
                    <?php
                    $conn = mysqli_connect("localhost", "root", "", "hr");
                    $db = mysqli_select_db($conn, "hr");
                    if (isset($_POST['delete'])) {

                      $delete_query = "DELETE FROM hr_table WHERE username = '$hr_name'";
                      if ($conn->query($delete_query) === TRUE) {
                        header("Location: hr_admin_homepage.php");
                      }
                    } ?>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  <?php
              }
  ?>
  <!--Container END-->



  <!--CONTAINER TO FETCH AND DISPLAY REVIEWS-->
  <div class="container py-5 h-auto">
    <div class="row justify-content-center align-items-center h-auto">
      <div class="col-xxl-11">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color:#800000;">
          <div class="card-body p-4 p-md-5">
            <!--Title-->
            <div class="jumbotron text-center">
              <h2 style="color: #FFFFFF;">Reviews</h2>
            </div>
            <!--PROGRAM TO DISPLAY REVIEWS-->
            <?php
            $conn = mysqli_connect("localhost", "root", "", "hr");
            $db = mysqli_select_db($conn, "hr");
            $hr_name = $_REQUEST['username'];
            $query05 = "SELECT * FROM hr_feedback WHERE hr_name = '$hr_name' ";
            $run05 = mysqli_query($conn, $query05);
            while ($result05 = mysqli_fetch_array($run05)) {
              $feedback_id = $result05['id'];
            ?>
              <div class="container">
                <div class="row g-2 m-3">
                  <div class="col-9">
                    <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000">
                      <b><?php echo $result05['fname']; ?> <?php echo $result05['lname']; ?></b><br>
                      <?php echo $result05['message'];
                      ?>
                    </div>
                  </div>
                  <div class="col-3">
                    <a class="btn btn-secondary m-3 fw-bold" style="background-color:#FFFFFF; color:#800000" role="button" <?php echo " href=report_spam.php?id=" . $result05['id'] . ">Report</a>"; ?> </button>
                  </div>
                </div>
              </div>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--CONTAINER END-->



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

  <!--SESSION END-->
  <?php
  ob_end_flush();
  ?>

  </section>
</body>

</html>