/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Material;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface MaterialFacadeLocal {

    void create(Material material);

    void edit(Material material);

    void remove(Material material);

    Material find(Object id);

    List<Material> findAll();

    List<Material> findRange(int[] range);

    int count();
    
    List<Material> obtenermaterialesdepaginicio();
    
    List<Material> obtenerlistamaterialescarrito(String cadmats);
    
    List<Material> obtenercamarasporresolucion(String resolucion);
    
    List<Material> obtenercamaraspormarca(String marca);
    
    List<Material> obtenerdvrporresolucion(String resolucion);
    
    List<Material> obtenermatporcatalogo(String catalogo);
    
    List<Material> obtenertmatporcolorvu();
    
    List<Material> obtenertcamaratermica();
    
    List<Material> obteneraccesoriosdevideovigilancia();
}
