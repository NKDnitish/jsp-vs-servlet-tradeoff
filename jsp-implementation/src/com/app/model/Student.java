package com.app.model;

public class Student {
    private final String name;
    private final String email;
    private final String course;

    public Student(String name, String email, String course) {
        this.name = name;
        this.email = email;
        this.course = course;
    }

    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getCourse() { return course; }
}