/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Profactividad;
import entidades.Serviciopedido;
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
public class ServiciopedidoFacade extends AbstractFacade<Serviciopedido> implements ServiciopedidoFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ServiciopedidoFacade() {
        super(Serviciopedido.class);
    }

    @Override
    public List<Serviciopedido> obtenerPedidosPorAtender(String estado){
        List<Serviciopedido> listServiciopedido = new ArrayList<Serviciopedido>();
        String consulta = null;
        try{
            consulta = "SELECT s FROM Serviciopedido s WHERE s.pedId.pedEstado = :estado";
            Query query = em.createQuery(consulta);
            query.setParameter("estado",estado);
            listServiciopedido = query.getResultList();
            if (!listServiciopedido.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }   
        return listServiciopedido;
    }
}
