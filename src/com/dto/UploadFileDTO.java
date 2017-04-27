package com.dto;

public class UploadFileDTO {
	private String fileId;
	private String filePath;
	private String showPublic;
	private String updatedBy;
	private String updatedOn;
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getShowPublic() {
		return showPublic;
	}
	public void setShowPublic(String showPublic) {
		this.showPublic = showPublic;
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
