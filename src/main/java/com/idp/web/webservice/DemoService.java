package com.idp.web.webservice;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

@WebService
public interface DemoService {

	@WebMethod
	public String demo(@WebParam(name="param") String param);
}
