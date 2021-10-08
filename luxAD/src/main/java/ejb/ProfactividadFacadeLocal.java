/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Profactividad;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface ProfactividadFacadeLocal {

    void create(Profactividad profactividad);

    void edit(Profactividad profactividad);

    void remove(Profactividad profactividad);

    Profactividad find(Object id);

    List<Profactividad> findAll();

    List<Profactividad> findRange(int[] range);

    int count();
    
    List<Profactividad> obtenerVisitasPorProf(String codprof, String estado, String tipo);
     
    List<Profactividad> obtenerActPorFech(String codprof, String fecha);
    
}
