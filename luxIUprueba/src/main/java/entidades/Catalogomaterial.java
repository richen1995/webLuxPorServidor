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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "catalogomaterial")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Catalogomaterial.findAll", query = "SELECT c FROM Catalogomaterial c")
    , @NamedQuery(name = "Catalogomaterial.findByCtmtId", query = "SELECT c FROM Catalogomaterial c WHERE c.ctmtId = :ctmtId")
    , @NamedQuery(name = "Catalogomaterial.findByCtmtNombre", query = "SELECT c FROM Catalogomaterial c WHERE c.ctmtNombre = :ctmtNombre")
    , @NamedQuery(name = "Catalogomaterial.findByCtmtEstado", query = "SELECT c FROM Catalogomaterial c WHERE c.ctmtEstado = :ctmtEstado")})
public class Catalogomaterial implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ctmt_id")
    private Integer ctmtId;
    @Size(max = 300)
    @Column(name = "ctmt_nombre")
    private String ctmtNombre;
    @Column(name = "ctmt_estado")
    private Boolean ctmtEstado;
    @JoinColumn(name = "cat_id", referencedColumnName = "cat_id")
    @ManyToOne
    private Catalogo catId;
    @OneToMany(mappedBy = "ctmtId")
    private Collection<Material> materialCollection;

    public Catalogomaterial() {
    }

    public Catalogomaterial(Integer ctmtId) {
        this.ctmtId = ctmtId;
    }

    public Integer getCtmtId() {
        return ctmtId;
    }

    public void setCtmtId(Integer ctmtId) {
        this.ctmtId = ctmtId;
    }

    public String getCtmtNombre() {
        return ctmtNombre;
    }

    public void setCtmtNombre(String ctmtNombre) {
        this.ctmtNombre = ctmtNombre;
    }

    public Boolean getCtmtEstado() {
        return ctmtEstado;
    }

    public void setCtmtEstado(Boolean ctmtEstado) {
        this.ctmtEstado = ctmtEstado;
    }

    public Catalogo getCatId() {
        return catId;
    }

    public void setCatId(Catalogo catId) {
        this.catId = catId;
    }

    @XmlTransient
    public Collection<Material> getMaterialCollection() {
        return materialCollection;
    }

    public void setMaterialCollection(Collection<Material> materialCollection) {
        this.materialCollection = materialCollection;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ctmtId != null ? ctmtId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Catalogomaterial)) {
            return false;
        }
        Catalogomaterial other = (Catalogomaterial) object;
        if ((this.ctmtId == null && other.ctmtId != null) || (this.ctmtId != null && !this.ctmtId.equals(other.ctmtId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Catalogomaterial[ ctmtId=" + ctmtId + " ]";
    }
    
}
