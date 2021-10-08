package entidades;

import entidades.Kit;
import entidades.Ventaprevia;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Ventakit.class)
public class Ventakit_ { 

    public static volatile SingularAttribute<Ventakit, Integer> vtktId;
    public static volatile SingularAttribute<Ventakit, Integer> vtktCantidad;
    public static volatile SingularAttribute<Ventakit, Kit> kitId;
    public static volatile SingularAttribute<Ventakit, Ventaprevia> vntpId;

}