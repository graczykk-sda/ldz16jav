package pl.sdacademy.jsp.servlets;

import pl.sdacademy.jsp.config.JdbcConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet(
        name = "HelloServlet",
        value = "/hello"
)
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        JdbcConfig.getConnection();
        PrintWriter writer = resp.getWriter();
        writer.println("Hello servlet!");
    }
}
