package servlets;

import beans.UserBean;
import utils.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/deletePost")
public class DeletePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int postId = Integer.parseInt(request.getParameter("postId"));

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM posts WHERE postId = ? AND author = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, postId);
            statement.setString(2, user.getUsername());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        response.sendRedirect("viewPosts.jsp");
    }
}
