<html>

<head>

  <!--Bootstrap Links-->
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
    <div class="container py-5 h-auto">
      <div class="row justify-content-center align-items-center h-auto">
        <div class="col-12 col-lg-9 col-xl-7">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color: #800000;">
            <div class="card-body p-4 p-md-5">

              <!--Center Text-->
              <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;"><b>Register</b></h3>
              <!--Form Tag-->
              <form action="registration_logic.php" method="post">
                <!--Row 01-->
                <div class="row">
                  <!--Username-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="username" style="color:#800000; background-color:#FFFFFF" id="UserName" class="form-control form-control-lg" />
                      <label class="form-label" for="UserName" style="color: #FFFFFF;">Username</label>
                    </div>
                  </div>
                  <!--Password-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="password" name="user_password" style="color:#800000; background-color:#FFFFFF" id="passwordid" class="form-control form-control-lg" />
                      <label class="form-label" for="passwordid" style="color: #FFFFFF;">Password</label>
                    </div>
                  </div>
                </div>
                <!--Row 02-->
                <div class="row">
                  <!--First Name-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="fname" id="fname" style="color:#800000; background-color:#FFFFFF" class="form-control form-control-lg" />
                      <label class="form-label" for="fname" style="color: #FFFFFF;">First Name</label>
                    </div>
                  </div>
                  <!--Last Name-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="lname" id="lname" style="color:#800000; background-color:#FFFFFF" class="form-control form-control-lg" />
                      <label class="form-label" for="lname" style="color: #FFFFFF;">Last Name</label>
                    </div>
                  </div>
                </div>
                <!--Row 03-->
                <div class="row">
                  <!--Phone Number-->
                  <div class="col-md-6 mb-4 d-flex align-items-center">
                    <div class="form-outline datepicker w-100">
                      <input type="tel" name="user_number" style="color:#800000; background-color:#FFFFFF" class="form-control form-control-lg" id="phoneid" />
                      <label for="phoneid" class="form-label" style="color: #FFFFFF;">Phone Number</label>
                    </div>
                  </div>
                  <!--Email-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="email" name="user_email" style="color:#800000; background-color:#FFFFFF" id="emailid" class="form-control form-control-lg" />
                      <label class="form-label" for="emailid" style="color: #FFFFFF;">Email</label>
                    </div>
                  </div>
                </div>
                <!--Row 04-->
                <div class="row">
                  <!--City-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="text" name="user_city" style="color:#800000; background-color:#FFFFFF" id="cityid" class="form-control form-control-lg" />
                      <label class="form-label" for="cityid" style="color: #FFFFFF;">City</label>
                    </div>
                  </div>
                  <!--Gender-->
                  <div class="col-md-6 mb-4">
                    <h6 class="mb-2 pb-1" style="color: #FFFFFF;">Gender: </h6>
                    <!--Female-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="gender" type="radio" id="femaleGender" value="female" checked />
                      <label class="form-check-label" for="femaleGender" style="color: #FFFFFF;">Female</label>
                    </div>
                    <!--Male-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="gender" type="radio" id="maleGender" value="male" />
                      <label class="form-check-label" for="maleGender" style="color: #FFFFFF;">Male</label>
                    </div>
                    <!--Others-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="gender" id="otherGender" value="others" />
                      <label class="form-check-label" for="otherGender" style="color: #FFFFFF;">Others</label>
                    </div>
                  </div>
                </div>
                <!--Row 05-->
                <div class="row">
                  <!--Guardian's Number-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="tel" name="GNumber01" style="color:#800000; background-color:#FFFFFF" id="Gnumber01" class="form-control form-control-lg" />
                      <label class="form-label" for="Gnumber01" style="color: #FFFFFF;">Guardian's Number</label>
                    </div>
                  </div>
                  <!--Guardian's Number-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="tel" name="GNumber02" style="color:#800000; background-color:#FFFFFF" id="GNumber02" class="form-control form-control-lg" />
                      <label class="form-label" for="GNumber02" style="color: #FFFFFF;">Guardian's Number</label>
                    </div>
                  </div>
                </div>
                <!--Row 06-->
                <div class="row">
                  <div class="col-md-6 mb-4 pb-2">
                    <!--Submit-->
                    <input class="btn  btn-lg" style="background-color: #FFFFFF; color: #800000 ;" name="submit" type="submit" value="Register">
                    <!--Go Back-->
                    <a href="../index.php"><input class="btn  btn-lg" style="background-color: #FFFFFF; color: #800000;" type="button" value="Go Back"></a>
                  </div>
                  <!--Login Page Link-->
                  <div class="col-md-6 mb-4 pb-2">
                    <p style="color: #FFFFFF;"><b>Already a User?</b> <a href="login.php" style="color: #FFFFFF;">Login</a></p>
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