<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Netflix Login</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<%
    String regSuccess = (String) session.getAttribute("registerSuccess");
    if (regSuccess != null) {
%>
    <div style="background-color: #d4edda; color: #155724; padding: 15px; text-align: center; font-weight: bold;">
        <%= regSuccess %>
    </div>
<%
        session.removeAttribute("registerSuccess");
    }

    String error = (String) session.getAttribute("error");
    if (error != null) {
%>
    <div style="background-color: #f8d7da; color: #721c24; padding: 10px; text-align: center;">
        <%= error %>
    </div>
<%
        session.removeAttribute("error");
    }
%>

<!-- Background overlay -->
<div class="overlay"></div>

<!-- Netflix logo -->
<div class="header">
  <div class="logo">NETFLIX</div>
</div>

<!-- Login form -->
<div class="form-wrapper">
  <div class="login-container">
    <h1>Sign In</h1>
    <form class="login-form" action="login" method="post">
      <input type="text" name="email" placeholder="Email or mobile number" required />
      <input type="password" name="password" placeholder="Password" required />
      <button type="submit">Sign In</button>
    </form>

    <div class="options">
      <div>OR</div>
      <button class="code-button">Use a sign-in code</button>
    </div>

    <div class="extra-links">
      <p><a href="#">Forgot password?</a></p>
      <p><input type="checkbox" /> Remember me</p>
      <p>New to Netflix? 
         <a href="<%= request.getContextPath() %>/Signup.jsp">Sign up now.</a>
      </p>
    </div>
  </div>
</div>
</body>
</html>
