
import com.model.Professeur;
import com.model.Salle;
import com.services.ProfesseurService;
import com.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mahefa
 */
public class Main {

    public static void main(String[] args) {

        ProfesseurService profService = new ProfesseurService(); // Ajouter une salle test
        Professeur prof = new Professeur("Se345", "TSial", "Bievnenu", "Assistant Enseignant");

        profService.ajouterProf(prof);

        System.out.println("Profs ajoutée avec succès !");
    }
}
