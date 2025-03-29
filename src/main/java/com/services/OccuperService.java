/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.services;

import com.dao.OccuperDAO;
import com.model.Occuper;

/**
 *
 * @author mahefa
 */
public class OccuperService {

    private OccuperDAO salsDAO;

    public OccuperService() {
        this.salsDAO = new OccuperDAO();
    }

    public void ajouterPlanning(Occuper prof) {
        salsDAO.save(prof);
    }
}
