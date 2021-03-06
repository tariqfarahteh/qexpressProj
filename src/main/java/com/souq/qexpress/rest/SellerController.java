package com.souq.qexpress.rest;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import com.souq.qexpress.business.Seller;
import com.souq.qexpress.dao.impl.SellerDaoImpl;

/**
 * 
 * This controller is used for the system sellers operations.
 * 
 * @author Tariq
 */
@Path("/sellers")
public class SellerController {

	private Gson gson = new Gson();
	private SellerDaoImpl sellerImpl = new SellerDaoImpl();

	/**
	 * Get all existing sellers.
	 * 
	 * @return Response contains status and result
	 * @author Tariq
	 */
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getAllSellers() {
		try {
			List<Seller> sellerList = sellerImpl.getAllSeller();
			String result = gson.toJson(sellerList);

			return Response.status(Response.Status.OK).entity(result).build();
		} catch (Exception ex) {
			ex.printStackTrace();
			return Response.status(Response.Status.INTERNAL_SERVER_ERROR).entity("Internal Server Error !!").build();
		}
	}
}
