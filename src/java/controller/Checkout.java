/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import model.Cart;
import model.CartItem;
import model.User;

/**
 *
 * @author acer
 */
public class Checkout extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            response.sendRedirect("login");
        } else {
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            response.sendRedirect("login");
        } else {
            ArrayList<String> errorMessages = validateCart(session);
            if (errorMessages.isEmpty()) {
                Object object = session.getAttribute("account");
                Object object1 = session.getAttribute("cart");
                String notes = request.getParameter("notes");
                User u = (User) object;
                Cart cart = (Cart) object1;
                OrderDAO odao = new OrderDAO();
                odao.insertOrder(u, cart, notes);
                response.sendRedirect("Home");
            } else {
                request.setAttribute("errors", errorMessages);
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }
        }
    }

    private ArrayList<String> validateCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");

        ArrayList<String> errorMessages = new ArrayList<>();

        for (CartItem item : cart.getItems()) {
            if (item.getQuantity() > item.getProduct().getStock()) {
                errorMessages.add(
                        String.format(
                                "You cannot buy %d of %s because it only has %d products available", 
                                item.getQuantity(),
                                item.getProduct().getName(),
                                item.getProduct().getStock()
                        )
                );
            }
        }
        
        return errorMessages;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
