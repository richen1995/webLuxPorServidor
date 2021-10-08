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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "viscotmaterial")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Viscotmaterial.findAll", query = "SELECT v FROM Viscotmaterial v")
    , @NamedQuery(name = "Viscotmaterial.findByVcmtId", query = "SELECT v FROM Viscotmaterial v WHERE v.vcmtId = :vcmtId")
    , @NamedQuery(name = "Viscotmaterial.findByVcmtCantidad", query = "SELECT v FROM Viscotmaterial v WHERE v.vcmtCantidad = :vcmtCantidad")})
public class Viscotmaterial implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "vcmt_id")
    private Integer vcmtId;
    @Column(name = "vcmt_cantidad")
    private Integer vcmtCantidad;
    @JoinColumn(name = "cot_id", referencedColumnName = "cot_id")
    @ManyToOne
    private Cotizacion cotId;
    @JoinColumn(name = "mat_id", referencedColumnName = "mat_id")
    @ManyToOne
    private Material matId;

    public Viscotmaterial() {
    }

    public Viscotmaterial(Integer vcmtId) {
        this.vcmtId = vcmtId;
    }

    public Integer getVcmtId() {
        return vcmtId;
    }

    public void setVcmtId(Integer vcmtId) {
        this.vcmtId = vcmtId;
    }

    public Integer getVcmtCantidad() {
        return vcmtCantidad;
    }

    public void setVcmtCantidad(Integer vcmtCantidad) {
        this.vcmtCantidad = vcmtCantidad;
    }

    public Cotizacion getCotId() {
        return cotId;
    }

    public void setCotId(Cotizacion cotId) {
        this.cotId = cotId;
    }

    public Material getMatId() {
        return matId;
    }

    public void setMatId(Material matId) {
        this.matId = matId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vcmtId != null ? vcmtId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Viscotmaterial)) {
            return false;
        }
        Viscotmaterial other = (Viscotmaterial) object;
        if ((this.vcmtId == null && other.vcmtId != null) || (this.vcmtId != null && !this.vcmtId.equals(other.vcmtId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Viscotmaterial[ vcmtId=" + vcmtId + " ]";
    }
    
}
