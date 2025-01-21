package kz.bitlab.java.models;

import java.util.Date;

public class News {
    private Long id;
    private String title;
    private String content;
    private int languageId;
    private Date postDate;

    public News() {
    }

    public News(Long id, String title, String content, int languageId, Date postDate) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.languageId = languageId;
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

    public int getLanguageId() {
        return languageId;
    }

    public void setLanguageId(int languageId) {
        this.languageId = languageId;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }
}
