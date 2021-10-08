/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Visita;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface VisitaFacadeLocal {

    void create(Visita visita);

    void edit(Visita visita);

    void remove(Visita visita);

    Visita find(Object id);

    List<Visita> findAll();

    List<Visita> findRange(int[] range);

    int count();
    
}
