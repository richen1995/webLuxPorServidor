/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Serviciopedido;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface ServiciopedidoFacadeLocal {

    void create(Serviciopedido serviciopedido);

    void edit(Serviciopedido serviciopedido);

    void remove(Serviciopedido serviciopedido);

    Serviciopedido find(Object id);

    List<Serviciopedido> findAll();

    List<Serviciopedido> findRange(int[] range);

    int count();
    
    List<Serviciopedido> obtenerPedidosPorAtender(String estado);
}
