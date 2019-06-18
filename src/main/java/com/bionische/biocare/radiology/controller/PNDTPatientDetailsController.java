package com.bionische.biocare.radiology.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.DateTime;
import org.springframework.context.annotation.Scope;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bionische.biocare.HomeController;
import com.bionische.biocare.common.Constant;
import com.bionische.biocare.common.DateConverter;
import com.bionische.biocare.lab.controller.UploadPndtDataOnGovSite;
import com.bionische.biocare.lab.model.LabDetails;
import com.bionische.biocare.lab.model.RadiologistPndtDetails;
import com.bionische.biocare.patient.model.Info;
import com.bionische.biocare.patient.model.State;
import com.bionische.biocare.patientdoctor.model.PrescriptionDetails;
import com.bionische.biocare.radiology.model.ChildsModel;
import com.bionische.biocare.radiology.model.IndicationsModel;
import com.bionische.biocare.radiology.model.NewPndtPatientDetails;
import com.bionische.biocare.radiology.model.PNDTPatientDetails;
import com.bionische.biocare.radiology.model.PndtIndications;
import com.bionische.biocare.radiology.model.PndtPatientHeader;
import com.bionische.biocare.radiology.model.PndtPatients;

@Scope("session")
@Controller
public class PNDTPatientDetailsController {

	List<PrescriptionDetails> prescriptionDetailsList;
	// List<IndicationsModel> indicationsModelList;
	public static List<ChildsModel> childsModelList = new ArrayList<ChildsModel>();
	public static List<IndicationsModel> indicationsModelList = new ArrayList<IndicationsModel>();
	List<State> stateList;
	String msg;
	int userType;

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showCheckUserType", method = RequestMethod.GET)

	public ModelAndView showCheckUserType(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("checkPatientExisting");

		return model;

	}

	@RequestMapping(value = "/showNewPndtPatientRegistration/{userType}", method = RequestMethod.GET)

	public ModelAndView showNewPndtPatientRegistration(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("userType") int userType) {

		ModelAndView model = new ModelAndView("lab/newPndtPatientRegistration");

		userType = 0;

		return model;

	}

	@RequestMapping(value = "/showPndtPatientPreview/{pndtId}", method = RequestMethod.GET)

	public ModelAndView showPndtPatientPreview(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("pndtId") int pndtId) {

		ModelAndView model = new ModelAndView("lab/patientPreview");

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("pndtId", pndtId);

		PNDTPatientDetails pndtPatientDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getPndtPatientDetailsByPndtId", map, PNDTPatientDetails.class);

		List<PndtIndications> pndtIndication = Constant.getRestTemplate()
				.getForObject(Constant.url + "getAllIndications", List.class);

		System.out.println("pndtPatientDetails = " + pndtPatientDetails.toString());
		model.addObject("pndtIndication", pndtIndication);
		model.addObject("pndtPatientDetails", pndtPatientDetails);
		return model;

	}

	@RequestMapping(value = "/registerNewPndtPatient", method = RequestMethod.POST)

	public String registerNewPndtPatient(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("lab/newPndtPatientRegistration");

		NewPndtPatientDetails newPndtPatientDetails = new NewPndtPatientDetails();

		newPndtPatientDetails.setPatientName(request.getParameter("name"));
		
		
		
		newPndtPatientDetails.setmName(request.getParameter("mname"));
		
		newPndtPatientDetails.setlName(request.getParameter("lname"));

		newPndtPatientDetails.setMobileNo(request.getParameter("mob"));

		newPndtPatientDetails = Constant.getRestTemplate().postForObject(Constant.url + "saveNewPndtUserDetails",
				newPndtPatientDetails, NewPndtPatientDetails.class);

		return "redirect:/showNewPndtRegisterPatient/"+newPndtPatientDetails.getPndtPatientId();
				

	}

	@RequestMapping(value = "/showNewPndtRegisterPatient/{pndtPatientId}", method = RequestMethod.GET)

