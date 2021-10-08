package entidades;

import entidades.Cliente;
import entidades.Cotkit;
import entidades.Profesional;
import entidades.Viscotmaterial;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Cotizacion.class)
public class Cotizacion_ { 

    public static volatile SingularAttribute<Cotizacion, Integer> cotId;
    public static volatile SingularAttribute<Cotizacion, String> cotNombre;
    public static volatile SingularAttribute<Cotizacion, Date> cotFechaini;
    public static volatile CollectionAttribute<Cotizacion, Viscotmaterial> viscotmaterialCollection;
    public static volatile SingularAttribute<Cotizacion, Double> cotIva;
    public static volatile SingularAttribute<Cotizacion, String> cotCodigo;
    public static volatile SingularAttribute<Cotizacion, Profesional> profId;
    public static volatile CollectionAttribute<Cotizacion, Cotkit> cotkitCollection;
    public static volatile SingularAttribute<Cotizacion, String> cotNomobra;
    public static volatile SingularAttribute<Cotizacion, Double> cotTotmat;
    public static volatile SingularAttribute<Cotizacion, Double> cotCostmanobra;
    public static volatile SingularAttribute<Cotizacion, Date> cotFechafin;
    public static volatile SingularAttribute<Cotizacion, Cliente> cliId;

}