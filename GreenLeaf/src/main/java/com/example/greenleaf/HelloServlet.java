package com.example.greenleaf;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;

import storage.DriverManagerConnectionPool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        DriverManagerConnectionPool db;
        Connection connection=null;
        try {
            connection=DriverManagerConnectionPool.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}