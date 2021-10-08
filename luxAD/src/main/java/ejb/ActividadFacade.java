/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Actividad;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;

/**
 *
 * @author Richard
 */
@Stateless
public class ActividadFacade extends AbstractFacade<Actividad> implements ActividadFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ActividadFacade() {
        super(Actividad.class);
    }
    
    @Override
    public List<Actividad> obtenerActPorFech(String estado){
        List<Actividad> listActividad = new ArrayList<Actividad>();
        String consulta = null;
        Date fechaActual = new Date();
        Date fechaInicial = obtenerFechIniCalendar();
        try{
            consulta = "SELECT a FROM Actividad a WHERE a.actEstado = :estado AND a.actFechafin BETWEEN :fechaini AND :fechafin";
            Query query = em.createQuery(consulta);
            query.setParameter("fechaini",fechaInicial,TemporalType.DATE);
            query.setParameter("fechafin",fechaActual,TemporalType.DATE);
            query.setParameter("estado",estado);
            listActividad = query.getResultList();
            if (!listActividad.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }   
        return listActividad;
    }
    
    //Funcion Utilitaria
    Date obtenerFechIniCalendar(){
        Date fecha = null;
        Calendar calendar =  Calendar.getInstance();    
        int m = calendar.get(Calendar.MONTH) + 1;
        int y = calendar.get(Calendar.YEAR);
        
        String cadfecha = y + "-" + m + "-1";
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        try {
            fecha = formato.parse(cadfecha);
        } catch (ParseException ex) {
            Logger.getLogger(ActividadFacade.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Ha ocurrido un error en el paso de string a date");
        }
            System.out.println("FECHA DATE: " + fecha);
        return fecha;
    }
}
