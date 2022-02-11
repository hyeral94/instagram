package com.somsom.instagram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.somsom.instagram.common.FileManagerService;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("/images/**") 
			.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
		}
}