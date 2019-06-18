package com.bionische.biocare.radiology.controller;

import java.util.Locale;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Scope("session")
@Controller
public class DmcViewerController {

	
	@RequestMapping(value = "/showDcmViewer", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		 
		return "lab/dcm_viewer";
	}
	
}
