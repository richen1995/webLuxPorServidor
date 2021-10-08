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
@Table(name = "actividadservicio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Actividadservicio.findAll", query = "SELECT a FROM Actividadservicio a")
    , @NamedQuery(name = "Actividadservicio.findBySvaId", query = "SELECT a FROM Actividadservicio a WHERE a.svaId = :svaId")
    , @NamedQuery(name = "Actividadservicio.findBySvaTipo", query = "SELECT a FROM Actividadservicio a WHERE a.svaTipo = :svaTipo")})
public class Actividadservicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sva_id")
    private Integer svaId;
    @Size(max = 50)
    @Column(name = "sva_tipo")
    private String svaTipo;
    @JoinColumn(name = "act_id", referencedColumnName = "act_id")
    @ManyToOne
    private Actividad actId;
    @JoinColumn(name = "srv_id", referencedColumnName = "srv_id")
    @ManyToOne
    private Servicio srvId;

    public Actividadservicio() {
    }

    public Actividadservicio(Integer svaId) {
        this.svaId = svaId;
    }

    public Integer getSvaId() {
        return svaId;
    }

    public void setSvaId(Integer svaId) {
        this.svaId = svaId;
    }

    public String getSvaTipo() {
        return svaTipo;
    }

    public void setSvaTipo(String svaTipo) {
        this.svaTipo = svaTipo;
    }

    public Actividad getActId() {
        return actId;
    }

    public void setActId(Actividad actId) {
        this.actId = actId;
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
        hash += (svaId != null ? svaId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Actividadservicio)) {
            return false;
        }
        Actividadservicio other = (Actividadservicio) object;
        if ((this.svaId == null && other.svaId != null) || (this.svaId != null && !this.svaId.equals(other.svaId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Actividadservicio[ svaId=" + svaId + " ]";
    }
    
}
