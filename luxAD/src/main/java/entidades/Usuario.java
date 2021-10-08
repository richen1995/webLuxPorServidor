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
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findByUsId", query = "SELECT u FROM Usuario u WHERE u.usId = :usId")
    , @NamedQuery(name = "Usuario.findByUsEmail", query = "SELECT u FROM Usuario u WHERE u.usEmail = :usEmail")
    , @NamedQuery(name = "Usuario.findByUsPassword", query = "SELECT u FROM Usuario u WHERE u.usPassword = :usPassword")
    , @NamedQuery(name = "Usuario.findByUsEstado", query = "SELECT u FROM Usuario u WHERE u.usEstado = :usEstado")
    , @NamedQuery(name = "Usuario.findByUsRol", query = "SELECT u FROM Usuario u WHERE u.usRol = :usRol")
    , @NamedQuery(name = "Usuario.findByUsFechainicial", query = "SELECT u FROM Usuario u WHERE u.usFechainicial = :usFechainicial")
    , @NamedQuery(name = "Usuario.findByUsFechafinal", query = "SELECT u FROM Usuario u WHERE u.usFechafinal = :usFechafinal")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "us_id")
    private Integer usId;
    @Size(max = 50)
    @Column(name = "us_email")
    private String usEmail;
    @Size(max = 25)
    @Column(name = "us_password")
    private String usPassword;
    @Column(name = "us_estado")
    private Boolean usEstado;
    @Size(max = 50)
    @Column(name = "us_rol")
    private String usRol;
    @Column(name = "us_fechainicial")
    @Temporal(TemporalType.DATE)
    private Date usFechainicial;
    @Column(name = "us_fechafinal")
    @Temporal(TemporalType.DATE)
    private Date usFechafinal;
    @JoinColumn(name = "pm_id", referencedColumnName = "pm_id")
    @ManyToOne
    private Permiso pmId;
    @JoinColumn(name = "per_cedula", referencedColumnName = "per_cedula")
    @ManyToOne
    private Persona perCedula;

    public Usuario() {
    }

    public Usuario(Integer usId) {
        this.usId = usId;
    }

    public Integer getUsId() {
        return usId;
    }

    public void setUsId(Integer usId) {
        this.usId = usId;
    }

    public String getUsEmail() {
        return usEmail;
    }

    public void setUsEmail(String usEmail) {
        this.usEmail = usEmail;
    }

    public String getUsPassword() {
        return usPassword;
    }

    public void setUsPassword(String usPassword) {
        this.usPassword = usPassword;
    }

    public Boolean getUsEstado() {
        return usEstado;
    }

    public void setUsEstado(Boolean usEstado) {
        this.usEstado = usEstado;
    }

    public String getUsRol() {
        return usRol;
    }

    public void setUsRol(String usRol) {
        this.usRol = usRol;
    }

    public Date getUsFechainicial() {
        return usFechainicial;
    }

    public void setUsFechainicial(Date usFechainicial) {
        this.usFechainicial = usFechainicial;
    }

    public Date getUsFechafinal() {
        return usFechafinal;
    }

    public void setUsFechafinal(Date usFechafinal) {
        this.usFechafinal = usFechafinal;
    }

    public Permiso getPmId() {
        return pmId;
    }

    public void setPmId(Permiso pmId) {
        this.pmId = pmId;
    }

    public Persona getPerCedula() {
        return perCedula;
    }

    public void setPerCedula(Persona perCedula) {
        this.perCedula = perCedula;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (usId != null ? usId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.usId == null && other.usId != null) || (this.usId != null && !this.usId.equals(other.usId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Usuario[ usId=" + usId + " ]";
    }
    
}
