# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->

  profile_role = document.getElementById("profile_role");

  $('#profile_role').on 'change', ->
    console.log("Selected " + profile_role.value);

    if profile_role.value == 'driver'
      console.log("I'm a driver");
      $driver_row = $('#car1');
      if $driver_row[0]
        # console.log($driver_row[0]);
        # Hide the rows for the driver if they already exist
        $car1 = $('#car1');
        $car1.show();
        $car2 = $('#car2');
        $car1.show();
      else
        console.log("Creating car details rows");
        # -------------------------------------------------
        # Create the picture and vehicle registration row
        # and cells
        # -------------------------------------------------
        $picture_row = $('#pic_row');
        $driver_row = $picture_row.clone();

        $driver_html = $driver_row[0];
        $driver_html.id = "car2";

        # WARNING code from here on down may break if the layout of the page changes
        # TODO make it more robust

        $car_cell = $driver_html.children[0];
        $car_img = $car_cell.children[0];

        $car_field = $car_cell.children[1];
        $car_field.name = "profile[carpic]";
        $car_field.id = "profile_carpic";

        # console.log($car_img.src);

        # TODO these will be blank if you have previously loaded a car image
        $car_img.src = "";
        $car_img.alt = "";

        $reg_cell = $driver_row[0].children[1];
        $reg_label = $reg_cell.children[0];
        $reg_label.textContent = "Car registration";
        $reg_field = $reg_cell.children[2];
        $reg_field.name = "profile[reg]";

        # -------------------------------------------------
        # Create the title row and cells
        # -------------------------------------------------

        $car_title = '<tr id="car1"><th colspan="2">Vehicle details</td></tr>'

        # -------------------------------------------------
        # Load the table and append the new rows
        # -------------------------------------------------

        $profile_table = $('#profile_table');
        $profile_table.append($car_title);
        $profile_table.append($driver_row);

      # END
    else
      # If we've changed from driver to something else and the rows exist,
      # hide them
      $profile_table = $('#profile_table');
      $car1 = $('#car1');
      $car1.hide();
      $car2 = $('#car2');
      $car1.hide();

