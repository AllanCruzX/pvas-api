package com.ikesocial.pvas.core.validation;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.ElementType.TYPE_USE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.OverridesAttribute;
import javax.validation.Payload;
import javax.validation.constraints.Pattern;

@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
@Retention(RUNTIME)
@Constraint(validatedBy = { })
@Pattern(regexp ="^[A-Za-zÀ-ú0-9.\\s]+$")
public @interface LetraNumeroEAcento {
	
	@OverridesAttribute(constraint = Pattern.class, name = "message")
	String message() default "{LetraEAcento.invalido}";

	Class<?>[] groups() default { };

	Class<? extends Payload>[] payload() default { };

}
