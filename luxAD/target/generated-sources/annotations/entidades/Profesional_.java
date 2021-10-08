package entidades;

import entidades.Cotizacion;
import entidades.Persona;
import entidades.Profactividad;
import entidades.Profpedido;
import entidades.Profservicio;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-10-08T12:24:04")
@StaticMetamodel(Profesional.class)
public class Profesional_ { 

    public static volatile SingularAttribute<Profesional, String> profProfesion;
    public static volatile CollectionAttribute<Profesional, Cotizacion> cotizacionCollection;
    public static volatile SingularAttribute<Profesional, String> profImagen;
    public static volatile SingularAttribute<Profesional, Persona> perCedula;
    public static volatile CollectionAttribute<Profesional, Profpedido> profpedidoCollection;
    public static volatile CollectionAttribute<Profesional, Profactividad> profactividadCollection;
    public static volatile SingularAttribute<Profesional, String> profEstudios;
    public static volatile SingularAttribute<Profesional, String> profId;
    public static volatile CollectionAttribute<Profesional, Profservicio> profservicioCollection;

}