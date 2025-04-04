/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.SalleDAO;
import com.model.Salle;
import com.services.ProfesseurService;
import com.services.SalleService;
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
    private SalleService salleService;

    @Override
    public void init() throws ServletException {
        daoSalle = new SalleDAO();
        salleService = new SalleService();
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
                afficherDetailsSalle(request, response);
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
                modifierSalle(request, response);
                break;
            case "supprimer":
                supprimerUnSalle(request, response);
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

    private void afficherDetailsSalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Salle salle = daoSalle.findById(id);
        request.setAttribute("salleDetails", salle);
        request.getRequestDispatcher("pages/salle/update.jsp").forward(request, response);
    }

    private void modifierSalle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String design = request.getParameter("design");
        int cpct = Integer.parseInt(request.getParameter("capacite"));
        Salle sals = new Salle(code, design, cpct);
        salleService.updateSalle(id, sals);

        response.sendRedirect("/GestionSalles/salle/list?action=list");
    }

    private void supprimerUnSalle(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        salleService.deleteSalle(id);

        response.sendRedirect("/GestionSalles/profs/list?action=list");
    }
}
