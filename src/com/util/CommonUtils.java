package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
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
import com.dto.StoriesFileDTO;
import com.dto.UploadFileDTO;
import com.sun.jersey.core.header.FormDataContentDisposition;
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
			@FormDataParam("file") FormDataContentDisposition fileDetail) {
		System.out.println("in to commonUtils upload");
		String sFileExtn = null;

		if (uploadedInputStream != null && fileDetail != null) {
			sFileExtn = FilenameUtils.getExtension(fileDetail.getFileName());
			System.out.println("1. sFileExtn===" + sFileExtn);

			if (StringUtils.isNotEmpty(sFileExtn) && sFileExtn.equalsIgnoreCase("zip")) {
				System.out.println("2. sFileExtn====zip====" + sFileExtn);
				//unZipIt(uploadedInputStream);
			} else {
				System.out.println("3. sFileExtn====non zip====" + sFileExtn);
				try {
					fileSave(request, uploadedInputStream, fileDetail);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
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
	
	
	private void fileSave(HttpServletRequest request, InputStream uploadedInputStream,
			FormDataContentDisposition fileDetail) throws IOException {

		String uploadedFileLocation = null;
		String sFileExtn = null;
		String sFileDir = null;
		HashMap<String, String> hm = new HashMap<String, String>();
		final String UPLOAD_IMAGE_FOLDER = "D:/currentworking/usgfa/WebContent/uploads/images/";
		final String UPLOAD_VIDEO_FOLDER = "D:/currentworking/usgfa/WebContent/uploads/video/";

		if (uploadedInputStream != null && fileDetail != null) {
			sFileExtn = FilenameUtils.getExtension(fileDetail.getFileName());
			System.out.println("sFileExtn===" + sFileExtn);

			if (sFileExtn != null && (sFileExtn.equalsIgnoreCase("jpg") || sFileExtn.equalsIgnoreCase("png")
					|| sFileExtn.equalsIgnoreCase("jpeg"))) {
				sFileDir = UPLOAD_IMAGE_FOLDER;
			} else {
				sFileDir = UPLOAD_VIDEO_FOLDER;
			}
			try {
				createFolderIfNotExists(sFileDir);
			} catch (SecurityException se) {
			}
			try {
				UUID uuid = UUID.randomUUID();
				String imageId = uuid.toString();

				uploadedFileLocation = sFileDir + imageId + "." + FilenameUtils.getExtension(fileDetail.getFileName());

				saveToFile(uploadedInputStream, uploadedFileLocation);
				HttpSession session = request.getSession();
				System.out.println("uploc -->" + uploadedFileLocation);
				session.setAttribute("uploadPath", uploadedFileLocation);
				session.setAttribute("empId", imageId);

				if (StringUtils.isNotEmpty(uploadedFileLocation)) {
					hm.put(imageId, uploadedFileLocation);

				}
				if (hm != null && hm.size() > 0) {
					session.setAttribute("UPLOADED_FILELIST", hm);
					System.out.println("in to HashMap-----" + hm);
				}
			} catch (IOException e) {
				// return Response.status(500).entity("Can not save
				// file").build();
			}
		}
	}
	
	public void unZipIt(InputStream uploadedInputStream){

	     byte[] buffer = new byte[1024];
	     String outputFolder = "D:/currentworking/usgfa/WebContent/uploads/outputzip/";
	     System.out.println("outputFolder===" + outputFolder);
	     try{
	    	 
	    	 byte[] buf = new byte[1024];
	    	    ZipInputStream zinstream = new ZipInputStream(uploadedInputStream);
	    	    ZipEntry zentry = zinstream.getNextEntry();
	    	    System.out.println("Name of current Zip Entry : " + zentry + "\n");
	    	    while (zentry != null) {
	    	      String entryName = zentry.getName();
	    	      System.out.println("Name of  Zip Entry : " + entryName);
	    	      FileOutputStream outstream = new FileOutputStream(entryName);
	    	      int n;

	    	      while ((n = zinstream.read(buf, 0, 1024)) > -1) {
	    	        outstream.write(buf, 0, n);

	    	      }
	    	      System.out.println("Successfully Extracted File Name : "
	    	          + entryName);
	    	      outstream.close();

	    	      zinstream.closeEntry();
	    	      zentry = zinstream.getNextEntry();
	    	    }
	    	    zinstream.close();

	    	/*//create output directory is not exists
	    	File folder = new File(outputFolder);
	    	if(!folder.exists()){
	    		folder.mkdir();
	    	}

	    	//get the zip file content
	    	ZipInputStream zis =
	    		new ZipInputStream(uploadedInputStream);
	    	//get the zipped file list entry
	    	ZipEntry ze = zis.getNextEntry();

	    	while(ze!=null){

	    	   String fileName = ze.getName();
	           File newFile = new File(outputFolder + File.separator + fileName);

	           System.out.println("file unzip : "+ newFile.getAbsoluteFile());

	            //create all non exists folders
	            //else you will hit FileNotFoundException for compressed folder
	            new File(newFile.getParent()).mkdirs();

	            FileOutputStream fos = new FileOutputStream(newFile);

	            int len;
	            while ((len = zis.read(buffer)) > 0) {
	       		fos.write(buffer, 0, len);
	            }

	            fos.close();
	            ze = zis.getNextEntry();
	    	}

	        zis.closeEntry();
	    	zis.close();*/

	    	System.out.println("Done");

	    }catch(IOException ex){
	       ex.printStackTrace();
	    }
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
				System.out.println("--------------sFileId---------"+sFileId);
				System.out.println("--------------sFilePath---------"+sFilePath);
				//System.out.println(m.getKey()+" "+m.getValue());
			
			// saving in to uploadFile Table
			UploadFileDTO uploadFileDto = new UploadFileDTO();
			uploadFileDto.setFileId(sFileId);
			uploadFileDto.setFilePath(sFilePath);
			uploadFileDto.setShowPublic("0");
		    uploadFileDto.setUpdatedBy(CommonUtils.getDate());
		    
		    UploadFileBO filebo = new UploadFileBO();
		    resultFile = filebo.addUploadFileDetails(uploadFileDto);
		    System.out.println("resultFile===="+resultFile);
		    
			 // saving file data in to  Table
		    if(sType.equals("NEWS")){
			    NewsFileDTO  newsFileDto = new NewsFileDTO();
			    newsFileDto.setFileId(sFileId);
			    newsFileDto.setNewsId(sId);
			    System.out.println("newsFile---------"+sId);
			    NewsFileBO newsFileBo = new NewsFileBO();
			    sResult = newsFileBo.newsFile(newsFileDto);
		    }else if(sType.equals("PROGRAM")){
		    	ProgramFileDTO  programFileDto = new ProgramFileDTO();
			    programFileDto.setFileId(sFileId);
			    programFileDto.setProgramId(sId);
			    System.out.println("programFile---------"+sId);
			    ProgramFileBO programFileBo = new ProgramFileBO();
			    sResult = programFileBo.programFile(programFileDto);
		    }else if(sType.equals("EVENT")){
		    	EventFileDTO eventFileDto = new EventFileDTO();
		    	eventFileDto.setFileId(sFileId);
		    	eventFileDto.setEventId(sId);
		    	 System.out.println("eventFile---------"+sId);
		    	 EventFileBO eventFileBo = new EventFileBO();
		    	 sResult = eventFileBo.eventFile(eventFileDto);
		    }else if(sType.equals("MEMBER")){
		    	MemberFileDTO memberFileDto = new MemberFileDTO();
		    	memberFileDto.setFileId(sFileId);
		    	memberFileDto.setMemberId(sId);
		    	 System.out.println("memberFile---------"+sId);
		    	 MemberFileBO memberFileBo = new MemberFileBO();
		    	 sResult = memberFileBo.memberFile(memberFileDto);
		    }else if(sType.equals("STORIES")){
		    	StoriesFileDTO storiesFileDto = new StoriesFileDTO();
		    	storiesFileDto.setFileId(sFileId);
		    	storiesFileDto.setStoriesId(sId);
		    	 System.out.println("storiesFile---------"+sId);
		    	StoriesFileBO storiesFileBo = new StoriesFileBO();
		    	sResult = storiesFileBo.storiesFile(storiesFileDto);
		    }else if(sType.equals("FARM")){
		    	FarmFileDTO farmFileDto = new FarmFileDTO();
		    	farmFileDto.setFileId(sFileId);
		    	farmFileDto.setFarmId(sId);
		    	System.out.println("farmFile---------"+sId);
		    	FarmFileBO farmFileBo = new FarmFileBO();
		    	sResult = farmFileBo.farmFile(farmFileDto);
		    }
	
		    session.setAttribute("UPLOADED_FILELIST", null);

		    
		    System.out.println("sResult===="+sResult);
			}
		}
	}
	@POST
	@Path("/uploadFarm")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public void uploadFarmFile(@Context HttpServletRequest request, @FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail) {
		System.out.println("in to commonUtils upload");
		String sFileExtn = null;

		if (uploadedInputStream != null && fileDetail != null) {
			sFileExtn = FilenameUtils.getExtension(fileDetail.getFileName());
			System.out.println("1. sFileExtn===" + sFileExtn);

			if (StringUtils.isNotEmpty(sFileExtn) && sFileExtn.equalsIgnoreCase("zip")) {
				System.out.println("2. sFileExtn====zip====" + sFileExtn);
				//unZipIt(uploadedInputStream);
			} else {
				System.out.println("3. sFileExtn====non zip====" + sFileExtn);
				try {
					fileSave(request, uploadedInputStream, fileDetail);
				} catch (IOException e) {
					e.printStackTrace();
				}
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
		System.out.println("1. path of propertiespath Page" + propertiespath);
		if (StringUtils.isNotEmpty(propertiespath)) {

			prop = new Properties();
			emailDTO = new EmailDTO();

			input = new FileInputStream(propertiespath);
			prop.load(input);

			mailHost = prop.getProperty("mailHost");
			mailPort = prop.getProperty("mailPort");
			mailUserName = prop.getProperty("mailUserName");
			mailPassword = prop.getProperty("mailPassword");

			System.out.println("2. mailHost===" + mailHost);
			System.out.println("3. mailPort===" + mailPort);
			System.out.println("4. mailUserName===" + mailUserName);
			System.out.println("5. mailPassword===" + mailPassword);

			emailDTO.setHost(mailHost);
			emailDTO.setPort(mailPort);
			emailDTO.setUserName(mailUserName);
			emailDTO.setPassword(mailPassword);

		}
		return emailDTO;
	}
	/*public static void showPublic(HttpServletRequest request,String upId){
		HttpSession session = request.getSession();
		UploadFileDTO uploadFileDto = new UploadFileDTO();
		uploadFileDto.setShowPublic("0");
		if(upId.equals("0")){
			
			
		}
		
		
	}*/
	public static void deleteImage()
	{
		
	}
	/*@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getNewsId")*/
	public static void getFileId(@QueryParam("fileId") String fileId, @Context HttpServletRequest request) {
		//System.out.println("1. *****Called getNewsId**********newsId==" + newsId);
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
		//System.out.println("Profile jobj-->" + jobj);
		return;

	}
}
