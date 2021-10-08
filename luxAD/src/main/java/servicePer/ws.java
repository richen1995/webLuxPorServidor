/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicePer;

import ejb.ActividadFacadeLocal;
import ejb.CatalogoFacadeLocal;
import ejb.CatalogomaterialFacadeLocal;
import ejb.CiudadFacadeLocal;
import ejb.CotizacionFacadeLocal;
import ejb.KitFacadeLocal;
import ejb.MaterialFacadeLocal;
import ejb.ServicioFacadeLocal;
import ejb.UsuarioFacadeLocal;
import ejb.MaterialservicioFacadeLocal;
import ejb.ProfactividadFacadeLocal;
import ejb.ProfservicioFacadeLocal;
import ejb.ServiciopedidoFacadeLocal;
import ejb.VentakitFacadeLocal;
import ejb.VentamaterialFacadeLocal;
import ejb.VentapreviaFacadeLocal;
import entidades.Actividad;
import entidades.Catalogo;
import entidades.Catalogomaterial;
import entidades.Ciudad;
import entidades.Cotizacion;
import entidades.Kit;
import entidades.Material;
import entidades.Materialservicio;
import entidades.Profactividad;
import entidades.Profservicio;
import entidades.Servicio;
import entidades.Serviciopedido;
import entidades.Usuario;
import entidades.Ventakit;
import entidades.Ventamaterial;
import entidades.Ventaprevia;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;


/**
 *
 * @author Richard
 */

@Stateless
@Path("")
public class ws {
    @EJB
    private UsuarioFacadeLocal usuario;
    
    @EJB
    private CiudadFacadeLocal ciudad;
    
    @EJB
    private ServicioFacadeLocal servicio;
    
    @EJB
    private MaterialservicioFacadeLocal materialservicio;
    
    @EJB
    private ProfservicioFacadeLocal profesionalservicio;
    
    @EJB
    private KitFacadeLocal kit;
    
    @EJB
    private CatalogoFacadeLocal catalogo;
   
    @EJB
    private CotizacionFacadeLocal cotizacion;
    
    @EJB
    private CatalogomaterialFacadeLocal catalogomaterial;
    
    @EJB
    private ProfactividadFacadeLocal profactividad;
    
    @EJB
    private ServiciopedidoFacadeLocal serviciopedido;
    
    @EJB
    private ActividadFacadeLocal actividad;
    
    @EJB
    private MaterialFacadeLocal material;
    
    @EJB
    private VentapreviaFacadeLocal ventaprevia;
    
    @EJB
    private VentamaterialFacadeLocal ventamaterial;
    
    @EJB
    private VentakitFacadeLocal ventakit;
 
