package com.dto;

public class NewsDTO {
private String newsId;
private String newsTitle;
private String date;
private String paper;
private String link;
private String moreInfo;
private String updatedBy;
private String updatedOn;
public String getNewsId() {
	return newsId;
}

public void setNewsId(String newsId) {
	this.newsId = newsId;
}

public String getDate() {
	return date;
}

public void setDate(String date) {
	this.date = date;
}

public String getPaper() {
	return paper;
}

public void setPaper(String paper) {
	this.paper = paper;
}

public String getLink() {
	return link;
}

public void setLink(String link) {
	this.link = link;
}

public String getMoreInfo() {
	return moreInfo;
}

public void setMoreInfo(String moreInfo) {
	this.moreInfo = moreInfo;
}

public String getNewsTitle() {
	return newsTitle;
}

public void setNewsTitle(String newsTitle) {
	this.newsTitle = newsTitle;
}

public String getUpdatedBy() {
	return updatedBy;
}

public void setUpdatedBy(String updatedBy) {
	this.updatedBy = updatedBy;
}

public String getUpdatedOn() {
	return updatedOn;
}

public void setUpdatedOn(String updatedOn) {
	this.updatedOn = updatedOn;
}
}
