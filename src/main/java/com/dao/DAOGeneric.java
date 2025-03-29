/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.utils.HibernateUtil;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mahefa
 */
public abstract class DAOGeneric<T> {

    private Class<T> entityType;

    public DAOGeneric(Class<T> entityType) {
        this.entityType = entityType;
    }

    public void save(T entity) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.persist(entity);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();  // Ferme la session après l'opération
            }
        }

    }

    public void update(T entity) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.merge(entity);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.close();  // Ferme la session après l'opération
            }
        }
    }

    public void delete(T entity) {
        Transaction transaction = null;
        Session session = null;
        try {

            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.delete(entity);
            transaction.commit();

        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();

        } finally {
            if (session != null && session.isOpen()) {
                session.close();  // Ferme la session après l'opération
            }
        }

    }

    public T findById(Serializable id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(entityType, id);
        }
    }

    public List<T> findAll() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from " + entityType.getName(), entityType).list();
        }
    }
}
