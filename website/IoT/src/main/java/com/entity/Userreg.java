package com.entity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/User")
public class Userreg extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String myname = req.getParameter("username");
        int myphone = 0;
        try {
            myphone = Integer.parseInt(req.getParameter("phone")); // Parse the phone number to int
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid phone number format.");
            return;
        }
        String myemail = req.getParameter("email");
        String mypassword = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "Manali@22");
            
            PreparedStatement ps = connection.prepareStatement("insert into reg (username, phone, email, password) values (?, ?, ?, ?)");
            ps.setString(1, myname);
            ps.setLong(2, myphone);
            ps.setString(3, myemail);
            ps.setString(4, mypassword);
            
            int count = ps.executeUpdate();
            if (count > 0) {
                resp.setContentType("text/html");
                out.print("<h3 style='color:green'>User registered successfully</h3>");
            } else {
                resp.setContentType("text/html");
                out.print("<h3 style='color:red'>User not registered due to some error</h3>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            out.print("<h3 style='color:red'>An error occurred: " + e.getMessage() + "</h3>");
        }
    }
}
