/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.Occuper;
import com.model.Professeur;
import com.model.Salle;
import com.model.enumModel.TypeOccupation;
import com.services.OccuperService;
import com.services.ProfesseurService;
import com.services.SalleService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author mahefa
 */
public class OccuperServlet extends HttpServlet {

    private OccuperService occpService;
    private ProfesseurService profService;
    private SalleService salleService;

    @Override
    public void init() throws ServletException {
        occpService = new OccuperService();
        profService = new ProfesseurService();
        salleService = new SalleService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
                //supprimerProf(request, response);
                break;
            default:
                response.sendRedirect("/GestionSalles/planning/list");
        }
    }

    private void creerUnPlanning(HttpServletRequest request, HttpServletResponse response) throws IOException {
        TypeOccupation type = TypeOccupation.valueOf(request.getParameter("type"));
        LocalDate date = LocalDate.parse(request.getParameter("date"));
        System.out.println("Requête " + request.getParameter("heureDebut"));
        LocalTime heureDebut = LocalTime.parse(request.getParameter("heureDebut"));
        LocalTime heureFin = LocalTime.parse(request.getParameter("heureFin"));
        
        int profId = Integer.parseInt(request.getParameter("profId"));
        int salleId = Integer.parseInt(request.getParameter("salleId"));

        Professeur prof = profService.getProfById(profId);
        Salle sls = salleService.getSalleById(salleId);

        Occuper pls = new Occuper(date, type, heureDebut, heureFin, prof, sls);
        occpService.ajouterPlanning(pls);

        response.sendRedirect("/GestionSalles/profs/list");
    }

}
