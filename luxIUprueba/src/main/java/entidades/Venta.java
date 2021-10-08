/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "venta")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Venta.findAll", query = "SELECT v FROM Venta v")
    , @NamedQuery(name = "Venta.findByVntId", query = "SELECT v FROM Venta v WHERE v.vntId = :vntId")
    , @NamedQuery(name = "Venta.findByVntFecha", query = "SELECT v FROM Venta v WHERE v.vntFecha = :vntFecha")})
public class Venta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "vnt_id")
    private Integer vntId;
    @Column(name = "vnt_fecha")
    @Temporal(TemporalType.DATE)
    private Date vntFecha;
    @JoinColumn(name = "fac_id", referencedColumnName = "fac_id")
    @ManyToOne
    private Factura facId;
    @JoinColumn(name = "vntp_id", referencedColumnName = "vntp_id")
    @ManyToOne
    private Ventaprevia vntpId;

    public Venta() {
    }

    public Venta(Integer vntId) {
        this.vntId = vntId;
    }

    public Integer getVntId() {
        return vntId;
    }

    public void setVntId(Integer vntId) {
        this.vntId = vntId;
    }

    public Date getVntFecha() {
        return vntFecha;
    }

    public void setVntFecha(Date vntFecha) {
        this.vntFecha = vntFecha;
    }

    public Factura getFacId() {
        return facId;
    }

    public void setFacId(Factura facId) {
        this.facId = facId;
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
        hash += (vntId != null ? vntId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Venta)) {
            return false;
        }
        Venta other = (Venta) object;
        if ((this.vntId == null && other.vntId != null) || (this.vntId != null && !this.vntId.equals(other.vntId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Venta[ vntId=" + vntId + " ]";
    }
    
}