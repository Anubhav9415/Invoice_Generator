<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Netflix Sign Up</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<%
    String regError = (String) session.getAttribute("registerError");
    if (regError != null) {
%>
    <div style="background-color: #f8d7da; color: #721c24; padding: 15px; text-align: center; font-weight: bold;">
        <%= regError %>
    </div>
<%
        session.removeAttribute("registerError");
    }
%>

<div class="overlay"></div>
<div class="header">
  <div class="logo">NETFLIX</div>
</div>

<div class="form-wrapper">
  <div class="login-container">
    <h1>Sign Up</h1>
    <form class="login-form" action="register" method="post">
      <input type="text" name="fullname" placeholder="Full Name" required />
      <input type="email" name="email" placeholder="Email" required />
      <input type="password" name="password" placeholder="Password" required />
      <button type="submit">Sign Up</button>
    </form>

    <div class="extra-links">
      <p>Already have an account? 
         <a href="<%= request.getContextPath() %>/first.jsp">Sign In</a>
      </p>
    </div>
  </div>
</div>
</body>
</html>
