package egovframework.com.cmm.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.validation.Validator;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.HandlerMethodReturnValueHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.AsyncSupportConfigurer;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import egovframework.com.cmm.interceptor.CustomInterceptor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class WebConfig implements WebMvcConfigurer {
	public WebConfig() {
        log.info("WebConfig is loaded");
    }
	@Autowired
    private CustomInterceptor customInterceptor;

	@Override
	public void configurePathMatch(PathMatchConfigurer configurer) {
		log.debug("configurePathMatch");
	}

	@Override
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
		log.debug("configureContentNegotiation");
	}

	@Override
	public void configureAsyncSupport(AsyncSupportConfigurer configurer) {
		log.debug("configureAsyncSupport");
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		log.debug("configureDefaultServletHandling");
	}

	@Override
	public void addFormatters(FormatterRegistry registry) {
		log.debug("addFormatters");
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		log.debug("addInterceptors");
		// TODO Interceptor
		registry.addInterceptor(customInterceptor).addPathPatterns("/**");
		// 모든 경로("/**")에 대해 customInterceptor를 적용합니다.
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		log.debug("addResourceHandlers");
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		log.debug("addCorsMappings");
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		log.debug("addViewControllers");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		log.debug("configureViewResolvers");
	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		log.debug("addArgumentResolvers");
	}

	@Override
	public void addReturnValueHandlers(List<HandlerMethodReturnValueHandler> returnValueHandlers) {
		log.debug("addReturnValueHandlers");
	}

	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		log.debug("configureMessageConverters");
	}

	@Override
	public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
		log.debug("extendMessageConverters");
	}

	@Override
	public void configureHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
		log.debug("configureHandlerExceptionResolvers");
	}

	@Override
	public void extendHandlerExceptionResolvers(List<HandlerExceptionResolver> exceptionResolvers) {
		log.debug("extendHandlerExceptionResolvers");
	}

	@Override
	public Validator getValidator() {
		log.debug("getValidator");
		return null;
	}

	@Override
	public MessageCodesResolver getMessageCodesResolver() {
		log.debug("MessageCodesResolver");
		return null;
	}

}
