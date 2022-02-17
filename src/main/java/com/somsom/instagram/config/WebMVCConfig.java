package com.somsom.instagram.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.somsom.instagram.common.FileManagerService;
import com.somsom.instagram.common.PermissionInterceptor;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

//	@Autowired
//	PermissionInterceptor permissionInterceptor;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**") 
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
	}
	
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(permissionInterceptor)
//		.addPathPatterns("/**") // 어떤 path가 인터셉터를 거쳐서 수행될지 설정
//		.excludePathPatterns("/static/**", "/images/**", "/user/sign_out"); // 제외할 path
//	}
}