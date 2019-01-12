package com.mehmetalp.justdance.models;

import java.util.Date;

public class Score {

    private String type;
    private int point;
    private String username;
    private String scoreDate;

    public String getScoreDate() {
        return scoreDate;
    }

    public void setScoreDate(String scoreDate) {
        this.scoreDate = scoreDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public Score(String type, int point, String username,String scoreDate) {
        this.type = type;
        this.point = point;
        this.username = username;
        this.scoreDate=scoreDate;
    }


    public Score() {
           }
}
