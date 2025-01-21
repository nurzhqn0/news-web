package kz.bitlab.java.models;

import java.util.Date;

public class News {
    private Long id;
    private String title;
    private String content;
    private String language;
    private Date postDate;

    public News() {
    }

    public News(Long id, String title, String content, String language, Date postDate) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.language = language;
        this.postDate = postDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getLanguage(){
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }
}
