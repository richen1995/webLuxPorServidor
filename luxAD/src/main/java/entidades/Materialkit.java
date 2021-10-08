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
@Table(name = "materialkit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Materialkit.findAll", query = "SELECT m FROM Materialkit m")
    , @NamedQuery(name = "Materialkit.findByMtkId", query = "SELECT m FROM Materialkit m WHERE m.mtkId = :mtkId")
    , @NamedQuery(name = "Materialkit.findByMtktCantidad", query = "SELECT m FROM Materialkit m WHERE m.mtktCantidad = :mtktCantidad")})
public class Materialkit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "mtk_id")
    private Integer mtkId;
    @Column(name = "mtkt_cantidad")
    private Integer mtktCantidad;
    @JoinColumn(name = "kit_id", referencedColumnName = "kit_id")
    @ManyToOne
    private Kit kitId;
    @JoinColumn(name = "mat_id", referencedColumnName = "mat_id")
    @ManyToOne
    private Material matId;

    public Materialkit() {
    }

    public Materialkit(Integer mtkId) {
        this.mtkId = mtkId;
    }

    public Integer getMtkId() {
        return mtkId;
    }

    public void setMtkId(Integer mtkId) {
        this.mtkId = mtkId;
    }

    public Kit getKitId() {
        return kitId;
    }

    public void setKitId(Kit kitId) {
        this.kitId = kitId;
    }

    public Material getMatId() {
        return matId;
    }

    public void setMatId(Material matId) {
        this.matId = matId;
    }
    
    public Integer getMtktCantidad() {
        return mtktCantidad;
    }

    public void setMtktCantidad(Integer mtktCantidad) {
        this.mtktCantidad = mtktCantidad;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mtkId != null ? mtkId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Materialkit)) {
            return false;
        }
        Materialkit other = (Materialkit) object;
        if ((this.mtkId == null && other.mtkId != null) || (this.mtkId != null && !this.mtkId.equals(other.mtkId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Materialkit[ mtkId=" + mtkId + " ]";
    }
    
}
