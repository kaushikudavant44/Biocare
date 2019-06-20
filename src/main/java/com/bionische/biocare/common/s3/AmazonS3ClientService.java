package com.bionische.biocare.common.s3;

import org.springframework.web.multipart.MultipartFile;

public interface AmazonS3ClientService {

	

    void uploadFileToS3Bucket(MultipartFile multipartFile,String fileName, String prefix, boolean enablePublicReadAccess);

    void deleteFileFromS3Bucket(String fileName);
}
