package com.mehmetalp.justdance.models;

public class HighScoreModel {

    private String type;
    private int point;
    private String username;

    public HighScoreModel(String type, int point, String username) {
        this.type = type;
        this.point = point;
        this.username = username;
    }
    public HighScoreModel() {

    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

}
