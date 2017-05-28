package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
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
			@FormDataParam("file") FormDataContentDisposition fileDetail) throws IOException {
		System.out.println("in to commonUtils upload");
		String sFileExtn = null;
		String destination = "D:/currentworking/usgfa/WebContent/images/uploads/";
		HashMap<String, String> hm = null;
		HttpSession session = request.getSession();
		
		if (uploadedInputStream != null && fileDetail != null) {
			sFileExtn = FilenameUtils.getExtension(fileDetail.getFileName());
			System.out.println("1. sFileExtn===" + sFileExtn);

			if (StringUtils.isNotEmpty(sFileExtn) && sFileExtn.equalsIgnoreCase("zip")) {
				System.out.println("2. sFileExtn====zip====" + sFileExtn);
				hm = unZipIt(uploadedInputStream, destination);
			} else {
				System.out.println("3. sFileExtn====non zip====" + sFileExtn);
				hm = fileSave(request, uploadedInputStream, fileDetail, destination);
			}
		}
		System.out.println("4. hm.size====" + hm.size());
		if (hm != null && hm.size() > 0) {
			session.setAttribute("UPLOADED_FILELIST", hm);
			System.out.println("5. HashMap-----" + hm);
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
				uploadedFileLocation = destination + imageId + "."
						+ FilenameUtils.getExtension(fileDetail.getFileName());
				saveToFile(uploadedInputStream, uploadedFileLocation);
				if (StringUtils.isNotEmpty(uploadedFileLocation)) {
					hm.put(imageId, uploadedFileLocation.substring(35));

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
				//System.out.println("b. sImageId===" + sImageId);
				File newFile = new File(sImageId + "." + sFileExtn);
				if (zipentry.isDirectory()) {
					newFile.mkdirs();
					zipentry = zipinputstream.getNextEntry();
					continue;
				}

				if (newFile.exists() && overwrite) {
					//System.out.println("Overwriting " + newFile);
					newFile.delete();
				}

				String sOutFile = destination + sImageId + "." + sFileExtn;
				//System.out.println("d. sOutFile===" + sOutFile);
				if (StringUtils.isNotEmpty(sOutFile)) {
					hm.put(sImageId, sOutFile.substring(35));
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
				System.out.println("--------------sFileId---------"+sFileId);
				System.out.println("--------------sFilePath---------"+sFilePath);
				System.out.println(m.getKey()+" "+m.getValue());
			
			// saving in to uploadFile Table
			UploadFileDTO uploadFileDto = new UploadFileDTO();
			uploadFileDto.setFileId(sFileId);
			uploadFileDto.setFilePath(sFilePath);
			uploadFileDto.setShowPublic("0");
		   // uploadFileDto.setUpdatedBy(CommonUtils.getDate());
		    uploadFileDto.setUpdatedOn(CommonUtils.getDate());
		    
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
			    //System.out.println("programFile---------"+sId);
			    ProgramFileBO programFileBo = new ProgramFileBO();
			    sResult = programFileBo.programFile(programFileDto);
		    }else if(sType.equals("EVENT")){
		    	EventFileDTO eventFileDto = new EventFileDTO();
		    	eventFileDto.setFileId(sFileId);
		    	eventFileDto.setEventId(sId);
		    	// System.out.println("eventFile---------"+sId);
		    	 EventFileBO eventFileBo = new EventFileBO();
		    	 sResult = eventFileBo.eventFile(eventFileDto);
		    }else if(sType.equals("MEMBER")){
		    	MemberFileDTO memberFileDto = new MemberFileDTO();
		    	memberFileDto.setFileId(sFileId);
		    	memberFileDto.setMemberId(sId);
		    	// System.out.println("memberFile---------"+sId);
		    	 MemberFileBO memberFileBo = new MemberFileBO();
		    	 sResult = memberFileBo.memberFile(memberFileDto);
		    }else if(sType.equals("STORIES")){
		    	StoriesFileDTO storiesFileDto = new StoriesFileDTO();
		    	storiesFileDto.setFileId(sFileId);
		    	storiesFileDto.setStoriesId(sId);
		    	// System.out.println("storiesFile---------"+sId);
		    	StoriesFileBO storiesFileBo = new StoriesFileBO();
		    	sResult = storiesFileBo.storiesFile(storiesFileDto);
		    }else if(sType.equals("FARM")){
		    	FarmFileDTO farmFileDto = new FarmFileDTO();
		    	farmFileDto.setFileId(sFileId);
		    	farmFileDto.setFarmId(sId);
		    	//System.out.println("farmFile---------"+sId);
		    	FarmFileBO farmFileBo = new FarmFileBO();
		    	sResult = farmFileBo.farmFile(farmFileDto);
		    }
	
		    session.setAttribute("UPLOADED_FILELIST", null);

		    
		   // System.out.println("sResult===="+sResult);
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
		//System.out.println("1. path of propertiespath Page" + propertiespath);
		if (StringUtils.isNotEmpty(propertiespath)) {

			prop = new Properties();
			emailDTO = new EmailDTO();

			input = new FileInputStream(propertiespath);
			prop.load(input);

			mailHost = prop.getProperty("mailHost");
			mailPort = prop.getProperty("mailPort");
			mailUserName = prop.getProperty("mailUserName");
			mailPassword = prop.getProperty("mailPassword");

			//System.out.println("2. mailHost===" + mailHost);
			//System.out.println("3. mailPort===" + mailPort);
			//System.out.println("4. mailUserName===" + mailUserName);
			//System.out.println("5. mailPassword===" + mailPassword);

			emailDTO.setHost(mailHost);
			emailDTO.setPort(mailPort);
			emailDTO.setUserName(mailUserName);
			emailDTO.setPassword(mailPassword);

		}
		return emailDTO;
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
