/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Cotizacion;
import entidades.Cotizacion;
import entidades.Cotizacion;
import entidades.Kit;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Richard
 */
@Stateless
public class CotizacionFacade extends AbstractFacade<Cotizacion> implements CotizacionFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CotizacionFacade() {
        super(Cotizacion.class);
    }

    @Override
    public List<Cotizacion> obtenerCotizacion(String codigoprv) {
        List<Cotizacion> listCotizacion = new ArrayList<Cotizacion>();
        String consulta = null;
        try{
            consulta = "SELECT c FROM Cotizacion c WHERE c.profId.profId = :codprv";
            Query query = em.createQuery(consulta);
            query.setParameter("codprv",codigoprv);
            listCotizacion = query.getResultList();
            if (!listCotizacion.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listCotizacion;
    }
    
    @Override
    public Cotizacion obtenerCotPorCod(String codcotizacion){
        Cotizacion objCot = new Cotizacion();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT c FROM Cotizacion c WHERE c.cotCodigo = :codcot";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("codcot", codcotizacion);
            List<Cotizacion> listCot = query.getResultList();
            if (!listCot.isEmpty()) 
                objCot = listCot.get(0);
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        
        return objCot;
    }
}
