package entidades;

import entidades.Catalogo;
import entidades.Material;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Catalogomaterial.class)
public class Catalogomaterial_ { 

    public static volatile SingularAttribute<Catalogomaterial, Catalogo> catId;
    public static volatile CollectionAttribute<Catalogomaterial, Material> materialCollection;
    public static volatile SingularAttribute<Catalogomaterial, String> ctmtNombre;
    public static volatile SingularAttribute<Catalogomaterial, Integer> ctmtId;
    public static volatile SingularAttribute<Catalogomaterial, Boolean> ctmtEstado;

}