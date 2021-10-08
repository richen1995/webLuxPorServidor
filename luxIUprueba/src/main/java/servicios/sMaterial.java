/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

/**
 *
 * @author Richard
 */
import conexionAD.URLconsumo;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;
import org.json.JSONException;

/**
 *
 * @author Richard
 */
public class sMaterial {
    public static String listaTodosMaterial() throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/material");
//            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;
    }

    public static String listaMaterialId(String codigo) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/material/" + codigo);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;
    }
    
    //Listar Materiales a mostrar en la Paguina Inicial 
    public static String listaMaterialesPagWeb() throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS + "/materialdewebinicioporestado");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;
    }
    
    public static String listaMaterialNombre(String nombre) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        nombre = java.net.URLEncoder.encode(nombre, "UTF-8");
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/idMaterial/" + nombre);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;
    }
    
    public static String menuSegunOpcion(String servicio, String caracteristica, String subcaracteristica) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        servicio = java.net.URLEncoder.encode(servicio, "UTF-8");
        caracteristica = java.net.URLEncoder.encode(caracteristica, "UTF-8");
        subcaracteristica = java.net.URLEncoder.encode(subcaracteristica, "UTF-8");
        try {
            URL url = null;
            if(servicio.equals("videovigilancia"))
            {
                if(caracteristica.equals("resolucion"))
                {
                    url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/camarasporresolucion/" + subcaracteristica);
                }
                if(caracteristica.equals("colorvu"))
                {
                    url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/getmatporcolorvu");
                }
                if(caracteristica.equals("marca"))
                {
                    url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/camaraspormarca/" + subcaracteristica);
                }
                if(caracteristica.equals("dvr"))
                {
                    url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/dvrporresolucion/" + subcaracteristica);
                }
                if(caracteristica.equals("camaratermica"))
                {
                    url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/getcamaratermica");
                }
                if(caracteristica.equals("catalogo"))
                {
                    url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/getmatporcatalogo/" + subcaracteristica);
                }
                if(caracteristica.equals("accesorios"))
                {
                    url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/getaccesoriosdevideovigilancia");
                }
                
                
            }else{
                url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/materialdewebinicioporestado");
            }
            
            //HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content, "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            connection.disconnect();
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJson;
    }

    public static String InsertarMaterial(String json) throws JSONException {
        String strJsonResponse = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/material");

            //HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json; charset=utf-8");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "UTF-8")) {
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJsonResponse = in.readLine();
            connection.disconnect();
        } catch (Exception e) {
            String aa = e.toString();
        }
        return strJsonResponse;
    }

    public static String EliminarMaterial(Integer codigo) throws JSONException {
        String strJsonResponse = "";
        try {
            //SERVICIO
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/material/" + codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            connection.setRequestMethod("DELETE");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            connection.setRequestProperty("Accept", "application/json; charset=UTF-8");
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            String line;
            String strJson = "";
            while ((line = in.readLine()) != null) {
                strJson = line;
            }
            strJsonResponse = new String(strJson.getBytes("ISO-8859-1"), "UTF-8");
        } catch (NumberFormatException | IOException ex) {
            System.out.println("Fallort");
        }
        return strJsonResponse;
    }

    public static String ModficarMaterial(String json, String codigo) throws IOException {
        String strJsonResponse = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/material/" + codigo);
            //HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("PUT");
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json; charset=utf-8");
            try (OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream(), "UTF-8")) {
                writer.write(json);
                writer.flush();
            }
            InputStream content = (InputStream) connection.getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(content));
            strJsonResponse = in.readLine();
            connection.disconnect();
        } catch (NumberFormatException | IOException e) {
            System.out.println("Fallort");
        }
        return strJsonResponse;
    }
}

