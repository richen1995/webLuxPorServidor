/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Profservicio;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface ProfservicioFacadeLocal {

    void create(Profservicio profservicio);

    void edit(Profservicio profservicio);

    void remove(Profservicio profservicio);

    Profservicio find(Object id);

    List<Profservicio> findAll();

    List<Profservicio> findRange(int[] range);

    int count();
    
    List<Profservicio> obtenerprofesionalesdeservicio(String codservicio);
}
