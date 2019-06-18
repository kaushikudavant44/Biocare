package com.bionische.biocare.radiology.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.HomeController;
import com.bionische.biocare.common.Constant;
import com.bionische.biocare.doctor.model.DoctorDetails;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.radiology.model.ChildsModel;
import com.bionische.biocare.radiology.model.IndicationsModel;
import com.bionische.biocare.radiology.model.PNDTPatientDetails;
import com.bionische.biocare.radiology.model.PndtPatientBasicDetails;
import com.bionische.biocare.radiology.model.TestDetails;

@Controller
public class RadiologiestController {

	

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showTestDetails", method = RequestMethod.GET)

	public ModelAndView showTestDetails(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("radiology/test_details");

		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		List<TestDetails> testDetailsList = new ArrayList<TestDetails>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

		int doctorId = doctorDetails.getDoctorId();
		map.add("doctorId", "" + doctorId);
		try {
			testDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getAllTestsByDoctorId", map,
					List.class);
			System.out.println("testDetailsList  " + testDetailsList.toString());

			model.addObject("testDetailsList", testDetailsList);
		}

		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		return model;

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/saveTestDetails", method = RequestMethod.POST)

	public String saveTestDetails(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");

		int doctorId = doctorDetails.getDoctorId();
		ModelAndView model = new ModelAndView("radiology/test_details");
		TestDetails testDetails = new TestDetails();
		testDetails.setDoctorId(doctorId);
		int testId = 0;
		try {
			testId = Integer.parseInt(request.getParameter("testId1"));
		} catch (Exception e) {
			e.printStackTrace();
		}

		testDetails.setTestId(testId);
		testDetails.setModalityName(request.getParameter("modalityName"));
		testDetails.setTest(request.getParameter("test"));
		testDetails.setTestRequirement(request.getParameter("testRequirement"));

		try {

			testDetails = Constant.getRestTemplate().postForObject(Constant.url + "saveTestDetails", testDetails,
					TestDetails.class);

			model.addObject("testDetails", testDetails);

		} catch (Exception e) {

		}
		return "redirect:/showAllTestByDoctorId";
	}

	@RequestMapping(value = "/showAllTestByDoctorId", method = RequestMethod.GET)
	public ModelAndView showAllTest(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("radiology/test_details");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		List<TestDetails> testDetailsList = new ArrayList<TestDetails>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		int doctorId = doctorDetails.getDoctorId();
		map.add("doctorId", "" + doctorId);
		try {
			testDetailsList = Constant.getRestTemplate().postForObject(Constant.url + "getAllTestsByDoctorId", map,
					List.class);
			System.out.println("testDetailsList  " + testDetailsList.toString());

			model.addObject("testDetailsList", testDetailsList);
		}

		catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		return model;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showAllPndtPatientsByDoctorId", method = RequestMethod.GET)

	public ModelAndView showAllPndtPatients(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("radiology/pndt_patient_details");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		List<PndtPatientBasicDetails> pndtPatientBasicDetailsList = new ArrayList<PndtPatientBasicDetails>();
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		int doctorId = doctorDetails.getDoctorId();
		map.add("doctorId", "" + doctorId);
		try {
			pndtPatientBasicDetailsList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getAllPndtPatientsByDoctorId", map, List.class);
			System.out.println("pndtPatientBasicDetailsList  " + pndtPatientBasicDetailsList.toString());
			model.addObject("pndtPatientBasicDetailsList", pndtPatientBasicDetailsList);
		} catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}
		return model;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showSinglePndtPatients", method = RequestMethod.GET)

	public ModelAndView showSinglePndtPatients(HttpServletRequest request, HttpServletResponse response) {

		PNDTPatientDetails pndtPatientDetails = new PNDTPatientDetails();
		List<IndicationsModel> indicationModelList = new ArrayList<IndicationsModel>();
		List<ChildsModel> childModelList = new ArrayList<ChildsModel>();
		ModelAndView model = new ModelAndView("radiology/single_pndt_patient_details");
		HttpSession session = request.getSession();
		DoctorDetails doctorDetails = (DoctorDetails) session.getAttribute("doctorDetails");
		int pndtId = Integer.parseInt(request.getParameter("pndtId"));
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		int doctorId = doctorDetails.getDoctorId();
		map.add("pndtId", "" + pndtId);
		try {
			pndtPatientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getPndtPatientsByPndtId", map,
					PNDTPatientDetails.class);

			indicationModelList = Constant.getRestTemplate()
					.postForObject(Constant.url + "getPndtPatientsIndicationsByPndtId", map, List.class);

			childModelList = Constant.getRestTemplate().postForObject(Constant.url + "getPndtPatientsChildsByPndtId",
					map, List.class);

			model.addObject("pndtPatientDetails", pndtPatientDetails);
			model.addObject("indicationModelList", indicationModelList);
			model.addObject("childModelList", childModelList);
		} catch (Exception e) {
			System.out.println(e.getMessage());// TODO: handle exception
		}

		return model;

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/deleteTest", method = RequestMethod.GET)
	public @ResponseBody Info deleteTest(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("In Ajax");
		Info info = new Info();
		TestDetails testDetails = new TestDetails();
		try {

			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			int testId = Integer.parseInt(request.getParameter("testId"));
			map.add("testId", "" + testId);

			info = Constant.getRestTemplate().postForObject(Constant.url + "deleteTest", map, Info.class);

			System.out.println(info);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return info;

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/editTestDetails", method = RequestMethod.GET)
	public @ResponseBody TestDetails editTestDetails(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("In Ajax");

		TestDetails testDetails = new TestDetails();
		try {

			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			int testId = Integer.parseInt(request.getParameter("testId"));
			map.add("testId", "" + testId);

			testDetails = Constant.getRestTemplate().postForObject(Constant.url + "editTestDetails", map,
					TestDetails.class);

			System.out.println(testDetails);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return testDetails;

	}

}
