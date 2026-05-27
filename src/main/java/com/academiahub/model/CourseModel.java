package com.academiahub.model;

public class CourseModel {
    private int    courseId;
    private String courseCode;
    private String courseName;
    private String instructor;
    private String schedule;
    private String room;
    private int    credits;

    public CourseModel() {}

    public int    getCourseId()               { return courseId; }
    public String getCourseCode()             { return courseCode; }
    public String getCourseName()             { return courseName; }
    public String getInstructor()             { return instructor; }
    public String getSchedule()               { return schedule; }
    public String getRoom()                   { return room; }
    public int    getCredits()                { return credits; }

    public void setCourseId(int courseId)         { this.courseId   = courseId; }
    public void setCourseCode(String courseCode)  { this.courseCode = courseCode; }
    public void setCourseName(String courseName)  { this.courseName = courseName; }
    public void setInstructor(String instructor)  { this.instructor = instructor; }
    public void setSchedule(String schedule)      { this.schedule   = schedule; }
    public void setRoom(String room)              { this.room       = room; }
    public void setCredits(int credits)           { this.credits    = credits; }
}
