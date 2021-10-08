package entidades;

import entidades.Cotkit;
import entidades.Materialkit;
import entidades.Servicio;
import entidades.Ventakit;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Kit.class)
public class Kit_ { 

    public static volatile SingularAttribute<Kit, String> kitImagen;
    public static volatile SingularAttribute<Kit, Boolean> kitPgweb;
    public static volatile SingularAttribute<Kit, String> kitId;
    public static volatile CollectionAttribute<Kit, Materialkit> materialkitCollection;
    public static volatile CollectionAttribute<Kit, Ventakit> ventakitCollection;
    public static volatile SingularAttribute<Kit, BigDecimal> kitDescuento;
    public static volatile CollectionAttribute<Kit, Cotkit> cotkitCollection;
    public static volatile SingularAttribute<Kit, Servicio> srvId;
    public static volatile SingularAttribute<Kit, String> kitMateriales;
    public static volatile SingularAttribute<Kit, Boolean> kitEstado;
    public static volatile SingularAttribute<Kit, BigDecimal> kitPrecio;

}