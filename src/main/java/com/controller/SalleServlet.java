/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.SalleDAO;
import com.model.Salle;
import com.services.ProfesseurService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author mahefa
 */
public class SalleServlet extends HttpServlet {

      private SalleDAO daoSalle;

    @Override
    public void init() throws ServletException {
        daoSalle = new SalleDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.isEmpty()) {
            action = "list";
        }

        switch (action) {
            case "list":
                //afficherProfesseurs(request, response);
                break;
            case "edit":
                //afficherDetailsProf(request, response);
                break;
            default:
                response.sendRedirect("/GestionSalles/profs/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {
            case "ajouter":
                ajouterSalle(request, response);
                break;
            case "modifier":
                //modifierProf(request, response);
                break;
            case "supprimer":
                //supprimerProf(request, response);
                break;
            default:
                response.sendRedirect("/GestionSalles/profs/list");
        }
    }
    
    
    
    private void ajouterSalle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        String design = request.getParameter("design");
        String cpct = request.getParameter("capacite");
       
        Salle salle = new Salle(code, design, Integer.parseInt(cpct));
        daoSalle.save(salle);

        response.sendRedirect("/GestionSalles/salle/list");
    }

}
