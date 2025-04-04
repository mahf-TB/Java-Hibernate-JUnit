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
import java.util.Map;

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

    public void ajouterPlanning(Map<String, Object> formData) {

        TypeOccupation type = TypeOccupation.valueOf(formData.get("type").toString());
        LocalDate date = LocalDate.parse(formData.get("date").toString());
        LocalTime heureDebut = LocalTime.parse(formData.get("heureDebut").toString());
        LocalTime heureFin = LocalTime.parse(formData.get("heureFin").toString());
        int profId = Integer.parseInt(formData.get("profId").toString());
        int salleId = Integer.parseInt(formData.get("salleId").toString());

        Professeur prof = profService.getProfById(profId);
        Salle sls = salleService.getSalleById(salleId);

        Occuper occup = new Occuper(date, type, heureDebut, heureFin, prof, sls);
        // Envoyer une notification WebSocket
        PlanningWebSocket.broadcast("Mise à jour du planning !");
        occpDAO.save(occup);
    }

    public boolean salleDisponible(LocalDate date, LocalTime heureDebut, LocalTime heureFin, long salsId) {
        return occpDAO.estSalleDisponible(salsId, date, heureDebut, heureFin);
    }

    public boolean profIsDisponible(LocalDate date, LocalTime heureDebut, LocalTime heureFin, long profId) {
        return occpDAO.estProfesseurDisponible(profId, date, heureDebut, heureFin);
    }

    public List<Occuper> getAllPlanningOccuper() {

        List<Occuper> plannings = occpDAO.findAll();
        // Trier : à venir d’abord (plus proche au plus lointain), puis passés (plus récent au plus ancien)
        plannings.sort((a, b) -> {
            if (!a.isEstPasse() && b.isEstPasse()) {
                return -1; // a vient avant
            }
            if (a.isEstPasse() && !b.isEstPasse()) {
                return 1;  // b vient avant
            }
            // Les deux sont dans le même groupe : soit tous les deux passés ou pas encore passés
            int dateCompare = a.getDate().compareTo(b.getDate());
            if (dateCompare != 0) {
                return a.isEstPasse() ? -dateCompare : dateCompare;
            }

            // Si même date, trier par heure
            return a.isEstPasse()
                    ? b.getHeureDebut().compareTo(a.getHeureDebut())
                    : // pour les passés, du plus récent au plus ancien
                    a.getHeureDebut().compareTo(b.getHeureDebut());  // pour les futurs, du plus proche au plus lointain
        });
        
        return plannings;
    }

    public Occuper getPlanningById(int profId) {
        Occuper prof = occpDAO.findById(profId);
        return prof;
    }

    public void deleteOccupation(int profId) {
        Occuper prof = occpDAO.findById(profId);
        if (prof != null) {
            occpDAO.delete(prof);
        } else {
            System.out.println("Occuper introuvable avec ID : " + profId);
        }

    }

    public String isSelected(Map<String, Object> formData, String key, long value) {
        if (formData != null && formData.get(key) != null) {
            String formValue = formData.get(key).toString();
            try {
                long formLongValue = Long.parseLong(formValue); // Conversion en long
                if (formLongValue == value) {
                    return "selected";
                }
            } catch (NumberFormatException e) {
                // Ignorer l'erreur de format si elle se produit
            }
        }
        return "";
    }
}
