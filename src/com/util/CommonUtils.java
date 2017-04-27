package com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;

import com.sun.jersey.core.header.FormDataContentDisposition;
import com.sun.jersey.multipart.FormDataParam;

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
	public void uploadFile(@Context HttpServletRequest request,
			@FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail) {
		System.out.println("in to commonUtils upload");
		String uploadedFileLocation = null;
		String sFileExtn = null;
		String sFileDir = null;
		HashMap<String,String> hm = new HashMap<String,String>();
		final String UPLOAD_IMAGE_FOLDER = "D:/currentworking/usgfa/WebContent/uploads/images/"; 
		final String UPLOAD_VIDEO_FOLDER = "D:/currentworking/usgfa/WebContent/uploads/video/"; 
		// check if all form parameters are provided
		if (uploadedInputStream != null && fileDetail != null){
			sFileExtn = FilenameUtils.getExtension(fileDetail.getFileName());
			System.out.println("sFileExtn==="+ sFileExtn);
			if (sFileExtn!= null && (sFileExtn.equalsIgnoreCase("jpg") || sFileExtn.equalsIgnoreCase("png") || sFileExtn.equalsIgnoreCase("jpeg"))){
				sFileDir = UPLOAD_IMAGE_FOLDER;
			}else{
				sFileDir = UPLOAD_VIDEO_FOLDER;
			}
			try {
				createFolderIfNotExists(sFileDir);
			} catch (SecurityException se) {
				// return
				// Response.status(500).entity("Can not create destination folder on server").build();
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
			
			if (StringUtils.isNotEmpty(uploadedFileLocation)){
				hm.put(imageId,uploadedFileLocation );
				
			}
			if(hm != null && hm.size() > 0){
				session.setAttribute("UPLOADED_FILELIST", hm);
				System.out.println("in to HashMap-----"+hm);
			}
			}
		catch (IOException e) {
			// return Response.status(500).entity("Can not save file").build();
		}
		}
		// return Response.status(200).entity("File saved to " +
		// uploadedFileLocation).build();

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
}