    @GET
    @Path("sessionusuario/{email}/{password}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
        public Usuario usuariodadocedula(@PathParam("email") String email, @PathParam("password") String password) {
        Usuario lstReturn = new Usuario();
        try {
            lstReturn = usuario.obtenerusuario(email, password);
            return lstReturn;
        } catch (Exception e) {
            lstReturn = null;
            return lstReturn;
        }
    }   
     
    @GET
    @Path("usuarioporemail/{email}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
        public Usuario usuariodadocedula(@PathParam("email") String email) {
        Usuario lstReturn = new Usuario();
        try {
            lstReturn = usuario.obtenerusuarioporemail(email);
            return lstReturn;
        } catch (Exception e) {
            lstReturn = null;
            return lstReturn;
        }
    }  
        
    @GET
    @Path("ciudadesdeprovincia/{codprovincia}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
        public List<Ciudad> ciudadesdeprovincia(@PathParam("codprovincia") String codprovincia) {
        List<Ciudad> listCiudad = null;
        try {
            listCiudad = ciudad.obtenerciudadesdeprovincia(codprovincia);
            return listCiudad;
        } catch (Exception e) {
            listCiudad = null;
            return listCiudad;
        }
    } 
        
    //Consultar servicios con estado true    
    @GET
    @Path("servicioshabilitados")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
        public List<Servicio> servioshabilitados() {
        List<Servicio> listServicio = null;
        try {
            listServicio = servicio.obtenerserviciosactivos();
            return listServicio;
        } catch (Exception e) {
            listServicio = null;
            return listServicio;
        }
    } 
        
    //Consultar lista de materiales por l codigo de un servicio   
    @GET
    @Path("materialporservicio/{codigosrv}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Materialservicio> materialporservicio(@PathParam("codigosrv") String codigosrv) {
        List<Materialservicio> listMaterialdeServicio = null;
        try {
            listMaterialdeServicio = materialservicio.obtenermaterialesdeservicio(codigosrv);
            return listMaterialdeServicio;
        } catch (Exception e) {
            listMaterialdeServicio = null;
            return listMaterialdeServicio;
        }
    } 
    
    //Obtener lista de materiales para mostrar en la pagina Web de Inicio con estado  true  
    @GET
    @Path("materialdewebinicioporestado")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Material> materialdepaginicio() {
        List<Material> listMaterial= null;
        try {
            listMaterial= material.obtenermaterialesdepaginicio();
            return listMaterial;
        } catch (Exception e) {
            listMaterial = null;
            return listMaterial;
        }
    }
    
    //Obtener lista de kits para mostrar en la pagina Web de Inicio con estado true  
    @GET
    @Path("kitdewebinicioporestado")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Kit> kitdepaginicio() {
        List<Kit> listKit= null;
        try {
            listKit = kit.obtenerkitsdepaginicio();
            return listKit;
        } catch (Exception e) {
            listKit = null;
            return listKit;
        }
    }
    
    //Consultar los profesionales de un servicio   
    @GET
    @Path("profecionalporservicio/{codigosrv}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Profservicio> profesionalporservicio(@PathParam("codigosrv") String codigosrv) {
        List<Profservicio> listProfesionaldeServicio = null;
        try {
            listProfesionaldeServicio = profesionalservicio.obtenerprofesionalesdeservicio(codigosrv);
            return listProfesionaldeServicio;
        } catch (Exception e) {
            listProfesionaldeServicio = null;
            return listProfesionaldeServicio;
        }
    }  
    
    //Obtener lista de los kits de un servicio   
    @GET
    @Path("kitporservicio/{codigosrv}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Kit> kitporservicio(@PathParam("codigosrv") String codigosrv) {
        List<Kit> listKitdeServicio = null;
        try {
            listKitdeServicio = kit.obtenerkitsdeservicio(codigosrv);
            return listKitdeServicio;
        } catch (Exception e) {
            listKitdeServicio = null;
            return listKitdeServicio;
        }
    } 
    
    //Obtener lista de servicios ordenados por prioridad   
    @GET
    @Path("servicioporprioridad")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Servicio> servicioporprioridad() {
        List<Servicio> listServicioporPrioridad = null;
        try {
            listServicioporPrioridad = servicio.obtenerservicioporprioridad();
            return listServicioporPrioridad;
        } catch (Exception e) {
            listServicioporPrioridad = null;
            return listServicioporPrioridad;
        }
    } 
    
    //Obtener registro catalogo usando el codigo CAT como parametro y no el id  
    @GET
    @Path("catalogoporcodigo/{codigocat}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Catalogo catalogoPorCodigo(@PathParam("codigocat") String codigocat) {
        Catalogo listCatalogoporCod = null;
        try {
            listCatalogoporCod = catalogo.obtenerCatalogo(codigocat);
            return listCatalogoporCod;
        } catch (Exception e) {
            listCatalogoporCod = null;
            return listCatalogoporCod;
        }
    }
    
    //Obtener lista de Cotizaciones de un Profecional
    @GET
    @Path("cotizacionporprofecional/{codigoprv}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Cotizacion> cotizacionporprofecional(@PathParam("codigoprv") String codigoprv) {
        List<Cotizacion> listCotizacionporCod = null;
        try {
            listCotizacionporCod = cotizacion.obtenerCotizacion(codigoprv);
            return listCotizacionporCod;
        } catch (Exception e) {
            listCotizacionporCod = null;
            return listCotizacionporCod;
        }
    }
    
    @GET
    @Path("kitultimoreg")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Kit kitporservicio() {
        Kit objKitUltimo = null;
        try {
            objKitUltimo = kit.obtenerkitregultimo();
            return objKitUltimo;
        } catch (Exception e) {
            objKitUltimo = null;
            return objKitUltimo;
        }
    }
    
    //Obtener lista de SubCatalogos de un Catalogo
    @GET
    @Path("subcatalogosdecatalogo/{codcatalogo}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Catalogomaterial> subcatalogodecatalogo(@PathParam("codcatalogo") String codcatalogo) {
        List<Catalogomaterial> listCotizacionporCod = null;
        try {
            listCotizacionporCod = catalogomaterial.obtenerSubCatalogos(codcatalogo);
            return listCotizacionporCod;
        } catch (Exception e) {
            listCotizacionporCod = null;
            return listCotizacionporCod;
        }
    }
    
    //Obtener Cotizacion por Codigo ingesado no por el Autoincrementable
    @GET
    @Path("cotizacionporcodigo/{codcotizacion}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Cotizacion cotizacionporcod(@PathParam("codcotizacion") String codcotizacion) {
        Cotizacion objCotizacion = null;
        try {
            objCotizacion = cotizacion.obtenerCotPorCod(codcotizacion);
            return objCotizacion;
        } catch (Exception e) {
            objCotizacion = null;
            return objCotizacion;
        }
    }
    
    //Obtener Visitas Pendientes de un Profesional por su CodigoProf Estado y Tipo
    @GET
    @Path("visitaspendientesporcodprof/{codprof}/{tipo}/{estado}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Profactividad> actvisitaspendporcodprof(@PathParam("codprof") String codprof, @PathParam("tipo") String tipo, @PathParam("estado") String estado) {
        List<Profactividad> objProfactividad = null;
        try {
            objProfactividad = profactividad.obtenerVisitasPorProf(codprof, estado,tipo);
            return objProfactividad;
        } catch (Exception e) {
            objProfactividad = null;
            return objProfactividad;
        }
    }
    
    //Obtener lista de Pedidos Segun el estado
    @GET
    @Path("pedidosporasignar/{estado}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Serviciopedido> actvisitaspendporcodprof(@PathParam("estado") String estado) {
        List<Serviciopedido> objServiciopedido = null;
        try {
            objServiciopedido = serviciopedido.obtenerPedidosPorAtender(estado);
            return objServiciopedido;
        } catch (Exception e) {
            objServiciopedido = null;
            return objServiciopedido;
        }
    }
    
    //Obtener Actividades Realizadas en unna fech determinada
    @GET
    @Path("actividadporfechestado/{estado}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Actividad> actividadesporfecha(@PathParam("estado") String estado) {
        List<Actividad> objActividad = null;
        try {
            objActividad = actividad.obtenerActPorFech(estado);
            return objActividad;
        } catch (Exception e) {
            objActividad = null;
            return objActividad;
        }   
    }
    
    //Obtener datos de la tabla VENTAPREVIA por cedula de la persona para recuperar los datos de entrega
    @GET
    @Path("ventapreviaporcedula/{cedula}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Ventaprevia> ventapreviaporcedulafecha(@PathParam("cedula") String cedula) {
        List<Ventaprevia> objVentaprevia = null;
        try {
            objVentaprevia = ventaprevia.obtenerventapreviaporcedula(cedula);
            return objVentaprevia;
        } catch (Exception e) {
            objVentaprevia = null;
            return objVentaprevia;
        }
    }
    
    //MOVIL Obtener lista de materiales seleccionados
    @GET
    @Path("materialescarritomovil/{cadmats}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Material> materialescarritomovil(@PathParam("cadmats") String cadmats) {
        List<Material> objMaterial = null;
        try {
            objMaterial = material.obtenerlistamaterialescarrito(cadmats);
            return objMaterial;
        } catch (Exception e) {
            objMaterial = null;
            return objMaterial;
        }
    }
    
    //Obtener lista de materiales de un Pedido en la tabla VentaMaterial
    @GET
    @Path("ventamaterialporcodvntprv/{codvntmat}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Ventamaterial> ventamaterialvntprv(@PathParam("codvntmat") String codvntmat) {
        List<Ventamaterial> objVentamaterial = null;
        try {
            objVentamaterial = ventamaterial.obtenerlistamaterialesvntprv(codvntmat);
            return objVentamaterial;
        } catch (Exception e) {
            objVentamaterial = null;
            return objVentamaterial;
        }
    }
    
    //Obtener lista de kits de un Pedido en la tabla VentaKit
    @GET
    @Path("ventakitporcodvntprv/{codvntkit}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Ventakit> ventakitvntprv(@PathParam("codvntkit") String codvntkit) {
        List<Ventakit> objVentakit = null;
        try {
            objVentakit = ventakit.obtenerlistakitsvntprv(codvntkit);
            return objVentakit;
        } catch (Exception e) {
            objVentakit = null;
            return objVentakit;
        }
    }
    
    //Obtener lista de VentaPrevia ordenada por fecha desde el pedido mas reciente 
    @GET
    @Path("ventapreviaporfechareciente")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Ventaprevia> ventapreviaporfechareciente() {
        List<Ventaprevia> objVentaprevia = null;
        try {
            objVentaprevia = ventaprevia.obtenerlistaordenadaporfecha();
            return objVentaprevia;
        } catch (Exception e) {
            objVentaprevia = null;
            return objVentaprevia;
        }
    }
    
    //Obtener Usuario por numero de cedula 
    @GET
    @Path("usuarioporcedula/{cedula}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public Usuario usuarioporcedula(@PathParam("cedula") String cedula) {
        Usuario objUsuario = null;
        try {
            objUsuario = usuario.obtenerusuarioporcedula(cedula);
            return objUsuario;
        } catch (Exception e) {
            objUsuario = null;
            return objUsuario;
        }
    }
 
     //Obtener Pdididos por Rango de fechas
    @GET
    @Path("pedvntporfechas/{fi}/{ff}")
    @Produces({"application/json; charset=utf-8"})
    @Consumes({"application/json; charset=utf-8"})
    public List<Ventaprevia> buscarvntpedporfechas(@PathParam("fi") String fi, @PathParam("ff") String ff) {
        List<Ventaprevia> listVentaprevia = null;
        try {
            listVentaprevia = ventaprevia.obtenervntpedporfechas(fi, ff);
            return listVentaprevia;
        } catch (Exception e) {
            listVentaprevia = null;
            return listVentaprevia;
        }
    }
    
    ////MENU-CAMARAS////
        //Camaras por Resolucion
        @GET
        @Path("camarasporresolucion/{resolucion}")
        @Produces({"application/json; charset=utf-8"})
        @Consumes({"application/json; charset=utf-8"})
        public List<Material> camarasporresolucion(@PathParam("resolucion") String resolucion) {
            List<Material> objMaterial = null;
            try {
                objMaterial = material.obtenercamarasporresolucion(resolucion);
                return objMaterial;
            } catch (Exception e) {
                objMaterial = null;
                return objMaterial;
            }
        }

        //Camaras por Marca
        @GET
        @Path("camaraspormarca/{marca}")
        @Produces({"application/json; charset=utf-8"})
        @Consumes({"application/json; charset=utf-8"})
        public List<Material> camaraspormarca(@PathParam("marca") String marca) {
            List<Material> objMaterial = null;
            try {
                objMaterial = material.obtenercamaraspormarca(marca);
                return objMaterial;
            } catch (Exception e) {
                objMaterial = null;
                return objMaterial;
            }
        }

        //DVR por Resolucion
        @GET
        @Path("dvrporresolucion/{resolucion}")
        @Produces({"application/json; charset=utf-8"})
        @Consumes({"application/json; charset=utf-8"})
        public List<Material> dvrporresolucion(@PathParam("resolucion") String resolucion) {
            List<Material> objMaterial = null;
            try {
                objMaterial = material.obtenerdvrporresolucion(resolucion);
                return objMaterial;
            } catch (Exception e) {
                objMaterial = null;
                return objMaterial;
            }
        }

        //GET CAMARA ColorVU
        @GET
        @Path("getmatporcolorvu")
        @Produces({"application/json; charset=utf-8"})
        @Consumes({"application/json; charset=utf-8"})
        public List<Material> getmatporcolorvu() {
            List<Material> objMaterial = null;
            try {
                objMaterial = material.obtenertmatporcolorvu();
                return objMaterial;
            } catch (Exception e) {
                objMaterial = null;
                return objMaterial;
            }
        }

        //GET CAMARA Termica
        @GET
        @Path("getcamaratermica")
        @Produces({"application/json; charset=utf-8"})
        @Consumes({"application/json; charset=utf-8"})
        public List<Material> getcamaratermica() {
            List<Material> objMaterial = null;
            try {
                objMaterial = material.obtenertcamaratermica();
                return objMaterial;
            } catch (Exception e) {
                objMaterial = null;
                return objMaterial;
            }
        }

        //GET MATERIALES POR CATALOGO  PARA (DISCODURO-NVR-MEMORIA)
        @GET
        @Path("getmatporcatalogo/{catalogo}")
        @Produces({"application/json; charset=utf-8"})
        @Consumes({"application/json; charset=utf-8"})
        public List<Material> getmatporcatalogo(@PathParam("catalogo") String catalogo) {
            List<Material> objMaterial = null;
            try {
                objMaterial = material.obtenermatporcatalogo(catalogo);
                return objMaterial;
            } catch (Exception e) {
                objMaterial = null;
                return objMaterial;
            }
        }

        //GET ACCESORIOS VIDEOVIGILANCIA
        @GET
        @Path("getaccesoriosdevideovigilancia")
        @Produces({"application/json; charset=utf-8"})
        @Consumes({"application/json; charset=utf-8"})
        public List<Material> getaccesoriosdevideovigilancia() {
            List<Material> objMaterial = null;
            try {
                objMaterial = material.obteneraccesoriosdevideovigilancia();
                return objMaterial;
            } catch (Exception e) {
                objMaterial = null;
                return objMaterial;
            }
        }
}