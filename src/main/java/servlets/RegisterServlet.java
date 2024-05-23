package servlets;

import beans.UserBean;
import utils.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String shopName = request.getParameter("shopName");
        String address = request.getParameter("address");
        String about = request.getParameter("about");

        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO users (username, email, password, shopName, address, about) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setString(4, shopName);
            statement.setString(5, address);
            statement.setString(6, about);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        response.sendRedirect("login.jsp");
    }
}
