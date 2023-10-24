<html>

<head>

  <!--Bootstrap Link-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


  <!--Style Sheet-->
  <style>
    .gradient-custom {
      background: #FFFFFF;
      font-family: 'Times New Roman', Times, serif;
    }

    .card-registration .select-input.form-control[readonly]:not([disabled]) {
      font-size: 1rem;
      line-height: 2.15;
      padding-left: .75em;
      padding-right: .75em;
    }

    .card-registration .select-arrow {
      top: 13px;
    }
  </style>

</head>

<body>
  <section class="vh-auto gradient-custom">
    <div class="container py-5 h-100">
      <div class="row justify-content-center align-items-center h-100">
        <div class="col-12 col-lg-9 col-xl-7">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color: #800000;">
            <div class="card-body p-4 p-md-5">

              <!--Center Text-->
              <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;"><b>Admin Login</b></h3>

              <!--Form Tag-->
              <form action="" method="post">

                <!--Row 01-->
                <div class="row">
                  <!--Username-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="username" style="color: #800000;" id="UserName" class="form-control form-control-lg" />
                      <label class="form-label" for="UserName" style="color: #FFFFFF;">Username</label>
                    </div>
                  </div>
                  <!--Password-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="password" name="password" style="color: #800000;" id="passwordid" class="form-control form-control-lg" />
                      <label class="form-label" for="passwordid" style="color: #FFFFFF;">Password</label>
                    </div>
                  </div>
                </div>

                <!--Row 02-->
                <div class="row">
                  <!--Submit-->
                  <div class="col-md-6 mb-4 pb-2">
                    <input class="btn btn-lg" style="background-color: #c0c0c0; color: #800000;" name="submit" type="submit" value="Log-in">
                    <input class="btn  btn-lg" style="background-color: #c0c0c0; color: #800000;" type="button" value="Go Back">
                  </div>
                </div>
                <!--FORM END-->
              </form>
              <?php
              session_start();

              $conn = mysqli_connect("localhost", "root", "", "hr");
              $db = mysqli_select_db($conn, "hr");

              if (isset($_POST['submit'])) {

                $_SESSION['username'] = $_POST['username'];
                $_SESSION['password'] = $_POST['password'];


                $username = $_POST['username'];
                $password = $_POST['password'];


                if ($username == 'admin' && $password == 'admin') {
                  header("Location: homepage.php");
                } else {
                  echo '<script type="text/javascript">
                  window.onload = function () { alert("Username or Password is incorrect."); }
                  </script>';
                }
              }
              ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>

</html>