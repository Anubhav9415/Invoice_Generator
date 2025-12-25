
import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String DB_URL = "jdbc:mysql://localhost:3306/netflix_clone?useSSL=false&serverTimezone=UTC";
        String DB_USER = "root";
        String DB_PASS = "root";

        HttpSession session = request.getSession();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "INSERT INTO users (fullname, email, password) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, password);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                session.setAttribute("registerSuccess", "Registration successful! Please login.");
                response.sendRedirect("first.jsp");
            } else {
                session.setAttribute("registerError", "❌ Registration failed. Please try again.");
                response.sendRedirect("Signup.jsp");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("registerError", "❌ Error: " + e.getMessage());
            response.sendRedirect("Signup.jsp");
        }
    }
}
