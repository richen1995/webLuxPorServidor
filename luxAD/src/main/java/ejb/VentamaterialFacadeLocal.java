/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ventamaterial;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface VentamaterialFacadeLocal {

    void create(Ventamaterial ventamaterial);

    void edit(Ventamaterial ventamaterial);

    void remove(Ventamaterial ventamaterial);

    Ventamaterial find(Object id);

    List<Ventamaterial> findAll();

    List<Ventamaterial> findRange(int[] range);

    int count();
    
    List<Ventamaterial> obtenerlistamaterialesvntprv(String codvntmat);
}
