
package util;

import java.sql.*;

public class Conexion {

    public Connection connectDatabase() {
        Connection connection = null;
        try {
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException ex) {
                System.out.println("Error al registrar el driver de PostgreSQL: " + ex);
            }

            // Database connect
            // Conectamos con la base de datos
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/luxflame",
                    "postgres", "postgres");
//            connection = DriverManager.getConnection(
//                    "jdbc:postgresql://172.17.103.29:5432/bienesdtic",
//                    "uth2018", "2018uth@@");

            boolean valid = connection.isValid(50000);
            System.out.println(valid ? "TEST OK" + connection : "TEST FAIL");
        } catch (java.sql.SQLException sqle) {
            System.out.println("Error: " + sqle);
        }
        return connection;
    }

}
