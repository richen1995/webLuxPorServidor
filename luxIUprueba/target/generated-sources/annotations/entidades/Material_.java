package entidades;

import entidades.Catalogomaterial;
import entidades.Materialkit;
import entidades.Materialservicio;
import entidades.Ordenmaterial;
import entidades.Ventamaterial;
import entidades.Viscotmaterial;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Material.class)
public class Material_ { 

    public static volatile SingularAttribute<Material, Integer> matStock;
    public static volatile SingularAttribute<Material, String> matCapacidad;
    public static volatile SingularAttribute<Material, String> matMarca;
    public static volatile CollectionAttribute<Material, Ventamaterial> ventamaterialCollection;
    public static volatile SingularAttribute<Material, BigDecimal> matPrecio;
    public static volatile SingularAttribute<Material, String> matDescripcion;
    public static volatile SingularAttribute<Material, String> matCompatibilidad;
    public static volatile SingularAttribute<Material, String> matCodcustom;
    public static volatile SingularAttribute<Material, String> matDimencion;
    public static volatile SingularAttribute<Material, String> matColor;
    public static volatile CollectionAttribute<Material, Materialservicio> materialservicioCollection;
    public static volatile SingularAttribute<Material, Catalogomaterial> ctmtId;
    public static volatile SingularAttribute<Material, Boolean> matPgweb;
    public static volatile SingularAttribute<Material, Double> matVoltaje;
    public static volatile SingularAttribute<Material, Double> matPotencia;
    public static volatile SingularAttribute<Material, String> matSalidas;
    public static volatile CollectionAttribute<Material, Materialkit> materialkitCollection;
    public static volatile SingularAttribute<Material, String> matTasa;
    public static volatile CollectionAttribute<Material, Viscotmaterial> viscotmaterialCollection;
    public static volatile SingularAttribute<Material, String> matCompresion;
    public static volatile SingularAttribute<Material, String> matImagen;
    public static volatile SingularAttribute<Material, Double> matCorriente;
    public static volatile SingularAttribute<Material, String> matId;
    public static volatile SingularAttribute<Material, Boolean> matEstado;
    public static volatile SingularAttribute<Material, String> matNombre;
    public static volatile SingularAttribute<Material, String> matTipoconexion;
    public static volatile CollectionAttribute<Material, Ordenmaterial> ordenmaterialCollection;
    public static volatile SingularAttribute<Material, String> matResolucion;

}