package kz.bitlab.java.database;

import kz.bitlab.java.models.News;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

    public static ArrayList<News> getAllNews(){
        ArrayList<News> newsList = new ArrayList<>();

        String query = "SELECT * FROM news";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String language = resultSet.getString("language");
                Timestamp postDate = resultSet.getTimestamp("post_date");

                News news = new News();
                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setLanguage(language);
                news.setPostDate(postDate);

                newsList.add(news);
            }
        } catch (Exception e){
            e.printStackTrace();
        }

        return newsList;
    }

    public static ArrayList<News> getNewsByType(String language){
        ArrayList<News> newsList = new ArrayList<>();
        String query = "SELECT * FROM news WHERE language = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, language);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Long id = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String lang = resultSet.getString("language");
                Timestamp postDate = resultSet.getTimestamp("post_date");

                News news = new News();
                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setLanguage(lang);
                news.setPostDate(postDate);

                newsList.add(news);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return newsList;
    }

    public static News getNewsById(Long id){
        News news = new News();
        String query = "SELECT * FROM news WHERE id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                Long ID = resultSet.getLong("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String language = resultSet.getString("language");
                Timestamp postDate = resultSet.getTimestamp("post_date");

                news.setId(id);
                news.setTitle(title);
                news.setContent(content);
                news.setLanguage(language);
                news.setPostDate(postDate);
            }
        } catch (Exception e){
            e.printStackTrace();
        }

        return news;
    }

    public static void addNews(String title, String content, String language){
        String query = "INSERT INTO news (title, content, language) VALUES (?, ?, ?::language_enum)";


        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, title);
            preparedStatement.setString(2, content);
            preparedStatement.setString(3, language);

            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteNewsById(Long id){
        String query =  "DELETE FROM news WHERE id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateNews(News news){
        String query = "UPDATE news SET title = ?, content = ?, language = ? WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, news.getTitle());
            preparedStatement.setString(2, news.getContent());
            preparedStatement.setString(3, news.getLanguage());

            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
