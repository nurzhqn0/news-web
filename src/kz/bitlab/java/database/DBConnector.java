package kz.bitlab.java.database;

import java.sql.*;

public class DBConnector {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/jakarta_news",
                    "postgres",
                    "2925"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
