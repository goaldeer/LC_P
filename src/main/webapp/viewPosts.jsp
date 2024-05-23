<%@ page import="beans.PostBean" %>
<%@ page import="java.util.List" %>
<%
    List<PostBean> posts = (List<PostBean>) request.getAttribute("posts");
    int currentPage = (int) request.getAttribute("currentPage");
    int recordsPerPage = (int) request.getAttribute("recordsPerPage");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Posts</title>
</head>
<body>
    <h2>Posts</h2>
    <%
        for (PostBean post : posts) {
            out.println("<div>");
            out.println("<h3>" + post.getTitle() + "</h3>");
            out.println("<p>" + post.getContent() + "</p>");
            out.println("<p>Author: <a href='userProfile.jsp?username=" + post.getAuthor() + "'>" + post.getAuthor() + "</a></p>");
            out.println("<p>Date: " + post.getDate() + "</p>");
            out.println("</div>");
        }
    %>
    <%
        int rows = 100; // total rows from the database
        int nOfPages = rows / recordsPerPage;
        if (rows % recordsPerPage > 0) {
            nOfPages++;
        }
        for (int i = 1; i <= nOfPages; i++) {
            if (i == currentPage) {
                out.println(i);
            } else {
                out.println("<a href='viewPosts.jsp?page=" + i + "'>" + i + "</a>");
            }
        }
    %>
    <a href="profile.jsp">Back to Profile</a>
</body>
</html>
