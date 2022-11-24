<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>my first tomcat</title>
<%--    <link rel="stylesheet" href="css/styleLab3.css">--%>
<%--<link rel="stylesheet" href="css/styleLab3.css">--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<h1>Contact Us</h1>
<div class="row-form">
    <div class="background-gray">
        <p> full name</p>
        <input class="" placeholder="Enter your name">
    </div>
</div>

<div class="row-form">
    <div class="col-2">
        <div class="background-gray">
            <p> Email</p>
            <input class="" placeholder="Enter your mail">
        </div>
        <div class="background-gray">
            <p>Phone</p>
            <input class="" placeholder="Enter your number">
        </div>
    </div>
</div>
<div class="row-form">
    <div class="background-gray">
        <p> Needed service</p>
        <select name="type-service" style="width: 100%">
            <option value="volvo">please choose</option>
            <option value="saab">service 2</option>
            <option value="opel">service 3</option>
            <option value="audi">service 4</option>
        </select>
    </div>
</div>
<div class="row-form-text">
    <h2>Message</h2>
    <textarea style="width: 100%; border:0px solid #ffffff " name="message" id="" cols="30" rows="10"
              placeholder="Enter your message"></textarea>
</div>
<div>
    <button class="submit-btn"> submit</button>
</div>
</body>
</html>