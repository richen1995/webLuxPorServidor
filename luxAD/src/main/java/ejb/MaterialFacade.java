/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Material;
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
public class MaterialFacade extends AbstractFacade<Material> implements MaterialFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MaterialFacade() {
        super(Material.class);
    }
   
    public List<Material> obtenermaterialesdepaginicio(){
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Material m WHERE m.matEstado = :estado AND m.matPgweb = :web";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("web",true);
            listmat= query.getResultList();
            if (!listmat.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
    
            
    public List<Material> obtenerlistamaterialescarrito(String cadmats){
        //Material objMaterial = new Material();
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        //extrar los codigos de los materiales
        String[] codigosmtr = cadmats.split("_");
        
        try{
            for(int i=0;i<codigosmtr.length;i++){
                consultaSQL = "SELECT m FROM Material m WHERE m.matId = :id";
                Query query = em.createQuery(consultaSQL);
                query.setParameter("id",codigosmtr[i]);
                Material objMaterial = (Material) query.getSingleResult();
                if (objMaterial != null) 
                    listmat.add(objMaterial);
            }
        }catch(Exception e){    
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
    
    public List<Material> obtenercamarasporresolucion(String resolucion){
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Material m WHERE m.matEstado = :estado AND m.ctmtId.catId.catNombre = :catalogo AND m.matResolucion = :resolucion";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("catalogo","CÁMARA");
            query.setParameter("resolucion",resolucion);
            listmat= query.getResultList();
            if (!listmat.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
    
    public List<Material> obtenercamaraspormarca(String marca){
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Material m WHERE m.matEstado = :estado AND m.ctmtId.catId.catNombre = :catalogo AND m.matMarca = :marca";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("catalogo","CÁMARA");
            query.setParameter("marca",marca);
            listmat= query.getResultList();
            if (!listmat.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
    
    public List<Material> obtenerdvrporresolucion(String resolucion){
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Material m WHERE m.matEstado = :estado AND m.ctmtId.catId.catNombre = :catalogo AND m.matResolucion = :resolucion";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("catalogo","DVR");
            query.setParameter("resolucion",resolucion);
            listmat= query.getResultList();
            if (!listmat.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
    
    @Override
    public List<Material> obtenertmatporcolorvu(){
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Material m WHERE m.matEstado = :estado "
                        + "AND m.ctmtId.catId.catNombre = :catalogo "
                        + "AND ((UPPER(m.ctmtId.ctmtNombre) LIKE CONCAT('%',UPPER(:color1),'%'))"
                        + "OR (UPPER(m.ctmtId.ctmtNombre) LIKE CONCAT('%',UPPER(:color2),'%')))";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("catalogo","CÁMARA");
            query.setParameter("color1","Color Vu");
            query.setParameter("color2","ColorVu");
            listmat= query.getResultList();
            if (!listmat.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
    
    @Override
    public List<Material> obtenertcamaratermica(){
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Material m WHERE m.matEstado = :estado "
                        + "AND m.ctmtId.catId.catNombre = :catalogo "
                        + "AND UPPER(m.ctmtId.ctmtNombre) LIKE CONCAT('%',UPPER(:tipo),'%')";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("catalogo","CÁMARA");
            query.setParameter("tipo","térmica");
            listmat= query.getResultList();
            if (!listmat.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
    
    public List<Material> obtenermatporcatalogo(String catalogo){
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Material m WHERE m.matEstado = :estado AND m.ctmtId.catId.catNombre = :catalogo";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("catalogo",catalogo);
            listmat= query.getResultList();
            if (!listmat.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
    
    public List<Material> obteneraccesoriosdevideovigilancia(){
        List<Material> listmat= new ArrayList<Material>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Material m WHERE m.matEstado = :estado AND m.ctmtId.catId.catNombre = :catalogo";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("catalogo","ACCESORIO VIDEOVIGILANCIA");
            listmat= query.getResultList();
            if (!listmat.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmat;
    }
}
