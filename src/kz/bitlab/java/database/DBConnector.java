package kz.bitlab.java.database;

import kz.bitlab.java.models.Item;
import kz.bitlab.java.models.User;

import java.sql.*;
import java.util.ArrayList;

public class DBConnector {
    private static Connection connection;

    static{
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/jakarta_shop",
                    "postgres",
                    "2925"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<Item> getAllItems(){
        ArrayList<Item> items = new ArrayList<>();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM items_table");

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");

                Item item = new Item();
                item.setId(id);
                item.setName(name);
                item.setDescription(description);
                item.setPrice(price);

                items.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }

    public static Item getItemById(int id){
        Item item = null;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT FROM items_table WHERE id = ?");

            preparedStatement.setLong(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Long ID = resultSet.getLong("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");

                item = new Item();

                item.setId(ID);
                item.setName(name);
                item.setDescription(description);
                item.setPrice(price);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return item;
    }

    public static void addItem(String name, String description, double price) {
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO items_table (name, description, price)" +
                            "VALUES (?, ?, ?)");

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setDouble(3, price);

            int rows = preparedStatement.executeUpdate();

            preparedStatement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteItemById(Long id) {
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(
                    "DELETE FROM items_table WHERE id = ? "
            );

            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void updateItem(String name, String description, double price) {
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(
                    "UPDATE items_table SET name=?, description=?, price=?" +
                            "WHERE id = ?");

            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setDouble(3, price);

            int rows = preparedStatement.executeUpdate();
            preparedStatement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<User> getAllUsers(){
        ArrayList<User> users = new ArrayList<>();

        try{
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users_table");

            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("full_name");

                User user = new User();

                user.setId(id);
                user.setEmail(email);
                user.setPassword(password);
                user.setFullName(fullName);
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public static User getUserById(int id){
        User user = null;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT FROM users_table WHERE id = ?");

            preparedStatement.setLong(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Long ID = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("full_name");

                user = new User();

                user.setId(ID);
                user.setEmail(email);
                user.setPassword(password);
                user.setFullName(fullName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static boolean login(String email, String password){
        boolean isCorrect = false;

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT * FROM users_table WHERE email = ? AND password = ?"
            );

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                isCorrect = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isCorrect;
    }

    public static boolean register(String email, String password, String fullName) {
        boolean isSuccessful = false;

        try {
            PreparedStatement checkStmt = connection.prepareStatement(
                    "SELECT COUNT(*) FROM users_table WHERE email = ?");
            checkStmt.setString(1, email);

            ResultSet resultSet = checkStmt.executeQuery();
            if (resultSet.next() && resultSet.getInt(1) > 0) {
                isSuccessful = false;
                checkStmt.close();
                return isSuccessful;
            }
            checkStmt.close();
            
            PreparedStatement insertStmt = connection.prepareStatement(
                    "INSERT INTO users_table (email, password, full_name) VALUES (?, ?, ?)");

            insertStmt.setString(1, email);
            insertStmt.setString(2, password);
            insertStmt.setString(3, fullName);

            int rows = insertStmt.executeUpdate();
            if (rows > 0) {
                isSuccessful = true;
            }
            insertStmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            isSuccessful = false;
        }

        return isSuccessful;
    }

}
