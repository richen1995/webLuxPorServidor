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
@Table(name = "profpedido")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Profpedido.findAll", query = "SELECT p FROM Profpedido p")
    , @NamedQuery(name = "Profpedido.findByPropedId", query = "SELECT p FROM Profpedido p WHERE p.propedId = :propedId")
    , @NamedQuery(name = "Profpedido.findByPropedEstado", query = "SELECT p FROM Profpedido p WHERE p.propedEstado = :propedEstado")})
public class Profpedido implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "proped_id")
    private Integer propedId;
    @Size(max = 25)
    @Column(name = "proped_estado")
    private String propedEstado;
    @JoinColumn(name = "ped_id", referencedColumnName = "ped_id")
    @ManyToOne
    private Pedido pedId;
    @JoinColumn(name = "prof_id", referencedColumnName = "prof_id")
    @ManyToOne
    private Profesional profId;

    public Profpedido() {
    }

    public Profpedido(Integer propedId) {
        this.propedId = propedId;
    }

    public Integer getPropedId() {
        return propedId;
    }

    public void setPropedId(Integer propedId) {
        this.propedId = propedId;
    }

    public String getPropedEstado() {
        return propedEstado;
    }

    public void setPropedEstado(String propedEstado) {
        this.propedEstado = propedEstado;
    }

    public Pedido getPedId() {
        return pedId;
    }

    public void setPedId(Pedido pedId) {
        this.pedId = pedId;
    }

    public Profesional getProfId() {
        return profId;
    }

    public void setProfId(Profesional profId) {
        this.profId = profId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (propedId != null ? propedId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Profpedido)) {
            return false;
        }
        Profpedido other = (Profpedido) object;
        if ((this.propedId == null && other.propedId != null) || (this.propedId != null && !this.propedId.equals(other.propedId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Profpedido[ propedId=" + propedId + " ]";
    }
    
}
