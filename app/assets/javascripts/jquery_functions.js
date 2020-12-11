$(document).on('turbolinks:load', function(){
    // When the button with id "submit_contact_form" is pressed,
    // the form with id "contact_form" is validated.
    $('#submit_contact_form').click(function() {
        $('#contact_form').validate({
            // The validation rules used to validate the form.
            rules: {
                // The name of the user is required.
                name: 'required',
                email: {
                    // The email address of the user is required.
                    required: true,
                    // The email address input must be a valid email address.
                    email: true
                },
                // The telephone number of the user is required.
                telephone: 'required',
                // A message is required.
                message: 'required',
            },
            // The validation error messages used.
            messages: {
                // The message output when the user hasn't input a name.
                name: "Please input your name",
                email: {
                    // The message output when the user hasn't input an email address.
                    required: "Please input your email address",
                    // The message output when the email address which has been input is not valid.
                    email: "Please input a valid email address. An example is example@gmail.com"
                },
                // The message output when the user hasn't input a telephone number.
                telephone: "Please input your telephone number",
                // The message output when the user hasn't input a message.
                message: "Please input the message which you would like to include"
            },
            // Submits the form when it is valid.
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
});

// When the button with id "submit_contact_form" is pressed,
// The color of the h1 elements and the element with id "nav_bar"
// will change to the value of the input element with id "color"
$(document).on('turbolinks:load', function(){
    $("#color_button").click(function(){
        $("h1").css("color", $("#color").val());
        $("#nav_bar").css("background-color", $("#color").val());
    });
});

// When the button with id "font_size_button" is pressed,
// The font size of the p elements is changed
$(document).on('turbolinks:load', function(){
    $("#font_size_button").click(function(){
        // If the value of the select element with id "font_size" is "small",
        // The font size of the p elements changes to 11px
        if ($("#font_size").val() === "small") {
            $("p").css("font-size", "11px");
        }
        // If the value of the select element with id "font_size" is "medium",
        // The font size of the p elements changes to 13px
        else if ($("#font_size").val() === "medium") {
            $("p").css("font-size", "13px");
        }
        // If the value of the select element with id "font_size" is "large",
        // The font size of the p elements changes to 15px
        else if ($("#font_size").val() === "large") {
            $("p").css("font-size", "15px");
        }
    });
});