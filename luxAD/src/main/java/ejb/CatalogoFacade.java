/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Catalogo;
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
public class CatalogoFacade extends AbstractFacade<Catalogo> implements CatalogoFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CatalogoFacade() {
        super(Catalogo.class);
    }
    
    @Override
    public Catalogo obtenerCatalogo(String codcatalogo){
        Catalogo catalogo = new Catalogo();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT c FROM Catalogo c WHERE c.catCodigo = :codcat";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("codcat",codcatalogo);
            List<Catalogo> listcatalogo = query.getResultList();
            if (!listcatalogo.isEmpty()) 
                catalogo = listcatalogo.get(0);
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        
        return catalogo;
    }
}