	public ModelAndView showNewPndtRegisterPatient(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("pndtPatientId") int pndtPatientId) {

		ModelAndView model = new ModelAndView("lab/newPndtPatientPage");

		//NewPndtPatientDetails newPndtPatientDetails = new NewPndtPatientDetails();
		userType = 0;
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("pndtPatientId", pndtPatientId);
		
		NewPndtPatientDetails newPndtPatientDetails = Constant.getRestTemplate().postForObject(Constant.url + "getNewPndtUserDetails",
				map, NewPndtPatientDetails.class);

		List<PndtIndications> pndtIndication = Constant.getRestTemplate().getForObject(Constant.url + "getAllIndications", List.class);

		childsModelList.clear();
		indicationsModelList.clear();
		model.addObject("userType", userType);
		model.addObject("pndtIndication", pndtIndication);
		model.addObject("newPndtPatientDetails", newPndtPatientDetails);
		model.addObject("stateList", HomeController.stateAndCityList);
		return model;

	}

	@RequestMapping(value = "/showPndtPage", method = RequestMethod.GET)

	public ModelAndView showPndtPage(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("lab/pndtPage");
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");

		try {
			userType = 1;
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			map.add("labId", labDetails.getLabId());

			List<PNDTPatientDetails> pndtPatientDetails1 = Constant.getRestTemplate()
					.postForObject(Constant.url + "getPndtPatientDetailsByLabId", map, List.class);

			System.out.println("pndtPatientDetails= " + pndtPatientDetails1.toString());

			List<PndtIndications> pndtIndication = Constant.getRestTemplate()
					.getForObject(Constant.url + "getAllIndications", List.class);

			System.out.println("pndtIndication= " + pndtIndication.toString());

			model.addObject("pndtPatientDetails1", pndtPatientDetails1);
			model.addObject("pndtIndication", pndtIndication);
			childsModelList.clear();
			indicationsModelList.clear();
			model.addObject("stateList", HomeController.stateAndCityList);
			model.addObject("userType", userType);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/savePndtChildrenDetails", method = RequestMethod.GET)
	public @ResponseBody List<ChildsModel> savePndtChildrenDetails(HttpServletRequest request,
			HttpServletResponse response) {

		ChildsModel childModel = new ChildsModel();

		// ModelAndView model=new ModelAndView("radiology/show_offline_radiology");

		int patientId = Integer.parseInt(request.getParameter("patientId"));
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		System.out.println("ss" + patientId + gender + dob);

		childModel.setPatientId(patientId);
		childModel.setGender(gender);
		childModel.setDob(dob);
		childsModelList.add(childModel);

		// childModel=rest.postForObject(Constant.url+"savePndtPatientChildDetails",childModel,ChildsModel.class);
		System.out.println("Child Details" + childsModelList.toString());

		return childsModelList;

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/savePndtIndicationDetails", method = RequestMethod.GET)
	public @ResponseBody List<IndicationsModel> savePndtIndicationDetails(HttpServletRequest request,
			HttpServletResponse response) {

		IndicationsModel indicationsModel = new IndicationsModel();

		int patientId = Integer.parseInt(request.getParameter("patientId"));
		String indications = request.getParameter("indication");

		indicationsModel.setPatientId(patientId);

		indicationsModel.setIndications(indications);

		indicationsModel.setString1("h");

		indicationsModel.setString2("h");

		System.out.println("indication model" + indicationsModel);

		try {

			indicationsModelList.add(indicationsModel);
			System.out.println(indicationsModelList.toString());

		} catch (Exception e) {

			e.printStackTrace();
		}
		return indicationsModelList;

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/savePndtPatientDetails", method = RequestMethod.POST)
	public String savePndtPatientDetails(HttpServletRequest request, HttpServletResponse response) {

		PNDTPatientDetails pndtPatientDetails = new PNDTPatientDetails();

		String patientName = request.getParameter("patientName");

		String mName = request.getParameter("mName");

		String lName = request.getParameter("lName");
		int patientId = Integer.parseInt(request.getParameter("patientId1"));
		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		ModelAndView model = new ModelAndView("lab/pndtPage");
		DateTime datetime = new DateTime();
		int month = Integer.parseInt(datetime.toString("MM"));
		int year = Integer.parseInt(datetime.toString("yyyy"));

		/*
		 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
		 * Object>(); map.add("patientId",+ patientId);
		 * 
		 * PndtPatientHeader
		 * pndtPatientHeader=Constant.getRestTemplate().postForObject(Constant.url +
		 * "getPndtPatientHeader", map,PndtPatientHeader.class);
		 */
		PndtPatientHeader pndtPatientHeader = new PndtPatientHeader();

		try {

			pndtPatientHeader.setPatient_id(patientId);

			pndtPatientHeader.setLab_id(labDetails.getLabId());

			// convert date to datetime

			pndtPatientHeader.setMonth(month);
			pndtPatientHeader.setYear(year);

			pndtPatientHeader = Constant.getRestTemplate().postForObject(Constant.url + "savePndtPatientHeader",
					pndtPatientHeader, PndtPatientHeader.class);

		} catch (Exception e) {
			e.printStackTrace();
		}
		String indication[] = request.getParameter("indications").split(",");

		System.out.println("Indication= " + indication[0]);

		System.out.println("header id = " + pndtPatientHeader.getPndt_header_id());

		pndtPatientDetails.setPndtHeaderId(pndtPatientHeader.getPndt_header_id());

		pndtPatientDetails.setPndtPatientId(patientId);

		pndtPatientDetails.setPatientName(patientName);

		pndtPatientDetails.setmName(mName);

		pndtPatientDetails.setlName(lName);

		pndtPatientDetails.setState(request.getParameter("state"));

		try {

			pndtPatientDetails.setNumberOfChild(Integer.parseInt(request.getParameter("numberOfChild")));

			pndtPatientDetails.setNumberOfMaleChild(Integer.parseInt(request.getParameter("numberOfMaleChild")));

			pndtPatientDetails.setNumberOfFemaleChild(Integer.parseInt(request.getParameter("numberOfFemaleChild")));

			pndtPatientDetails.setIndicationMTPabnormality(request.getParameter("indicationMTPabnormality"));

			pndtPatientDetails.setPatientType(Integer.parseInt(request.getParameter("patientType")));

		} catch (Exception e) {

			e.printStackTrace();

		}

		pndtPatientDetails.setLabId(labDetails.getLabId());

		pndtPatientDetails.setRelativeType(request.getParameter("relativeType"));

		pndtPatientDetails.setRelativeName(request.getParameter("relativeName"));

		pndtPatientDetails.setAddress(request.getParameter("address"));

		pndtPatientDetails.setRefDoctor(request.getParameter("refDoctor"));

		pndtPatientDetails.setSelfDoctor(request.getParameter("selfDoctor"));

		pndtPatientDetails.setWeeksOfPregnancy(request.getParameter("weeksOfPregnancy"));

		pndtPatientDetails.setNameOfDoctor(request.getParameter("nameOfDoctor"));

		pndtPatientDetails.setNumberOfIndication(request.getParameter("indications"));

		pndtPatientDetails.setNonInvasiveProc(request.getParameter("nonInvasiveProc"));

		pndtPatientDetails.setPregWomenObtainDate(request.getParameter("pregWomenObtainDate"));

		pndtPatientDetails.setDateProcCarOut(request.getParameter("dateProcCarOut"));

		pndtPatientDetails.setResOfNonInvasiveProc(request.getParameter("resOfNonInvasiveProc"));

		pndtPatientDetails.setResOfPreNatalDiagnoProc(request.getParameter("resOfPreNatalDiagnoProc"));

		pndtPatientDetails.setIndicationMTPAbnormal(request.getParameter("indicationMTPAbnormal"));

		pndtPatientDetails.setNameOfDoctor(request.getParameter("nameOfDoctor"));

		pndtPatientDetails.setGenDiseaseHistory(request.getParameter("genDiseaseHistory"));

		pndtPatientDetails.setIndicationDiangoProc(request.getParameter("indicationDiangoProc"));

		pndtPatientDetails.setDateConsentOfPrgWomen(request.getParameter("dateConsentOfPrgWomen"));

		pndtPatientDetails.setInvasiveProcCarOut(request.getParameter("invasiveProcCarOut"));

		pndtPatientDetails.setComplicationInvasiveProc(request.getParameter("complicationInvasiveProc"));

		pndtPatientDetails.setAdditionalTestRecommended(request.getParameter("additionalTestRecommended"));

		pndtPatientDetails.setResultOfProcedure(request.getParameter("resultOfProcedure"));

		pndtPatientDetails.setDateResOfProcedure(request.getParameter("dateResOfProcedure"));

		pndtPatientDetails.setInvasivePreNatalDiagnoProc(request.getParameter("invasivePreNatalDiagnoProc"));

		pndtPatientDetails.setChildsModelList(childsModelList);

		try {
			// System.out.println("Pndt patient Details=" + pndtPatientDetails);

			Info info = Constant.getRestTemplate().postForObject(Constant.url + "savePndtPatientDetails",
					pndtPatientDetails, Info.class);

			model.addObject("pndtPatientDetails", pndtPatientDetails);

			// indicationsModelList.clear();
			childsModelList.clear();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "redirect:/showPndtPage";

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showPndtPatientList", method = RequestMethod.GET)

	public ModelAndView showPndtPatientList(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");
		ModelAndView model = new ModelAndView("lab/pndtPatientList");
		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("labId", labDetails.getLabId());

	/*	List<PndtPatients> pndtPatientsList = Constant.getRestTemplate()
				.postForObject(Constant.url + "getAllPndtPatientsByLabId", map, List.class);*/
		
		ParameterizedTypeReference<List<PndtPatients>> typeRef = new ParameterizedTypeReference<List<PndtPatients>>() {
		};
		ResponseEntity<List<PndtPatients>> responseEntity = Constant.getRestTemplate().exchange(Constant.url + "getAllPndtPatientsByLabId",	HttpMethod.POST, new HttpEntity<MultiValueMap<String, Object>>(map), typeRef);
		
		List<PndtPatients> pndtPatientsList = responseEntity.getBody();
		
		
		for(int i=0;i<pndtPatientsList.size();i++) {
			
			String createDate=pndtPatientsList.get(i).getCreatedDate();
						
	//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date currentDate = new Date();
			Date dateAfterFiveDays=null;
			Date expiryDate = null;
			try {
				

				 expiryDate = new SimpleDateFormat("yyyy-MM-dd").parse(DateConverter.convertToYMD(createDate));
			
				 dateAfterFiveDays = new Date(expiryDate.getTime() + 5 * 24 * 3600 * 1000);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (currentDate.before(dateAfterFiveDays) && currentDate.after(expiryDate)) {				
				
				model.addObject("getExpiryDate", createDate);

				model.addObject("patientValidToUpload", "0");
				
				pndtPatientsList.get(i).setDateStatus(1);

			}else {
				
				model.addObject("patientValidToUpload", 1);
				pndtPatientsList.get(i).setDateStatus(2);
			}
			
		}

		Date date = new Date(); 
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String currentDate=formatter.format(date);
		if (pndtPatientsList.isEmpty()) {

			model.addObject("message", 0);
		}
		model.addObject("currentDate", currentDate);
		model.addObject("msg", msg);
		model.addObject("pndtPatientsList", pndtPatientsList);
		return model;
	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getAllStateByCountryId", method = RequestMethod.GET)
	public @ResponseBody List<State> getAllStateByCountryId(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("In Ajax");

		try {

			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> mapState = new LinkedMultiValueMap<String, Object>();
			int countryId = Integer.parseInt(request.getParameter("countryId"));
			mapState.add("countryId", "" + countryId);
			stateList = Constant.getRestTemplate().postForObject(Constant.url + "getAllStateByCountryId", mapState,
					List.class);
			System.out.println("" + stateList.toString());

			childsModelList = new ArrayList<ChildsModel>();
			indicationsModelList = new ArrayList<IndicationsModel>();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return stateList;

	}

	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getPndtPatientDetails", method = RequestMethod.GET)
	public @ResponseBody PNDTPatientDetails getPndtPatientDetails(HttpServletRequest request,
			HttpServletResponse response) {

		try {
			System.out.println("Inside getPndtPatientDetails");
			RestTemplate rest = new RestTemplate();
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();

			String patientName = request.getParameter("patientName");
			map.add("patientName", patientName);
			System.out.println("patientName= " + patientName);
			PNDTPatientDetails pndtPatientDetails = Constant.getRestTemplate()
					.postForObject(Constant.url + "getPndtPatientDetails", map, PNDTPatientDetails.class);

			System.out.println("pndtPatientDetails=== " + pndtPatientDetails.toString());
			return pndtPatientDetails;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	@RequestMapping(value = "/uploadPndtPatientDetails/{pndtId}", method = RequestMethod.POST)

	public String uploadPndtPatientDetails(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("pndtId") int pndtId) {

		HttpSession session = request.getSession();
		LabDetails labDetails = (LabDetails) session.getAttribute("labDetails");

		MultiValueMap<String, Object> userMap = new LinkedMultiValueMap<String, Object>();

		userMap.add("labId", labDetails.getLabId());

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.add("pndtId", pndtId);

		PNDTPatientDetails pndtPatientDetails = Constant.getRestTemplate()
				.postForObject(Constant.url + "getPndtPatientDetailsByPndtId", map, PNDTPatientDetails.class);

		RadiologistPndtDetails radiologistPndtDetails = Constant.getRestTemplate().postForObject(
				Constant.url + "getLabPndtUsernameAndPasswordByLabId", userMap, RadiologistPndtDetails.class);

		try {
			boolean flag = false;

			flag = UploadPndtDataOnGovSite.uploadData(pndtPatientDetails, radiologistPndtDetails);

			if (flag == true) {

				Info info = Constant.getRestTemplate().postForObject(Constant.url + "updateUploadStatusUsingPndtId",
						map, Info.class);
				return "redirect:/showPndtPatientList";
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		msg = "Something went wrong. please try again";
		return "redirect:/showPndtPatientList";

	}

	/**
	 * 
	 * @param patientId
	 * @param appoitId
	 * @param request
	 * @param response
	 * @return
	 *//*
		 * @RequestMapping(value = "/showRadiologistConsulting/{patientId}/{appoitId}",
		 * method = RequestMethod.GET)
		 * 
		 * public ModelAndView showDoctorPatientMeeting(@PathVariable("patientId") int
		 * patientId,
		 * 
		 * @PathVariable("appoitId") int appoitId, HttpServletRequest request,
		 * HttpServletResponse response) { RestTemplate rest = new RestTemplate();
		 * 
		 * System.out.println("patientId:" + patientId); ModelAndView model = new
		 * ModelAndView("radiology/show_offline_radiology"); PatientDetails
		 * patientDetails = new PatientDetails();
		 * 
		 * MultiValueMap<String, Object> map = new LinkedMultiValueMap<String,
		 * Object>(); map.add("patientId", patientId); try { patientDetails =
		 * rest.postForObject(Constant.url + "getPatientDetailsById", map,
		 * PatientDetails.class);
		 * 
		 * } catch (Exception e) {
		 * 
		 * System.out.println(e.getMessage());// TODO: handle exception } try {
		 * SpecializationDetailsList specializationList = rest.getForObject(Constant.url
		 * + "getAllSpecialization", SpecializationDetailsList.class);
		 * model.addObject("specializationList",
		 * specializationList.getSpecializationDetailsList()); } catch (Exception e) {
		 * System.out.println(e.getMessage());// TODO: handle exception }
		 * BabyBornReports babyBornReportsRes = rest.postForObject(Constant.url +
		 * "getBabyBornReports", map, BabyBornReports.class);
		 * 
		 * model.addObject("babyBornReportsRes", babyBornReportsRes);
		 * 
		 * model.addObject("patientDetails", patientDetails); prescriptionDetailsList =
		 * new ArrayList<PrescriptionDetails>(); model.addObject("appoitId", appoitId);
		 * model.addObject("reportUrl", Constant.patientUrl);
		 * model.addObject("patientProfile", Constant.patientProfile);
		 * 
		 * return model;
		 * 
		 * }
		 */

	/*
	 * @RequestMapping(value = "/getPndtPatientDetails", method = RequestMethod.GET)
	 * public ModelAndView getPndtPatientDetails(HttpServletRequest request,
	 * HttpServletResponse response) {
	 * 
	 * 
	 * ModelAndView model=new ModelAndView("doctor/show_offline_consulting");
	 * 
	 * 
	 * try {
	 * 
	 * PNDTPatientDetails
	 * pndtPatientDetails=Constant.getRestTemplate().postForObject(Constant.url +
	 * "getPndtPatientDetails", map, PNDTPatientDetails.class); } catch (Exception
	 * e) { System.out.println(e.getMessage()); }
	 * 
	 * return model;
	 * 
	 * }
	 */

	@RequestMapping(value = "/uploadPndtData", method = RequestMethod.GET)

	public ModelAndView uploadPndtData(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView model = new ModelAndView("radiology/uploadData");

		return model;

	}
	
}
