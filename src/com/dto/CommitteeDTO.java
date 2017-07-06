package com.dto;

public class CommitteeDTO {
private String committeeId;
private String memberId;
private String role;
private String displayOrder;
private String comments;
private String updatedOn;
private String updatedBy;

public String getCommitteeId() {
	return committeeId;
}
public void setCommitteeId(String committeeId) {
	this.committeeId = committeeId;
}
public String getMemberId() {
	return memberId;
}
public void setMemberId(String memberId) {
	this.memberId = memberId;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
public String getDisplayOrder() {
	return displayOrder;
}
public void setDisplayOrder(String displayOrder) {
	this.displayOrder = displayOrder;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
public String getUpdatedOn() {
	return updatedOn;
}
public void setUpdatedOn(String updatedOn) {
	this.updatedOn = updatedOn;
}
public String getUpdatedBy() {
	return updatedBy;
}
public void setUpdatedBy(String updatedBy) {
	this.updatedBy = updatedBy;
}
}
