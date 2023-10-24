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
</head>

<body>
  <section class="vh-auto background">

    <!--SESSION START-->
    <?php
    session_start();
    $hr_admin_name = $_SESSION['username'];
    ?>

    <!--REGISTRATION FORM CONTAINER-->
    <div class="container py-5 h-auto">
      <div class="row justify-content-center align-items-center h-100">
        <div class="col-12 col-lg-9 col-xl-7">
          <div class="card shadow-2-strong card-registration" style="border-radius: 15px;background-color: #800000;">
            <div class="card-body p-4 p-md-5">
              <!--Center Text-->
              <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" style="color: #FFFFFF;"><b>HR Registration Form</b></h3>
              <!--Form Tag-->
              <form action="addHR_registration_logic.php" method="POST" enctype="multipart/form-data">
                <!--Row 01-->
                <div class="row">
                  <!--HR Name-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="admin_name" style="color: #800000;" id="hr_admin_name" class="form-control form-control-md" value="<?php echo "$hr_admin_name" ?>" disabled />
                      <label class="form-label" style="color: #FFFFFF;" for="hr_admin_name">HR Admin Name</label>
                    </div>
                  </div>
                  <!--HR Name-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="hr_username" style="color: #800000;" id="hr_username" class="form-control form-control-md" placeholder="Enter Your Hostel/Room Username" />
                      <label class="form-label" style="color: #FFFFFF;" for="hr_username">HR Username</label>
                    </div>
                  </div>
                </div>
                <!--Row 02-->
                <div class="row">
                  <!--HR Name-->
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" name="hr_name" id="hr_name" style="color: #800000;" class="form-control form-control-md" placeholder="Enter Your Hostel/Room Name" />
                      <label class="form-label" style="color: #FFFFFF;" for="hr_name">HR Name</label>
                    </div>
                  </div>
                  <!--HR Type-->
                  <div class="col-md-6 mb-4">
                    <h6 class="mb-2 pb-1" style="color: #FFFFFF;">Hostel / Room : </h6>
                    <!--Hostel-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_type" style="color: #800000;" type="radio" id="hr_type_h" value="Hostel" checked />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_type_h">Hostel</label>
                    </div>
                    <!--Room-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_type" style="color: #800000;" type="radio" id="hr_type_r" value="Room" />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_type_r">Room</label>
                    </div>
                  </div>
                </div>
                <!--Row 03-->
                <div class="row">
                  <!--HR Address-->
                  <div class="col-md-6 mb-4 d-flex align-items-center">
                    <div class="form-outline datepicker w-100">
                      <input type="text" name="hr_address" style="color: #800000;" class="form-control form-control-md" id="hr_address" placeholder="Enter Your Hostel/Room Address" />
                      <label for="hr_address" style="color: #FFFFFF;" class="form-label">HR Address</label>
                    </div>
                  </div>
                  <!--HR City-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="text" name="hr_city" style="color: #800000;" id="hr_city" class="form-control form-control-md" placeholder="Enter Your Hostel/Room City Name" />
                      <label class="form-label" style="color: #FFFFFF;" for="hr_city">HR City</label>
                    </div>
                  </div>
                </div>
                <!--Row 04-->
                <div class="row">
                  <!--HR Number-->
                  <div class="col-md-6 mb-4 d-flex align-items-center">
                    <div class="form-outline datepicker w-100">
                      <input type="tel" name="hr_number" style="color: #800000;" class="form-control form-control-md" id="hr_number" placeholder="Enter Hostel/Room Contact Number" />
                      <label for="hr_number" style="color: #FFFFFF;" class="form-label">HR Contact Number</label>
                    </div>
                  </div>
                  <!--HR Email-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="email" name="hr_email" style="color: #800000;" id="hr_email" class="form-control form-control-md" placeholder="Enter Hostel/Room Email " />
                      <label class="form-label" style="color: #FFFFFF;" for="hr_email">HR Email</label>
                    </div>
                  </div>
                </div>
                <!--Row 05-->
                <div class="row">
                  <!--HR Laundry-->
                  <div class="col-md-6 mb-4">
                    <h6 class="mb-2 pb-1" style="color: #FFFFFF;">Laundry : </h6>
                    <!--Laundry Yes-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_laundry" type="radio" id="hr_laundry_y" value="Available" checked />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_laundry_y">Available</label>
                    </div>
                    <!--Laundry No-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_laundry" type="radio" id="hr_laundry_n" value="Not-Available" />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_laundry_n">Not-Available</label>
                    </div>
                  </div>
                  <!--HR Food Type-->
                  <div class="col-md-6 mb-4">
                    <h6 class="mb-2 pb-1" style="color: #FFFFFF;">Veg / Non-Veg : </h6>
                    <!--Veg / Non-Veg-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_food_type" type="radio" id="hr_food_type_veg" value="Veg" checked />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_food_type_veg">Veg</label>
                    </div>
                    <!--Veg / Non-Veg-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_food_type" type="radio" id="hr_food_type_nonveg" value="Non-Veg" />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_food_type_nonveg">Non-Veg</label>
                    </div>
                    <!--Jain-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_food_type" type="radio" id="hr_food_type_jain" value="Jain" />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_food_type_jain">Jain</label>
                    </div>
                  </div>
                </div>
                <!--Row 06-->
                <div class="row">
                  <!--Boys / Girls HR-->
                  <div class="col-md-6 mb-4">
                    <h6 class="mb-2 pb-1" style="color: #FFFFFF;">Boys HR/ Girls HR: </h6>
                    <!--Boys-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_bg" type="radio" id="hr_BG_boy" value="Boys" checked />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_BG_boy">Boys</label>
                    </div>
                    <!--Girls-->
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" name="hr_bg" type="radio" id="hr_BG_girl" value="Girls" />
                      <label class="form-check-label" style="color: #FFFFFF;" for="hr_BG_girl">Girls</label>
                    </div>
                  </div>
                  <!--HR Total Beds-->
                  <div class="col-md-6 mb-4 d-flex align-items-center">
                    <div class="form-outline datepicker w-100">
                      <input type="number" style="color: #800000;" name="hr_total_beds" class="form-control form-control-md" id="hr_total_beds" placeholder="Enter Total Number of Beds" />
                      <label for="hr_total_beds" class="form-label" style="color: #FFFFFF;">HR Total Beds</label>
                    </div>
                  </div>
                </div>
                <!--Row 07-->
                <div class="row">
                  <!--HR Beds Available-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="number" style="color: #800000;" name="hr_beds_avail" id="hr_beds_avail" class="form-control form-control-md" placeholder="Enter Beds Available" />
                      <label class="form-label" for="hr_beds_avail" style="color: #FFFFFF;">HR Available Beds</label>
                    </div>
                  </div>
                  <!--HR Beds Occupied-->
                  <div class="col-md-6 mb-4 d-flex align-items-center">
                    <div class="form-outline datepicker w-100">
                      <input type="number" style="color: #800000;" name="hr_beds_occup" class="form-control form-control-md" id="hr_beds_occup" placeholder="Enter Beds Occupied" />
                      <label for="hr_beds_occup" class="form-label" style="color: #FFFFFF;">HR Occupied Beds</label>
                    </div>
                  </div>
                </div>
                <!--Row 08-->
                <div class="row">
                  <!--HR Price Per Year-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="number" style="color: #800000;" name="hr_price_per_year" id="hr_price_per_year" class="form-control form-control-md" placeholder="Enter your Hostel/Room Price Per Year" />
                      <label class="form-label" for="hr_price_per_year" style="color: #FFFFFF;">HR Price Per Year</label>
                    </div>
                  </div>
                  <!--HR Price Per Month-->
                  <div class="col-md-6 mb-4 d-flex align-items-center">
                    <div class="form-outline datepicker w-100">
                      <input type="number" style="color: #800000;" name="hr_price_per_month" class="form-control form-control-md" id="hr_price_per_month" placeholder="Enter Hostel/Room Price Per Month" />
                      <label for="hr_price_per_month" class="form-label" style="color: #FFFFFF;">HR Price Per Month</label>
                    </div>
                  </div>
                </div>
                <!--Row 09-->
                <div class="row">
                  <!--HR Price Per Day-->
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="number" name="hr_price_per_day" style="color: #800000;" id="hr_price_per_day" class="form-control form-control-md" placeholder="Enter Your Hostel/Room Price Per Day" />
                      <label class="form-label" for="hr_price_per_day" style="color: #FFFFFF;">HR Price Per Day</label>
                    </div>
                  </div>
                  <!--HR Building Image-->
                  <div class="col-md-6 mb-4 d-flex align-items-center">
                    <div class="form-outline datepicker w-100">
                      <input type="file" name="hr_build_img" style="color: #800000;" class="form-control form-control-md" id="hr_build_img" />
                      <label for="hr_build_img" class="form-label" style="color: #FFFFFF;">HR Building Image</label>
                    </div>
                  </div>
                  <!--Row 10-->
                  <div class="row">
                    <!--HR Reception Image-->
                    <div class="col-md-6 mb-4 pb-2">
                      <div class="form-outline">
                        <input type="file" name="hr_reception_img" style="color: #800000;" id="hr_reception_img" class="form-control form-control-md" />
                        <label class="form-label" for="hr_reception_img" style="color: #FFFFFF;">HR Reception Image</label>
                      </div>
                    </div>
                    <!--HR Room Image-->
                    <div class="col-md-6 mb-4 pb-2">
                      <div class="form-outline datepicker w-100">
                        <input type="file" name="hr_room_img01" style="color: #800000;" style="color: #800000;" class="form-control form-control-md" id="hr_room_img01" />
                        <label for="hr_room_img01" class="form-label" style="color: #FFFFFF;">HR Room Image 01</label>
                      </div>
                    </div>
                  </div>
                  <!--Row 11-->
                  <div class="row">
                    <!--HR Room Image-->
                    <div class="col-md-6 mb-4 d-flex align-items-center">
                      <div class="form-outline datepicker w-100">
                        <input type="file" name="hr_room_img02" style="color: #800000;" class="form-control form-control-md" id="hr_room_img02" />
                        <label for="hr_room_img02" class="form-label" style="color: #FFFFFF;">HR Room Image 02</label>
                      </div>
                    </div>
                    <!--HR Restroom Image-->
                    <div class="col-md-6 mb-4 pb-2">
                      <div class="form-outline">
                        <input type="file" name="hr_restroom01_img" style="color: #800000;" id="hr_restroom01_img" class="form-control form-control-md" />
                        <label class="form-label" for="hr_restroom01_img" style="color: #FFFFFF;">HR Restroom Image 01</label>
                      </div>
                    </div>
                  </div>
                  <!--Row 12-->
                  <div class="row">
                    <!--HR Restroom 02 Image-->
                    <div class="col-md-6 mb-4 pb-2">
                      <div class="form-outline">
                        <input type="file" name="hr_restroom02_img" style="color: #800000;" id="hr_restroom02_img" class="form-control form-control-md" />
                        <label class="form-label" for="hr_restroom02_img" style="color: #FFFFFF;">HR Restroom Image 02</label>
                      </div>
                    </div>
                  </div>
                  <!--Row 11-->
                  <div class="row">
                    <!--Submit-->
                    <div class="col-md-6 mb-4 pb-2">
                      <a href="homepage.php"><input class="btn" style="background-color: #FFFFFF; color: #800000;" type="button" value="Go Back"></a>
                      <input class="btn" name="submit" style="background-color: #FFFFFF; color: #800000;" type="submit" value="Submit" />
                    </div>
                  </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--CONTAINER END-->

  </section>
</body>

</html>