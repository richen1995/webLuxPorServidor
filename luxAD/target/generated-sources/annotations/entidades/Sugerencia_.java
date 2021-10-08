package entidades;

import entidades.Ordentrabajo;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Sugerencia.class)
public class Sugerencia_ { 

    public static volatile SingularAttribute<Sugerencia, Integer> sugCalificacion;
    public static volatile SingularAttribute<Sugerencia, Date> sugFecha;
    public static volatile SingularAttribute<Sugerencia, Ordentrabajo> ordtrId;
    public static volatile SingularAttribute<Sugerencia, Integer> sugId;
    public static volatile SingularAttribute<Sugerencia, String> sugDescripcion;

}