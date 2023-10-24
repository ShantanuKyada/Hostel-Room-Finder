<html>

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
</head>

<body>
  <section class="vh-auto background">
    <div class="container py-5 h-auto">
      <div class="row justify-content-center align-items-center h-100">
        <div class="col-12 col-lg-9 col-xl-7">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color: #800000;">
            <div class="card-body p-4 p-md-5">
              <!--Center Text-->
              <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;">Login</h3>
              <!--Form Tag-->
              <form action="login_logic.php" method="post">
                <!--Row 01-->
                <div class="row">
                  <!--Username-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="username" id="UserName" style="color:#800000;" class="form-control form-control-lg" />
                      <label class="form-label" for="UserName" style="color: #FFFFFF;">Username</label>
                    </div>
                  </div>
                  <!--Password-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="password" name="password" id="passwordid" style="color:#800000;" class="form-control form-control-lg" />
                      <label class="form-label" for="passwordid" style="color: #FFFFFF;">Password</label>
                    </div>
                  </div>
                </div>
                <!--Row 02-->
                <div class="row">
                  <!--Submit-->
                  <div class="col-md-6 mb-4 pb-2">
                    <input class="btn btn-secondary btn-lg" name="submit" style="background-color: #FFFFFF; color:#800000; border:#FFFFFF 1pxx solid;" type="submit" value="Submit">
                  </div>
                  <!--Login Page Link-->
                  <div class="col-md-6 mb-4 pb-2">
                    <p style="color: #FFFFFF;">New HR Admin? <a href="registration.php" style="color: #FFFFFF;">Sign Up</a></p>
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