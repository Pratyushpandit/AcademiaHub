package com.academiahub.model;

public class AnnouncementModel {
    private int    announcementId;
    private String title;
    private String content;
    private String postedBy;
    private String postedDate;
    private String category;

    public AnnouncementModel() {}

    public int    getAnnouncementId()                         { return announcementId; }
    public String getTitle()                                  { return title; }
    public String getContent()                                { return content; }
    public String getPostedBy()                               { return postedBy; }
    public String getPostedDate()                             { return postedDate; }
    public String getCategory()                               { return category; }

    public void setAnnouncementId(int announcementId)         { this.announcementId = announcementId; }
    public void setTitle(String title)                        { this.title      = title; }
    public void setContent(String content)                    { this.content    = content; }
    public void setPostedBy(String postedBy)                  { this.postedBy   = postedBy; }
    public void setPostedDate(String postedDate)              { this.postedDate = postedDate; }
    public void setCategory(String category)                  { this.category   = category; }
}
