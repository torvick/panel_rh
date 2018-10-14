$(document).ready(function(){

    $('#login-form').on('click', function(event) {
        event.preventDefault();
        var email    = $("#input-email").val();
        var input_password = $("#input-password").val();
        url_application = "home";
        var data_form = {
            'email': email,
            'password': input_password
        };
        $.post(url_application, data_form , function(data) {
            console.log(data);
        });
    });
});