    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Usuario;
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
public class UsuarioFacade extends AbstractFacade<Usuario> implements UsuarioFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    @Override
    public Usuario obtenerusuario(String email, String password) {
        Usuario objUsuario = null;
        String consulta;
        try {
            consulta = "SELECT u FROM Usuario u WHERE u.usEmail like CONCAT(?1, '%') AND u.usPassword like CONCAT(?2, '%')";

            Query query = em.createQuery(consulta);
            query.setParameter(1, email);
            query.setParameter(2, password);
            List<Usuario> listaUsuario = query.getResultList();
            if (!listaUsuario.isEmpty()) {
                objUsuario = listaUsuario.get(0);
}
        } catch (Exception e) {
        }
        return objUsuario;
    }
    
    @Override
    public Usuario obtenerusuarioporemail(String email){
                Usuario objUsuario = null;
        String consulta;
        try {
            consulta = "SELECT u FROM Usuario u WHERE u.usEmail like CONCAT(?1, '%')";
            Query query = em.createQuery(consulta);
            query.setParameter(1, email);
            List<Usuario> listaUsuario = query.getResultList();
            if (!listaUsuario.isEmpty()) {
                objUsuario = listaUsuario.get(0);
            }
        } catch (Exception e) {
        }
        return objUsuario;
    }
    
    @Override
    public Usuario obtenerusuarioporcedula(String cedula){
        Usuario objUsuario = null;
        String consulta;
        try {
            consulta = "SELECT u FROM Usuario u WHERE u.perCedula.perCedula like CONCAT(?1, '%')";
            Query query = em.createQuery(consulta);
            query.setParameter(1, cedula);
            List<Usuario> listaUsuario = query.getResultList();
            if (!listaUsuario.isEmpty()) {
                objUsuario = listaUsuario.get(0);
            }
        } catch (Exception e) {
        }
        return objUsuario;
    }
}
