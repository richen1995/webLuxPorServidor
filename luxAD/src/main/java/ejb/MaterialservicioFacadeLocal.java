/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Materialservicio;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface MaterialservicioFacadeLocal {

    void create(Materialservicio materialservicio);

    void edit(Materialservicio materialservicio);

    void remove(Materialservicio materialservicio);

    Materialservicio find(Object id);

    List<Materialservicio> findAll();

    List<Materialservicio> findRange(int[] range);

    int count();
    
    List<Materialservicio> obtenermaterialesdeservicio(String codigosrv);
}
