/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.math.BigDecimal;
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
@Table(name = "ventaprevia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ventaprevia.findAll", query = "SELECT v FROM Ventaprevia v")
    , @NamedQuery(name = "Ventaprevia.findByVntpImporte", query = "SELECT v FROM Ventaprevia v WHERE v.vntpImporte = :vntpImporte")
    , @NamedQuery(name = "Ventaprevia.findByVntpId", query = "SELECT v FROM Ventaprevia v WHERE v.vntpId = :vntpId")
    , @NamedQuery(name = "Ventaprevia.findByVntpEstado", query = "SELECT v FROM Ventaprevia v WHERE v.vntpEstado = :vntpEstado")
    , @NamedQuery(name = "Ventaprevia.findByVntpTipuser", query = "SELECT v FROM Ventaprevia v WHERE v.vntpTipuser = :vntpTipuser")
    , @NamedQuery(name = "Ventaprevia.findByVntpCallefirst", query = "SELECT v FROM Ventaprevia v WHERE v.vntpCallefirst = :vntpCallefirst")
    , @NamedQuery(name = "Ventaprevia.findByVntpCallesecond", query = "SELECT v FROM Ventaprevia v WHERE v.vntpCallesecond = :vntpCallesecond")
    , @NamedQuery(name = "Ventaprevia.findByVntpSector", query = "SELECT v FROM Ventaprevia v WHERE v.vntpSector = :vntpSector")
    , @NamedQuery(name = "Ventaprevia.findByVntpNumcasa", query = "SELECT v FROM Ventaprevia v WHERE v.vntpNumcasa = :vntpNumcasa")
    , @NamedQuery(name = "Ventaprevia.findByVntpCodpostal", query = "SELECT v FROM Ventaprevia v WHERE v.vntpCodpostal = :vntpCodpostal")
    , @NamedQuery(name = "Ventaprevia.findByVntpReferencia", query = "SELECT v FROM Ventaprevia v WHERE v.vntpReferencia = :vntpReferencia")
    , @NamedQuery(name = "Ventaprevia.findByVntpFecha", query = "SELECT v FROM Ventaprevia v WHERE v.vntpFecha = :vntpFecha")
    , @NamedQuery(name = "Ventaprevia.findByVntpHora", query = "SELECT v FROM Ventaprevia v WHERE v.vntpHora = :vntpHora")})
