/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Catalogomaterial;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface CatalogomaterialFacadeLocal {

    void create(Catalogomaterial catalogomaterial);

    void edit(Catalogomaterial catalogomaterial);

    void remove(Catalogomaterial catalogomaterial);

    Catalogomaterial find(Object id);

    List<Catalogomaterial> findAll();

    List<Catalogomaterial> findRange(int[] range);

    int count();
    
    List<Catalogomaterial> obtenerSubCatalogos(String codcatalogo);
    
}
