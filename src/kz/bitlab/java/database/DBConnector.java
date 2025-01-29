package kz.bitlab.java.database;

import kz.bitlab.java.models.Comment;
import kz.bitlab.java.models.News;
import kz.bitlab.java.models.NewsCategory;
import kz.bitlab.java.models.User;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class DBConnector {
    private static Connection connection;

    private static final LocalDateTime now = LocalDateTime.now();
    private static final Timestamp currentTimestamp = Timestamp.valueOf(now);

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/news-web",
                    "postgres",
                    "2925"
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<User> getAllUsers(){
        ArrayList<User> userList = new ArrayList<>();

        String query = "SELECT * FROM users";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("full_name");
                int roleId = resultSet.getInt("role_id");

                User user = new User();
                user.setId(id);
                user.setEmail(email);
                user.setFullName(fullName);
                user.setPassword(password);
                user.setRoleId(roleId);

                userList.add(user);
            }

            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
        }

        return userList;
    }

    public static User getUserById(Long id){
        User user = null;
        String query = "SELECT * FROM users WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                user = new User();
                user.setId(resultSet.getLong("id"));
                user.setEmail(resultSet.getString("email"));
                user.setFullName(resultSet.getString("full_name"));
                user.setPassword(resultSet.getString("password"));
                user.setRoleId(resultSet.getInt("role_id"));
            }

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static boolean addUser(User user){
        String query = "INSERT INTO users (email, password, full_name, role_id) VALUES (?, ?, ?, ?)";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFullName());
            preparedStatement.setInt(4, user.getRoleId());

            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public static boolean deleteUser(Long id){
        String query = "DELETE FROM users WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);

            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public static boolean updateUser(User user){
        String query = "UPDATE users SET email = ?, password = ?, full_name = ?, role_id = ?  WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFullName());
            preparedStatement.setInt(4, user.getRoleId());
            preparedStatement.setLong(5, user.getId());

            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }


        return true;
    }


    public ArrayList<NewsCategory> getAllNewsCategories(){
        ArrayList<NewsCategory> newsCategoryList = new ArrayList<>();
        String query = "SELECT * FROM news_categories";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Long id = resultSet.getLong("id");
                String name = resultSet.getString("name");

                newsCategoryList.add(new NewsCategory(id, name));
            }

            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
        }

        return newsCategoryList;
    }

    public NewsCategory getNewsCategoryById(Long id){
        NewsCategory newsCategory = null;
        String query = "SELECT * FROM news_categories WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                String newsCategoryName = resultSet.getString("name");

                newsCategory = new NewsCategory();
                newsCategory.setId(id);
                newsCategory.setName(newsCategoryName);
            }

            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
        }

        return newsCategory;
    }

    public boolean addNewsCategory(NewsCategory newsCategory){
        String query = "INSERT INTO news_categories (name) VALUES (?)";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newsCategory.getName());
            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public boolean deleteNewsCategory(Long id){
        String query = "DELETE FROM news_categories WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public boolean updateNewsCategory(NewsCategory newsCategory){
        String query = "UPDATE news_categories SET name = ? WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newsCategory.getName());
            preparedStatement.setLong(2, newsCategory.getId());

            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public ArrayList<News> getAllNews(){
        ArrayList<News> newsList = new ArrayList<>();
        String query =
                "SELECT news.id, news.post_date, news.title, news.content, news.category_id, news_categories.name "
                        + "FROM news "
                        + "INNER JOIN news_categories ON news.category_id = news_categories.id;";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Long newsId = resultSet.getLong("id");
                Timestamp postDate = resultSet.getTimestamp("post_date");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                Long categoryId = resultSet.getLong("category_id");
                String categoryName = resultSet.getString("name");

                NewsCategory newsCategory = new NewsCategory();
                newsCategory.setId(categoryId);
                newsCategory.setName(categoryName);

                News news = new News();
                news.setId(newsId);
                news.setPost_date(postDate);
                news.setTitle(title);
                news.setContent(content);
                news.setCategory(newsCategory);

                newsList.add(news);
            }

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newsList;
    }

    public ArrayList<News> getAllNewsByCategory(NewsCategory category){
        ArrayList<News> newsList = new ArrayList<News>();
        String query =
                "SELECT news.id, news.post_date, news.title, news.content, news.category_id, news_categories.name "
                        + "FROM news "
                        + "INNER JOIN news_categories ON news.category_id = news_categories.id"
                        + "WHERE news_categories.id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, category.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                Long newsId = resultSet.getLong("id");
                Timestamp postDate = resultSet.getTimestamp("post_date");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                Long categoryId = resultSet.getLong("category_id");
                String categoryName = resultSet.getString("name");

                NewsCategory newsCategory = new NewsCategory();
                newsCategory.setId(categoryId);
                newsCategory.setName(categoryName);

                News news = new News();
                news.setId(newsId);
                news.setPost_date(postDate);
                news.setTitle(title);
                news.setContent(content);
                news.setCategory(newsCategory);

                newsList.add(news);
            }

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newsList;
    }


    public static News getNewsById(Long id){
        News news = null;
        String query = "SELECT news.post_date, news.title, news.content, news.category_id, news_categories.name" +
                "FROM news " +
                "INNER JOIN news_categories ON news.category_id = news_categories.id" +
                "WHERE news.id = ?;";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next()){
                Timestamp postDate = resultSet.getTimestamp("post_date");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                Long categoryId = resultSet.getLong("category_id");
                String categoryName = resultSet.getString("name");

                NewsCategory newsCategory = new NewsCategory();
                newsCategory.setId(categoryId);
                newsCategory.setName(categoryName);

                news = new News();
                news.setId(id);
                news.setPost_date(postDate);
                news.setTitle(title);
                news.setContent(content);
                news.setCategory(newsCategory);
            }

        } catch (Exception e){
            e.printStackTrace();
        }

        return news;
    }

    public static boolean addNews(News news){
        String query = "INSERT INTO news (post_date, title, content, category_id) VALUES (?, ?, ?, ?)";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setTimestamp(1, currentTimestamp);
            preparedStatement.setString(2, news.getTitle());
            preparedStatement.setString(3, news.getContent());
            preparedStatement.setLong(4, news.getCategory().getId());

            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public static boolean deleteNews(Long id){
        String query = "DELETE FROM news WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public static boolean updateNews(News news){
        String query = "UPDATE news SET post_date = ?, title = ?, content = ?, category_id = ? WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setTimestamp(1, currentTimestamp);
            preparedStatement.setString(2, news.getTitle());
            preparedStatement.setString(3, news.getContent());
            preparedStatement.setLong(4, news.getCategory().getId());
            preparedStatement.setLong(5, news.getId());

            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public static ArrayList<Comment> getAllComments(){
        ArrayList<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM comments";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPost_date(resultSet.getTimestamp("post_date"));
                comment.setUser_id(resultSet.getLong("user_id"));
                comment.setNews_id(resultSet.getLong("news_id"));

                comments.add(comment);
            }

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comments;
    }

    public static ArrayList<Comment> getAllUserComments(Long user_id){
        ArrayList<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM comments WHERE user_id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, user_id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPost_date(resultSet.getTimestamp("post_date"));
                comment.setUser_id(resultSet.getLong("user_id"));
                comment.setNews_id(resultSet.getLong("news_id"));

                comments.add(comment);
            }

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comments;
    }

    public static ArrayList<Comment> getAllNewsComments(Long news_id){
        ArrayList<Comment> comments = new ArrayList<>();
        String query = "SELECT * FROM comments WHERE news_id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, news_id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()){
                Comment comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPost_date(resultSet.getTimestamp("post_date"));
                comment.setUser_id(resultSet.getLong("user_id"));
                comment.setNews_id(resultSet.getLong("news_id"));

                comments.add(comment);
            }

            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comments;
    }

    public static Comment getCommentById(Long id){
        Comment comment = null;
        String query = "SELECT * FROM comments WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                comment = new Comment();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPost_date(resultSet.getTimestamp("post_date"));
                comment.setUser_id(resultSet.getLong("user_id"));
                comment.setNews_id(resultSet.getLong("news_id"));
            }
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comment;
    }

    public static boolean addComment(Comment comment){
        String query = "INSERT INTO comments (comment, post_date, user_id, news_id) VALUES (?, ?, ?, ?)";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, comment.getComment());
            preparedStatement.setTimestamp(2, currentTimestamp);
            preparedStatement.setLong(3, comment.getUser_id());
            preparedStatement.setLong(4, comment.getNews_id());
            preparedStatement.executeUpdate();

            preparedStatement.close();
        } catch (Exception e){
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public static boolean deleteComment(Long id){
        String query = "DELETE FROM comments WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public static boolean updateComment(Comment comment){
        String query = "UPDATE comments SET comment = ?, post_date = ? WHERE id = ?";

        try{
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, comment.getComment());
            preparedStatement.setTimestamp(2, comment.getPost_date());
            preparedStatement.setLong(3, comment.getId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
