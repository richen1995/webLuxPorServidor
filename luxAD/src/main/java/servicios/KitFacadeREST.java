/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

import entidades.Kit;
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
@Path("kit")
public class KitFacadeREST extends AbstractFacade<Kit> {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    public KitFacadeREST() {
        super(Kit.class);
    }

    @POST
    //@Override
    @Consumes({"application/json; charset=utf-8"})
    @Produces({"application/json; charset=utf-8"})
    public Kit insertar(Kit entity) {
        //super.create(entity);
        try {
            super.create(entity);
            em.flush();
            return entity;
        } catch (Exception e) {
            System.out.println("" + e);
            entity = null;
            return entity;
        }
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/json; charset=utf-8"})
    public void edit(@PathParam("id") String id, Kit entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") String id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/json; charset=utf-8"})
    public Kit find(@PathParam("id") String id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({"application/json; charset=utf-8"})
    public List<Kit> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/json; charset=utf-8"})
    public List<Kit> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
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
