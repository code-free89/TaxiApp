# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->

  profile_role = document.getElementById("profile_role");

  $('#profile_role').on 'change', ->
    console.log("Selected " + profile_role.value);

    if profile_role.value == 'driver'
      $driver_row = $('#car1');
      if ($driver_row[0])
        # Do nothing, driver visual row already exists
        # TODO do we need hide and show?
        console.log("Found ");
        console.log($driver_row[0]);
        $car1 = $('#car1');
        $car1.show();
        $car2 = $('#car2');
        $car1.show();
      else
        $picture_row = $('#pic_row');
        # console.log($picture_row);
        $driver_row = $picture_row.clone();

        $driver_html = $driver_row[0];
        $driver_html.id = "car2";

        # WARNING code from here on down may break if the layout of the page changes
        # TODO make it more robust

        $car_cell = $driver_html.children[0];
        $car_img = $car_cell.children[0];
        console.log($car_img);

        $car_field = $car_cell.children[1];
        $car_field.name = "profile[carpic]";

        console.log($car_img.src);

        # TODO these will be blank if you have previously loaded a car image
        $car_img.src = "";
        $car_img.alt = "";

        $reg_cell = $driver_row[0].children[1];
        $reg_label = $reg_cell.children[0];
        $reg_label.textContent = "Car registration";
        $reg_field = $reg_cell.children[2];
        $reg_field.name = "profile[reg]";

        $profile_table = $('#profile_table');

        $car_title = '<tr id="car1"><th colspan="2">Vehicle details</td></tr>'
        $profile_table.append($car_title);
        $profile_table.append($driver_row);
      # END
    else
      $profile_table = $('#profile_table');
      $car1 = $('#car1');
      $car1.hide();
      $car2 = $('#car2');
      $car1.hide();

