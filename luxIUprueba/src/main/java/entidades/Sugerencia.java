/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Richard
 */
@Entity
@Table(name = "sugerencia")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sugerencia.findAll", query = "SELECT s FROM Sugerencia s")
    , @NamedQuery(name = "Sugerencia.findBySugId", query = "SELECT s FROM Sugerencia s WHERE s.sugId = :sugId")
    , @NamedQuery(name = "Sugerencia.findBySugCalificacion", query = "SELECT s FROM Sugerencia s WHERE s.sugCalificacion = :sugCalificacion")
    , @NamedQuery(name = "Sugerencia.findBySugFecha", query = "SELECT s FROM Sugerencia s WHERE s.sugFecha = :sugFecha")
    , @NamedQuery(name = "Sugerencia.findBySugDescripcion", query = "SELECT s FROM Sugerencia s WHERE s.sugDescripcion = :sugDescripcion")})
public class Sugerencia implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sug_id")
    private Integer sugId;
    @Column(name = "sug_calificacion")
    private Integer sugCalificacion;
    @Column(name = "sug_fecha")
    @Temporal(TemporalType.DATE)
    private Date sugFecha;
    @Size(max = 500)
    @Column(name = "sug_descripcion")
    private String sugDescripcion;
    @JoinColumn(name = "ordtr_id", referencedColumnName = "ordtr_id")
    @ManyToOne
    private Ordentrabajo ordtrId;

    public Sugerencia() {
    }

    public Sugerencia(Integer sugId) {
        this.sugId = sugId;
    }

    public Integer getSugId() {
        return sugId;
    }

    public void setSugId(Integer sugId) {
        this.sugId = sugId;
    }

    public Integer getSugCalificacion() {
        return sugCalificacion;
    }

    public void setSugCalificacion(Integer sugCalificacion) {
        this.sugCalificacion = sugCalificacion;
    }

    public Date getSugFecha() {
        return sugFecha;
    }

    public void setSugFecha(Date sugFecha) {
        this.sugFecha = sugFecha;
    }

    public String getSugDescripcion() {
        return sugDescripcion;
    }

    public void setSugDescripcion(String sugDescripcion) {
        this.sugDescripcion = sugDescripcion;
    }

    public Ordentrabajo getOrdtrId() {
        return ordtrId;
    }

    public void setOrdtrId(Ordentrabajo ordtrId) {
        this.ordtrId = ordtrId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (sugId != null ? sugId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Sugerencia)) {
            return false;
        }
        Sugerencia other = (Sugerencia) object;
        if ((this.sugId == null && other.sugId != null) || (this.sugId != null && !this.sugId.equals(other.sugId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Sugerencia[ sugId=" + sugId + " ]";
    }
    
}
