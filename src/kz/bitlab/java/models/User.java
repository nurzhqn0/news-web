package kz.bitlab.java.models;

public class User {
    private Long id;
    private String email;
    private String password;
    private String fullName;
    private int roleId;

    public User() {}

    public User(Long id, String email, String password, String fullName, int roleId) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.roleId = roleId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int role_id) {
        this.roleId = role_id;
    }
}
