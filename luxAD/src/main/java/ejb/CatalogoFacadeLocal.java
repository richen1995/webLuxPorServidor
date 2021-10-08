/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Catalogo;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface CatalogoFacadeLocal {

    void create(Catalogo catalogo);

    void edit(Catalogo catalogo);

    void remove(Catalogo catalogo);

    Catalogo find(Object id);

    List<Catalogo> findAll();

    List<Catalogo> findRange(int[] range);

    int count();
    
    Catalogo obtenerCatalogo (String catalogo); //obtener catalogo por el codigo que es String  
}
