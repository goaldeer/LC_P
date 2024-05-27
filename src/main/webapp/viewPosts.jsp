<%@ page import="beans.PostBean" %>
<%@ page import="java.util.List" %>
<%
    List<PostBean> posts = (List<PostBean>) request.getAttribute("posts");
    Integer currentPageObj = (Integer) request.getAttribute("currentPage");
    Integer recordsPerPageObj = (Integer) request.getAttribute("recordsPerPage");
    
    int currentPage = (currentPageObj != null) ? currentPageObj : 1; // default to page 1 if null
    int recordsPerPage = (recordsPerPageObj != null) ? recordsPerPageObj : 20; // default to 20 records per page if null
%>
<!DOCTYPE html>
<html>
<head>
    <title>Posts</title>
</head>
<body>
    <h2>Posts</h2>
    <%
        if (posts != null && !posts.isEmpty()) {
            for (PostBean post : posts) {
    %>
                <div>
                    <h3><%= post.getTitle() %></h3>
                    <p><%= post.getContent() %></p>
                    <p>Author: <a href="userProfile.jsp?username=<%= post.getAuthor() %>"><%= post.getAuthor() %></a></p>
                    <p>Date: <%= post.getDate() %></p>
                </div>
    <%
            }
        } else {
    %>
            <p>No posts available.</p>
    <%
        }
    %>
    <%
        int rows = 100; // This should be dynamically fetched from the database
        int nOfPages = rows / recordsPerPage;
        if (rows % recordsPerPage > 0) {
            nOfPages++;
        }
    %>
    <div>
    <%
        for (int i = 1; i <= nOfPages; i++) {
            if (i == currentPage) {
    %>
                <strong><%= i %></strong>
    <%
            } else {
    %>
                <a href="viewPosts?page=<%= i %>"><%= i %></a>
    <%
            }
        }
    %>
    </div>
    <a href="profile.jsp">Back to Profile</a>
</body>
</html>
