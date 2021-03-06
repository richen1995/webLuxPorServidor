/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Servicio;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author Richard
 */
@Local
public interface ServicioFacadeLocal {

    void create(Servicio servicio);

    void edit(Servicio servicio);

    void remove(Servicio servicio);

    Servicio find(Object id);

    List<Servicio> findAll();

    List<Servicio> findRange(int[] range);

    int count();
    
    //obtener solo ciudades activas con TRUE
    List<Servicio> obtenerserviciosactivos();
    
    //obtener servicios por prioridad
    List<Servicio> obtenerservicioporprioridad();
}
