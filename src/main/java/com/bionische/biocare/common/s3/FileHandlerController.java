package com.bionische.biocare.common.s3;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;


/*
aws.access.key.id =AKIA2RPEIHRMV3VIZB3J
aws.access.key.secret =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
aws.region = ap-south-1
aws.s3.audio.bucket =elasticbeanstalk-ap-south-1-724717550681
*/



/*
<dependency>
<groupId>com.amazonaws</groupId>
<artifactId>aws-java-sdk</artifactId>
<version>1.11.106</version>
</dependency>*/

@RestController
@RequestMapping("/files")
public class FileHandlerController {

	
	 @Autowired
	    private AmazonS3ClientService amazonS3ClientService;

	 
		@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	    public Map<String, String> uploadFile(@RequestPart(value = "file") MultipartFile file)
	    {
	        this.amazonS3ClientService.uploadFileToS3Bucket(file,file.getOriginalFilename(),"", true);

	        Map<String, String> response = new HashMap<>();
	        response.put("message", "file [" + file.getOriginalFilename() + "] uploading request submitted successfully.");

	        return response;
	    }

	    @DeleteMapping
	    public Map<String, String> deleteFile(@RequestParam("file_name") String fileName)
	    {
	        this.amazonS3ClientService.deleteFileFromS3Bucket(fileName);

	        Map<String, String> response = new HashMap<>();
	        response.put("message", "file [" + fileName + "] removing request submitted successfully.");

	        return response;
	    }
	
	
}
