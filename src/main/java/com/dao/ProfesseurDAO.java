/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.Professeur;
import com.utils.HibernateUtil;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author mahefa
 */
public class ProfesseurDAO extends DAOGeneric<Professeur> {

    public ProfesseurDAO() {
        super(Professeur.class);
    }
    
    
        // Recherche d'un professeur en utilisant un seul terme de recherche
    public List<Professeur> rechercherProf(String searchQuery) {
        // Crée une session Hibernate pour effectuer la recherche
        String hql = "from Professeur p where "
                   + "p.nom like :searchQuery or "
                   + "p.prenom like :searchQuery or "
                   + "p.codeProf like :searchQuery";

        // Exécution de la requête HQL
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Professeur> query = session.createQuery(hql, Professeur.class);

            query.setParameter("searchQuery", "%" + searchQuery + "%");

            return query.list();
        }
    }
}
