/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "cotkit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cotkit.findAll", query = "SELECT c FROM Cotkit c")
    , @NamedQuery(name = "Cotkit.findByCtktId", query = "SELECT c FROM Cotkit c WHERE c.ctktId = :ctktId")
    , @NamedQuery(name = "Cotkit.findByCtktCantidad", query = "SELECT c FROM Cotkit c WHERE c.ctktCantidad = :ctktCantidad")})
public class Cotkit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ctkt_id")
    private Integer ctktId;
    @Column(name = "ctkt_cantidad")
    private Integer ctktCantidad;
    @JoinColumn(name = "cot_id", referencedColumnName = "cot_id")
    @ManyToOne
    private Cotizacion cotId;
    @JoinColumn(name = "kit_id", referencedColumnName = "kit_id")
    @ManyToOne
    private Kit kitId;

    public Cotkit() {
    }

    public Cotkit(Integer ctktId) {
        this.ctktId = ctktId;
    }

    public Integer getCtktId() {
        return ctktId;
    }

    public void setCtktId(Integer ctktId) {
        this.ctktId = ctktId;
    }

    public Integer getCtktCantidad() {
        return ctktCantidad;
    }

    public void setCtktCantidad(Integer ctktCantidad) {
        this.ctktCantidad = ctktCantidad;
    }

    public Cotizacion getCotId() {
        return cotId;
    }

    public void setCotId(Cotizacion cotId) {
        this.cotId = cotId;
    }

    public Kit getKitId() {
        return kitId;
    }

    public void setKitId(Kit kitId) {
        this.kitId = kitId;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ctktId != null ? ctktId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cotkit)) {
            return false;
        }
        Cotkit other = (Cotkit) object;
        if ((this.ctktId == null && other.ctktId != null) || (this.ctktId != null && !this.ctktId.equals(other.ctktId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Cotkit[ ctktId=" + ctktId + " ]";
    }
    
}
