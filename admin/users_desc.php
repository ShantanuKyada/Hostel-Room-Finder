<!DOCTYPE html>
<html lang="en">

<head>
  <!--Bootstrap-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <link href="jquery-3.6.0.js">

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
    ob_start();
    ?>
    <header>
      <!--LOG-OUT-->
      <div>
        <a href="index.php"><button class="btn m-1 float-end" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#800000;" type="button"><b>Log-Out</b></button></a>
      </div>
      <!--TITLE-->
      <div class="text-start">
        <h1 style="color: #800000;">Admin Dashboard</h1>
      </div>
      <!--NAV BAR-->
      <nav id="navbar_top" style="background-color: #800000;" class="navbar navbar-expand-lg">
        <button class="navbar-toggler " style="border-radius:10px; background-color: #800000; color:#800000; border:#FFFFFF solid;" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler" style="color:#FFFFFF;">Menu</span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="homepage.php"><b>Hello <?php echo $_SESSION['username']; ?></b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="users.php"><b>Users</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="hr_admin.php"><b>HR_Admins</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="hr.php"><b>Hostels/Rooms</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="hr_reviews.php"><b>HR_Reviews</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="bookings.php"><b>Current Bookings</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="confirmations.php"><b>Confirmations</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="checked_in.php"><b>Checked_in</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="cancellations.php"><b>Cancellations</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="bookings_history.php"><b>Booking History</b></a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" style="color: #FFFFFF;" aria-current="page" href="checked_in_history.php"><b>Checked_in History</b></a>
            </li>
      </nav>
    </header>


    <div class="container py-5 h-auto">
      <div class="row justify-content-center align-items-center h-auto">
        <div class="col-xxl-11">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color:#800000;">
            <div class="card-body p-4 p-md-5">

              <!--PHP Code For Connection-->
              <?php
              $conn = mysqli_connect("localhost", "root", "", "hr");
              $db = mysqli_select_db($conn, "hr");
              $id = $_REQUEST['id'];
              $query = "SELECT * FROM user_table WHERE id = '$id' ";
              $run = mysqli_query($conn, $query);
              while ($result = mysqli_fetch_array($run)) {
              ?>



                <!--Title-->
                <div class="jumbotron text-center">
                  <h2 style="color: #FFFFFF;"><?php echo $result['username']; ?></h2>
                </div>

                <!--DETAILS-->
                <div class="container">
                  <div class="row g-2">
                    <!--USERNAME-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Username</b><br><?php echo $result['username']; ?> </div>
                    </div>
                    <!--USERNAME EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#username" aria-expanded="false" aria-controls="username">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--USERNAME FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="username">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="text" name="username" style="color: #800000;" id="username" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="username">Username</label>
                            </div>
                            <button class="btn float-end w-25" name="username_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--USERNAME LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['username_submit'])) {
                        $username = $_POST['username'];
                        $username_query = "UPDATE user_table SET username = '$username' WHERE id = '$id'";
                        $username_run = mysqli_query($conn, $username_query);
                        if ($username_run == TRUE) {
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
                    <!--USERNAME END-->



                    <!--FIRST NAME-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>First Name</b><br><?php echo $result['fname']; ?> </div>
                    </div>
                    <!--FIRST NAME EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#fname" aria-expanded="false" aria-controls="fname">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--FIRST NAME FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="fname">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="text" name="fname" style="color: #800000;" id="fname" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="fname">First Name</label>
                            </div>
                            <button class="btn float-end w-25" name="fname_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--FIRST NAME LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['fname_submit'])) {
                        $fname = $_POST['fname'];
                        $fname_query = "UPDATE user_table SET fname = '$fname' WHERE id = '$id'";
                        $fname_run = mysqli_query($conn, $fname_query);
                        if ($fname_run == TRUE) {
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
                    <!--FIRST NAME END-->



                    <!--LAST NAME-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Last Name</b><br><?php echo $result['lname']; ?></div>
                    </div>
                    <!--LAST NAME EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#lname" aria-expanded="false" aria-controls="lname">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--LAST NAME FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="lname">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="text" name="lname" style="color: #800000;" id="lname" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="lname">Last Name</label>
                            </div>
                            <button class="btn float-end w-25" name="lname_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--LAST NAME LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['lname_submit'])) {
                        $lname = $_POST['lname'];
                        $lname_query = "UPDATE hr_table SET lname = '$lname' WHERE id = '$id'";
                        $lname_run = mysqli_query($conn, $lname_query);
                        if ($lname_run == TRUE) {
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
                    <!--LAST NAME END-->



                    <!--NUMBER-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Phone Number</b><br><?php echo $result['number']; ?></div>
                    </div>
                    <!--NUMBER EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#number" aria-expanded="false" aria-controls="number">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--NUMBER FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="number">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="number" name="number" style="color: #800000;" id="number" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="number">Phone Number</label>
                            </div>
                            <button class="btn float-end w-25" name="number_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--NUMBER LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['number_submit'])) {
                        $number = $_POST['number'];
                        $number_query = "UPDATE user_table SET number = '$number' WHERE id = '$id'";
                        $number_run = mysqli_query($conn, $number_query);
                        if ($number_run == TRUE) {
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
                    <!--NUMBER END-->



                    <!--EMAIL-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Email</b><br><?php echo $result['email']; ?></div>
                    </div>
                    <!--EMAIL EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#email" aria-expanded="false" aria-controls="email">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--EMAIL FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="email">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="text" name="email" style="color: #800000;" id="email" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="email">Email</label>
                            </div>
                            <button class="btn float-end w-25" name="email_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--EMAIL LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['email_submit'])) {
                        $email = $_POST['email'];
                        $email_query = "UPDATE user_table SET email = '$email' WHERE id = '$id'";
                        $email_run = mysqli_query($conn, $email_query);
                        if ($email_run == TRUE) {
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
                    <!--EMAIL END-->



                    <!--CITY-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>City</b><br><?php echo $result['city']; ?></div>
                    </div>
                    <!--CITY EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#city" aria-expanded="false" aria-controls="city">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--CITY FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="city">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="text" name="city" style="color: #800000;" id="city" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="city">City</label>
                            </div>
                            <button class="btn float-end w-25" name="city_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--CITY LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['city_submit'])) {
                        $city = $_POST['city'];
                        $city_query = "UPDATE user_table SET city = '$city' WHERE id = '$id'";
                        $city_run = mysqli_query($conn, $city_query);
                        if ($city_run == TRUE) {
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
                    <!--CITY END-->



                    <!--GENDER-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Gender</b><br><?php echo $result['gender']; ?></div>
                    </div>
                    <!--GENDER EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#gender" aria-expanded="false" aria-controls="gender">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--GENDER FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="gender">
                          <div class="card card-body" style="border-radius: 15px">
                            <h6 class="mb-2 pb-1" style="color: #800000;"><b>Gender</b> </h6>
                            <!--FEMALE-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="gender" style="color: #800000;" type="radio" id="gender" value="Male" />
                              <label class="form-check-label" style="color: #800000;" for="gender">Male</label>
                            </div>
                            <!--MALE-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="gender" style="color: #800000;" type="radio" id="gender" value="Female" />
                              <label class="form-check-label" style="color: #800000;" for="gender">Female</label>
                            </div>
                            <!--OTHERS-->
                            <div class="form-check form-check-inline">
                              <input class="form-check-input" name="gender" style="color: #800000;" type="radio" id="gender" value="Others" />
                              <label class="form-check-label" style="color: #800000;" for="gender">Others</label>
                            </div>
                            <button class="btn float-end w-25" name="gender_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--HR LAUNDRY LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['gender_submit'])) {
                        $gender = $_POST['gender'];
                        $gender_query = "UPDATE user_table SET gender = '$gender' WHERE id = '$id'";
                        $gender_run = mysqli_query($conn, $gender_query);
                        if ($gender_run == TRUE) {
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
                    <!--GENDER END-->



                    <!--Guardian Number 01-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Guardian Number 01</b><br><?php echo $result['g_num01']; ?></div>
                    </div>
                    <!--Guardian Number 01 EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#g_num01" aria-expanded="false" aria-controls="g_num01">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--Guardian Number 01 FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="g_num01">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="number" name="g_num01" style="color: #800000;" id="g_num01" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="g_num01">Guardian Number 01</label>
                            </div>
                            <button class="btn float-end w-25" name="g_num01_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--Guardian Number 01 LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['g_num01_submit'])) {
                        $g_num01 = $_POST['g_num01'];
                        $g_num01_query = "UPDATE user_table SET g_num01 = '$g_num01' WHERE id = '$id'";
                        $g_num01_run = mysqli_query($conn, $g_num01_query);
                        if ($g_num01_run == TRUE) {
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
                    <!--Guardian Number 01 END-->



                    <!--Guardian Number 02-->
                    <div class="col-9">
                      <div class="p-3 border" style="border-radius: 15px; background-color:#FFFFFF; color:#800000"><b>Guardian Number 02</b><br><?php echo $result['g_num02']; ?></div>
                    </div>
                    <!--Guardian Number 02 EDIT-->
                    <div class="col-3">
                      <button class="btn float-start m-3" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="button" data-bs-toggle="collapse" data-bs-target="#g_num02" aria-expanded="false" aria-controls="g_num02">
                        <b>Edit</b>
                      </button>
                    </div>
                    <!--Guardian Number 02 FORM-->
                    <div class="col-12">
                      <form method="POST" action="">
                        <div class="collapse" id="g_num02">
                          <div class="card card-body" style="border-radius: 15px">
                            <div class="form-outline">
                              <input type="number" name="g_num02" style="color: #800000;" id="g_num02" class="form-control form-control-md" />
                              <label class="form-label" style="color: #FFFFFF;" for="g_num02">Guardian Number 02</label>
                            </div>
                            <button class="btn float-end w-25" name="g_num02_submit" style="background-color: #FFFFFF; color: #800000; border-style: solid; border-color:#045E5E;" type="submit">
                              Update
                            </button>
                          </div>
                        </div>
                      </form>
                      <!--Guardian Number 02 LOGIC-->
                      <?php
                      $conn = mysqli_connect("localhost", "root", "", "hr");
                      $db = mysqli_select_db($conn, "hr");
                      if (isset($_POST['g_num02_submit'])) {
                        $g_num02 = $_POST['g_num02'];
                        $g_num02_query = "UPDATE user_table SET g_num02 = '$g_num02' WHERE id = '$id'";
                        $g_num02_run = mysqli_query($conn, $g_num02_query);
                        if ($g_num02_run == TRUE) {
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
                    <!--Guardian Number 02 END-->



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
                              <h5 class="modal-title" style=" color:#800000;" id="delete">Delete <?php echo $result['username']; ?></h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body" style="color:#800000">
                              Are you sure, you want to delete this User named <?php echo $result['fname']; ?> ?
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

                      $delete_query = "DELETE FROM user_table WHERE id = '$id'";
                      //$delete_run = mysqli_query($conn, $delete_query);
                      if ($conn->query($delete_query) === TRUE) {
                        header("Location: admin_users.php ");
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

  <?php
  ob_end_flush();
  ?>

  </section>
</body>

</html>