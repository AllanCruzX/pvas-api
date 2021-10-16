package com.ikesocial.pvas.core.modelmapper.converter;

import com.ikesocial.pvas.api.model.output.ContatoModel;

public class ContatoEmContatoModelBuilder {

	private ContatoModel contatoModel;

	public ContatoEmContatoModelBuilder() {
		contatoModel = new ContatoModel();
	}

	public ContatoEmContatoModelBuilder comEmail(String email) {
		contatoModel.setEmail(email);
		return this;
	}

	public ContatoEmContatoModelBuilder comCelular(String celular) {
		contatoModel.setCelular(celular);
		return this;
	}

	public ContatoEmContatoModelBuilder comFacebook(String faceBook) {
		contatoModel.setFacebook(faceBook);
		return this;
	}

	public ContatoEmContatoModelBuilder comInstagram(String instagram) {
		contatoModel.setInstagran(instagram);
		return this;
	}

	public ContatoEmContatoModelBuilder comYoutube(String youtube) {
		contatoModel.setYoutube(youtube);
		return this;
	}

	public ContatoEmContatoModelBuilder comLinkedin(String linkedin) {
		contatoModel.setLinkedin(linkedin);
		return this;
	}

	public ContatoEmContatoModelBuilder comSite(String site) {
		contatoModel.setSite(site);
		return this;
	}
	
	public ContatoModel construir() {
		return this.contatoModel;
	}

}
