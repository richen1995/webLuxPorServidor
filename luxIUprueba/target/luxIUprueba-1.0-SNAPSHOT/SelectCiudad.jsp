<%-- 
    Document   : SelectCiudad
    Created on : 23/03/2021, 12:07:57
    Author     : Richard
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Ciudad"%>
<%@page import="servicios.sCiudad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%
        String provincia = request.getParameter("provincia");
        
        ArrayList<Ciudad> arrayCity = new ArrayList<Ciudad>();
        
        String cadCity = sCiudad.listaCiudadesdeProvincia(provincia);
        String cadJSONCity = "{\"respuesta\":" + cadCity + "}";
        JSONObject jsonObjCity = new JSONObject(cadJSONCity);
        JSONArray jsonArrayCity = jsonObjCity.getJSONArray("respuesta");
        for(int i = 0;i<jsonArrayCity.length();i++)   
        {
            JSONObject childJSONObject = jsonArrayCity.optJSONObject(i);
            Ciudad objCity = new Gson().fromJson(childJSONObject.toString(), Ciudad.class);
            arrayCity.add(objCity);
        }
        
        String htmlSelectCity = "<label for=\"perCiudad\">Ciudad</label><select class=\"custom-select mr-sm-2\" id=\"perCiudad\" name=\"perCiudad\">";
        
        for (Ciudad oPet : arrayCity) {
            htmlSelectCity = htmlSelectCity + "<option value='" + oPet.getCidCodigo() + "'>" + oPet.getCidNombre() + "</option>";
        }
        htmlSelectCity = htmlSelectCity + "</select>";
        response.setContentType("text/plain");
        response.getWriter().write(htmlSelectCity);
    %>
</html>
