/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import java.util.Set;
import javax.ws.rs.core.Application;

/**
 *
 * @author Richard
 */
@javax.ws.rs.ApplicationPath("webADluxflame")
public class ApplicationConfig extends Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }

    /**
     * Do not modify addRestResourceClasses() method.
     * It is automatically populated with
     * all resources defined in the project.
     * If required, comment out calling this method in getClasses().
     */
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(servicePer.ws.class);
        resources.add(servicios.ActividadFacadeREST.class);
        resources.add(servicios.ActividadservicioFacadeREST.class);
        resources.add(servicios.CatalogoFacadeREST.class);
        resources.add(servicios.CatalogomaterialFacadeREST.class);
        resources.add(servicios.CiudadFacadeREST.class);
        resources.add(servicios.ClienteFacadeREST.class);
        resources.add(servicios.CotizacionFacadeREST.class);
        resources.add(servicios.CotkitFacadeREST.class);
        resources.add(servicios.FacturaFacadeREST.class);
        resources.add(servicios.KitFacadeREST.class);
        resources.add(servicios.MaterialFacadeREST.class);
        resources.add(servicios.MaterialkitFacadeREST.class);
        resources.add(servicios.MaterialservicioFacadeREST.class);
        resources.add(servicios.OrdenmaterialFacadeREST.class);
        resources.add(servicios.OrdentrabajoFacadeREST.class);
        resources.add(servicios.PedidoFacadeREST.class);
        resources.add(servicios.PermisoFacadeREST.class);
        resources.add(servicios.PersonaFacadeREST.class);
        resources.add(servicios.ProfactividadFacadeREST.class);
        resources.add(servicios.ProfesionalFacadeREST.class);
        resources.add(servicios.ProfpedidoFacadeREST.class);
        resources.add(servicios.ProfservicioFacadeREST.class);
        resources.add(servicios.ProvinciaFacadeREST.class);
        resources.add(servicios.ServicioFacadeREST.class);
        resources.add(servicios.ServiciopedidoFacadeREST.class);
        resources.add(servicios.SugerenciaFacadeREST.class);
        resources.add(servicios.UsuarioFacadeREST.class);
        resources.add(servicios.VentaFacadeREST.class);
        resources.add(servicios.VentakitFacadeREST.class);
        resources.add(servicios.VentamaterialFacadeREST.class);
        resources.add(servicios.VentapreviaFacadeREST.class);
        resources.add(servicios.ViscotmaterialFacadeREST.class);
        resources.add(servicios.VisitaFacadeREST.class);
    }
    
}
