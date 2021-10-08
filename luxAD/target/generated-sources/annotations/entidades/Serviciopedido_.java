package entidades;

import entidades.Pedido;
import entidades.Servicio;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Serviciopedido.class)
public class Serviciopedido_ { 

    public static volatile SingularAttribute<Serviciopedido, Integer> svpId;
    public static volatile SingularAttribute<Serviciopedido, Pedido> pedId;
    public static volatile SingularAttribute<Serviciopedido, Servicio> srvId;
    public static volatile SingularAttribute<Serviciopedido, String> svpTipo;

}