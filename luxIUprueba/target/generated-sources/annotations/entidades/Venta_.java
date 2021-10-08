package entidades;

import entidades.Factura;
import entidades.Ventaprevia;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Venta.class)
public class Venta_ { 

    public static volatile SingularAttribute<Venta, Integer> vntId;
    public static volatile SingularAttribute<Venta, Date> vntFecha;
    public static volatile SingularAttribute<Venta, Factura> facId;
    public static volatile SingularAttribute<Venta, Ventaprevia> vntpId;

}