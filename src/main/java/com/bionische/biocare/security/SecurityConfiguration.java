package com.bionische.biocare.security;

import java.util.Arrays;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.common.Constant;
import com.bionische.biocare.patient.model.Info;
 
@Controller
public class SecurityConfiguration {

	public static HttpHeaders getHeaders() {
		String plainCredentials = "bill:abc123";
		String base64Credentials = new String(Base64.encodeBase64(plainCredentials.getBytes()));

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Basic " + base64Credentials);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		return headers;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getRes", method = RequestMethod.GET)
	public ModelAndView getRes() {

		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String,Object>();
		map.add("id", ""+1);
		map.add("name", "Ganeshh");
		try {
		HttpEntity<String> request = new HttpEntity<String>(getHeaders());
		ResponseEntity<Info> response = restTemplate.exchange(Constant.url + "/getRes",
				HttpMethod.GET, request, Info.class);

		System.out.println("Ganesh   " + response.getBody());
		// List<LinkedHashMap<String, Object>> usersMap = (List<LinkedHashMap<String,
		// Object>>)response.getBody();
		}catch(Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("home");

		return model;

	}
	
	/*@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getRes1", method = RequestMethod.GET)
	public ModelAndView getRes1() {

		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String, Object>();
		map.add("id", 1);
		map.add("name", "Ganesh");
		 try {
		HttpEntity<String> request = new HttpEntity<String>(getHeaders());
		
		//ResponseEntity<Info> info = restTemplate.exchange(Constant.url + "/getRes1?id=1&name=Ganesh", HttpMethod.POST, request, Info.class);

		
		
		Info info=restTemplate.postForObject(Constant.url + "/getRes1?id=1&name=Ganesh", request, Info.class);
				//postForObject(Constant.url + "/getRes1", request,map, Info.class);
		//ResponseEntity<Info> response = restTemplate.exchange(Constant.url + "/getRes1",
	//			HttpMethod.POST, request, Info.class);
		//ResponseEntity<Info> response = restTemplate.exchange(Constant.url + "/getRes1/",
		//		HttpMethod.POST, request, Info.class, map);

		//System.out.println("Ganesh   " + response.getBody());
		System.out.println("Ganesh   " + info.toString());
		 }catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			// TODO: handle exception
		}
		
		// List<LinkedHashMap<String, Object>> usersMap = (List<LinkedHashMap<String,
		// Object>>)response.getBody();

		ModelAndView model = new ModelAndView("home");

		return model;

	}*/
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getRes1", method = RequestMethod.GET)
	public ModelAndView getRes1() {

		RestTemplate restTemplate = new RestTemplate();
		MultiValueMap<String, Object> map=new LinkedMultiValueMap<String,Object>();
		map.add("id", ""+1);
		map.add("name", "Ganeshh");
		Info ii=new Info();
		ii.setError(false);
		ii.setMessage("sdfghjkl");
		try {
		HttpEntity<Info> request = new HttpEntity<Info>(ii, getHeaders());
		ResponseEntity<Info> response = restTemplate.exchange(Constant.url + "/getRes2",
				HttpMethod.POST, request, Info.class);

		System.out.println("Ganesh   " + response.getBody());
		// List<LinkedHashMap<String, Object>> usersMap = (List<LinkedHashMap<String,
		// Object>>)response.getBody();
		}catch(Exception e) {
			e.printStackTrace();
		}
		ModelAndView model = new ModelAndView("home");

		return model;

	}
}
