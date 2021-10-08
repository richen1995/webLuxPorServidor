/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Profpedido;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface ProfpedidoFacadeLocal {

    void create(Profpedido profpedido);

    void edit(Profpedido profpedido);

    void remove(Profpedido profpedido);

    Profpedido find(Object id);

    List<Profpedido> findAll();

    List<Profpedido> findRange(int[] range);

    int count();
    
}
