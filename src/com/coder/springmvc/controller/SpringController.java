package com.coder.springmvc.controller;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coder.springmvc.entity.UserDocument;
import com.coder.springmvc.service.UserDocumentService;

@Controller
@RequestMapping("/tools")
public class SpringController {

	@Autowired
	UserDocumentService userDocumentService;
	
	@InitBinder
	public void initBinder(WebDataBinder databinder) {
		StringTrimmerEditor sEditor = new StringTrimmerEditor(true);
		databinder.registerCustomEditor(String.class, sEditor);
	}
	
	
	@GetMapping("/selectFile")
	public String welcomeToHome(Model model) {
		
		model.addAttribute("userDoc", new UserDocument());
		return "home-page";
	}
	
	@PostMapping("/cropImage")
	public String sendToCropeImagePage(@ModelAttribute("userDoc") UserDocument usrDoc, 
			@RequestParam("fileUploaded") MultipartFile fileUpload,
			RedirectAttributes redirectAttributes, Model model) throws IOException {
		
		 String sendTo = "";
		 
		if(fileUpload.isEmpty() || fileUpload.getBytes().length == 0) {
			redirectAttributes.addFlashAttribute("error", "File not found!");
			sendTo = "home-page";
		}else {
			//Set the picture to user documents..
			usrDoc.setContent(fileUpload.getBytes());
			usrDoc.setType(fileUpload.getContentType());
			
			String fileName = fileUpload.getOriginalFilename();
			String fileDescription = fileName.toLowerCase().substring(fileName.length() -4, fileName.length());
			usrDoc.setDescription(fileDescription);
			
			System.out.println("FILE NAME : " + fileName);
			System.out.println("FILE DESCRIPTION : " + fileDescription);
			System.out.println("FILE TYPE : " + fileUpload.getContentType());
			
			//Save it in database
			userDocumentService.save(usrDoc);
			
			//Show the picture in the page
			byte[] encodeBase64 = Base64.encodeBase64(fileUpload.getBytes());
			String base64Encoded = new String(encodeBase64);
			usrDoc.setContent(encodeBase64);
			model.addAttribute("picture", base64Encoded);
	
			sendTo = "show-page";
		}
		
		return sendTo;
	}
	
	@PostMapping("/serveIt")
	public String serveCroppedImage(@RequestParam("x") int x, 
			@RequestParam("y") int y, @RequestParam("w") int w, 
			@RequestParam("h") int h, Model model, HttpServletResponse response) throws IOException {
		
		System.out.println(x+" "+y+" "+w+" "+" "+h);
//		final String fileName = "CroppedImage";
		
		UserDocument usrDoc = userDocumentService.getDocumentById(1);
		if(usrDoc != null) {
			
			InputStream inputStream = new ByteArrayInputStream(usrDoc.getContent());
			BufferedImage createImage = ImageIO.read(inputStream);
			Graphics g = createImage.getGraphics();
			g.drawImage(createImage, x, y, w, h, null);
			
//			response.setContentType("application/force-download");
//	        response.setHeader("Content-Disposition", "attachment; filename="+fileName+usrDoc.getDescription());
	        
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			ImageIO.write(createImage, "jpg", os);
			usrDoc.setContent(os.toByteArray());
			userDocumentService.save(usrDoc);
			
//			IOUtils.copy(inputStream, response.getOutputStream());
//			response.flushBuffer();
//			inputStream.close();
		}
		
		return "service-page";
		
	}
	
	
	
}


