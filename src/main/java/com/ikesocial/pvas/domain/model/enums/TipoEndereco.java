package com.ikesocial.pvas.domain.model.enums;

import java.util.Arrays;
import java.util.List;

import lombok.Getter;

@Getter
public enum TipoEndereco {

	RESIDENCIAL(0L, "Residencial"),
	COMERCIAL(1L, "Comercial");

	private Long id;
	private String nome;

	private TipoEndereco(Long id, String nome) {

		this.id = id;
		this.nome = nome;

	}

	public static TipoEndereco getById(Long id) {

		if (id != null) {
			for (TipoEndereco tipo : TipoEndereco.values()) {
				if (tipo.id.equals(id)) {
					return tipo;
				}
			}

			throw new IllegalArgumentException("Não existe um tipo de endereco com o código " + id);
		}
		return null;
	}

	public static List<TipoEndereco> valores() {
		return Arrays.asList(values());
	}

}