package com.dto;

import java.util.Map;

public class EmailDTO {

	private String host;
	private String port;
	private  String userName; 
	private  String password; 
	private String toAddress;
	private String ccAddress;
	private String bccAddress;
	private String subject;
	private String htmlBody; 
	private Map<String, String> mapInlineImages;
	
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public String getCcAddress() {
		return ccAddress;
	}
	public void setCcAddress(String ccAddress) {
		this.ccAddress = ccAddress;
	}
	public String getBccAddress() {
		return bccAddress;
	}
	public void setBccAddress(String bccAddress) {
		this.bccAddress = bccAddress;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getHtmlBody() {
		return htmlBody;
	}
	public void setHtmlBody(String htmlBody) {
		this.htmlBody = htmlBody;
	}
	public Map<String, String> getMapInlineImages() {
		return mapInlineImages;
	}
	public void setMapInlineImages(Map<String, String> mapInlineImages) {
		this.mapInlineImages = mapInlineImages;
	}

	
}
