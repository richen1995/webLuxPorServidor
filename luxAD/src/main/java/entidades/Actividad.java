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
@Table(name = "actividad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Actividad.findAll", query = "SELECT a FROM Actividad a")
    , @NamedQuery(name = "Actividad.findByActId", query = "SELECT a FROM Actividad a WHERE a.actId = :actId")
    , @NamedQuery(name = "Actividad.findByActDescripcion", query = "SELECT a FROM Actividad a WHERE a.actDescripcion = :actDescripcion")
    , @NamedQuery(name = "Actividad.findByActFechaini", query = "SELECT a FROM Actividad a WHERE a.actFechaini = :actFechaini")
    , @NamedQuery(name = "Actividad.findByActFechafin", query = "SELECT a FROM Actividad a WHERE a.actFechafin = :actFechafin")
    , @NamedQuery(name = "Actividad.findByActDireccion", query = "SELECT a FROM Actividad a WHERE a.actDireccion = :actDireccion")
    , @NamedQuery(name = "Actividad.findByActCostomanoobra", query = "SELECT a FROM Actividad a WHERE a.actCostomanoobra = :actCostomanoobra")
    , @NamedQuery(name = "Actividad.findByActTipo", query = "SELECT a FROM Actividad a WHERE a.actTipo = :actTipo")
    , @NamedQuery(name = "Actividad.findByActEstado", query = "SELECT a FROM Actividad a WHERE a.actEstado = :actEstado")
    , @NamedQuery(name = "Actividad.findByActHorafinal", query = "SELECT a FROM Actividad a WHERE a.actHorafinal = :actHorafinal")
    , @NamedQuery(name = "Actividad.findByActHorainicial", query = "SELECT a FROM Actividad a WHERE a.actHorainicial = :actHorainicial")})
public class Actividad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "act_id")
    private Integer actId;
    @Size(max = 500)
    @Column(name = "act_descripcion")
    private String actDescripcion;
    @Column(name = "act_fechaini")
    @Temporal(TemporalType.DATE)
    private Date actFechaini;
    @Column(name = "act_fechafin")
    @Temporal(TemporalType.DATE)
    private Date actFechafin;
    @Size(max = 500)
    @Column(name = "act_direccion")
    private String actDireccion;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "act_costomanoobra")
    private BigDecimal actCostomanoobra;
    @Size(max = 25)
    @Column(name = "act_tipo")
    private String actTipo;
    @Size(max = 10)
    @Column(name = "act_estado")
    private String actEstado;
    @Column(name = "act_horafinal")
    @Temporal(TemporalType.TIME)
    private Date actHorafinal;
    @Column(name = "act_horainicial")
    @Temporal(TemporalType.TIME)
    private Date actHorainicial;
    @OneToMany(mappedBy = "actId")
    private Collection<Profactividad> profactividadCollection;
    @JoinColumn(name = "cli_id", referencedColumnName = "cli_id")
    @ManyToOne
    private Cliente cliId;
    @OneToMany(mappedBy = "actId")
    private Collection<Actividadservicio> actividadservicioCollection;
    @OneToMany(mappedBy = "actId")
    private Collection<Visita> visitaCollection;
    @OneToMany(mappedBy = "actId")
    private Collection<Ordentrabajo> ordentrabajoCollection;

    public Actividad() {
    }

    public Actividad(Integer actId) {
        this.actId = actId;
    }

    public Integer getActId() {
        return actId;
    }

    public void setActId(Integer actId) {
        this.actId = actId;
    }

    public String getActDescripcion() {
        return actDescripcion;
    }

    public void setActDescripcion(String actDescripcion) {
        this.actDescripcion = actDescripcion;
    }

    public Date getActFechaini() {
        return actFechaini;
    }

    public void setActFechaini(Date actFechaini) {
        this.actFechaini = actFechaini;
    }

    public Date getActFechafin() {
        return actFechafin;
    }

    public void setActFechafin(Date actFechafin) {
        this.actFechafin = actFechafin;
    }

    public String getActDireccion() {
        return actDireccion;
    }

    public void setActDireccion(String actDireccion) {
        this.actDireccion = actDireccion;
    }

    public BigDecimal getActCostomanoobra() {
        return actCostomanoobra;
    }

    public void setActCostomanoobra(BigDecimal actCostomanoobra) {
        this.actCostomanoobra = actCostomanoobra;
    }

    public String getActTipo() {
        return actTipo;
    }

    public void setActTipo(String actTipo) {
        this.actTipo = actTipo;
    }

    public String getActEstado() {
        return actEstado;
    }

    public void setActEstado(String actEstado) {
        this.actEstado = actEstado;
    }

    public Date getActHorafinal() {
        return actHorafinal;
    }

    public void setActHorafinal(Date actHorafinal) {
        this.actHorafinal = actHorafinal;
    }

    public Date getActHorainicial() {
        return actHorainicial;
    }

    public void setActHorainicial(Date actHorainicial) {
        this.actHorainicial = actHorainicial;
    }

    @XmlTransient
    public Collection<Profactividad> getProfactividadCollection() {
        return profactividadCollection;
    }

    public void setProfactividadCollection(Collection<Profactividad> profactividadCollection) {
        this.profactividadCollection = profactividadCollection;
    }

    public Cliente getCliId() {
        return cliId;
    }

    public void setCliId(Cliente cliId) {
        this.cliId = cliId;
    }

    @XmlTransient
    public Collection<Actividadservicio> getActividadservicioCollection() {
        return actividadservicioCollection;
    }

    public void setActividadservicioCollection(Collection<Actividadservicio> actividadservicioCollection) {
        this.actividadservicioCollection = actividadservicioCollection;
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
        hash += (actId != null ? actId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Actividad)) {
            return false;
        }
        Actividad other = (Actividad) object;
        if ((this.actId == null && other.actId != null) || (this.actId != null && !this.actId.equals(other.actId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Actividad[ actId=" + actId + " ]";
    }
    
}
