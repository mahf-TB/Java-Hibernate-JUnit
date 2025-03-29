
package com.model;

import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author mahefa
 */
@Entity
@Table(name = "occupers")
public class Occuper {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "prof_id")
    private Professeur prof;

    @ManyToOne
    @JoinColumn(name = "salle_id")
    private Salle salle;

    @Column(nullable = false)
    private LocalDate date;

    @Column(name = "heure_debut", nullable = false)
    private LocalTime heureDebut;

    @Column(name = "heure_fin", nullable = true)
    private LocalTime heureFin;

    public Occuper() {
    }

    public Occuper(Long id, Professeur prof, Salle salle, LocalDate date, LocalTime heureDebut, LocalTime heureFin) {
        this.id = id;
        this.prof = prof;
        this.salle = salle;
        this.date = date;
        this.heureDebut = heureDebut;
        this.heureFin = heureFin;
    }

    public Long getId() {
        return id;
    }

    public Professeur getProf() {
        return prof;
    }

    public Salle getSalle() {
        return salle;
    }

    public LocalDate getDate() {
        return date;
    }

    public LocalTime getHeureDebut() {
        return heureDebut;
    }

    public LocalTime getHeureFin() {
        return heureFin;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setProf(Professeur prof) {
        this.prof = prof;
    }

    public void setSalle(Salle salle) {
        this.salle = salle;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setHeureDebut(LocalTime heureDebut) {
        this.heureDebut = heureDebut;
    }

    public void setHeureFin(LocalTime heureFin) {
        this.heureFin = heureFin;
    }

    @Override
    public String toString() {
        return "com.model.Occuper[ id=" + id + " ]";
    }

}
