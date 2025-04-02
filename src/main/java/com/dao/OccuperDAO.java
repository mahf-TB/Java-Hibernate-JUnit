/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.model.Occuper;
import com.utils.HibernateUtil;
import java.time.LocalDate;
import java.time.LocalTime;
import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 *
 * @author mahefa
 */
public class OccuperDAO extends DAOGeneric<Occuper> {

    public OccuperDAO() {
        super(Occuper.class);
    }

    public boolean estSalleDisponible(Long salleId, LocalDate date, LocalTime heureDebut, LocalTime heureFin) {
        String hql = "SELECT COUNT(o) FROM Occuper o "
                +"WHERE o.salle.id = :salleId "
               +" AND o.date = :date "
               +" AND (o.heureDebut < :heureFin AND o.heureFin > :heureDebut)";
        
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<Long> query = session.createQuery(hql, Long.class);
            query.setParameter("salleId", salleId);
            query.setParameter("date", date);
            query.setParameter("heureDebut", heureDebut);
            query.setParameter("heureFin", heureFin);

            Long count = query.uniqueResult();
            return count == 0; // True si pas de conflit
        }
    }

}
