/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.services;

import com.dao.ProfesseurDAO;
import com.model.Professeur;
import java.util.List;

/**
 *
 * @author mahefa
 */
public class ProfesseurService {

    private ProfesseurDAO profDAO;

    public ProfesseurService() {
        this.profDAO = new ProfesseurDAO();
    }

    public void ajouterProf(Professeur prof) {
        profDAO.save(prof);
    }

    public List<Professeur> getAllProfs() {
        return profDAO.findAll();
    }

    public Professeur getProfById(int profId) {
        Professeur prof = profDAO.findById(profId);
        return prof;
    }

    // Recherche d'un professeur avec un seul terme de recherche
    public List<Professeur> rechercherProfByNPC(String searchQuery) {
        return profDAO.rechercherProf(searchQuery);
    }

    public void updateProf(int profId, Professeur profssr) {
        Professeur prof = profDAO.findById(profId);
        if (prof != null) {
            prof.setCodeProf(profssr.getCodeProf());
            prof.setNom(profssr.getNom());
            prof.setPrenom(profssr.getPrenom());
            prof.setGrade(profssr.getGrade());
            profDAO.update(prof);
        } else {
            System.out.println("Professeur introuvable avec ID : " + profId);
        }

    }

    public void deleteProf(int profId) {
        Professeur prof = profDAO.findById(profId);
        if (prof != null) {
            profDAO.delete(prof);
        } else {
            System.out.println("Professeur introuvable avec ID : " + profId);
        }

    }
}
