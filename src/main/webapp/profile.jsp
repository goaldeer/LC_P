<%@ page import="beans.UserBean" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession currentSession = request.getSession();
    UserBean user = (UserBean) currentSession.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
</head>
<body>
    <h2>Profile</h2>
    <p>Username: <%= user.getUsername() %></p>
    <p>Email: <%= user.getEmail() %></p>
    <p>Shop Name: <%= user.getShopName() %></p>
    <p>Address: <%= user.getAddress() %></p>
    <p>About: <%= user.getAbout() %></p>
    <a href="newPost.jsp">Create New Post</a>
    <a href="post">View My Posts</a>
    <a href="logout">Logout</a>
</body>
</html>
