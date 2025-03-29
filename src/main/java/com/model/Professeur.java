package com.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 *
 * @author mahefa
 */
@Entity
@Table(name = "professeurs")
public class Professeur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    private String codeProf;
    @Column
    private String nom;
    @Column
    private String prenom;
    @Column
    private String grade;

    public Professeur() {
    }

    public Professeur(String codeProf, String nom, String prenom, String grade) {
        this.codeProf = codeProf;
        this.nom = nom;
        this.prenom = prenom;
        this.grade = grade;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCodeProf(String codeProf) {
        this.codeProf = codeProf;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    
    
    public Long getId() {
        return id;
    }

    public String getCodeProf() {
        return codeProf;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getGrade() {
        return grade;
    }

    @Override
    public String toString() {
        return "Professeur{"
                + "id=" + id
                + ", code='" + codeProf + '\''
                + ", nom='" + nom + '\''
                + ", prenom='" + prenom + '\''
                + ", grade=" + grade
                + '}';
    }

}
