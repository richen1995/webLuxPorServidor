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
@Table(name = "ordentrabajo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ordentrabajo.findAll", query = "SELECT o FROM Ordentrabajo o")
    , @NamedQuery(name = "Ordentrabajo.findByOrdtrId", query = "SELECT o FROM Ordentrabajo o WHERE o.ordtrId = :ordtrId")
    , @NamedQuery(name = "Ordentrabajo.findByOrdtrTipo", query = "SELECT o FROM Ordentrabajo o WHERE o.ordtrTipo = :ordtrTipo")})
public class Ordentrabajo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ordtr_id")
    private Integer ordtrId;
    @Size(max = 25)
    @Column(name = "ordtr_tipo")
    private String ordtrTipo;
    @OneToMany(mappedBy = "ordtrId")
    private Collection<Ordenmaterial> ordenmaterialCollection;
    @JoinColumn(name = "act_id", referencedColumnName = "act_id")
    @ManyToOne
    private Actividad actId;
    @JoinColumn(name = "fac_id", referencedColumnName = "fac_id")
    @ManyToOne
    private Factura facId;
    @OneToMany(mappedBy = "ordtrId")
    private Collection<Sugerencia> sugerenciaCollection;

    public Ordentrabajo() {
    }

    public Ordentrabajo(Integer ordtrId) {
        this.ordtrId = ordtrId;
    }

    public Integer getOrdtrId() {
        return ordtrId;
    }

    public void setOrdtrId(Integer ordtrId) {
        this.ordtrId = ordtrId;
    }

    public String getOrdtrTipo() {
        return ordtrTipo;
    }

    public void setOrdtrTipo(String ordtrTipo) {
        this.ordtrTipo = ordtrTipo;
    }

    @XmlTransient
    public Collection<Ordenmaterial> getOrdenmaterialCollection() {
        return ordenmaterialCollection;
    }

    public void setOrdenmaterialCollection(Collection<Ordenmaterial> ordenmaterialCollection) {
        this.ordenmaterialCollection = ordenmaterialCollection;
    }

    public Actividad getActId() {
        return actId;
    }

    public void setActId(Actividad actId) {
        this.actId = actId;
    }

    public Factura getFacId() {
        return facId;
    }

    public void setFacId(Factura facId) {
        this.facId = facId;
    }

    @XmlTransient
    public Collection<Sugerencia> getSugerenciaCollection() {
        return sugerenciaCollection;
    }

    public void setSugerenciaCollection(Collection<Sugerencia> sugerenciaCollection) {
        this.sugerenciaCollection = sugerenciaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ordtrId != null ? ordtrId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ordentrabajo)) {
            return false;
        }
        Ordentrabajo other = (Ordentrabajo) object;
        if ((this.ordtrId == null && other.ordtrId != null) || (this.ordtrId != null && !this.ordtrId.equals(other.ordtrId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Ordentrabajo[ ordtrId=" + ordtrId + " ]";
    }
    
}
