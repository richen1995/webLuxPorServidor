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
@Table(name = "cotizacion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Cotizacion.findAll", query = "SELECT c FROM Cotizacion c")
    , @NamedQuery(name = "Cotizacion.findByCotId", query = "SELECT c FROM Cotizacion c WHERE c.cotId = :cotId")
    , @NamedQuery(name = "Cotizacion.findByCotCostmanobra", query = "SELECT c FROM Cotizacion c WHERE c.cotCostmanobra = :cotCostmanobra")
    , @NamedQuery(name = "Cotizacion.findByCotIva", query = "SELECT c FROM Cotizacion c WHERE c.cotIva = :cotIva")
    , @NamedQuery(name = "Cotizacion.findByCotTotmat", query = "SELECT c FROM Cotizacion c WHERE c.cotTotmat = :cotTotmat")
    , @NamedQuery(name = "Cotizacion.findByCotFechaini", query = "SELECT c FROM Cotizacion c WHERE c.cotFechaini = :cotFechaini")
    , @NamedQuery(name = "Cotizacion.findByCotFechafin", query = "SELECT c FROM Cotizacion c WHERE c.cotFechafin = :cotFechafin")
    , @NamedQuery(name = "Cotizacion.findByCotNombre", query = "SELECT c FROM Cotizacion c WHERE c.cotNombre = :cotNombre")
    , @NamedQuery(name = "Cotizacion.findByCotCodigo", query = "SELECT c FROM Cotizacion c WHERE c.cotCodigo = :cotCodigo")
    , @NamedQuery(name = "Cotizacion.findByCotNomobra", query = "SELECT c FROM Cotizacion c WHERE c.cotNomobra = :cotNomobra")})
public class Cotizacion implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cot_id")
    private Integer cotId;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "cot_costmanobra")
    private Double cotCostmanobra;
    @Column(name = "cot_iva")
    private Double cotIva;
    @Column(name = "cot_totmat")
    private Double cotTotmat;
    @Column(name = "cot_fechaini")
    @Temporal(TemporalType.DATE)
    private Date cotFechaini;
    @Column(name = "cot_fechafin")
    @Temporal(TemporalType.DATE)
    private Date cotFechafin;
    @Size(max = 200)
    @Column(name = "cot_nombre")
    private String cotNombre;
    @Size(max = 5)
    @Column(name = "cot_codigo")
    private String cotCodigo;
    @Size(max = 400)
    @Column(name = "cot_nomobra")
    private String cotNomobra;
    @OneToMany(mappedBy = "cotId")
    private Collection<Cotkit> cotkitCollection;
    @OneToMany(mappedBy = "cotId")
    private Collection<Viscotmaterial> viscotmaterialCollection;
    @JoinColumn(name = "cli_id", referencedColumnName = "cli_id")
    @ManyToOne
    private Cliente cliId;
    @JoinColumn(name = "prof_id", referencedColumnName = "prof_id")
    @ManyToOne
    private Profesional profId;

    public Cotizacion() {
    }

    public Cotizacion(Integer cotId) {
        this.cotId = cotId;
    }

    public Integer getCotId() {
        return cotId;
    }

    public void setCotId(Integer cotId) {
        this.cotId = cotId;
    }

    public Double getCotCostmanobra() {
        return cotCostmanobra;
    }

    public void setCotCostmanobra(Double cotCostmanobra) {
        this.cotCostmanobra = cotCostmanobra;
    }

    public Double getCotIva() {
        return cotIva;
    }

    public void setCotIva(Double cotIva) {
        this.cotIva = cotIva;
    }
    
    public Double getCotTotmat() {
        return cotTotmat;
    }

    public void setCotTotmat(Double cotTotmat) {
        this.cotTotmat = cotTotmat;
    }

    public Date getCotFechaini() {
        return cotFechaini;
    }

    public void setCotFechaini(Date cotFechaini) {
        this.cotFechaini = cotFechaini;
    }

    public Date getCotFechafin() {
        return cotFechafin;
    }

    public void setCotFechafin(Date cotFechafin) {
        this.cotFechafin = cotFechafin;
    }

    public String getCotNombre() {
        return cotNombre;
    }

    public void setCotNombre(String cotNombre) {
        this.cotNombre = cotNombre;
    }

    public String getCotCodigo() {
        return cotCodigo;
    }

    public void setCotCodigo(String cotCodigo) {
        this.cotCodigo = cotCodigo;
    }

    public String getCotNomobra() {
        return cotNomobra;
    }

    public void setCotNomobra(String cotNomobra) {
        this.cotNomobra = cotNomobra;
    }
    
    @XmlTransient
    public Collection<Cotkit> getCotkitCollection() {
        return cotkitCollection;
    }

    public void setCotkitCollection(Collection<Cotkit> cotkitCollection) {
        this.cotkitCollection = cotkitCollection;
    }
    
    @XmlTransient
    public Collection<Viscotmaterial> getViscotmaterialCollection() {
        return viscotmaterialCollection;
    }

    public void setViscotmaterialCollection(Collection<Viscotmaterial> viscotmaterialCollection) {
        this.viscotmaterialCollection = viscotmaterialCollection;
    }

    public Cliente getCliId() {
        return cliId;
    }

    public void setCliId(Cliente cliId) {
        this.cliId = cliId;
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
        hash += (cotId != null ? cotId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cotizacion)) {
            return false;
        }
        Cotizacion other = (Cotizacion) object;
        if ((this.cotId == null && other.cotId != null) || (this.cotId != null && !this.cotId.equals(other.cotId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Cotizacion[ cotId=" + cotId + " ]";
    }
    
}
