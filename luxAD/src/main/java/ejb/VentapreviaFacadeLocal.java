/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ventaprevia;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface VentapreviaFacadeLocal {

    void create(Ventaprevia ventaprevia);

    void edit(Ventaprevia ventaprevia);

    void remove(Ventaprevia ventaprevia);

    Ventaprevia find(Object id);

    List<Ventaprevia> findAll();

    List<Ventaprevia> findRange(int[] range);

    int count();
    
    List<Ventaprevia> obtenerventapreviaporcedula(String cedula);
    
    List<Ventaprevia> obtenerlistaordenadaporfecha();
    
    List<Ventaprevia> obtenervntpedporfechas(String fi, String ff);
}
