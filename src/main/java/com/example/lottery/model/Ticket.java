package com.example.lottery.model;

public class Ticket {
    private Integer id;
    private Integer drawId;
    private String numbers; // JSON array
    private String createdAt;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getDrawId() { return drawId; }
    public void setDrawId(Integer drawId) { this.drawId = drawId; }

    public String getNumbers() { return numbers; }
    public void setNumbers(String numbers) { this.numbers = numbers; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
