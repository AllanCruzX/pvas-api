package com.ikesocial.pvas.domain.model.enums;

import java.util.Arrays;
import java.util.List;

import com.ikesocial.pvas.domain.exception.EstadoCivilEncontradoException;

import lombok.Getter;

@Getter
public enum EstadoCivil {

	SOLTEIRO(0L, "Solteiro"),
	CASADO(1L, "Casado"),
	VIUVO(2L, "Viúvo"),
	DIVORCIADO(3L, "Divorciado");

	private Long id;
	private String nome;

	private EstadoCivil(Long id, String nome) {

		this.id = id;
		this.nome = nome;

	}

	public static EstadoCivil getById(Long id) {

		if (id != null) {
			for (EstadoCivil tipo : EstadoCivil.values()) {
				if (tipo.id.equals(id)) {
					return tipo;
				}
			}

			throw new EstadoCivilEncontradoException(id);
		}
		return null;
	}

	public static List<EstadoCivil> valores() {
		return Arrays.asList(values());
	}


}