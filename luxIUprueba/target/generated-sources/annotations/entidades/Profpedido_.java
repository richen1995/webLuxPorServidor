package entidades;

import entidades.Pedido;
import entidades.Profesional;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Profpedido.class)
public class Profpedido_ { 

    public static volatile SingularAttribute<Profpedido, Integer> propedId;
    public static volatile SingularAttribute<Profpedido, Pedido> pedId;
    public static volatile SingularAttribute<Profpedido, Profesional> profId;
    public static volatile SingularAttribute<Profpedido, String> propedEstado;

}