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
@Table(name = "ordenmaterial")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ordenmaterial.findAll", query = "SELECT o FROM Ordenmaterial o")
    , @NamedQuery(name = "Ordenmaterial.findByOrdmtId", query = "SELECT o FROM Ordenmaterial o WHERE o.ordmtId = :ordmtId")
    , @NamedQuery(name = "Ordenmaterial.findByOrdmtCantidad", query = "SELECT o FROM Ordenmaterial o WHERE o.ordmtCantidad = :ordmtCantidad")})
public class Ordenmaterial implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ordmt_id")
    private Integer ordmtId;
    @Column(name = "ordmt_cantidad")
    private Integer ordmtCantidad;
    @JoinColumn(name = "mat_id", referencedColumnName = "mat_id")
    @ManyToOne
    private Material matId;
    @JoinColumn(name = "ordtr_id", referencedColumnName = "ordtr_id")
    @ManyToOne
    private Ordentrabajo ordtrId;

    public Ordenmaterial() {
    }

    public Ordenmaterial(Integer ordmtId) {
        this.ordmtId = ordmtId;
    }

    public Integer getOrdmtId() {
        return ordmtId;
    }

    public void setOrdmtId(Integer ordmtId) {
        this.ordmtId = ordmtId;
    }

    public Integer getOrdmtCantidad() {
        return ordmtCantidad;
    }

    public void setOrdmtCantidad(Integer ordmtCantidad) {
        this.ordmtCantidad = ordmtCantidad;
    }

    public Material getMatId() {
        return matId;
    }

    public void setMatId(Material matId) {
        this.matId = matId;
    }

    public Ordentrabajo getOrdtrId() {
        return ordtrId;
    }

    public void setOrdtrId(Ordentrabajo ordtrId) {
        this.ordtrId = ordtrId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ordmtId != null ? ordmtId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ordenmaterial)) {
            return false;
        }
        Ordenmaterial other = (Ordenmaterial) object;
        if ((this.ordmtId == null && other.ordmtId != null) || (this.ordmtId != null && !this.ordmtId.equals(other.ordmtId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Ordenmaterial[ ordmtId=" + ordmtId + " ]";
    }
    
}
