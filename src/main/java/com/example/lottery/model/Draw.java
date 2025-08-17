package com.example.lottery.model;

public class Draw {
    private Integer id;
    private String status; // ACTIVE | CLOSED
    private String winningNumbers; // JSON array or null
    private String createdAt;
    private String closedAt;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getWinningNumbers() { return winningNumbers; }
    public void setWinningNumbers(String winningNumbers) { this.winningNumbers = winningNumbers; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getClosedAt() { return closedAt; }
    public void setClosedAt(String closedAt) { this.closedAt = closedAt; }
}
