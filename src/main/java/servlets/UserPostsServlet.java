package servlets;

import beans.PostBean;
import utils.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/userPosts")
public class UserPostsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        List<PostBean> posts = new ArrayList<>();
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM posts WHERE author = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                PostBean post = new PostBean();
                post.setPostId(resultSet.getInt("postId"));
                post.setTitle(resultSet.getString("title"));
                post.setContent(resultSet.getString("content"));
                post.setAuthor(resultSet.getString("author"));
                post.setDate(resultSet.getDate("date"));
                posts.add(post);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        request.setAttribute("posts", posts);
        request.getRequestDispatcher("userProfile.jsp").forward(request, response);
    }
}
