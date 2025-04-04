/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.Occuper;
import com.model.Salle;
import com.model.enumModel.TypeOccupation;
import com.services.OccuperService;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author mahefa
 */
public class OccuperServlet extends HttpServlet {

    private OccuperService occpService;

    @Override
    public void init() throws ServletException {
        occpService = new OccuperService();

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
            case "search":
                //searchProfesseursByNPC(request, response);
                break;
            case "edit":
                afficherDetailsPlanning(request, response);
                break;
            default:
                response.sendRedirect("/GestionSalles/profs/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {
            case "ajouter":
                creerUnPlanning(request, response);
                break;
            case "modifier":
                //modifierProf(request, response);
                break;
            case "supprimer":
                supprimerPlanning(request, response);
                break;
            default:
                response.sendRedirect("/GestionSalles/planning/list");
        }
    }

    private void creerUnPlanning(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {      
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        LocalTime heureDebut = LocalTime.parse(request.getParameter("heureDebut"));
        LocalTime heureFin = LocalTime.parse(request.getParameter("heureFin"));
        int salleId = Integer.parseInt(request.getParameter("salleId"));
        int profId = Integer.parseInt(request.getParameter("profId"));
        
        Map<String, Object> formData = new HashMap<>();
        formData.put("heureDebut", request.getParameter("heureDebut"));
        formData.put("heureFin", request.getParameter("heureFin"));
        formData.put("type", request.getParameter("type"));
        formData.put("date", request.getParameter("date"));
        formData.put("profId", request.getParameter("profId"));
        formData.put("salleId", request.getParameter("salleId"));

        // Vérifier que heureDebut est avant heureFin
        if (heureDebut.isAfter(heureFin)) {
            request.setAttribute("error", "L'heure de début doit être inférieure à l'heure de fin.");
            request.setAttribute("formData", formData);
            request.getRequestDispatcher("pages/planning/add.jsp").forward(request, response);
            return;
        }

        boolean estProfDisponible = occpService.profIsDisponible(date, heureDebut, heureFin, profId);
        if (!estProfDisponible) {
            request.setAttribute("error", "Le Prof est déjà occupée à ce créneau.");
            request.setAttribute("formData", formData);
            request.getRequestDispatcher("pages/planning/add.jsp").forward(request, response);
            return;
        }

        boolean estDisponible = occpService.salleDisponible(date, heureDebut, heureFin, salleId);
        if (!estDisponible) {
            request.setAttribute("error", "La salle est déjà occupée à ce créneau.");
            request.setAttribute("formData", formData);
            request.getRequestDispatcher("pages/planning/add.jsp").forward(request, response);
            return;
        }

        occpService.ajouterPlanning(formData);
        response.sendRedirect("/GestionSalles/planning/list");
    }

    private void afficherDetailsPlanning(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Occuper details = occpService.getPlanningById(id);
        request.setAttribute("detailsPlan", details);
        request.getRequestDispatcher("pages/planning/update.jsp").forward(request, response);
    }

    private void supprimerPlanning(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        occpService.deleteOccupation(id);

        response.sendRedirect("/GestionSalles/planning/list");
    }

}
