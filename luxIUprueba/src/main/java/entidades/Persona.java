/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "persona")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Persona.findAll", query = "SELECT p FROM Persona p")
    , @NamedQuery(name = "Persona.findByPerCedula", query = "SELECT p FROM Persona p WHERE p.perCedula = :perCedula")
    , @NamedQuery(name = "Persona.findByPerNombre", query = "SELECT p FROM Persona p WHERE p.perNombre = :perNombre")
    , @NamedQuery(name = "Persona.findByPerApellido", query = "SELECT p FROM Persona p WHERE p.perApellido = :perApellido")
    , @NamedQuery(name = "Persona.findByPerCelular", query = "SELECT p FROM Persona p WHERE p.perCelular = :perCelular")
    , @NamedQuery(name = "Persona.findByPerSexo", query = "SELECT p FROM Persona p WHERE p.perSexo = :perSexo")
    , @NamedQuery(name = "Persona.findByPerRuc", query = "SELECT p FROM Persona p WHERE p.perRuc = :perRuc")
    , @NamedQuery(name = "Persona.findByPerFechanacimiento", query = "SELECT p FROM Persona p WHERE p.perFechanacimiento = :perFechanacimiento")
    , @NamedQuery(name = "Persona.findByPerDireccion", query = "SELECT p FROM Persona p WHERE p.perDireccion = :perDireccion")
    , @NamedQuery(name = "Persona.findByPerTipo", query = "SELECT p FROM Persona p WHERE p.perTipo = :perTipo")})
public class Persona implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "per_cedula")
    private String perCedula;
    @Size(max = 50)
    @Column(name = "per_nombre")
    private String perNombre;
    @Size(max = 50)
    @Column(name = "per_apellido")
    private String perApellido;
    @Size(max = 10)
    @Column(name = "per_celular")
    private String perCelular;
    @Size(max = 10)
    @Column(name = "per_sexo")
    private String perSexo;
    @Size(max = 25)
    @Column(name = "per_ruc")
    private String perRuc;
    @Column(name = "per_fechanacimiento")
    //@Temporal(TemporalType.DATE)
    private String perFechanacimiento;
    @Size(max = 200)
    @Column(name = "per_direccion")
    private String perDireccion;
    @Size(max = 25)
    @Column(name = "per_tipo")
    private String perTipo;
    @OneToMany(mappedBy = "perCedula")
    private Collection<Ventaprevia> ventapreviaCollection;
    @JoinColumn(name = "cid_codigo", referencedColumnName = "cid_codigo")
    @ManyToOne
    private Ciudad cidCodigo;
    @OneToMany(mappedBy = "perCedula")
    private Collection<Cliente> clienteCollection;
    @OneToMany(mappedBy = "perCedula")
    private Collection<Profesional> profesionalCollection;
    @OneToMany(mappedBy = "perCedula")
    private Collection<Usuario> usuarioCollection;

    public Persona() {
    }

    public Persona(String perCedula) {
        this.perCedula = perCedula;
    }

    public String getPerCedula() {
        return perCedula;
    }

    public void setPerCedula(String perCedula) {
        this.perCedula = perCedula;
    }

    public String getPerNombre() {
        return perNombre;
    }

    public void setPerNombre(String perNombre) {
        this.perNombre = perNombre;
    }

    public String getPerApellido() {
        return perApellido;
    }

    public void setPerApellido(String perApellido) {
        this.perApellido = perApellido;
    }

    public String getPerCelular() {
        return perCelular;
    }

    public void setPerCelular(String perCelular) {
        this.perCelular = perCelular;
    }

    public String getPerSexo() {
        return perSexo;
    }

    public void setPerSexo(String perSexo) {
        this.perSexo = perSexo;
    }

    public String getPerRuc() {
        return perRuc;
    }

    public void setPerRuc(String perRuc) {
        this.perRuc = perRuc;
    }

    public String getPerFechanacimiento() {
        return perFechanacimiento;
    }

    public void setPerFechanacimiento(String perFechanacimiento) {
        this.perFechanacimiento = perFechanacimiento;
    }

    public String getPerDireccion() {
        return perDireccion;
    }

    public void setPerDireccion(String perDireccion) {
        this.perDireccion = perDireccion;
    }

    public String getPerTipo() {
        return perTipo;
    }

    public void setPerTipo(String perTipo) {
        this.perTipo = perTipo;
    }

    @XmlTransient
    public Collection<Ventaprevia> getVentapreviaCollection() {
        return ventapreviaCollection;
    }

    public void setVentapreviaCollection(Collection<Ventaprevia> ventapreviaCollection) {
        this.ventapreviaCollection = ventapreviaCollection;
    }
    
    public Ciudad getCidCodigo() {
        return cidCodigo;
    }

    public void setCidCodigo(Ciudad cidCodigo) {
        this.cidCodigo = cidCodigo;
    }

    @XmlTransient
    public Collection<Cliente> getClienteCollection() {
        return clienteCollection;
    }

    public void setClienteCollection(Collection<Cliente> clienteCollection) {
        this.clienteCollection = clienteCollection;
    }

    @XmlTransient
    public Collection<Profesional> getProfesionalCollection() {
        return profesionalCollection;
    }

    public void setProfesionalCollection(Collection<Profesional> profesionalCollection) {
        this.profesionalCollection = profesionalCollection;
    }

    @XmlTransient
    public Collection<Usuario> getUsuarioCollection() {
        return usuarioCollection;
    }

    public void setUsuarioCollection(Collection<Usuario> usuarioCollection) {
        this.usuarioCollection = usuarioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (perCedula != null ? perCedula.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Persona)) {
            return false;
        }
        Persona other = (Persona) object;
        if ((this.perCedula == null && other.perCedula != null) || (this.perCedula != null && !this.perCedula.equals(other.perCedula))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Persona[ perCedula=" + perCedula + " ]";
    }
    
}
