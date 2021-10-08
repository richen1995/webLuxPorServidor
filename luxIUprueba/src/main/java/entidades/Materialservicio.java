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
@Table(name = "materialservicio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Materialservicio.findAll", query = "SELECT m FROM Materialservicio m")
    , @NamedQuery(name = "Materialservicio.findByMtsId", query = "SELECT m FROM Materialservicio m WHERE m.mtsId = :mtsId")})
public class Materialservicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "mts_id")
    private Integer mtsId;
    @JoinColumn(name = "mat_id", referencedColumnName = "mat_id")
    @ManyToOne
    private Material matId;
    @JoinColumn(name = "srv_id", referencedColumnName = "srv_id")
    @ManyToOne
    private Servicio srvId;

    public Materialservicio() {
    }

    public Materialservicio(Integer mtsId) {
        this.mtsId = mtsId;
    }

    public Integer getMtsId() {
        return mtsId;
    }

    public void setMtsId(Integer mtsId) {
        this.mtsId = mtsId;
    }

    public Material getMatId() {
        return matId;
    }

    public void setMatId(Material matId) {
        this.matId = matId;
    }

    public Servicio getSrvId() {
        return srvId;
    }

    public void setSrvId(Servicio srvId) {
        this.srvId = srvId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mtsId != null ? mtsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Materialservicio)) {
            return false;
        }
        Materialservicio other = (Materialservicio) object;
        if ((this.mtsId == null && other.mtsId != null) || (this.mtsId != null && !this.mtsId.equals(other.mtsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Materialservicio[ mtsId=" + mtsId + " ]";
    }
    
}
