package com.idp.web.webservice;

import javax.jws.WebService;

@WebService(endpointInterface="com.idp.web.webservice.DemoService")
public class DemoServiceImpl implements DemoService {

	@Override
	public String demo(String param) {
		
		return param;
	}

}
