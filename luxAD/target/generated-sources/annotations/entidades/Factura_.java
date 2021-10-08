package entidades;

import entidades.Ordentrabajo;
import entidades.Venta;
import entidades.Visita;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Factura.class)
public class Factura_ { 

    public static volatile SingularAttribute<Factura, String> facTipago;
    public static volatile SingularAttribute<Factura, Date> facFechaemision;
    public static volatile SingularAttribute<Factura, Double> facValtotal;
    public static volatile SingularAttribute<Factura, Double> facSubtotalsiniva;
    public static volatile SingularAttribute<Factura, Integer> facId;
    public static volatile CollectionAttribute<Factura, Ordentrabajo> ordentrabajoCollection;
    public static volatile SingularAttribute<Factura, String> facRucemisor;
    public static volatile CollectionAttribute<Factura, Venta> ventaCollection;
    public static volatile SingularAttribute<Factura, String> facCodgiaemision;
    public static volatile SingularAttribute<Factura, Double> facDescuento;
    public static volatile CollectionAttribute<Factura, Visita> visitaCollection;
    public static volatile SingularAttribute<Factura, String> facCodigo;
    public static volatile SingularAttribute<Factura, String> facCodautorizacion;
    public static volatile SingularAttribute<Factura, Double> facIva;
    public static volatile SingularAttribute<Factura, Double> facSubtotaliva;

}