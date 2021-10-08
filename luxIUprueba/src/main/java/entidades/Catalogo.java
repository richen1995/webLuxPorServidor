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
@Table(name = "catalogo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Catalogo.findAll", query = "SELECT c FROM Catalogo c")
    , @NamedQuery(name = "Catalogo.findByCatId", query = "SELECT c FROM Catalogo c WHERE c.catId = :catId")
    , @NamedQuery(name = "Catalogo.findByCatCodigo", query = "SELECT c FROM Catalogo c WHERE c.catCodigo = :catCodigo")
    , @NamedQuery(name = "Catalogo.findByCatNombre", query = "SELECT c FROM Catalogo c WHERE c.catNombre = :catNombre")
    , @NamedQuery(name = "Catalogo.findByCatEstado", query = "SELECT c FROM Catalogo c WHERE c.catEstado = :catEstado")})
public class Catalogo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cat_id")
    private Integer catId;
    @Size(max = 25)
    @Column(name = "cat_codigo")
    private String catCodigo;
    @Size(max = 50)
    @Column(name = "cat_nombre")
    private String catNombre;
    @Column(name = "cat_estado")
    private Boolean catEstado;
    @OneToMany(mappedBy = "catId")
    private Collection<Catalogomaterial> catalogomaterialCollection;

    public Catalogo() {
    }

    public Catalogo(Integer catId) {
        this.catId = catId;
    }

    public Integer getCatId() {
        return catId;
    }

    public void setCatId(Integer catId) {
        this.catId = catId;
    }

    public String getCatCodigo() {
        return catCodigo;
    }

    public void setCatCodigo(String catCodigo) {
        this.catCodigo = catCodigo;
    }

    public String getCatNombre() {
        return catNombre;
    }

    public void setCatNombre(String catNombre) {
        this.catNombre = catNombre;
    }

    public Boolean getCatEstado() {
        return catEstado;
    }

    public void setCatEstado(Boolean catEstado) {
        this.catEstado = catEstado;
    }

    @XmlTransient
    public Collection<Catalogomaterial> getCatalogomaterialCollection() {
        return catalogomaterialCollection;
    }

    public void setCatalogomaterialCollection(Collection<Catalogomaterial> catalogomaterialCollection) {
        this.catalogomaterialCollection = catalogomaterialCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (catId != null ? catId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Catalogo)) {
            return false;
        }
        Catalogo other = (Catalogo) object;
        if ((this.catId == null && other.catId != null) || (this.catId != null && !this.catId.equals(other.catId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Catalogo[ catId=" + catId + " ]";
    }
    
}
