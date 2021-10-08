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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
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
@Table(name = "material")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Material.findAll", query = "SELECT m FROM Material m")
    , @NamedQuery(name = "Material.findByMatId", query = "SELECT m FROM Material m WHERE m.matId = :matId")
    , @NamedQuery(name = "Material.findByMatNombre", query = "SELECT m FROM Material m WHERE m.matNombre = :matNombre")
    , @NamedQuery(name = "Material.findByMatPrecio", query = "SELECT m FROM Material m WHERE m.matPrecio = :matPrecio")
    , @NamedQuery(name = "Material.findByMatMarca", query = "SELECT m FROM Material m WHERE m.matMarca = :matMarca")
    , @NamedQuery(name = "Material.findByMatColor", query = "SELECT m FROM Material m WHERE m.matColor = :matColor")
    , @NamedQuery(name = "Material.findByMatStock", query = "SELECT m FROM Material m WHERE m.matStock = :matStock")
    , @NamedQuery(name = "Material.findByMatDescripcion", query = "SELECT m FROM Material m WHERE m.matDescripcion = :matDescripcion")
    , @NamedQuery(name = "Material.findByMatVoltaje", query = "SELECT m FROM Material m WHERE m.matVoltaje = :matVoltaje")
    , @NamedQuery(name = "Material.findByMatCorriente", query = "SELECT m FROM Material m WHERE m.matCorriente = :matCorriente")
    , @NamedQuery(name = "Material.findByMatPotencia", query = "SELECT m FROM Material m WHERE m.matPotencia = :matPotencia")
    , @NamedQuery(name = "Material.findByMatCompatibilidad", query = "SELECT m FROM Material m WHERE m.matCompatibilidad = :matCompatibilidad")
    , @NamedQuery(name = "Material.findByMatTipoconexion", query = "SELECT m FROM Material m WHERE m.matTipoconexion = :matTipoconexion")
    , @NamedQuery(name = "Material.findByMatImagen", query = "SELECT m FROM Material m WHERE m.matImagen = :matImagen")
    , @NamedQuery(name = "Material.findByMatCodcustom", query = "SELECT m FROM Material m WHERE m.matCodcustom = :matCodcustom")
    , @NamedQuery(name = "Material.findByMatEstado", query = "SELECT m FROM Material m WHERE m.matEstado = :matEstado")
    , @NamedQuery(name = "Material.findByMatPgweb", query = "SELECT m FROM Material m WHERE m.matPgweb = :matPgweb")
    , @NamedQuery(name = "Material.findByMatResolucion", query = "SELECT m FROM Material m WHERE m.matResolucion = :matResolucion")
    , @NamedQuery(name = "Material.findByMatCapacidad", query = "SELECT m FROM Material m WHERE m.matCapacidad = :matCapacidad")
    , @NamedQuery(name = "Material.findByMatSalidas", query = "SELECT m FROM Material m WHERE m.matSalidas = :matSalidas")
    , @NamedQuery(name = "Material.findByMatCompresion", query = "SELECT m FROM Material m WHERE m.matCompresion = :matCompresion")
    , @NamedQuery(name = "Material.findByMatTasa", query = "SELECT m FROM Material m WHERE m.matTasa = :matTasa")
    , @NamedQuery(name = "Material.findByMatDimencion", query = "SELECT m FROM Material m WHERE m.matDimencion = :matDimencion")})
