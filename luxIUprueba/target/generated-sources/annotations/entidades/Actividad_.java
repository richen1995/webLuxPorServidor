package entidades;

import entidades.Cliente;
import entidades.Ordentrabajo;
import entidades.Profactividad;
import entidades.Servicio;
import entidades.Visita;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Actividad.class)
public class Actividad_ { 

    public static volatile CollectionAttribute<Actividad, Servicio> servicioCollection;
    public static volatile SingularAttribute<Actividad, BigDecimal> actCostomanoobra;
    public static volatile SingularAttribute<Actividad, String> actEstado;
    public static volatile SingularAttribute<Actividad, Integer> actId;
    public static volatile CollectionAttribute<Actividad, Profactividad> profactividadCollection;
    public static volatile SingularAttribute<Actividad, String> actHorafinal;
    public static volatile SingularAttribute<Actividad, String> actDireccion;
    public static volatile SingularAttribute<Actividad, String> actHorainicial;
    public static volatile CollectionAttribute<Actividad, Ordentrabajo> ordentrabajoCollection;
    public static volatile SingularAttribute<Actividad, String> actFechafin;
    public static volatile SingularAttribute<Actividad, String> actDescripcion;
    public static volatile SingularAttribute<Actividad, String> actTipo;
    public static volatile SingularAttribute<Actividad, String> actFechaini;
    public static volatile CollectionAttribute<Actividad, Visita> visitaCollection;
    public static volatile SingularAttribute<Actividad, Cliente> cliId;

}