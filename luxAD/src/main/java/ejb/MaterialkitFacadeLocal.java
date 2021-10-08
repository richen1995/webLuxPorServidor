/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Materialkit;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface MaterialkitFacadeLocal {

    void create(Materialkit materialkit);

    void edit(Materialkit materialkit);

    void remove(Materialkit materialkit);

    Materialkit find(Object id);

    List<Materialkit> findAll();

    List<Materialkit> findRange(int[] range);

    int count();
    
}
