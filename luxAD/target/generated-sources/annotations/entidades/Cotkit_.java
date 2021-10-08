package entidades;

import entidades.Cotizacion;
import entidades.Kit;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Cotkit.class)
public class Cotkit_ { 

    public static volatile SingularAttribute<Cotkit, Integer> ctktCantidad;
    public static volatile SingularAttribute<Cotkit, Integer> ctktId;
    public static volatile SingularAttribute<Cotkit, Cotizacion> cotId;
    public static volatile SingularAttribute<Cotkit, Kit> kitId;

}