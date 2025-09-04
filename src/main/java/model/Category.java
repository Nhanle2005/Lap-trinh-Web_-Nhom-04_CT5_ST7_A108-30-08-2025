package model;

import java.io.Serializable;
import java.util.Date;

public class Category implements Serializable {
    private int id;
    private String name;
    private String description;
    private int userId;
    private Date createdAt;

    // Constructor mặc định
    public Category() {}

    // Constructor đầy đủ (khớp với code trong Controller)
    public Category(int id, String name, String description, int userId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.userId = userId;
        this.createdAt = new Date(); // gán mặc định là thời điểm hiện tại
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}