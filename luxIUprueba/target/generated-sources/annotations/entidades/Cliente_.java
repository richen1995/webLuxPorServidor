package entidades;

import entidades.Actividad;
import entidades.Cotizacion;
import entidades.Pedido;
import entidades.Persona;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:46")
@StaticMetamodel(Cliente.class)
public class Cliente_ { 

    public static volatile CollectionAttribute<Cliente, Cotizacion> cotizacionCollection;
    public static volatile SingularAttribute<Cliente, Persona> perCedula;
    public static volatile CollectionAttribute<Cliente, Actividad> actividadCollection;
    public static volatile SingularAttribute<Cliente, Boolean> cliEstado;
    public static volatile CollectionAttribute<Cliente, Pedido> pedidoCollection;
    public static volatile SingularAttribute<Cliente, String> cliId;

}