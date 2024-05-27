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
    <title>New Post</title>
</head>
<body>
    <h2>Create New Post</h2>
    <form action="post" method="post">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" required><br>
        <label for="content">Content:</label>
        <textarea id="content" name="content" required></textarea><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
