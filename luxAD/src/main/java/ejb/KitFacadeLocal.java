/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Kit;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface KitFacadeLocal {

    void create(Kit kit);

    void edit(Kit kit);

    void remove(Kit kit);

    Kit find(Object id);

    List<Kit> findAll();

    List<Kit> findRange(int[] range);

    int count();
    
    List<Kit> obtenerkitsdeservicio(String codigosrv);
    
    Kit obtenerkitregultimo();
    
    List<Kit> obtenerkitsdepaginicio();
}
