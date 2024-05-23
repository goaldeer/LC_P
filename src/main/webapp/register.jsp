<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>
    <h2>Register</h2>
    <form action="register" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <label for="shopName">Shop Name:</label>
        <input type="text" id="shopName" name="shopName"><br>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address"><br>
        <label for="about">About:</label>
        <textarea id="about" name="about"></textarea><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>
