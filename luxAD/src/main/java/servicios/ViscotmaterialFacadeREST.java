/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import entidades.Viscotmaterial;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author Richard
 */
@Stateless
@Path("viscotmaterial")
public class ViscotmaterialFacadeREST extends AbstractFacade<Viscotmaterial> {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    public ViscotmaterialFacadeREST() {
        super(Viscotmaterial.class);
    }

    @POST
    //@Override
    @Consumes({"application/json; charset=utf-8"})
    @Produces({"application/json; charset=utf-8"})
    public void create(Viscotmaterial entity) {
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/json; charset=utf-8"})
    public void edit(@PathParam("id") Integer id, Viscotmaterial entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
     @Produces({"application/json; charset=utf-8"})
    public Viscotmaterial find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/json; charset=utf-8"})
    public List<Viscotmaterial> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/json; charset=utf-8"})  
    public List<Viscotmaterial> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}