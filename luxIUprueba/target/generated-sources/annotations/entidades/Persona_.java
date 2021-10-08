package entidades;

import entidades.Ciudad;
import entidades.Cliente;
import entidades.Profesional;
import entidades.Usuario;
import entidades.Ventaprevia;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T11:00:47")
@StaticMetamodel(Persona.class)
public class Persona_ { 

    public static volatile SingularAttribute<Persona, String> perRuc;
    public static volatile SingularAttribute<Persona, String> perDireccion;
    public static volatile SingularAttribute<Persona, String> perCedula;
    public static volatile SingularAttribute<Persona, String> perSexo;
    public static volatile CollectionAttribute<Persona, Usuario> usuarioCollection;
    public static volatile SingularAttribute<Persona, String> perNombre;
    public static volatile SingularAttribute<Persona, String> perTipo;
    public static volatile CollectionAttribute<Persona, Ventaprevia> ventapreviaCollection;
    public static volatile SingularAttribute<Persona, Ciudad> cidCodigo;
    public static volatile SingularAttribute<Persona, String> perFechanacimiento;
    public static volatile CollectionAttribute<Persona, Profesional> profesionalCollection;
    public static volatile SingularAttribute<Persona, String> perApellido;
    public static volatile SingularAttribute<Persona, String> perCelular;
    public static volatile CollectionAttribute<Persona, Cliente> clienteCollection;

}