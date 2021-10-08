/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ventakit;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface VentakitFacadeLocal {

    void create(Ventakit ventakit);

    void edit(Ventakit ventakit);

    void remove(Ventakit ventakit);

    Ventakit find(Object id);

    List<Ventakit> findAll();

    List<Ventakit> findRange(int[] range);

    int count();
    
    List<Ventakit> obtenerlistakitsvntprv(String codvntkit);
}
