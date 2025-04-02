/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.services;

import com.dao.OccuperDAO;
import com.model.Occuper;
import com.model.Professeur;
import com.model.Salle;
import com.model.enumModel.TypeOccupation;
import com.websocket.PlanningWebSocket;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

/**
 *
 * @author mahefa
 */
public class OccuperService {

    private OccuperDAO occpDAO;
    private ProfesseurService profService;
    private SalleService salleService;

    public OccuperService() {
        this.occpDAO = new OccuperDAO();
        this.profService = new ProfesseurService();
        this.salleService = new SalleService();
    }

    public void ajouterPlanning(LocalDate date, TypeOccupation type, LocalTime heureDebut, LocalTime heureFin, int profId, int salsId) {
        Professeur prof = profService.getProfById(profId);
        Salle sls = salleService.getSalleById(salsId);
        Occuper occup = new Occuper(date, type, heureDebut, heureFin, prof, sls);
        // Envoyer une notification WebSocket
        PlanningWebSocket.broadcast("Mise à jour du planning !");
        occpDAO.save(occup);
    }

    public boolean salleDisponible(LocalDate date, LocalTime heureDebut, LocalTime heureFin, long salsId) {
        return occpDAO.estSalleDisponible(salsId, date, heureDebut, heureFin);
    }

    public List<Occuper> getAllPlanningOccuper() {
        return occpDAO.findAll();
    }
    
    
    public void deleteOccupation(int profId) {
        Occuper prof = occpDAO.findById(profId);
        if (prof != null) {
            occpDAO.delete(prof);
        } else {
            System.out.println("Occuper introuvable avec ID : " + profId);
        }

    }
}
