package com.ikesocial.pvas.core.io;

import java.util.Base64;

import org.springframework.boot.context.event.ApplicationContextInitializedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ProtocolResolver;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Base64ProtocolResolver implements ProtocolResolver, 
		ApplicationListener<ApplicationContextInitializedEvent> {
	
	@Override
	public Resource resolve(String location, ResourceLoader resourceLoader) {
		try {
			if (location.startsWith("base64:")) {
				byte[] decodedResource = Base64.getDecoder().decode(location.substring(7));
				return new ByteArrayResource(decodedResource);
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return null;
	}

	@Override
	public void onApplicationEvent(ApplicationContextInitializedEvent event) {
		event.getApplicationContext().addProtocolResolver(this);
	}

}
