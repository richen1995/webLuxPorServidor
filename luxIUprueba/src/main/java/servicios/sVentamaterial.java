/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;

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
public class sVentamaterial {
    
    public static String listaTodosVentamaterial() throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/ventamaterial");
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

    public static String listaVentamaterialId(Integer codigo) throws JSONException {
        String strJson = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/ventamaterial/" + codigo);
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

    public static String listaVentamaterialporCodVntPrv(String codvntprv) throws JSONException, UnsupportedEncodingException {
        String strJson = "";
        codvntprv = java.net.URLEncoder.encode(codvntprv, "UTF-8");
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/ventamaterialporcodvntprv/" + codvntprv);
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

    public static String InsertarVentamaterial(String json) throws JSONException {
        String strJsonResponse = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/ventamaterial");

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

    public static String EliminarVentamaterial(Integer codigo) throws JSONException {
        String strJsonResponse = "";
        try {
            //SERVICIO
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/ventamaterial/" + codigo);
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

    public static String ModficarVentamaterial(String json, Integer codigo) throws IOException {
        String strJsonResponse = "";
        try {
            URL url = new URL(URLconsumo.PREFIJO + URLconsumo.IP + "/" + URLconsumo.SERVICIO + "/" + URLconsumo.ACCESO_DATOS +"/ventamaterial/" + codigo);
            HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
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
