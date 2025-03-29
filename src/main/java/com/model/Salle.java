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
@Table(name = "salles")
public class Salle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(unique = true)
    private String codeSalle;
    @Column
    private String designation;
    @Column
    private int capacite;

    
    
    public Salle() {
    }
    public Salle(String codeSalle, String designation, int capacite) {

        this.codeSalle = codeSalle;
        this.designation = designation;
        this.capacite = capacite;
    }

    
    
    public Long getId() {
        return id;
    }
    public String getDesignation() {
        return designation;
    }
    public int getCapacite() {
        return capacite;
    }
    public String getCodeSalle() {
        return codeSalle;
    }

    
    
    public void setId(Long id) {
        this.id = id;
    }
    public void setDesignation(String designation) {
        this.designation = designation;
    }
    public void setCapacite(int capacite) {
        this.capacite = capacite;
    }
    public void setCodeSalle(String codeSalle) {
        this.codeSalle = codeSalle;
    }
    
    
    
    
    @Override
    public String toString() {
        return "Salle{"
                + "id=" + id
                + ", codeSalle='" + codeSalle + '\''
                + ", nom='" + designation + '\''
                + ", capacite=" + capacite
                + '}';
    }

}
