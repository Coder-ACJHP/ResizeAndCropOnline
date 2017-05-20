package com.coder.springmvc.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coder.springmvc.entity.UserDocument;
import com.coder.springmvc.service.UserDocumentService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/tools")
public class SpringController {

	@Autowired
	UserDocumentService userDocumentService;
	
	@GetMapping("/selectFile")
	public String welcomeToHome(Model model) {
		userDocumentService.deleteUserDoc();
		model.addAttribute("userDoc", new UserDocument());
		return "home-page";
	}
	
	@PostMapping("/cropImage")
	public String sendToCropeImagePage(@ModelAttribute("userDoc") UserDocument usrDoc, 
			@RequestParam("fileUploaded") MultipartFile fileUpload,
			RedirectAttributes redirectAttributes, Model model) throws IOException {
		
		 String sendTo = "";
		 
		if(fileUpload.isEmpty() || fileUpload.getBytes().length == 0) {
			redirectAttributes.addFlashAttribute("error", "File not found! Please select an image to crop it.");
			sendTo = "redirect:/tools/selectFile";
		}else {
			
			String fileName = fileUpload.getOriginalFilename().substring(0, fileUpload.getOriginalFilename().length()-4);
			String fileDescription = fileUpload.getOriginalFilename().toLowerCase().
					substring(fileUpload.getOriginalFilename().length() -4, fileUpload.getOriginalFilename().length());

			//Save it in database
			usrDoc.setContent(fileUpload.getBytes());
			usrDoc.setType(fileUpload.getContentType());
			usrDoc.setName(fileName);
			usrDoc.setDescription(fileDescription);
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
			@RequestParam("h") int h, Model model) throws IOException {
		
		UserDocument usrDoc = userDocumentService.getLastDocument();
		if(usrDoc != null) {
			
			BufferedImage createImage = ImageIO.read(new ByteArrayInputStream(usrDoc.getContent()));
			BufferedImage croppedImage = createImage.getSubimage(x, y, w, h);
	        
			saveToDatabaseAndServe(croppedImage, usrDoc, model);

		}
		
		return "service-page";
	}
	
	@PostMapping("/resizeIt")
	public String resizeIt(Model model, @RequestParam("pic_size")String picSize) throws IOException {
		
		BufferedImage newImage = null;
		BufferedImage resizedImage = null;
		
		UserDocument usrDoc = userDocumentService.getLastDocument();
			if(usrDoc != null) {
				
				resizedImage = ImageIO.read(new ByteArrayInputStream(usrDoc.getContent()));
				
				switch (picSize) {
					case "200":
						newImage = Thumbnails.of(resizedImage).forceSize(200, 200).asBufferedImage();
						break;
					case "400":
						newImage = Thumbnails.of(resizedImage).forceSize(400, 400).asBufferedImage();
						break;
					case "600":
						newImage = Thumbnails.of(resizedImage).forceSize(800, 600).asBufferedImage();
						break;
					case "800":
						newImage = Thumbnails.of(resizedImage).forceSize(1200, 800).asBufferedImage();
						break;

				}
				
				saveToDatabaseAndServe(newImage, usrDoc, model);

		}
			return "service-page";
	}
	
	@GetMapping("/saveAsPng")
	public void saveAsPng(HttpServletResponse response, RedirectAttributes redirectAttributes) {
				
		UserDocument usrDc = userDocumentService.getLastDocument();
		if(usrDc != null) {	
							
			cookDownloadableImage(response, usrDc.getName(), "png", usrDc.getContent().length, usrDc.getContent(), redirectAttributes);
				
		}
	}

	@GetMapping("/saveAsJpg")
	public void saveAsJpg(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		
		UserDocument usrDc = userDocumentService.getLastDocument();
		if(usrDc != null) {	
				
			cookDownloadableImage(response, usrDc.getName(), "jpg", usrDc.getContent().length, usrDc.getContent(), redirectAttributes);

		}
	}
	
	@GetMapping("/saveAsGif")
	public void saveAsGif(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		
		UserDocument usrDc = userDocumentService.getLastDocument();
		if(usrDc != null) {	
				
			cookDownloadableImage(response, usrDc.getName(), "gif", usrDc.getContent().length, usrDc.getContent(), redirectAttributes);

		}
	}
	
	private final static void cookDownloadableImage(
			HttpServletResponse response, String FILE_NAME, String IMAGE_TYPE, 
			int contentLength, byte[] content, RedirectAttributes redirectAttributes){
		
		try {
			
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", String.
					format("inline; filename=\""+FILE_NAME+"."+IMAGE_TYPE+"\""));
			response.setContentLength(contentLength);
			
			BufferedImage createImage = ImageIO.read(new ByteArrayInputStream(content));
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			ImageIO.write(createImage, IMAGE_TYPE, os);
			os.flush();
			InputStream is = new ByteArrayInputStream(os.toByteArray());
			IOUtils.copy(is, response.getOutputStream());
			os.close();
			
		} catch (IOException e) {
			redirectAttributes.addFlashAttribute("error", e.getMessage());
			return;
		}
		
	}
	
	private void saveToDatabaseAndServe(BufferedImage image, 
				UserDocument usrDoc, Model model) throws IOException {
		
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		ImageIO.write(image, "png", os);
		os.flush();
		usrDoc.setContent(os.toByteArray());
		os.close();
		userDocumentService.save(usrDoc);
		
		//This used for showing cropped image in service page.
		byte[] encodeBase64 = Base64.encodeBase64(usrDoc.getContent());
		String base64Encoded = new String(encodeBase64, "UTF-8");
		model.addAttribute("picture", base64Encoded);
		
	}
}


