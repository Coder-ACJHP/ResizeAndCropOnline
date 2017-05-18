package com.coder.springmvc.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return FileBucket.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		FileBucket fileBucket = (FileBucket) target;
		
		if(fileBucket.getMultipartFile() != null) {
			if(fileBucket.getMultipartFile().getSize() == 0) {
				errors.rejectValue("multipartfile", "missing.file");
			}
		}

	}

}
