/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "pedido")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pedido.findAll", query = "SELECT p FROM Pedido p")
    , @NamedQuery(name = "Pedido.findByPedId", query = "SELECT p FROM Pedido p WHERE p.pedId = :pedId")
    , @NamedQuery(name = "Pedido.findByPedDescripcion", query = "SELECT p FROM Pedido p WHERE p.pedDescripcion = :pedDescripcion")
    , @NamedQuery(name = "Pedido.findByPedFecha", query = "SELECT p FROM Pedido p WHERE p.pedFecha = :pedFecha")
    , @NamedQuery(name = "Pedido.findByPedEstado", query = "SELECT p FROM Pedido p WHERE p.pedEstado = :pedEstado")
    , @NamedQuery(name = "Pedido.findByPedHora", query = "SELECT p FROM Pedido p WHERE p.pedHora = :pedHora")
    , @NamedQuery(name = "Pedido.findByPedDireccion", query = "SELECT p FROM Pedido p WHERE p.pedDireccion = :pedDireccion")})
public class Pedido implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ped_id")
    private Integer pedId;
    @Size(max = 500)
    @Column(name = "ped_descripcion")
    private String pedDescripcion;
    @Column(name = "ped_fecha")
    @Temporal(TemporalType.DATE)
    private Date pedFecha;
    @Size(max = 10)
    @Column(name = "ped_estado")
    private String pedEstado;
    @Column(name = "ped_hora")
    @Temporal(TemporalType.TIME)
    private Date pedHora;
    @Size(max = 100)
    @Column(name = "ped_direccion")
    private String pedDireccion;
    @OneToMany(mappedBy = "pedId")
    private Collection<Profpedido> profpedidoCollection;
    @JoinColumn(name = "cli_id", referencedColumnName = "cli_id")
    @ManyToOne
    private Cliente cliId;
    @OneToMany(mappedBy = "pedId")
    private Collection<Serviciopedido> serviciopedidoCollection;

    public Pedido() {
    }

    public Pedido(Integer pedId) {
        this.pedId = pedId;
    }

    public Integer getPedId() {
        return pedId;
    }

    public void setPedId(Integer pedId) {
        this.pedId = pedId;
    }

    public String getPedDescripcion() {
        return pedDescripcion;
    }

    public void setPedDescripcion(String pedDescripcion) {
        this.pedDescripcion = pedDescripcion;
    }

    public Date getPedFecha() {
        return pedFecha;
    }

    public void setPedFecha(Date pedFecha) {
        this.pedFecha = pedFecha;
    }

    public String getPedEstado() {
        return pedEstado;
    }

    public void setPedEstado(String pedEstado) {
        this.pedEstado = pedEstado;
    }

    public Date getPedHora() {
        return pedHora;
    }

    public void setPedHora(Date pedHora) {
        this.pedHora = pedHora;
    }

    public String getPedDireccion() {
        return pedDireccion;
    }

    public void setPedDireccion(String pedDireccion) {
        this.pedDireccion = pedDireccion;
    }

    @XmlTransient
    public Collection<Profpedido> getProfpedidoCollection() {
        return profpedidoCollection;
    }

    public void setProfpedidoCollection(Collection<Profpedido> profpedidoCollection) {
        this.profpedidoCollection = profpedidoCollection;
    }

    public Cliente getCliId() {
        return cliId;
    }

    public void setCliId(Cliente cliId) {
        this.cliId = cliId;
    }

    @XmlTransient
    public Collection<Serviciopedido> getServiciopedidoCollection() {
        return serviciopedidoCollection;
    }

    public void setServiciopedidoCollection(Collection<Serviciopedido> serviciopedidoCollection) {
        this.serviciopedidoCollection = serviciopedidoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (pedId != null ? pedId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pedido)) {
            return false;
        }
        Pedido other = (Pedido) object;
        if ((this.pedId == null && other.pedId != null) || (this.pedId != null && !this.pedId.equals(other.pedId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Pedido[ pedId=" + pedId + " ]";
    }
    
}
