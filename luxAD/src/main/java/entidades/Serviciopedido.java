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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "serviciopedido")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Serviciopedido.findAll", query = "SELECT s FROM Serviciopedido s")
    , @NamedQuery(name = "Serviciopedido.findBySvpTipo", query = "SELECT s FROM Serviciopedido s WHERE s.svpTipo = :svpTipo")
    , @NamedQuery(name = "Serviciopedido.findBySvpId", query = "SELECT s FROM Serviciopedido s WHERE s.svpId = :svpId")})
public class Serviciopedido implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 50)
    @Column(name = "svp_tipo")
    private String svpTipo;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "svp_id")
    private Integer svpId;
    @JoinColumn(name = "ped_id", referencedColumnName = "ped_id")
    @ManyToOne
    private Pedido pedId;
    @JoinColumn(name = "srv_id", referencedColumnName = "srv_id")
    @ManyToOne
    private Servicio srvId;

    public Serviciopedido() {
    }

    public Serviciopedido(Integer svpId) {
        this.svpId = svpId;
    }

    public String getSvpTipo() {
        return svpTipo;
    }

    public void setSvpTipo(String svpTipo) {
        this.svpTipo = svpTipo;
    }

    public Integer getSvpId() {
        return svpId;
    }

    public void setSvpId(Integer svpId) {
        this.svpId = svpId;
    }

    public Pedido getPedId() {
        return pedId;
    }

    public void setPedId(Pedido pedId) {
        this.pedId = pedId;
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
        hash += (svpId != null ? svpId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Serviciopedido)) {
            return false;
        }
        Serviciopedido other = (Serviciopedido) object;
        if ((this.svpId == null && other.svpId != null) || (this.svpId != null && !this.svpId.equals(other.svpId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Serviciopedido[ svpId=" + svpId + " ]";
    }
    
}
