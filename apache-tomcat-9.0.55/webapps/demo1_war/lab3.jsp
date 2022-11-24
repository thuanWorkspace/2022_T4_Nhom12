<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>lab 3</title>
    <%--  <link rel="stylesheet" href="css/styleLab3.css">--%>
    <link rel="stylesheet" href="css/styleLab3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div id="main">
    <div class="sign_in">
        <div class="container">
            <div class="contain_form">
                <form class="sign_in_form" action="/demo1_war/Login" method="post">
                    <h1>Sign in</h1>
                    <div class="user_account">
                        <input class="input_form" type="text" name="username1"
                               placeholder="username or email">
                    </div>
                    <div class="password">
                        <input class="input_form" type="password" name="password" placeholder="password">
                    </div>
                    <div class="btn_sign_in">
                        <button class="sign_in_btn">Sign in</button>
                    </div>
                    <div class="text">
                        <h3 class="text_form_sign_in">Or login with</h3>
                    </div>
                    <div class="icon">
                        <a href="#"><i class="fa fa-facebook-f"></i></a>
                        <a href="#"><img src="img/google.png"></a>
                    </div>
                    <div class="link">
                        <a href="#">Sign up</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>