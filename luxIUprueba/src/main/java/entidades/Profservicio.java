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
@Table(name = "profservicio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Profservicio.findAll", query = "SELECT p FROM Profservicio p")
    , @NamedQuery(name = "Profservicio.findByPrfsrv", query = "SELECT p FROM Profservicio p WHERE p.prfsrv = :prfsrv")})
public class Profservicio implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "prfsrv")
    private Integer prfsrv;
    @JoinColumn(name = "prof_id", referencedColumnName = "prof_id")
    @ManyToOne
    private Profesional profId;
    @JoinColumn(name = "srv_id", referencedColumnName = "srv_id")
    @ManyToOne
    private Servicio srvId;

    public Profservicio() {
    }

    public Profservicio(Integer prfsrv) {
        this.prfsrv = prfsrv;
    }

    public Integer getPrfsrv() {
        return prfsrv;
    }

    public void setPrfsrv(Integer prfsrv) {
        this.prfsrv = prfsrv;
    }

    public Profesional getProfId() {
        return profId;
    }

    public void setProfId(Profesional profId) {
        this.profId = profId;
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
        hash += (prfsrv != null ? prfsrv.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Profservicio)) {
            return false;
        }
        Profservicio other = (Profservicio) object;
        if ((this.prfsrv == null && other.prfsrv != null) || (this.prfsrv != null && !this.prfsrv.equals(other.prfsrv))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Profservicio[ prfsrv=" + prfsrv + " ]";
    }
    
}
