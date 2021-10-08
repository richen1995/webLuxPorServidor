/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "servicio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Servicio.findAll", query = "SELECT s FROM Servicio s")
    , @NamedQuery(name = "Servicio.findBySrvId", query = "SELECT s FROM Servicio s WHERE s.srvId = :srvId")
    , @NamedQuery(name = "Servicio.findBySrvNombre", query = "SELECT s FROM Servicio s WHERE s.srvNombre = :srvNombre")
    , @NamedQuery(name = "Servicio.findBySrvTipo", query = "SELECT s FROM Servicio s WHERE s.srvTipo = :srvTipo")
    , @NamedQuery(name = "Servicio.findBySrvEstado", query = "SELECT s FROM Servicio s WHERE s.srvEstado = :srvEstado")
    , @NamedQuery(name = "Servicio.findBySrvImgmovil", query = "SELECT s FROM Servicio s WHERE s.srvImgmovil = :srvImgmovil")
    , @NamedQuery(name = "Servicio.findBySrvPrioridad", query = "SELECT s FROM Servicio s WHERE s.srvPrioridad = :srvPrioridad")})
public class Servicio implements Serializable {

    @OneToMany(mappedBy = "srvId")
    private Collection<Kit> kitCollection;
    @OneToMany(mappedBy = "srvId")
    private Collection<Materialservicio> materialservicioCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Size(min = 1, max = 10)
    @Column(name = "srv_id")
    private String srvId;
    @Size(max = 50)
    @Column(name = "srv_nombre")
    private String srvNombre;
    @Size(max = 50)
    @Column(name = "srv_tipo")
    private String srvTipo;
    @Column(name = "srv_estado")
    private Boolean srvEstado;
    @Size(max = 500)
    @Column(name = "srv_imgmovil")
    private String srvImgmovil;
    @Column(name = "srv_prioridad")
    private Integer srvPrioridad;
    @ManyToMany(mappedBy = "servicioCollection")
    private Collection<Actividad> actividadCollection;
    @ManyToMany(mappedBy = "servicioCollection")
    private Collection<Pedido> pedidoCollection;
    @OneToMany(mappedBy = "srvId")
    private Collection<Profservicio> profservicioCollection;

    public Servicio() {
    }

    public Servicio(String srvId) {
        this.srvId = srvId;
    }

    public String getSrvId() {
        return srvId;
    }

    public void setSrvId(String srvId) {
        this.srvId = srvId;
    }

    public String getSrvNombre() {
        return srvNombre;
    }

    public void setSrvNombre(String srvNombre) {
        this.srvNombre = srvNombre;
    }

    public String getSrvTipo() {
        return srvTipo;
    }

    public void setSrvTipo(String srvTipo) {
        this.srvTipo = srvTipo;
    }

    public Boolean getSrvEstado() {
        return srvEstado;
    }

    public void setSrvEstado(Boolean srvEstado) {
        this.srvEstado = srvEstado;
    }
    
    public String getSrvImgmovil() {
        return srvImgmovil;
    }

    public void setSrvImgmovil(String srvImgmovil) {
        this.srvImgmovil = srvImgmovil;
    }
    
    public Integer getSrvPrioridad() {
        return srvPrioridad;
    }

    public void setSrvPrioridad(Integer srvPrioridad) {
        this.srvPrioridad = srvPrioridad;
    }

    @XmlTransient
    public Collection<Actividad> getActividadCollection() {
        return actividadCollection;
    }

    public void setActividadCollection(Collection<Actividad> actividadCollection) {
        this.actividadCollection = actividadCollection;
    }

    @XmlTransient
    public Collection<Pedido> getPedidoCollection() {
        return pedidoCollection;
    }

    public void setPedidoCollection(Collection<Pedido> pedidoCollection) {
        this.pedidoCollection = pedidoCollection;
    }

    @XmlTransient
    public Collection<Profservicio> getProfservicioCollection() {
        return profservicioCollection;
    }

    public void setProfservicioCollection(Collection<Profservicio> profservicioCollection) {
        this.profservicioCollection = profservicioCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (srvId != null ? srvId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Servicio)) {
            return false;
        }
        Servicio other = (Servicio) object;
        if ((this.srvId == null && other.srvId != null) || (this.srvId != null && !this.srvId.equals(other.srvId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Servicio[ srvId=" + srvId + " ]";
    }

    @XmlTransient
    public Collection<Kit> getKitCollection() {
        return kitCollection;
    }

    public void setKitCollection(Collection<Kit> kitCollection) {
        this.kitCollection = kitCollection;
    }

    @XmlTransient
    public Collection<Materialservicio> getMaterialservicioCollection() {
        return materialservicioCollection;
    }

    public void setMaterialservicioCollection(Collection<Materialservicio> materialservicioCollection) {
        this.materialservicioCollection = materialservicioCollection;
    }
    
}
