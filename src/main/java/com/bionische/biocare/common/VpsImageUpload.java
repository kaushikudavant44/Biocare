package com.bionische.biocare.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.bionische.biocare.common.s3.AmazonS3ClientService;

public class VpsImageUpload {

	 @Autowired
	    private   AmazonS3ClientService amazonS3ClientService;
	
	 
	 
	public static final String patientImages = "patient/";
	  public static final String doctorImages = "doctor/";

	public static final String labImages = "lab/";
	public static final String pharmacy = "pharmacy/";
	public static final String ADRVERTISE = "advertise/";
	
	 public static final String BLOGIMAGESPATH = "blogs/";
 
	/*public static void uploadBlogFile(MultipartFile file, String imageName) throws IOException {

		Path path = null;
		byte[] bytes = file.getBytes();

		path = Paths.get(BLOGIMAGESPATH + imageName);
		if (!Files.exists(path)) {
			Files.createDirectories(path.getParent());
		}
		Files.write(path, bytes);

	}

	public static void uploadedPatientReports(MultipartFile file, int imageType, String imageName, int userId)
			throws IOException {
		Path path = null;
		byte[] bytes = file.getBytes();

		if (imageType == 5) {
			path = Paths.get(patientImages + userId + "/reports/" + imageName);
			if (!Files.exists(path)) {
				Files.createDirectories(path.getParent());
			}
			Files.write(path, bytes);
		}

		if (imageType == 2) {
			path = Paths.get(patientImages + userId + "/prescription/" + imageName);
			if (!Files.exists(path)) {
				Files.createDirectories(path.getParent());
			}
			Files.write(path, bytes);
		}

	}

	public void saveUploadedFiles(List<MultipartFile> files, int imageType, String imageName, int userId)
			throws IOException {

		for (MultipartFile file : files) {

			if (file.isEmpty()) {

				continue;

			}

			Path path = null;
			byte[] bytes = file.getBytes();

			if (imageType == 1) {

				path = Paths.get(doctorImages + userId + "/profile/" + imageName);

			} else if (imageType == 2) {

				path = Paths.get(patientImages + userId + "/profile/" + imageName);

			} else if (imageType == 3) {

				path = Paths.get(pharmacy + userId + "/profile/" + imageName);
			} else if (imageType == 4) {

				path = Paths.get(labImages + userId + "/profile/" + imageName);

			} else if (imageType == 5) {

				path = Paths.get(patientImages + userId + "/reports/" + imageName);

			} else if (imageType == 6) {

				path = Paths.get(pharmacy + userId + "/documents/" + imageName);

			} else if (imageType == 7) {

				path = Paths.get(doctorImages + userId + "/documents/" + imageName);

			} else if (imageType == 8) {

				path = Paths.get(labImages + userId + "/documents/" + imageName);

			} else if (imageType == 10) {

				path = Paths.get(doctorImages + userId + "/signature/" + imageName);

			} else if (imageType == 11) {

				path = Paths.get(labImages + userId + "/signature/" + imageName);
			} else if (imageType == 12) {

				path = Paths.get(ADRVERTISE + imageName);
			}
			 else if (imageType == 13) {
//Video
					path = Paths.get(patientImages + userId + "/video/" + imageName);
				}
			if (!Files.exists(path)) {
				Files.createDirectories(path.getParent());
			}
			Files.write(path, bytes);
		}
	}*/

	/*public   void uploadBlogFile(MultipartFile file, String imageName) throws IOException {
 
		amazonS3ClientService.uploadFileToS3Bucket(file,imageName,BLOGIMAGESPATH, true);
		 
	}

	public   void uploadedPatientReports(MultipartFile file, int imageType, String imageName, int userId)
			throws IOException {
		Path path = null;
		byte[] bytes = file.getBytes();

		if (imageType == 5) {
		 
			amazonS3ClientService.uploadFileToS3Bucket(file,imageName,patientImages + userId + "/reports/", true);
		 
		}

		if (imageType == 2) {
	 
			amazonS3ClientService.uploadFileToS3Bucket(file,imageName,patientImages + userId + "/prescription/", true);
			 
		}

	}*/

	/*public void saveUploadedFiles(List<MultipartFile> files, int imageType, String imageName, int userId)
			throws IOException {

		for (MultipartFile file : files) {

			if (file.isEmpty()) {

				continue;

			}

			Path path = null;
			byte[] bytes = file.getBytes();

			if (imageType == 1) {
 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,doctorImages + userId + "/profile/", true);
				
			} else if (imageType == 2) {
 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,patientImages + userId + "/profile/", true);

			} else if (imageType == 3) {

			 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,pharmacy + userId + "/profile/", true);
			} else if (imageType == 4) {

		 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,labImages + userId + "/profile/", true);

			} else if (imageType == 5) {
 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,patientImages + userId + "/reports/", true);

			} else if (imageType == 6) {

			 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,pharmacy + userId + "/documents/", true);

			} else if (imageType == 7) {

			 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,doctorImages + userId + "/documents/", true);

			} else if (imageType == 8) {

			 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,labImages + userId + "/documents/", true);


			} else if (imageType == 10) {

			 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,doctorImages + userId + "/signature/", true);
				

			} else if (imageType == 11) {

 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,labImages + userId + "/signature/", true);
				
			} else if (imageType == 12) {
 
				amazonS3ClientService.uploadFileToS3Bucket(file,imageName,ADRVERTISE, true);
				
			}
			 else if (imageType == 13) {
//Video
				 
					amazonS3ClientService.uploadFileToS3Bucket(file,imageName,patientImages + userId + "/video/", true);
					
				}
		 
		}
	}*/
	public static String getFileExtension(MultipartFile inFile) {
		String fileExtention = inFile.getOriginalFilename().substring(inFile.getOriginalFilename().lastIndexOf('.'));
		return fileExtention;
	}

}
