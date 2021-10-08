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
@Table(name = "profactividad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Profactividad.findAll", query = "SELECT p FROM Profactividad p")
    , @NamedQuery(name = "Profactividad.findByPrfactId", query = "SELECT p FROM Profactividad p WHERE p.prfactId = :prfactId")})
public class Profactividad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "prfact_id")
    private Integer prfactId;
    @JoinColumn(name = "act_id", referencedColumnName = "act_id")
    @ManyToOne
    private Actividad actId;
    @JoinColumn(name = "prof_id", referencedColumnName = "prof_id")
    @ManyToOne
    private Profesional profId;

    public Profactividad() {
    }

    public Profactividad(Integer prfactId) {
        this.prfactId = prfactId;
    }

    public Integer getPrfactId() {
        return prfactId;
    }

    public void setPrfactId(Integer prfactId) {
        this.prfactId = prfactId;
    }

    public Actividad getActId() {
        return actId;
    }

    public void setActId(Actividad actId) {
        this.actId = actId;
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
        hash += (prfactId != null ? prfactId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Profactividad)) {
            return false;
        }
        Profactividad other = (Profactividad) object;
        if ((this.prfactId == null && other.prfactId != null) || (this.prfactId != null && !this.prfactId.equals(other.prfactId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Profactividad[ prfactId=" + prfactId + " ]";
    }
    
}
