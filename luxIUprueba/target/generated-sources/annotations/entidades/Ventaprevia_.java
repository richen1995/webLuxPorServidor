package entidades;

import entidades.Ciudad;
import entidades.Persona;
import entidades.Venta;
import entidades.Ventakit;
import entidades.Ventamaterial;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Ventaprevia.class)
public class Ventaprevia_ { 

    public static volatile SingularAttribute<Ventaprevia, String> vntpCallesecond;
    public static volatile SingularAttribute<Ventaprevia, String> vntpNumcasa;
    public static volatile SingularAttribute<Ventaprevia, Persona> perCedula;
    public static volatile CollectionAttribute<Ventaprevia, Ventamaterial> ventamaterialCollection;
    public static volatile CollectionAttribute<Ventaprevia, Ventakit> ventakitCollection;
    public static volatile SingularAttribute<Ventaprevia, String> vntpCodpostal;
    public static volatile SingularAttribute<Ventaprevia, BigDecimal> vntpImporte;
    public static volatile SingularAttribute<Ventaprevia, String> vntpTipuser;
    public static volatile SingularAttribute<Ventaprevia, String> vntpFecha;
    public static volatile SingularAttribute<Ventaprevia, Integer> vntpId;
    public static volatile CollectionAttribute<Ventaprevia, Venta> ventaCollection;
    public static volatile SingularAttribute<Ventaprevia, String> vntpReferencia;
    public static volatile SingularAttribute<Ventaprevia, Ciudad> cidCodigo;
    public static volatile SingularAttribute<Ventaprevia, String> vntpEstado;
    public static volatile SingularAttribute<Ventaprevia, String> vntpHora;
    public static volatile SingularAttribute<Ventaprevia, String> vntpCallefirst;
    public static volatile SingularAttribute<Ventaprevia, String> vntpSector;

}