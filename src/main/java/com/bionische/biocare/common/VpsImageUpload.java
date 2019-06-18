package com.bionische.biocare.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class VpsImageUpload {

	/*
	 * public static final String doctorProfile = "doctorProfile\\"; public static
	 * final String patientProfile = "patientProfile\\"; public static final String
	 * labImages = "labImages\\";
	 */
	// public static final String report="reports/";
	// public static final String
	// report="/usr/local/tomcat8/apache-tomcat-8.5.34/apache-tomcat-8.5.34/webapps/reports/";
	public static final String patientImages = "/usr/local/apache-tomcat-9.0.13/webapps/images/patient/";
	//public static final String PATIENT_VIDEO = "/usr/local/apache-tomcat-9.0.13/webapps/images/patient/";
//	public static final String patientImages = "reports/";
//	public static final String doctorImages = "D:\\upload\\new\\";

	public static final String doctorImages = "/usr/local/apache-tomcat-9.0.13/webapps/images/doctor/";

	public static final String labImages = "/usr/local/apache-tomcat-9.0.13/webapps/images/lab/";
	public static final String pharmacy = "/usr/local/apache-tomcat-9.0.13/webapps/images/pharmacy/";
	public static final String ADRVERTISE = "/usr/local/apache-tomcat-9.0.13/webapps/images/advertise/";
	
	// public static final String patientImages="image//";
	// public static final String
	// DOCTOR_CERTIFICATE="/usr/local/tomcat8/apache-tomcat-8.5.34/webapps/images/doctor/";

//	public static final String BLOGIMAGESPATH = "/usr/local/apache-tomcat-9.0.13/webapps/images/blogs/";

	public static final String BLOGIMAGESPATH = "/usr/local/apache-tomcat-9.0.13/webapps/images/blogs/";

	// public static final String patientImages="image//";
	// public static final String
	// DOCTOR_CERTIFICATE="/usr/local/tomcat8/apache-tomcat-8.5.34/webapps/images/doctor/";

	public static void uploadBlogFile(MultipartFile file, String imageName) throws IOException {

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
	}

	public static String getFileExtension(MultipartFile inFile) {
		String fileExtention = inFile.getOriginalFilename().substring(inFile.getOriginalFilename().lastIndexOf('.'));
		return fileExtention;
	}

}
