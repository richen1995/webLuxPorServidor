/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "profesional")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Profesional.findAll", query = "SELECT p FROM Profesional p")
    , @NamedQuery(name = "Profesional.findByProfEstudios", query = "SELECT p FROM Profesional p WHERE p.profEstudios = :profEstudios")
    , @NamedQuery(name = "Profesional.findByProfImagen", query = "SELECT p FROM Profesional p WHERE p.profImagen = :profImagen")
    , @NamedQuery(name = "Profesional.findByProfProfesion", query = "SELECT p FROM Profesional p WHERE p.profProfesion = :profProfesion")
    , @NamedQuery(name = "Profesional.findByProfId", query = "SELECT p FROM Profesional p WHERE p.profId = :profId")})
public class Profesional implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 500)
    @Column(name = "prof_estudios")
    private String profEstudios;
    @Size(max = 500)
    @Column(name = "prof_imagen")
    private String profImagen;
    @Size(max = 100)
    @Column(name = "prof_profesion")
    private String profProfesion;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Size(min = 1, max = 11)
    @Column(name = "prof_id")
    private String profId;
    @OneToMany(mappedBy = "profId")
    private Collection<Profpedido> profpedidoCollection;
    @OneToMany(mappedBy = "profId")
    private Collection<Profactividad> profactividadCollection;
    @OneToMany(mappedBy = "profId")
    private Collection<Profservicio> profservicioCollection;
    @OneToMany(mappedBy = "profId")
    private Collection<Cotizacion> cotizacionCollection;
    @JoinColumn(name = "per_cedula", referencedColumnName = "per_cedula")
    @ManyToOne
    private Persona perCedula;

    public Profesional() {
    }

    public Profesional(String profId) {
        this.profId = profId;
    }

    public String getProfEstudios() {
        return profEstudios;
    }

    public void setProfEstudios(String profEstudios) {
        this.profEstudios = profEstudios;
    }

    public String getProfImagen() {
        return profImagen;
    }

    public void setProfImagen(String profImagen) {
        this.profImagen = profImagen;
    }

    public String getProfProfesion() {
        return profProfesion;
    }

    public void setProfProfesion(String profProfesion) {
        this.profProfesion = profProfesion;
    }

    public String getProfId() {
        return profId;
    }

    public void setProfId(String profId) {
        this.profId = profId;
    }

    @XmlTransient
    public Collection<Profpedido> getProfpedidoCollection() {
        return profpedidoCollection;
    }

    public void setProfpedidoCollection(Collection<Profpedido> profpedidoCollection) {
        this.profpedidoCollection = profpedidoCollection;
    }

    @XmlTransient
    public Collection<Profactividad> getProfactividadCollection() {
        return profactividadCollection;
    }

    public void setProfactividadCollection(Collection<Profactividad> profactividadCollection) {
        this.profactividadCollection = profactividadCollection;
    }

    @XmlTransient
    public Collection<Profservicio> getProfservicioCollection() {
        return profservicioCollection;
    }

    public void setProfservicioCollection(Collection<Profservicio> profservicioCollection) {
        this.profservicioCollection = profservicioCollection;
    }

    @XmlTransient
    public Collection<Cotizacion> getCotizacionCollection() {
        return cotizacionCollection;
    }

    public void setCotizacionCollection(Collection<Cotizacion> cotizacionCollection) {
        this.cotizacionCollection = cotizacionCollection;
    }

    public Persona getPerCedula() {
        return perCedula;
    }

    public void setPerCedula(Persona perCedula) {
        this.perCedula = perCedula;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (profId != null ? profId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Profesional)) {
            return false;
        }
        Profesional other = (Profesional) object;
        if ((this.profId == null && other.profId != null) || (this.profId != null && !this.profId.equals(other.profId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Profesional[ profId=" + profId + " ]";
    }
    
}
