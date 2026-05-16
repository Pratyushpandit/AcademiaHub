package com.academiahub.model;

public class UserModel {
    private int    userId;
    private String fullName;
    private String email;
    private String password;
    private String role;

    public UserModel() {}

    public int    getUserId()   { return userId; }
    public String getFullName() { return fullName; }
    public String getEmail()    { return email; }
    public String getPassword() { return password; }
    public String getRole()     { return role; }

    public void setUserId(int userId)   { this.userId   = userId; }
    public void setFullName(String n)   { this.fullName = n; }
    public void setEmail(String e)      { this.email    = e; }
    public void setPassword(String p)   { this.password = p; }
    public void setRole(String r)       { this.role     = r; }
}
