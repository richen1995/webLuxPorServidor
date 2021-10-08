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
@Table(name = "ventakit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ventakit.findAll", query = "SELECT v FROM Ventakit v")
    , @NamedQuery(name = "Ventakit.findByVtktId", query = "SELECT v FROM Ventakit v WHERE v.vtktId = :vtktId")
    , @NamedQuery(name = "Ventakit.findByVtktCantidad", query = "SELECT v FROM Ventakit v WHERE v.vtktCantidad = :vtktCantidad")})
public class Ventakit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "vtkt_id")
    private Integer vtktId;
    @Column(name = "vtkt_cantidad")
    private Integer vtktCantidad;
    @JoinColumn(name = "kit_id", referencedColumnName = "kit_id")
    @ManyToOne
    private Kit kitId;
    @JoinColumn(name = "vntp_id", referencedColumnName = "vntp_id")
    @ManyToOne
    private Ventaprevia vntpId;

    public Ventakit() {
    }

    public Ventakit(Integer vtktId) {
        this.vtktId = vtktId;
    }

    public Integer getVtktId() {
        return vtktId;
    }

    public void setVtktId(Integer vtktId) {
        this.vtktId = vtktId;
    }

    public Integer getVtktCantidad() {
        return vtktCantidad;
    }

    public void setVtktCantidad(Integer vtktCantidad) {
        this.vtktCantidad = vtktCantidad;
    }

    public Kit getKitId() {
        return kitId;
    }

    public void setKitId(Kit kitId) {
        this.kitId = kitId;
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
        hash += (vtktId != null ? vtktId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ventakit)) {
            return false;
        }
        Ventakit other = (Ventakit) object;
        if ((this.vtktId == null && other.vtktId != null) || (this.vtktId != null && !this.vtktId.equals(other.vtktId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Ventakit[ vtktId=" + vtktId + " ]";
    }
    
}
