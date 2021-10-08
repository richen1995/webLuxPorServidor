package entidades;

import entidades.Actividadservicio;
import entidades.Kit;
import entidades.Materialservicio;
import entidades.Profservicio;
import entidades.Serviciopedido;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Servicio.class)
public class Servicio_ { 

    public static volatile SingularAttribute<Servicio, Boolean> srvEstado;
    public static volatile CollectionAttribute<Servicio, Actividadservicio> actividadservicioCollection;
    public static volatile CollectionAttribute<Servicio, Materialservicio> materialservicioCollection;
    public static volatile CollectionAttribute<Servicio, Serviciopedido> serviciopedidoCollection;
    public static volatile SingularAttribute<Servicio, Integer> srvPrioridad;
    public static volatile SingularAttribute<Servicio, String> srvId;
    public static volatile SingularAttribute<Servicio, String> srvImgmovil;
    public static volatile SingularAttribute<Servicio, String> srvNombre;
    public static volatile CollectionAttribute<Servicio, Kit> kitCollection;
    public static volatile CollectionAttribute<Servicio, Profservicio> profservicioCollection;

}