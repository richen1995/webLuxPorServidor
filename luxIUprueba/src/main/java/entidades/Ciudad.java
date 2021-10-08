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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "ciudad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ciudad.findAll", query = "SELECT c FROM Ciudad c")
    , @NamedQuery(name = "Ciudad.findByCidCodigo", query = "SELECT c FROM Ciudad c WHERE c.cidCodigo = :cidCodigo")
    , @NamedQuery(name = "Ciudad.findByCidNombre", query = "SELECT c FROM Ciudad c WHERE c.cidNombre = :cidNombre")
    , @NamedQuery(name = "Ciudad.findByCidEstado", query = "SELECT c FROM Ciudad c WHERE c.cidEstado = :cidEstado")})
public class Ciudad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "cid_codigo")
    private String cidCodigo;
    @Size(max = 25)
    @Column(name = "cid_nombre")
    private String cidNombre;
    @Column(name = "cid_estado")
    private Boolean cidEstado;
    @OneToMany(mappedBy = "cidCodigo")
    private Collection<Persona> personaCollection;
    @OneToMany(mappedBy = "cidCodigo")
    private Collection<Ventaprevia> ventapreviaCollection;
    @JoinColumn(name = "prv_codigo", referencedColumnName = "prv_codigo")
    @ManyToOne
    private Provincia prvCodigo;

    public Ciudad() {
    }

    public Ciudad(String cidCodigo) {
        this.cidCodigo = cidCodigo;
    }

    public String getCidCodigo() {
        return cidCodigo;
    }

    public void setCidCodigo(String cidCodigo) {
        this.cidCodigo = cidCodigo;
    }

    public String getCidNombre() {
        return cidNombre;
    }

    public void setCidNombre(String cidNombre) {
        this.cidNombre = cidNombre;
    }

    public Boolean getCidEstado() {
        return cidEstado;
    }

    public void setCidEstado(Boolean cidEstado) {
        this.cidEstado = cidEstado;
    }

    @XmlTransient
    public Collection<Persona> getPersonaCollection() {
        return personaCollection;
    }

    public void setPersonaCollection(Collection<Persona> personaCollection) {
        this.personaCollection = personaCollection;
    }

    @XmlTransient
    public Collection<Ventaprevia> getVentapreviaCollection() {
        return ventapreviaCollection;
    }

    public void setVentapreviaCollection(Collection<Ventaprevia> ventapreviaCollection) {
        this.ventapreviaCollection = ventapreviaCollection;
    }
    
    public Provincia getPrvCodigo() {
        return prvCodigo;
    }

    public void setPrvCodigo(Provincia prvCodigo) {
        this.prvCodigo = prvCodigo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cidCodigo != null ? cidCodigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ciudad)) {
            return false;
        }
        Ciudad other = (Ciudad) object;
        if ((this.cidCodigo == null && other.cidCodigo != null) || (this.cidCodigo != null && !this.cidCodigo.equals(other.cidCodigo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Ciudad[ cidCodigo=" + cidCodigo + " ]";
    }
    
}
