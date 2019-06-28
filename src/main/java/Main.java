import entity.EmployeEntity;
import org.hibernate.Query;
import org.hibernate.Session;
import utils.HibernateSessionFactory;

import java.util.List;

/**
 * Created by istvolov on 28.06.19.
 */
public class Main {


    private List<EmployeEntity> getAllUsers (Session session) {

        Query query = session.createQuery("from entity.EmployeEntity");

//        query.setParameter("paramName", "Nick");
        return query.list();

    }


    public static void main (String... str) {

        Main main = new Main ();

        System.out.println("Hibernate tutorial");

        Session session = HibernateSessionFactory.getSessionFactory().openSession();

        session.beginTransaction();

        List<EmployeEntity> userList = main.getAllUsers(session);

        System.out.println(userList);


        session.close();
    }

}
