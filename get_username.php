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
  <section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
      <div class="row justify-content-center align-items-center h-100">
        <div class="col-12 col-lg-9 col-xl-7">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px; background-color: #800000;">
            <div class="card-body p-4 p-md-5">

              <!--Center Text-->
              <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;"><b>Get Username</b></h3>

              <!--Form Tag-->
              <form action="get_username_logic.php" method="post">


                <!--Row 01-->
                <div class="row">
                  <!--Username-->
                  <div class="col-md-12 mb-4">
                    <div class="form-outline">
                      <input type="email" name="email" style="color: #800000;" id="email" class="form-control form-control-lg" required />
                      <label class="form-label" for="email" style="color: #FFFFFF;">Enter your Email Address</label>
                    </div>
                  </div>
                </div>


                <!--Row 05-->
                <div class="row">
                  <!--Submit-->
                  <div class="col-md-6 mb-4 pb-2">
                    <input class="btn btn-lg" style="background-color: #c0c0c0; color: #800000;" name="get_username_submit" type="submit" value="Submit">

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