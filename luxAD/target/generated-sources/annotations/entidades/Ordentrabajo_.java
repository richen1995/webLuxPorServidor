package entidades;

import entidades.Actividad;
import entidades.Factura;
import entidades.Ordenmaterial;
import entidades.Sugerencia;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Ordentrabajo.class)
public class Ordentrabajo_ { 

    public static volatile SingularAttribute<Ordentrabajo, Actividad> actId;
    public static volatile SingularAttribute<Ordentrabajo, Integer> ordtrId;
    public static volatile SingularAttribute<Ordentrabajo, Factura> facId;
    public static volatile CollectionAttribute<Ordentrabajo, Ordenmaterial> ordenmaterialCollection;
    public static volatile SingularAttribute<Ordentrabajo, Boolean> ordtrHaymat;
    public static volatile CollectionAttribute<Ordentrabajo, Sugerencia> sugerenciaCollection;

}