public class Material implements Serializable {

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "mat_precio")
    private BigDecimal matPrecio;
    @Size(max = 500)
    @Column(name = "mat_imagen")
    private String matImagen;
    @OneToMany(mappedBy = "matId")
    private Collection<Materialkit> materialkitCollection;
    @OneToMany(mappedBy = "matId")
    private Collection<Materialservicio> materialservicioCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Size(min = 1, max = 8)
    @Column(name = "mat_id")
    private String matId;
    @Size(max = 50)
    @Column(name = "mat_nombre")
    private String matNombre;
    @Size(max = 50)
    @Column(name = "mat_marca")
    private String matMarca;
    @Size(max = 25)
    @Column(name = "mat_color")
    private String matColor;
    @Column(name = "mat_stock")
    private Integer matStock;
    @Size(max = 500)
    @Column(name = "mat_descripcion")
    private String matDescripcion;
    @Column(name = "mat_voltaje")
    private Double matVoltaje;
    @Column(name = "mat_corriente")
    private Double matCorriente;
    @Column(name = "mat_potencia")
    private Double matPotencia;
    @Size(max = 500)
    @Column(name = "mat_compatibilidad")
    private String matCompatibilidad;
    @Size(max = 25)
    @Column(name = "mat_tipoconexion")
    private String matTipoconexion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "mat_codcustom")
    private String matCodcustom;
    @Column(name = "mat_estado")
    private Boolean matEstado;
    @Column(name = "mat_pgweb")
    private Boolean matPgweb;
    @Size(max = 8)
    @Column(name = "mat_resolucion")
    private String matResolucion;
    @Size(max = 25)
    @Column(name = "mat_capacidad")
    private String matCapacidad;
    @Size(max = 25)
    @Column(name = "mat_salidas")
    private String matSalidas;
    @Size(max = 25)
    @Column(name = "mat_compresion")
    private String matCompresion;
    @Size(max = 25)
    @Column(name = "mat_tasa")
    private String matTasa;
    @Size(max = 10)
    @Column(name = "mat_dimencion")
    private String matDimencion;
    @OneToMany(mappedBy = "matId")
    private Collection<Ordenmaterial> ordenmaterialCollection;
    @OneToMany(mappedBy = "matId")
    private Collection<Viscotmaterial> viscotmaterialCollection;
    @JoinColumn(name = "ctmt_id", referencedColumnName = "ctmt_id")
    @ManyToOne
    private Catalogomaterial ctmtId;
    @OneToMany(mappedBy = "matId")
    private Collection<Ventamaterial> ventamaterialCollection;

    public Material() {
    }

    public Material(String matId) {
        this.matId = matId;
    }
    
    public Material(String matId, String matCodcustom) {
        this.matId = matId;
        this.matCodcustom = matCodcustom;
    }

    public String getMatId() {
        return matId;
    }

    public void setMatId(String matId) {
        this.matId = matId;
    }

    public String getMatNombre() {
        return matNombre;
    }

    public void setMatNombre(String matNombre) {
        this.matNombre = matNombre;
    }

    public BigDecimal getMatPrecio() {
        return matPrecio;
    }

    public void setMatPrecio(BigDecimal matPrecio) {
        this.matPrecio = matPrecio;
    }

    public String getMatMarca() {
        return matMarca;
    }

    public void setMatMarca(String matMarca) {
        this.matMarca = matMarca;
    }

    public String getMatColor() {
        return matColor;
    }

    public void setMatColor(String matColor) {
        this.matColor = matColor;
    }

    public Integer getMatStock() {
        return matStock;
    }

    public void setMatStock(Integer matStock) {
        this.matStock = matStock;
    }

    public String getMatDescripcion() {
        return matDescripcion;
    }

    public void setMatDescripcion(String matDescripcion) {
        this.matDescripcion = matDescripcion;
    }

    public Double getMatVoltaje() {
        return matVoltaje;
    }

    public void setMatVoltaje(Double matVoltaje) {
        this.matVoltaje = matVoltaje;
    }

    public Double getMatCorriente() {
        return matCorriente;
    }

    public void setMatCorriente(Double matCorriente) {
        this.matCorriente = matCorriente;
    }

    public Double getMatPotencia() {
        return matPotencia;
    }

    public void setMatPotencia(Double matPotencia) {
        this.matPotencia = matPotencia;
    }

    public String getMatCompatibilidad() {
        return matCompatibilidad;
    }

    public void setMatCompatibilidad(String matCompatibilidad) {
        this.matCompatibilidad = matCompatibilidad;
    }

    public String getMatTipoconexion() {
        return matTipoconexion;
    }

    public void setMatTipoconexion(String matTipoconexion) {
        this.matTipoconexion = matTipoconexion;
    }

    public String getMatImagen() {
        return matImagen;
    }

    public void setMatImagen(String matImagen) {
        this.matImagen = matImagen;
    }

    public String getMatCodcustom() {
        return matCodcustom;
    }

    public void setMatCodcustom(String matCodcustom) {
        this.matCodcustom = matCodcustom;
    }
    
        public Boolean getMatEstado() {
        return matEstado;
    }

    public void setMatEstado(Boolean matEstado) {
        this.matEstado = matEstado;
    }

    public Boolean getMatPgweb() {
        return matPgweb;
    }

    public void setMatPgweb(Boolean matPgweb) {
        this.matPgweb = matPgweb;
    }
    
    public String getMatCapacidad() {
        return matCapacidad;
    }

    public void setMatCapacidad(String matCapacidad) {
        this.matCapacidad = matCapacidad;
    }

    public String getMatSalidas() {
        return matSalidas;
    }

    public void setMatSalidas(String matSalidas) {
        this.matSalidas = matSalidas;
    }

    public String getMatCompresion() {
        return matCompresion;
    }

    public void setMatCompresion(String matCompresion) {
        this.matCompresion = matCompresion;
    }

    public String getMatTasa() {
        return matTasa;
    }

    public void setMatTasa(String matTasa) {
        this.matTasa = matTasa;
    }
    
    @XmlTransient
    public Collection<Ordenmaterial> getOrdenmaterialCollection() {
        return ordenmaterialCollection;
    }

    public void setOrdenmaterialCollection(Collection<Ordenmaterial> ordenmaterialCollection) {
        this.ordenmaterialCollection = ordenmaterialCollection;
    }

    @XmlTransient
    public Collection<Viscotmaterial> getViscotmaterialCollection() {
        return viscotmaterialCollection;
    }

    public void setViscotmaterialCollection(Collection<Viscotmaterial> viscotmaterialCollection) {
        this.viscotmaterialCollection = viscotmaterialCollection;
    }

    public Catalogomaterial getCtmtId() {
        return ctmtId;
    }

    public void setCtmtId(Catalogomaterial ctmtId) {
        this.ctmtId = ctmtId;
    }
    
    public String getMatResolucion() {
        return matResolucion;
    }

    public void setMatResolucion(String matResolucion) {
        this.matResolucion = matResolucion;
    }
    
    public String getMatDimencion() {
        return matDimencion;
    }

    public void setMatDimencion(String matDimencion) {
        this.matDimencion = matDimencion;
    }

    @XmlTransient
    public Collection<Ventamaterial> getVentamaterialCollection() {
        return ventamaterialCollection;
    }

    public void setVentamaterialCollection(Collection<Ventamaterial> ventamaterialCollection) {
        this.ventamaterialCollection = ventamaterialCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (matId != null ? matId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Material)) {
            return false;
        }
        Material other = (Material) object;
        if ((this.matId == null && other.matId != null) || (this.matId != null && !this.matId.equals(other.matId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Material[ matId=" + matId + " ]";
    }

    @XmlTransient
    public Collection<Materialkit> getMaterialkitCollection() {
        return materialkitCollection;
    }

    public void setMaterialkitCollection(Collection<Materialkit> materialkitCollection) {
        this.materialkitCollection = materialkitCollection;
    }

    @XmlTransient
    public Collection<Materialservicio> getMaterialservicioCollection() {
        return materialservicioCollection;
    }

    public void setMaterialservicioCollection(Collection<Materialservicio> materialservicioCollection) {
        this.materialservicioCollection = materialservicioCollection;
    }
    
}
