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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "provincia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Provincia.findAll", query = "SELECT p FROM Provincia p")
    , @NamedQuery(name = "Provincia.findByPrvCodigo", query = "SELECT p FROM Provincia p WHERE p.prvCodigo = :prvCodigo")
    , @NamedQuery(name = "Provincia.findByPrvNombre", query = "SELECT p FROM Provincia p WHERE p.prvNombre = :prvNombre")
    , @NamedQuery(name = "Provincia.findByPrvEstado", query = "SELECT p FROM Provincia p WHERE p.prvEstado = :prvEstado")})
public class Provincia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "prv_codigo")
    private String prvCodigo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "prv_nombre")
    private String prvNombre;
    @Column(name = "prv_estado")
    private Boolean prvEstado;
    @OneToMany(mappedBy = "prvCodigo")
    private Collection<Ciudad> ciudadCollection;

    public Provincia() {
    }

    public Provincia(String prvCodigo) {
        this.prvCodigo = prvCodigo;
    }

    public Provincia(String prvCodigo, String prvNombre) {
        this.prvCodigo = prvCodigo;
        this.prvNombre = prvNombre;
    }

    public String getPrvCodigo() {
        return prvCodigo;
    }

    public void setPrvCodigo(String prvCodigo) {
        this.prvCodigo = prvCodigo;
    }

    public String getPrvNombre() {
        return prvNombre;
    }

    public void setPrvNombre(String prvNombre) {
        this.prvNombre = prvNombre;
    }

    public Boolean getPrvEstado() {
        return prvEstado;
    }

    public void setPrvEstado(Boolean prvEstado) {
        this.prvEstado = prvEstado;
    }

    @XmlTransient
    public Collection<Ciudad> getCiudadCollection() {
        return ciudadCollection;
    }

    public void setCiudadCollection(Collection<Ciudad> ciudadCollection) {
        this.ciudadCollection = ciudadCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (prvCodigo != null ? prvCodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Provincia)) {
            return false;
        }
        Provincia other = (Provincia) object;
        if ((this.prvCodigo == null && other.prvCodigo != null) || (this.prvCodigo != null && !this.prvCodigo.equals(other.prvCodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Provincia[ prvCodigo=" + prvCodigo + " ]";
    }
    
}
