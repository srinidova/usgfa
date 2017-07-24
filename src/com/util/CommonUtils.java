package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;

import com.bo.EventFileBO;
import com.bo.FarmFileBO;
import com.bo.MemberFileBO;
import com.bo.NewsFileBO;
import com.bo.ProgramFileBO;
import com.bo.StoriesFileBO;
import com.bo.UploadFileBO;
import com.dto.EmailDTO;
import com.dto.EventFileDTO;
import com.dto.FarmFileDTO;
import com.dto.MemberFileDTO;
import com.dto.NewsFileDTO;
import com.dto.ProgramFileDTO;
import com.dto.SmsDTO;
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;
import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.BodyPartEntity;
import com.sun.jersey.multipart.FormDataBodyPart;
import com.sun.jersey.multipart.FormDataParam;

import net.sf.json.JSONObject;

@Path("/commonUtils")
public class CommonUtils {
	public static String getAutoGenId(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
	public static String getDate() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Calendar cal = Calendar.getInstance();
		 String regDate = dateFormat.format(cal.getTime());
		return regDate;
	}
	public static String generatePIN() 
	{   
	    int x = (int)(Math.random() * 9);
	    x = x + 1;
	    String randomPIN = (x + "") + ( ((int)(Math.random()*1000)) + "" );
	    return randomPIN;
	}
	public static String getIndainDate(String sDate) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		 String regDate = dateFormat.format(sDate);
		return regDate;
	}

	@POST
	@Path("/upload")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public void uploadFile(@Context HttpServletRequest request, @FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail) throws IOException {
		String sFileExtn = null;
		String destination = "D:/currentworking/usgfa/WebContent/images/uploads/";
		HashMap<String, String> hm = null;
		HttpSession session = request.getSession();
		
		if (uploadedInputStream != null && fileDetail != null) {
			sFileExtn = FilenameUtils.getExtension(fileDetail.getFileName());

			if (StringUtils.isNotEmpty(sFileExtn) && sFileExtn.equalsIgnoreCase("zip")) {
				hm = unZipIt(uploadedInputStream, destination);
			} else {
				hm = fileSave(request, uploadedInputStream, fileDetail, destination);
			}
		}
		if (hm != null && hm.size() > 0) {
			session.setAttribute("UPLOADED_FILELIST", hm);
		}

	}

	/**
	 * Utility method to save InputStream data to target location/file
	 * 
	 * @param inStream
	 *            - InputStream to be saved
	 * @param target
	 *            - full path to destination file
	 */
	private void saveToFile(InputStream inStream, String target)
			throws IOException {
		OutputStream out = null;
		int read = 0;
		byte[] bytes = new byte[1024];
		out = new FileOutputStream(new File(target));
		while ((read = inStream.read(bytes)) != -1) {
			out.write(bytes, 0, read);
		}
		out.flush();
		out.close();
	}

	/**
	 * Creates a folder to desired location if it not already exists
	 * 
	 * @param dirName
	 *            - full path to the folder
	 * @throws SecurityException
	 *             - in case you don't have permission to create the folder
	 */
	private void createFolderIfNotExists(String dirName)
			throws SecurityException {
		File theDir = new File(dirName);
		if (!theDir.exists()) {
			theDir.mkdir();
		}
	}
	
	
	private HashMap<String, String> fileSave(HttpServletRequest request, InputStream uploadedInputStream,
			FormDataContentDisposition fileDetail, String destination) throws IOException {

		String uploadedFileLocation = null;
		HashMap<String, String> hm = new HashMap<String, String>();
		if (uploadedInputStream != null && fileDetail != null) {
			try {
				createFolderIfNotExists(destination);
			} catch (SecurityException se) {
			}
			try {

				String imageId = UUID.randomUUID().toString();
				uploadedFileLocation = destination + imageId + "."+ FilenameUtils.getExtension(fileDetail.getFileName());
				String sDbFilePath = "images/uploads/" + imageId + "." + FilenameUtils.getExtension(fileDetail.getFileName());
				saveToFile(uploadedInputStream, uploadedFileLocation);
				if (StringUtils.isNotEmpty(uploadedFileLocation)) {
					hm.put(imageId, sDbFilePath);
				}
			} catch (IOException e) {
				// return Response.status(500).entity("Can not save
				// file").build();
			}
		}
		return hm;
	}
	
	public HashMap<String, String> unZipIt(InputStream inputStream, String destination) {
		HashMap<String, String> hm = new HashMap<String, String>();
		boolean overwrite = false;

		try {
			byte[] buf = new byte[1024];
			ZipInputStream zipinputstream = null;
			ZipEntry zipentry;
			zipinputstream = new ZipInputStream(inputStream);

			zipentry = zipinputstream.getNextEntry();

			while (zipentry != null) {
				int n;
				FileOutputStream fileoutputstream;

				String sFileName = zipentry.getName();
				String sFileExtn = sFileName.substring(sFileName.lastIndexOf(".") + 1);
				String sImageId = UUID.randomUUID().toString();
				File newFile = new File(sImageId + "." + sFileExtn);
				if (zipentry.isDirectory()) {
					newFile.mkdirs();
					zipentry = zipinputstream.getNextEntry();
					continue;
				}

				if (newFile.exists() && overwrite) {
					newFile.delete();
				}

				String sOutFile = destination + sImageId + "." + sFileExtn;
				String sDbFilePath = "images/uploads/" + sImageId + "." + sFileExtn;
				if (StringUtils.isNotEmpty(sOutFile)) {
					hm.put(sImageId, sDbFilePath);
				}

				fileoutputstream = new FileOutputStream(new File(sOutFile));

				while ((n = zipinputstream.read(buf, 0, 1024)) > -1) {
					fileoutputstream.write(buf, 0, n);
				}

				fileoutputstream.close();
				zipinputstream.closeEntry();
				zipentry = zipinputstream.getNextEntry();

			}

			zipinputstream.close();
		} catch (Exception e) {
			throw new IllegalStateException("Can't unzip input stream", e);
		}
		return hm;
	}
	public static void saveFileData(HttpServletRequest request, String sId, String sType){
		HttpSession session = request.getSession();
		String resultFile = "fail";
		String sResult = "fail";
		HashMap<String,String> hmImages = (HashMap<String,String>)session.getAttribute("UPLOADED_FILELIST");
		if(hmImages != null && hmImages.size() > 0){
			for(Map.Entry m:hmImages.entrySet()){
				String sFileId  = (String) m.getKey();
				String sFilePath  = (String) m.getValue();
			// saving in to uploadFile Table
			UploadFileDTO uploadFileDto = new UploadFileDTO();
			uploadFileDto.setFileId(sFileId);
			uploadFileDto.setFilePath(sFilePath);
			uploadFileDto.setShowPublic("0");
		   // uploadFileDto.setUpdatedBy(CommonUtils.getDate());
		    uploadFileDto.setUpdatedOn(CommonUtils.getDate());
		    
		    UploadFileBO filebo = new UploadFileBO();
		    resultFile = filebo.addUploadFileDetails(uploadFileDto);
		    
			 // saving file data in to  Table
		    if(sType.equals("NEWS")){
			    NewsFileDTO  newsFileDto = new NewsFileDTO();
			    newsFileDto.setFileId(sFileId);
			    newsFileDto.setNewsId(sId);
			    NewsFileBO newsFileBo = new NewsFileBO();
			    sResult = newsFileBo.newsFile(newsFileDto);
		    }else if(sType.equals("PROGRAM")){
		    	ProgramFileDTO  programFileDto = new ProgramFileDTO();
			    programFileDto.setFileId(sFileId);
			    programFileDto.setProgramId(sId);
			    ProgramFileBO programFileBo = new ProgramFileBO();
			    sResult = programFileBo.programFile(programFileDto);
		    }else if(sType.equals("EVENT")){
		    	EventFileDTO eventFileDto = new EventFileDTO();
		    	eventFileDto.setFileId(sFileId);
		    	eventFileDto.setEventId(sId);
		    	 EventFileBO eventFileBo = new EventFileBO();
		    	 sResult = eventFileBo.eventFile(eventFileDto);
		    }else if(sType.equals("MEMBER")){
		    	MemberFileDTO memberFileDto = new MemberFileDTO();
		    	memberFileDto.setFileId(sFileId);
		    	memberFileDto.setMemberId(sId);
		    	 MemberFileBO memberFileBo = new MemberFileBO();
		    	 sResult = memberFileBo.memberFile(memberFileDto);
		    }else if(sType.equals("STORIES")){
		    	StoriesFileDTO storiesFileDto = new StoriesFileDTO();
		    	storiesFileDto.setFileId(sFileId);
		    	storiesFileDto.setStoriesId(sId);
		    	StoriesFileBO storiesFileBo = new StoriesFileBO();
		    	sResult = storiesFileBo.storiesFile(storiesFileDto);
		    }else if(sType.equals("FARM")){
		    	FarmFileDTO farmFileDto = new FarmFileDTO();
		    	farmFileDto.setFileId(sFileId);
		    	farmFileDto.setFarmId(sId);
		    	FarmFileBO farmFileBo = new FarmFileBO();
		    	sResult = farmFileBo.farmFile(farmFileDto);
		    }
	
		    session.setAttribute("UPLOADED_FILELIST", null);

		    
			}
		}
	}
	public static EmailDTO getMailProperties(ServletContext objContext) throws IOException {

		Properties prop = null;
		EmailDTO emailDTO = null;
		InputStream input = null;
		String propertiespath = null;
		String mailHost = null;
		String mailPort = null;
		String mailUserName = null;
		String mailPassword = null;

		propertiespath = objContext.getRealPath("Resources" + File.separator + "USGFA.properties");
		if (StringUtils.isNotEmpty(propertiespath)) {

			prop = new Properties();
			emailDTO = new EmailDTO();

			input = new FileInputStream(propertiespath);
			prop.load(input);

			mailHost = prop.getProperty("mailHost");
			mailPort = prop.getProperty("mailPort");
			mailUserName = prop.getProperty("mailUserName");
			mailPassword = prop.getProperty("mailPassword");


			emailDTO.setHost(mailHost);
			emailDTO.setPort(mailPort);
			emailDTO.setUserName(mailUserName);
			emailDTO.setPassword(mailPassword);

		}
		return emailDTO;
	}

	public static void getFileId(@QueryParam("fileId") String fileId, @Context HttpServletRequest request) {
		JSONObject jobj = new JSONObject();
		try {
			HttpSession session = request.getSession();

			if (!(fileId.length() < 0)) {
				session.setAttribute("FILEID", fileId);
			} else {
				jobj.put("FileId", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;

	}
	
	
public static SmsDTO getSmsProperties(ServletContext objContext) throws IOException {
		
		SmsDTO smsDTO = null;
		Properties prop = null;
		InputStream input = null;
		String propertiespath = null;
		String smsUserName = null;
		String smsPassword = null;
		String smsUrl = null;
		String smsSenderID = null;
		
		propertiespath = objContext.getRealPath("Resources" + File.separator + "USGFA.properties");
		
		if (StringUtils.isNotEmpty(propertiespath)) {
			prop = new Properties();
			smsDTO = new SmsDTO();
			
			input = new FileInputStream(propertiespath);
			prop.load(input);
			
			smsUserName = prop.getProperty("smsUserName");
			smsPassword = prop.getProperty("smsPassword");
			smsUrl = prop.getProperty("smsUrl");
			smsSenderID = prop.getProperty("smsSenderID");
			
			
			smsDTO.setUserName(smsUserName);
			smsDTO.setPassword(smsPassword);
			smsDTO.setUrl(smsUrl);
			smsDTO.setSenderId(smsSenderID);
		}
		return smsDTO;
	}
	
	public static String getPin (){

		int x = (int)(Math.random() * 9);
	    x = x + 1;
	    String randomPIN = (x + "") + ( ((int)(Math.random()*1000)) + "" );
		if(randomPIN.length() < 4){
			getPin ();
		}

		return randomPIN;
	}
	
	public static String getPropertyContent(ServletContext objContext, String sContentFor) throws IOException {

		String sPropertyContent = null;
		Properties prop = null;
		InputStream input = null;
		String propertiespath = null;

		propertiespath = objContext.getRealPath("Resources" + File.separator + "USGFA.properties");

		if (StringUtils.isNotEmpty(propertiespath)) {
			prop = new Properties();

			input = new FileInputStream(propertiespath);
			prop.load(input);

			sPropertyContent = prop.getProperty(sContentFor);

		}
		return sPropertyContent;
	}
	
	public  void uploadFileToLocation(FormDataContentDisposition fileDetail, InputStream uploadedInputStream,HttpServletRequest request, String path) throws IOException{
		String sFileExtn = null;
		//String destination = "D:/currentworking/usgfa/WebContent/images/uploads/";
		String destination = path;
		HashMap<String, String> hm = null;
		HttpSession session = request.getSession();
		 sFileExtn = FilenameUtils.getExtension(fileDetail.getFileName());
		if (uploadedInputStream != null && fileDetail != null && sFileExtn != null) {
			
            
			if (StringUtils.isNotEmpty(sFileExtn) && sFileExtn.equalsIgnoreCase("zip")) {
				hm = unZipIt(uploadedInputStream, destination);
			} else {
				hm = fileSave(request, uploadedInputStream, fileDetail, destination);
			}
		}
		if (hm != null && hm.size() > 0) {
			session.setAttribute("UPLOADED_FILELIST", hm);
		}
	}
	
	public void saveFile(InputStream file, String filePath) {
		try {
			/* Change directory path */
			java.nio.file.Path path = FileSystems.getDefault().getPath(filePath);
			/* Save InputStream as file */
			Files.copy(file, path);
		} catch (IOException ie) {
			ie.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void processFileUpload(List<FormDataBodyPart> bodyParts,HttpServletRequest request ) throws IOException{
		HashMap<String, String> hm = null;
		HttpSession session = request.getSession();
		String path = request.getServletContext().getRealPath("/") + "images/uploads/";
		
/*		if(session.getAttribute("UPLOADED_FILELIST") != null){
			hm = (HashMap<String,String>)session.getAttribute("UPLOADED_FILELIST");
		}else{
			hm = new HashMap<String, String>();
		}*/
		hm = new HashMap<String, String>();
		for (int i = 0; i < bodyParts.size(); i++) {
			BodyPartEntity bodyPartEntity = (BodyPartEntity) bodyParts.get(i).getEntity();
			String fileName = bodyParts.get(i).getContentDisposition().getFileName();
			InputStream uploadedInputStream = bodyPartEntity.getInputStream();
			String sFileExtn = FilenameUtils.getExtension(fileName);
			
			if (uploadedInputStream != null && sFileExtn != null) {
				if (StringUtils.isNotEmpty(sFileExtn) && sFileExtn.equalsIgnoreCase("zip")) {
					hm = unZipIt(uploadedInputStream, path, hm);
				} else {
					hm = fileSave(uploadedInputStream, path, sFileExtn, hm);
				}
			}
			System.out.println("file path sFileExtn"+sFileExtn);
			System.out.println("file path "+path);
		}
		if (hm != null && hm.size() > 0) {
			session.setAttribute("UPLOADED_FILELIST", hm);
		}
		
	}
	
	private HashMap<String, String> fileSave(InputStream uploadedInputStream, String destination,String sFileExtn, HashMap<String, String> hm) throws IOException {
		String uploadedFileLocation = null;
		//HashMap<String, String> hm = new HashMap<String, String>();
		if (uploadedInputStream != null && destination != null) {
			try {
				createFolderIfNotExists(destination);
			} catch (SecurityException se) {
			}
			try {

				String imageId = UUID.randomUUID().toString();
				uploadedFileLocation = destination + imageId + "."+ sFileExtn;
				String sDbFilePath = "images/uploads/" + imageId + "." + sFileExtn;
				saveToFile(uploadedInputStream, uploadedFileLocation);
				if (StringUtils.isNotEmpty(uploadedFileLocation)) {
					hm.put(imageId, sDbFilePath);
				}
			} catch (IOException e) {
				// return Response.status(500).entity("Can not save
				// file").build();
			}
		}
		return hm;
	}
	
	public HashMap<String, String> unZipIt(InputStream inputStream, String destination, HashMap<String, String> hm) {
		//HashMap<String, String> hm = new HashMap<String, String>();
		boolean overwrite = false;

		try {
			byte[] buf = new byte[1024];
			ZipInputStream zipinputstream = null;
			ZipEntry zipentry;
			zipinputstream = new ZipInputStream(inputStream);

			zipentry = zipinputstream.getNextEntry();

			while (zipentry != null) {
				int n;
				FileOutputStream fileoutputstream;

				String sFileName = zipentry.getName();
				String sFileExtn = sFileName.substring(sFileName.lastIndexOf(".") + 1);
				String sImageId = UUID.randomUUID().toString();
				File newFile = new File(sImageId + "." + sFileExtn);
				if (zipentry.isDirectory()) {
					newFile.mkdirs();
					zipentry = zipinputstream.getNextEntry();
					continue;
				}

				if (newFile.exists() && overwrite) {
					newFile.delete();
				}

				String sOutFile = destination + sImageId + "." + sFileExtn;
				String sDbFilePath = "images/uploads/" + sImageId + "." + sFileExtn;
				if (StringUtils.isNotEmpty(sOutFile)) {
					hm.put(sImageId, sDbFilePath);
				}

				fileoutputstream = new FileOutputStream(new File(sOutFile));

				while ((n = zipinputstream.read(buf, 0, 1024)) > -1) {
					fileoutputstream.write(buf, 0, n);
				}

				fileoutputstream.close();
				zipinputstream.closeEntry();
				zipentry = zipinputstream.getNextEntry();

			}

			zipinputstream.close();
		} catch (Exception e) {
			throw new IllegalStateException("Can't unzip input stream", e);
		}
		return hm;
	}
	
}
