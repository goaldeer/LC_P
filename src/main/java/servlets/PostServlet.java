package servlets;

import beans.PostBean;
import utils.DatabaseConnection;

import javax.servlet.ServletException;
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

public class PostServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        int currentPage = 1;
        int recordsPerPage = 20;
        
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        int start = currentPage * recordsPerPage - recordsPerPage;

        List<PostBean> posts = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            String sql = "SELECT * FROM posts WHERE author = ? ORDER BY date DESC LIMIT ?, ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setInt(2, start);
            statement.setInt(3, recordsPerPage);
            resultSet = statement.executeQuery();

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
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        int totalRecords = getTotalRecords(username);

        request.setAttribute("posts", posts);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("totalRecords", totalRecords);

        request.getRequestDispatcher("viewPosts.jsp").forward(request, response);
    }

    private int getTotalRecords(String username) throws ServletException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int totalRecords = 0;

        try {
            connection = DatabaseConnection.getConnection();
            String sql = "SELECT COUNT(*) FROM posts WHERE author = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                totalRecords = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return totalRecords;
    }
}
