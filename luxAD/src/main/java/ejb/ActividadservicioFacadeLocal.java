/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Actividadservicio;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface ActividadservicioFacadeLocal {

    void create(Actividadservicio actividadservicio);

    void edit(Actividadservicio actividadservicio);

    void remove(Actividadservicio actividadservicio);

    Actividadservicio find(Object id);

    List<Actividadservicio> findAll();

    List<Actividadservicio> findRange(int[] range);

    int count();
    
}
