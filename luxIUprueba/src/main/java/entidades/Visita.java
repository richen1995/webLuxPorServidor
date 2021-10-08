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
@Table(name = "visita")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Visita.findAll", query = "SELECT v FROM Visita v")
    , @NamedQuery(name = "Visita.findByVcId", query = "SELECT v FROM Visita v WHERE v.vcId = :vcId")
    , @NamedQuery(name = "Visita.findByVcHaycliente", query = "SELECT v FROM Visita v WHERE v.vcHaycliente = :vcHaycliente")})
public class Visita implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "vc_id")
    private Integer vcId;
    @Column(name = "vc_haycliente")
    private Boolean vcHaycliente;
    @JoinColumn(name = "act_id", referencedColumnName = "act_id")
    @ManyToOne
    private Actividad actId;
    @JoinColumn(name = "fac_id", referencedColumnName = "fac_id")
    @ManyToOne
    private Factura facId;

    public Visita() {
    }

    public Visita(Integer vcId) {
        this.vcId = vcId;
    }

    public Integer getVcId() {
        return vcId;
    }

    public void setVcId(Integer vcId) {
        this.vcId = vcId;
    }

    public Boolean getVcHaycliente() {
        return vcHaycliente;
    }

    public void setVcHaycliente(Boolean vcHaycliente) {
        this.vcHaycliente = vcHaycliente;
    }

    public Actividad getActId() {
        return actId;
    }

    public void setActId(Actividad actId) {
        this.actId = actId;
    }

    public Factura getFacId() {
        return facId;
    }

    public void setFacId(Factura facId) {
        this.facId = facId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vcId != null ? vcId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Visita)) {
            return false;
        }
        Visita other = (Visita) object;
        if ((this.vcId == null && other.vcId != null) || (this.vcId != null && !this.vcId.equals(other.vcId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Visita[ vcId=" + vcId + " ]";
    }
    
}
