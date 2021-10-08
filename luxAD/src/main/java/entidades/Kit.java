/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "kit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Kit.findAll", query = "SELECT k FROM Kit k")
    , @NamedQuery(name = "Kit.findByKitId", query = "SELECT k FROM Kit k WHERE k.kitId = :kitId")
    , @NamedQuery(name = "Kit.findByKitMateriales", query = "SELECT k FROM Kit k WHERE k.kitMateriales = :kitMateriales")
    , @NamedQuery(name = "Kit.findByKitPrecio", query = "SELECT k FROM Kit k WHERE k.kitPrecio = :kitPrecio")
    , @NamedQuery(name = "Kit.findByKitImagen", query = "SELECT k FROM Kit k WHERE k.kitImagen = :kitImagen")
    , @NamedQuery(name = "Kit.findByKitEstado", query = "SELECT k FROM Kit k WHERE k.kitEstado = :kitEstado")
    , @NamedQuery(name = "Kit.findByKitPgweb", query = "SELECT k FROM Kit k WHERE k.kitPgweb = :kitPgweb")
    , @NamedQuery(name = "Kit.findByKitDescuento", query = "SELECT k FROM Kit k WHERE k.kitDescuento = :kitDescuento")})
public class Kit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "kit_id")
    private String kitId;
    @Size(max = 500)
    @Column(name = "kit_materiales")
    private String kitMateriales;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "kit_precio")
    private BigDecimal kitPrecio;
    @Column(name = "kit_descuento")
    private BigDecimal kitDescuento;
    @Size(max = 500)
    @Column(name = "kit_imagen")
    private String kitImagen;
    @Column(name = "kit_estado")
    private Boolean kitEstado;
    @Column(name = "kit_pgweb")
    private Boolean kitPgweb;
    @OneToMany(mappedBy = "kitId")
    private Collection<Materialkit> materialkitCollection;
    @OneToMany(mappedBy = "kitId")
    private Collection<Cotkit> cotkitCollection;
    @JoinColumn(name = "srv_id", referencedColumnName = "srv_id")
    @ManyToOne
    private Servicio srvId;
    @OneToMany(mappedBy = "kitId")
    private Collection<Ventakit> ventakitCollection;

    public Kit() {
    }

    public Kit(String kitId) {
        this.kitId = kitId;
    }

    public String getKitId() {
        return kitId;
    }

    public void setKitId(String kitId) {
        this.kitId = kitId;
    }

    public String getKitMateriales() {
        return kitMateriales;
    }

    public void setKitMateriales(String kitMateriales) {
        this.kitMateriales = kitMateriales;
    }

    public BigDecimal getKitPrecio() {
        return kitPrecio;
    }

    public void setKitPrecio(BigDecimal kitPrecio) {
        this.kitPrecio = kitPrecio;
    }

    public BigDecimal getKitDescuento() {
        return kitDescuento;
    }

    public void setKitDescuento(BigDecimal kitDescuento) {
        this.kitDescuento = kitDescuento;
    }
    
    public String getKitImagen() {
        return kitImagen;
    }

    public void setKitImagen(String kitImagen) {
        this.kitImagen = kitImagen;
    }

    public Boolean getKitEstado() {
        return kitEstado;
    }

    public void setKitEstado(Boolean kitEstado) {
        this.kitEstado = kitEstado;
    }

    public Boolean getKitPgweb() {
        return kitPgweb;
    }

    public void setKitPgweb(Boolean kitPgweb) {
        this.kitPgweb = kitPgweb;
    }

    @XmlTransient
    public Collection<Materialkit> getMaterialkitCollection() {
        return materialkitCollection;
    }

    public void setMaterialkitCollection(Collection<Materialkit> materialkitCollection) {
        this.materialkitCollection = materialkitCollection;
    }

    @XmlTransient
    public Collection<Cotkit> getCotkitCollection() {
        return cotkitCollection;
    }

    public void setCotkitCollection(Collection<Cotkit> cotkitCollection) {
        this.cotkitCollection = cotkitCollection;
    }

    public Servicio getSrvId() {
        return srvId;
    }

    public void setSrvId(Servicio srvId) {
        this.srvId = srvId;
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
        hash += (kitId != null ? kitId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Kit)) {
            return false;
        }
        Kit other = (Kit) object;
        if ((this.kitId == null && other.kitId != null) || (this.kitId != null && !this.kitId.equals(other.kitId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Kit[ kitId=" + kitId + " ]";
    }
    
}
