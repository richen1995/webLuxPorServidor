/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Viscotmaterial;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface ViscotmaterialFacadeLocal {

    void create(Viscotmaterial viscotmaterial);

    void edit(Viscotmaterial viscotmaterial);

    void remove(Viscotmaterial viscotmaterial);

    Viscotmaterial find(Object id);

    List<Viscotmaterial> findAll();

    List<Viscotmaterial> findRange(int[] range);

    int count();
    
}
