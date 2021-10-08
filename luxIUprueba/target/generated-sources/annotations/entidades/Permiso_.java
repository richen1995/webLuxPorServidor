package entidades;

import entidades.Usuario;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:46")
@StaticMetamodel(Permiso.class)
public class Permiso_ { 

    public static volatile SingularAttribute<Permiso, String> pmNombre;
    public static volatile SingularAttribute<Permiso, Integer> pmId;
    public static volatile SingularAttribute<Permiso, String> pmCodigo;
    public static volatile CollectionAttribute<Permiso, Usuario> usuarioCollection;

}