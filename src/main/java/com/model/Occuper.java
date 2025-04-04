package com.model;

import com.model.enumModel.TypeOccupation;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Transient;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

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

    @Column(nullable = false)
    private LocalDate date;

    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private TypeOccupation type;

    @Column(name = "heure_debut", nullable = false)
    private LocalTime heureDebut;

    @Column(name = "heure_fin", nullable = false)
    private LocalTime heureFin;

    @ManyToOne
    @JoinColumn(name = "prof_id")
    private Professeur prof;

    @ManyToOne
    @JoinColumn(name = "salle_id")
    private Salle salle;

    public Occuper() {
    }

    public Occuper(LocalDate date, TypeOccupation type, LocalTime heureDebut, LocalTime heureFin, Professeur prof, Salle salle) {
        this.date = date;
        this.type = type;
        this.heureDebut = heureDebut;
        this.heureFin = heureFin;
        this.prof = prof;
        this.salle = salle;

    }

    public Long getId() {
        return id;
    }

    public LocalDate getDate() {
        return date;
    }

    public TypeOccupation getType() {
        return type;
    }

    public LocalTime getHeureDebut() {
        return heureDebut;
    }

    public LocalTime getHeureFin() {
        return heureFin;
    }

    public Professeur getProf() {
        return prof;
    }

    public Salle getSalle() {
        return salle;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setType(TypeOccupation type) {
        this.type = type;
    }

    public void setHeureDebut(LocalTime heureDebut) {
        this.heureDebut = heureDebut;
    }

    public void setHeureFin(LocalTime heureFin) {
        this.heureFin = heureFin;
    }

    public void setProf(Professeur prof) {
        this.prof = prof;
    }

    public void setSalle(Salle salle) {
        this.salle = salle;
    }

    @Transient
    public boolean isEstPasse() {
        LocalDate today = LocalDate.now();
        LocalTime now = LocalTime.now();

        if (this.date.isBefore(today)) {
            return true;
        } else if (this.date.isEqual(today) && this.heureFin.isBefore(now)) {
            return true;
        }
        return false;
    }

    public String getFormattedDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy", Locale.FRENCH);
        return date.format(formatter);
    }

    @Override
    public String toString() {
        return "com.model.Occuper[ id=" + id + " ]";
    }

}
