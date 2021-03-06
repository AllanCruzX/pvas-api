# pvas-api
Plataforma de visibilidade para assistentes sociais, da empresa Ike social. 
O PVAS é uma API RESTful (Nível 3 do RMM) 

### Construído com

* RESTful
* DDD
* SOLID
* Padrões de Projeto
* Java 11
* Jakarta EE
* Spring Boot
* Spring MVC
* Spring RestTemplate
* Spring Session
* Spring Data
* Spring HATEOAS (especificação HAL)
* Spring Boot Test
* Spring Security (OAuth2)
* JWT
* JPA (Hibernate)
* Hikari
* Mysql
* Redis
* Bean Validation
* JasperReports
* Thymeleaf
* Apache FreeMarker
* Cache ETags (Shallow ETags e Deep ETags)
* OpenAPI (Swagger UI e SringFox)
* Logs (Logback, SLF4J e Loggly)
* Testes de integração (JUnit e REST Assured)
* Testes unitários (JUnit, AssertJ e Mockito)
* UUIDs
* SendGrid
* Gzip
* Maven
* Docker
* AWS(S3, RDS, ECS {Farget}, ECR e ELB)
* RFC 7807
* ISO-8601


### Diagrama

![diagarama_topo](https://user-images.githubusercontent.com/26599676/174293897-4bef9a1e-3f21-4bc5-a0aa-615561a4c045.png)
![diagarama_foot](https://user-images.githubusercontent.com/26599676/174294415-b81c0fdc-bd21-48ef-83f0-39b341423e6e.png)

### Subindo o Docker Compose
Navegue até a pasta docker e digite sudo docker-compose up -d {{nome_do_servico}}, os serviços disponibilizados serão configurados e executados a partir de um container docker. Para visualizar o log digite sudo docker-compose logs {{nome_do_servico}} ou sudo docker-compose logs -f {{nome_do_servico}} para acompanhar os últimos logs em tempo real.



