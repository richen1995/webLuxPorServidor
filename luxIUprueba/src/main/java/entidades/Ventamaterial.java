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
@Table(name = "ventamaterial")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ventamaterial.findAll", query = "SELECT v FROM Ventamaterial v")
    , @NamedQuery(name = "Ventamaterial.findByVtmtId", query = "SELECT v FROM Ventamaterial v WHERE v.vtmtId = :vtmtId")
    , @NamedQuery(name = "Ventamaterial.findByVtmtCantidad", query = "SELECT v FROM Ventamaterial v WHERE v.vtmtCantidad = :vtmtCantidad")})
public class Ventamaterial implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "vtmt_id")
    private Integer vtmtId;
    @Column(name = "vtmt_cantidad")
    private Integer vtmtCantidad;
    @JoinColumn(name = "mat_id", referencedColumnName = "mat_id")
    @ManyToOne
    private Material matId;
    @JoinColumn(name = "vntp_id", referencedColumnName = "vntp_id")
    @ManyToOne
    private Ventaprevia vntpId;

    public Ventamaterial() {
    }

    public Ventamaterial(Integer vtmtId) {
        this.vtmtId = vtmtId;
    }

    public Integer getVtmtId() {
        return vtmtId;
    }

    public void setVtmtId(Integer vtmtId) {
        this.vtmtId = vtmtId;
    }

    public Integer getVtmtCantidad() {
        return vtmtCantidad;
    }

    public void setVtmtCantidad(Integer vtmtCantidad) {
        this.vtmtCantidad = vtmtCantidad;
    }

    public Material getMatId() {
        return matId;
    }

    public void setMatId(Material matId) {
        this.matId = matId;
    }

    public Ventaprevia getVntpId() {
        return vntpId;
    }

    public void setVntpId(Ventaprevia vntpId) {
        this.vntpId = vntpId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vtmtId != null ? vtmtId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ventamaterial)) {
            return false;
        }
        Ventamaterial other = (Ventamaterial) object;
        if ((this.vtmtId == null && other.vtmtId != null) || (this.vtmtId != null && !this.vtmtId.equals(other.vtmtId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Ventamaterial[ vtmtId=" + vtmtId + " ]";
    }
    
}
