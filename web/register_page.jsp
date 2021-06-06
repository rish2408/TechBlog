<%-- 
    Document   : register_page
    Created on : 19-Dec-2020, 7:54:03 pm
    Author     : Rishabh Srivastava
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <!--Bootstrap CSS-->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 68% 89%, 30% 100%, 0 84%, 0 0);
            }
            body{
                background: url(img/background.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>

        <!--Navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--Register Form Started-->

        <main class="primary-background banner-background" style="padding-bottom: 100px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">

                        <!--Card Started-->
                        <div class="card">  

                            <!--Card header-->
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-2x"></span>
                                <h4>Register Here</h4>
                            </div>

                            <!--Card Body-->
                            <div class="card-body">
                                <form id="reg-form" action="RegisterServlet" method="POST">

                                    <div class="mb-3">
                                        <label for="user_name" class="form-label">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name"> 
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
                                    </div>

                                    <div class="mb-3">
                                        <label for="gender" class="form-label">Select Gender</label>
                                        <br>
                                        <input type="radio" id="gender"  name="gender" value="male"> Male
                                        <input type="radio" id="gender" name="gender" value="female"> Female
                                    </div>

                                    <div class="mb-3">
                                        <textarea name="about" class="form-control" id="" rows="5" placeholder="Enter Something about yourself."></textarea>
                                    </div>

                                    <div class="mb-3 form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">I agree Terms and Conditions</label>
                                    </div>
                                    <div class="container text-center" id="loader" style="color: green; display: none;">
                                        <span class="fa fa-refresh fa-spin fa-2x"></span>
                                        <h4>Please Wait....</h4>
                                    </div>
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </form> 
                            </div>

                        </div>
                        <!--Card Ended-->

                    </div>
                </div>
            </div>
        </main>

        <!--Register Form Ended-->


        <!--Bootstrap JavaScript-->

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
            
//            Testing
            $(document).ready(function () {
                console.log("Loaded....");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    
                    let form = new FormData(this);
                    
                    $('#submit-btn').hide();
                    $('#loader').show();
                    // Send Form to RegisterServlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $('#submit-btn').show();
                            $('#loader').hide();
                            if (data.trim() === 'Data Inserted') {
                                swal("Registered Successfully. We're Redirecting to a Login Page.")
                                    .then((value) => {
                                        window.location = "login_page.jsp"
                                    });
                            } else {
                                swal(data);
                            }
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#submit-btn').show();
                            $('#loader').hide();
                            swal("Something Went Wrong..Please Try after Sometime");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
