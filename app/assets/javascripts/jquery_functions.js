// Waits for the DOM to be ready.
$(document).ready(function(){
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
