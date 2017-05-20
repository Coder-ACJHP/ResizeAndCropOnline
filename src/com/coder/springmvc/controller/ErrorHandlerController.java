package com.coder.springmvc.controller;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class ErrorHandlerController {

	protected Logger logger;
	
	public ErrorHandlerController() {
		logger = Logger.getLogger(getClass().getName());
	}
	
	@GetMapping("/400")
	public String error400(Model model) {
		model.addAttribute("headerError", "400");
		model.addAttribute("error", "I guess I could not figure out what you mean :)");
		return "error-page";
	}
	
	@GetMapping("/404")
	public String error404(Model model) {
		model.addAttribute("headerError", "404");
		model.addAttribute("error", "The requested URL was not found on this server.");
		return "error-page";
	}
	
	@GetMapping("/500")
	public String error500(Model model) {
		model.addAttribute("headerError", "500");
		model.addAttribute("error", "It's my foult :(\nThe server encountered an internal error or misconfiguration"
				+ " and was unable to complete your request.Please contact the server administrator, "
				+ "you{at}your.address and inform them of the time the error occurred, and anything "
				+ "you might have done that may have caused the error.");
		return "error-page";
	}
	
	@ResponseStatus(value = HttpStatus.CONFLICT, reason = "Data integrity violation")
	// 409
	@ExceptionHandler(DataIntegrityViolationException.class)
	public void conflict() {
		logger.log(Level.WARNING,"Request raised a DataIntegrityViolationException");
		// Nothing to do
	}
	
	@ExceptionHandler({ SQLException.class, DataAccessException.class })
	public String databaseError(Exception exception) {
		
		logger.log(Level.WARNING, "Request raised " + exception.getClass().getSimpleName());
		return "databaseError";
	}

	
}
