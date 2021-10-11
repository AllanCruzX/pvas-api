package com.ikesocial.pvas.core.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ikesocial.pvas.domain.service.EnvioEmailService;
import com.ikesocial.pvas.infrastructure.service.email.FakeEnvioEmailService;
import com.ikesocial.pvas.infrastructure.service.email.SandboxEnvioEmailService;
import com.ikesocial.pvas.infrastructure.service.email.SmtpEnvioEmailService;

@Configuration
public class EmailConfig {

    @Autowired
    private EmailProperties emailProperties;

    @Bean
    public EnvioEmailService envioEmailService() {
        switch (emailProperties.getImpl()) {
            case FAKE:
                return new FakeEnvioEmailService();
            case SANDBOX:
                return new SandboxEnvioEmailService();
            case SMTP:
                return new SmtpEnvioEmailService();
            default:
                return null;
        }
    }
}  