public class Ventaprevia implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "vntp_importe")
    private BigDecimal vntpImporte;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "vntp_id")
    private Integer vntpId;
    @Size(max = 10)
    @Column(name = "vntp_estado")
    private String vntpEstado;
    @Size(max = 11)
    @Column(name = "vntp_tipuser")
    private String vntpTipuser;
    @Size(max = 50)
    @Column(name = "vntp_callefirst")
    private String vntpCallefirst;
    @Size(max = 50)
    @Column(name = "vntp_callesecond")
    private String vntpCallesecond;
    @Size(max = 25)
    @Column(name = "vntp_sector")
    private String vntpSector;
    @Size(max = 25)
    @Column(name = "vntp_numcasa")
    private String vntpNumcasa;
    @Size(max = 6)
    @Column(name = "vntp_codpostal")
    private String vntpCodpostal;
    @Size(max = 50)
    @Column(name = "vntp_referencia")
    private String vntpReferencia;
    @Column(name = "vntp_fecha")
    //@Temporal(TemporalType.DATE)
    private String vntpFecha;
    @Column(name = "vntp_hora")
    //@Temporal(TemporalType.TIME)
    private String vntpHora;
    @OneToMany(mappedBy = "vntpId")
    private Collection<Venta> ventaCollection;
    @OneToMany(mappedBy = "vntpId")
    private Collection<Ventakit> ventakitCollection;
    @JoinColumn(name = "cid_codigo", referencedColumnName = "cid_codigo")
    @ManyToOne
    private Ciudad cidCodigo;
    @JoinColumn(name = "per_cedula", referencedColumnName = "per_cedula")
    @ManyToOne
    private Persona perCedula;
    @OneToMany(mappedBy = "vntpId")
    private Collection<Ventamaterial> ventamaterialCollection;

    public Ventaprevia() {
    }

    public Ventaprevia(Integer vntpId) {
        this.vntpId = vntpId;
    }

    public BigDecimal getVntpImporte() {
        return vntpImporte;
    }

    public void setVntpImporte(BigDecimal vntpImporte) {
        this.vntpImporte = vntpImporte;
    }

    public Integer getVntpId() {
        return vntpId;
    }

    public void setVntpId(Integer vntpId) {
        this.vntpId = vntpId;
    }

    public String getVntpEstado() {
        return vntpEstado;
    }

    public void setVntpEstado(String vntpEstado) {
        this.vntpEstado = vntpEstado;
    }

    public String getVntpTipuser() {
        return vntpTipuser;
    }

    public void setVntpTipuser(String vntpTipuser) {
        this.vntpTipuser = vntpTipuser;
    }

    public String getVntpCallefirst() {
        return vntpCallefirst;
    }

    public void setVntpCallefirst(String vntpCallefirst) {
        this.vntpCallefirst = vntpCallefirst;
    }

    public String getVntpCallesecond() {
        return vntpCallesecond;
    }

    public void setVntpCallesecond(String vntpCallesecond) {
        this.vntpCallesecond = vntpCallesecond;
    }

    public String getVntpSector() {
        return vntpSector;
    }

    public void setVntpSector(String vntpSector) {
        this.vntpSector = vntpSector;
    }

    public String getVntpNumcasa() {
        return vntpNumcasa;
    }

    public void setVntpNumcasa(String vntpNumcasa) {
        this.vntpNumcasa = vntpNumcasa;
    }

    public String getVntpCodpostal() {
        return vntpCodpostal;
    }

    public void setVntpCodpostal(String vntpCodpostal) {
        this.vntpCodpostal = vntpCodpostal;
    }

    public String getVntpReferencia() {
        return vntpReferencia;
    }

    public void setVntpReferencia(String vntpReferencia) {
        this.vntpReferencia = vntpReferencia;
    }

    public String getVntpFecha() {
        return vntpFecha;
    }

    public void setVntpFecha(String vntpFecha) {
        this.vntpFecha = vntpFecha;
    }
    
    public String getVntpHora() {
        return vntpHora;
    }

    public void setVntpHora(String vntpHora) {
        this.vntpHora = vntpHora;
    }

    @XmlTransient
    public Collection<Venta> getVentaCollection() {
        return ventaCollection;
    }

    public void setVentaCollection(Collection<Venta> ventaCollection) {
        this.ventaCollection = ventaCollection;
    }

    public Ciudad getCidCodigo() {
        return cidCodigo;
    }

    public void setCidCodigo(Ciudad cidCodigo) {
        this.cidCodigo = cidCodigo;
    }

    public Persona getPerCedula() {
        return perCedula;
    }

    public void setPerCedula(Persona perCedula) {
        this.perCedula = perCedula;
    }

    @XmlTransient
    public Collection<Ventamaterial> getVentamaterialCollection() {
        return ventamaterialCollection;
    }

    public void setVentamaterialCollection(Collection<Ventamaterial> ventamaterialCollection) {
        this.ventamaterialCollection = ventamaterialCollection;
    }
    
   @XmlTransient
    public Collection<Ventakit> getVentakitCollection() {
        return ventakitCollection;
    }

    public void setVentakitCollection(Collection<Ventakit> ventakitCollection) {
        this.ventakitCollection = ventakitCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vntpId != null ? vntpId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ventaprevia)) {
            return false;
        }
        Ventaprevia other = (Ventaprevia) object;
        if ((this.vntpId == null && other.vntpId != null) || (this.vntpId != null && !this.vntpId.equals(other.vntpId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Ventaprevia[ vntpId=" + vntpId + " ]";
    }
    
}
