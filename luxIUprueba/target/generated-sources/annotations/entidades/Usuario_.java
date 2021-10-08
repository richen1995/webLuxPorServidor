package entidades;

import entidades.Permiso;
import entidades.Persona;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Usuario.class)
public class Usuario_ { 

    public static volatile SingularAttribute<Usuario, String> usFechainicial;
    public static volatile SingularAttribute<Usuario, String> usFechafinal;
    public static volatile SingularAttribute<Usuario, Persona> perCedula;
    public static volatile SingularAttribute<Usuario, String> usRol;
    public static volatile SingularAttribute<Usuario, String> usEmail;
    public static volatile SingularAttribute<Usuario, String> usPassword;
    public static volatile SingularAttribute<Usuario, Boolean> usEstado;
    public static volatile SingularAttribute<Usuario, Permiso> pmId;
    public static volatile SingularAttribute<Usuario, Integer> usId;

}