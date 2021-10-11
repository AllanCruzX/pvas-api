package com.ikesocial.pvas.domain.model.enums;

import java.util.Arrays;
import java.util.List;

import com.ikesocial.pvas.domain.exception.SexoNaoEncontradoException;

import lombok.Getter;

@Getter
public enum Sexo {

	MASCULINO(0L, "Masculino"),
	FEMININO(1L, "Feminino"),
	OUTROS(2L, "Outros");

	private Long id;
	private String nome;

	private Sexo(Long id, String nome) {

		this.id = id;
		this.nome = nome;

	}

	public static Sexo getById(Long id) {

		if (id != null) {
			for (Sexo tipo : Sexo.values()) {
				if (tipo.id.equals(id)) {
					return tipo;
				}
			}

			throw new SexoNaoEncontradoException(id);
		}
		return null;
	}

	public static List<Sexo> valores() {
		return Arrays.asList(values());
	}

}