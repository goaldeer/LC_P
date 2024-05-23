<%@ page import="beans.PostBean" %>
<%@ page import="beans.UserBean" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession currentSession = request.getSession();
    UserBean user = (UserBean) currentSession.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = request.getParameter("username");

    // Assuming you fetch user details and posts based on the username
    List<PostBean> posts = (List<PostBean>) request.getAttribute("posts");
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h2>User Profile</h2>
    <p>Username: <%= user.getUsername() %></p>
    <p>Email: <%= user.getEmail() %></p>
    <p>Shop Name: <%= user.getShopName() %></p>
    <p>Address: <%= user.getAddress() %></p>
    <p>About: <%= user.getAbout() %></p>
    <h3>Posts</h3>
    <%
        for (PostBean post : posts) {
            out.println("<div>");
            out.println("<h3>" + post.getTitle() + "</h3>");
            out.println("<p>" + post.getContent() + "</p>");
            out.println("<p>Date: " + post.getDate() + "</p>");
            out.println("</div>");
        }
    %>
    <a href="profile.jsp">Back to Profile</a>
</body>
</html>
