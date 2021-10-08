package entidades;

import entidades.Actividad;
import entidades.Factura;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Visita.class)
public class Visita_ { 

    public static volatile SingularAttribute<Visita, Boolean> vcHaycliente;
    public static volatile SingularAttribute<Visita, Actividad> actId;
    public static volatile SingularAttribute<Visita, Factura> facId;
    public static volatile SingularAttribute<Visita, Integer> vcId;

}