/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Cotizacion;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface CotizacionFacadeLocal {

    void create(Cotizacion cotizacion);

    void edit(Cotizacion cotizacion);

    void remove(Cotizacion cotizacion);

    Cotizacion find(Object id);

    List<Cotizacion> findAll();

    List<Cotizacion> findRange(int[] range);

    int count();
    
    List<Cotizacion> obtenerCotizacion(String codigoprv);
    
    Cotizacion obtenerCotPorCod(String codcotizacion);
}
