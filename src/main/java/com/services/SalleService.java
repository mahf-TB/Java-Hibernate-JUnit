/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.services;

import com.dao.SalleDAO;
import com.model.Salle;

/**
 *
 * @author mahefa
 */
public class SalleService {

    private SalleDAO salsDAO;

    public SalleService() {
        this.salsDAO = new SalleDAO();
    }

    public void updateSalle(int Id, Salle sals) {
        Salle salle = salsDAO.findById(Id);
        if (salle != null) {
            salle.setCodeSalle(sals.getCodeSalle());
            salle.setCapacite(sals.getCapacite());
            salle.setDesignation(sals.getDesignation());
            salsDAO.update(salle);
        } else {
            System.out.println("Professeur introuvable avec ID : " + Id);
        }

    }

    public Salle getSalleById(int profId) {
        Salle salle = salsDAO.findById(profId);
        return salle;
    }
    
        public void deleteSalle(int profId) {
        Salle sls = salsDAO.findById(profId);
        if (sls != null) {
            salsDAO.delete(sls);
        } else {
            System.out.println("Salle de classe introuvable avec ID : " + profId);
        }

    }
}
