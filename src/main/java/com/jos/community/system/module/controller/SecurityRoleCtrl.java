package com.jos.community.system.module.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/system/role")
public class SecurityRoleCtrl {

	@RequestMapping(value = "/init.shtml", method = RequestMethod.GET)
	public String init(Model model){
		return "module/system/role_init";
	}
	
}
