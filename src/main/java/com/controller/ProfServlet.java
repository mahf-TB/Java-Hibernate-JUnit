/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.Professeur;
import com.services.ProfesseurService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

public class ProfServlet extends HttpServlet {

    private ProfesseurService profService;

    @Override
    public void init() throws ServletException {
        profService = new ProfesseurService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.isEmpty()) {
            action = "list";
        }

        switch (action) {
            case "list":
                afficherProfesseurs(request, response);
                break;
            case "edit":
                afficherDetailsProf(request, response);
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
                ajouterProf(request, response);
                break;
            case "modifier":
                modifierProf(request, response);
                break;
            case "supprimer":
                supprimerProf(request, response);
                break;
            default:
                response.sendRedirect("/GestionSalles/profs/list");
        }
    }

    private void afficherProfesseurs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Professeur> listeProfesseurs = profService.getAllProfs();
        System.out.println("Response data : " + listeProfesseurs);
        request.setAttribute("professeurs", listeProfesseurs);
        request.getRequestDispatcher("pages/profs/list.jsp").forward(request, response);
    }

    private void afficherDetailsProf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Professeur prof = profService.getProfById(id);
        request.setAttribute("prof", prof);
        request.getRequestDispatcher("edit-prof.jsp").forward(request, response);
    }

    private void ajouterProf(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String grade = request.getParameter("grade");

        System.out.println("Requête reçue par ProfServlet avec données: code=" + code + ", nom=" + nom + ", prenom=" + prenom + ", grade=" + grade);

        Professeur prof = new Professeur(code, nom, prenom, grade);
        profService.ajouterProf(prof);

        response.sendRedirect("/GestionSalles/profs/list");
    }

    private void modifierProf(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String grade = request.getParameter("grade");

        Professeur prof = new Professeur(code, nom, prenom, grade);
        profService.updateProf(id, prof);

        response.sendRedirect("/GestionSalles/profs/list?action=list");
    }

    private void supprimerProf(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        profService.deleteProf(id);

        response.sendRedirect("/GestionSalles/profs/list?action=list");
    }

}
