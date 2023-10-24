<html>

<head>
  <!--Bootstrap Link-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  <!--Style Sheet-->
  <style>
    .background {
      background: #FFFFFF;
      font-family: 'Times New Roman', Times, serif;
    }
  </style>
</head>

<body>
  <section class="vh-auto background">
    <div class="container py-5 h-100">
      <div class="row justify-content-center align-items-center h-100">
        <div class="col-12 col-lg-9 col-xl-7">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color: #800000;">
            <div class="card-body p-4 p-md-5">
              <!--Center Text-->
              <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;"><b>Login</b></h3>
              <!--Form Tag-->
              <form action="login_logic.php" method="post">
                <!--Row 01-->
                <div class="row">
                  <!--Username-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="username" style="background-color:#FFFFFF; color:#151B54; background-color:#FFFFFF" id="UserName" class="form-control form-control-lg" />
                      <label class="form-label" for="UserName" style="color: #FFFFFF;">Username</label>
                    </div>
                  </div>
                  <!--Password-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="password" name="password" style="background-color:#FFFFFF; color:#151B54; background-color:#FFFFFF" id="passwordid" class="form-control form-control-lg" />
                      <label class="form-label" for="passwordid" style="color: #FFFFFF;">Password</label>
                    </div>
                  </div>
                </div>
                <!--Row 02-->
                <div class="row">
                  <!--Submit-->
                  <div class="col-md-6 mb-4 pb-2">
                    <input class="btn btn-lg" style="background-color: #FFFFFF; color: #800000;" name="submit" type="submit" value="Submit">
                    <a href="../index.php"><input class="btn  btn-lg" style="background-color: #FFFFFF; color: #800000;" type="button" value="Go Back"></a>
                  </div>
                  <!--Login Page Link-->
                  <div class="col-md-6 mb-4 pb-2">
                    <p style="color: #FFFFFF;"><b>New User?</b> <a href="registration.php" style="text-decoration: underline; color:#FFFFFF;">Sign Up</a></p>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>

</html>