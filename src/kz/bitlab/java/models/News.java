package kz.bitlab.java.models;

import java.sql.Timestamp;

public class News {
    private Long id;
    private Timestamp post_date;
    private String title;
    private String content;
    private NewsCategory category;

    public News() {};

    public News(Long id, Timestamp post_date, String title, String content, NewsCategory category) {
        this.id = id;
        this.post_date = post_date;
        this.title = title;
        this.content = content;
        this.category = category;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Timestamp getPost_date() {
        return post_date;
    }

    public void setPost_date(Timestamp post_date) {
        this.post_date = post_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public NewsCategory getCategory() {
        return category;
    }

    public void setCategory(NewsCategory category) {
        this.category = category;
    }
}
