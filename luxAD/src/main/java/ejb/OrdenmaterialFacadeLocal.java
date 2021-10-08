/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ordenmaterial;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface OrdenmaterialFacadeLocal {

    void create(Ordenmaterial ordenmaterial);

    void edit(Ordenmaterial ordenmaterial);

    void remove(Ordenmaterial ordenmaterial);

    Ordenmaterial find(Object id);

    List<Ordenmaterial> findAll();

    List<Ordenmaterial> findRange(int[] range);

    int count();
    
}
