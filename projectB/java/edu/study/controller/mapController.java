package edu.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/map")
@Controller
public class mapController {

	@RequestMapping(value="/map.do", method=RequestMethod.GET)
	public String map() {
		return "map/map";
	}
	
}
