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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "factura")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Factura.findAll", query = "SELECT f FROM Factura f")
    , @NamedQuery(name = "Factura.findByFacId", query = "SELECT f FROM Factura f WHERE f.facId = :facId")
    , @NamedQuery(name = "Factura.findByFacRucemisor", query = "SELECT f FROM Factura f WHERE f.facRucemisor = :facRucemisor")
    , @NamedQuery(name = "Factura.findByFacCodigo", query = "SELECT f FROM Factura f WHERE f.facCodigo = :facCodigo")
    , @NamedQuery(name = "Factura.findByFacCodautorizacion", query = "SELECT f FROM Factura f WHERE f.facCodautorizacion = :facCodautorizacion")
    , @NamedQuery(name = "Factura.findByFacFechaemision", query = "SELECT f FROM Factura f WHERE f.facFechaemision = :facFechaemision")
    , @NamedQuery(name = "Factura.findByFacCodgiaemision", query = "SELECT f FROM Factura f WHERE f.facCodgiaemision = :facCodgiaemision")
    , @NamedQuery(name = "Factura.findByFacIva", query = "SELECT f FROM Factura f WHERE f.facIva = :facIva")
    , @NamedQuery(name = "Factura.findByFacSubtotaliva", query = "SELECT f FROM Factura f WHERE f.facSubtotaliva = :facSubtotaliva")
    , @NamedQuery(name = "Factura.findByFacSubtotalsiniva", query = "SELECT f FROM Factura f WHERE f.facSubtotalsiniva = :facSubtotalsiniva")
    , @NamedQuery(name = "Factura.findByFacDescuento", query = "SELECT f FROM Factura f WHERE f.facDescuento = :facDescuento")
    , @NamedQuery(name = "Factura.findByFacValtotal", query = "SELECT f FROM Factura f WHERE f.facValtotal = :facValtotal")
    , @NamedQuery(name = "Factura.findByFacTipago", query = "SELECT f FROM Factura f WHERE f.facTipago = :facTipago")})
public class Factura implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "fac_id")
    private Integer facId;
    @Size(max = 25)
    @Column(name = "fac_rucemisor")
    private String facRucemisor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "fac_codigo")
    private String facCodigo;
    @Size(max = 25)
    @Column(name = "fac_codautorizacion")
    private String facCodautorizacion;
    @Column(name = "fac_fechaemision")
    @Temporal(TemporalType.DATE)
    private Date facFechaemision;
    @Size(max = 25)
    @Column(name = "fac_codgiaemision")
    private String facCodgiaemision;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "fac_iva")
    private Double facIva;
    @Column(name = "fac_subtotaliva")
    private Double facSubtotaliva;
    @Column(name = "fac_subtotalsiniva")
    private Double facSubtotalsiniva;
    @Column(name = "fac_descuento")
    private Double facDescuento;
    @Column(name = "fac_valtotal")
    private Double facValtotal;
    @Size(max = 8)
    @Column(name = "fac_tipago")
    private String facTipago;
    @OneToMany(mappedBy = "facId")
    private Collection<Venta> ventaCollection;
    @OneToMany(mappedBy = "facId")
    private Collection<Visita> visitaCollection;
    @OneToMany(mappedBy = "facId")
    private Collection<Ordentrabajo> ordentrabajoCollection;

    public Factura() {
    }

    public Factura(Integer facId) {
        this.facId = facId;
    }

    public Factura(Integer facId, String facCodigo) {
        this.facId = facId;
        this.facCodigo = facCodigo;
    }

    public Integer getFacId() {
        return facId;
    }

    public void setFacId(Integer facId) {
        this.facId = facId;
    }

    public String getFacRucemisor() {
        return facRucemisor;
    }

    public void setFacRucemisor(String facRucemisor) {
        this.facRucemisor = facRucemisor;
    }

    public String getFacCodigo() {
        return facCodigo;
    }

    public void setFacCodigo(String facCodigo) {
        this.facCodigo = facCodigo;
    }

    public String getFacCodautorizacion() {
        return facCodautorizacion;
    }

    public void setFacCodautorizacion(String facCodautorizacion) {
        this.facCodautorizacion = facCodautorizacion;
    }

    public Date getFacFechaemision() {
        return facFechaemision;
    }

    public void setFacFechaemision(Date facFechaemision) {
        this.facFechaemision = facFechaemision;
    }

    public String getFacCodgiaemision() {
        return facCodgiaemision;
    }

    public void setFacCodgiaemision(String facCodgiaemision) {
        this.facCodgiaemision = facCodgiaemision;
    }

    public Double getFacIva() {
        return facIva;
    }

    public void setFacIva(Double facIva) {
        this.facIva = facIva;
    }

    public Double getFacSubtotaliva() {
        return facSubtotaliva;
    }

    public void setFacSubtotaliva(Double facSubtotaliva) {
        this.facSubtotaliva = facSubtotaliva;
    }

    public Double getFacSubtotalsiniva() {
        return facSubtotalsiniva;
    }

    public void setFacSubtotalsiniva(Double facSubtotalsiniva) {
        this.facSubtotalsiniva = facSubtotalsiniva;
    }

    public Double getFacDescuento() {
        return facDescuento;
    }

    public void setFacDescuento(Double facDescuento) {
        this.facDescuento = facDescuento;
    }

    public Double getFacValtotal() {
        return facValtotal;
    }

    public void setFacValtotal(Double facValtotal) {
        this.facValtotal = facValtotal;
    }

    public String getFacTipago() {
        return facTipago;
    }

    public void setFacTipago(String facTipago) {
        this.facTipago = facTipago;
    }

    @XmlTransient
    public Collection<Venta> getVentaCollection() {
        return ventaCollection;
    }

    public void setVentaCollection(Collection<Venta> ventaCollection) {
        this.ventaCollection = ventaCollection;
    }

    @XmlTransient
    public Collection<Visita> getVisitaCollection() {
        return visitaCollection;
    }

    public void setVisitaCollection(Collection<Visita> visitaCollection) {
        this.visitaCollection = visitaCollection;
    }

    @XmlTransient
    public Collection<Ordentrabajo> getOrdentrabajoCollection() {
        return ordentrabajoCollection;
    }

    public void setOrdentrabajoCollection(Collection<Ordentrabajo> ordentrabajoCollection) {
        this.ordentrabajoCollection = ordentrabajoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (facId != null ? facId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Factura)) {
            return false;
        }
        Factura other = (Factura) object;
        if ((this.facId == null && other.facId != null) || (this.facId != null && !this.facId.equals(other.facId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Factura[ facId=" + facId + " ]";
    }
    
}
