package com.ikesocial.pvas.infrastructure.service.report;

import java.util.HashMap;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.filter.AssistenteSocialEstatisticaFilter;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.service.AssistenteSocialQueryService;
import com.ikesocial.pvas.domain.service.AssitenteSocialReportService;
import com.ikesocial.pvas.domain.service.CadastroEstadoService;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Service
public class PdfAssitenteSocialReportService implements AssitenteSocialReportService{
	
	@Autowired
	private AssistenteSocialQueryService assistenteSocialQueryService;
	
	@Autowired
	private CadastroEstadoService estadoService;

	@Override
	public byte[] emitirAssistenteSocialEstatisticas(AssistenteSocialEstatisticaFilter filtro, String timeOffset) {
		try {
			
			String estadoNome = null;
			String ativo = null;
			
			if(filtro.getEstadoId() != null) {
				Estado estadoAtual = estadoService.buscarOuFalhar(filtro.getEstadoId());
				estadoNome = estadoAtual.getNome();
			}
			
			if(filtro.getAtivo() != null) {
				ativo = filtro.getAtivo() == 0L ? "ATIVO" : "INATIVO";
			}
			
			var inputStream = this.getClass().getResourceAsStream(
					"/relatorios/assistente-social-estatistica.jasper");
			
			var parametros = new HashMap<String, Object>();
			parametros.put("REPORT_LOCALE", new Locale("pt", "BR"));
			parametros.put("ESTADO", estadoNome);
			parametros.put("ATIVO", ativo);
			parametros.put("DATA_CADASTRO",filtro.getDataCadastro());
			parametros.put("DATA_INATIVACAO",filtro.getDataIntivacao());
			
			var  assistenteSocialEstatistica = assistenteSocialQueryService.consultarAssistenteSocialEstatisticas(filtro, timeOffset);
			var dataSource = new JRBeanCollectionDataSource(assistenteSocialEstatistica);
			
			var jasperPrint = JasperFillManager.fillReport(inputStream, parametros, dataSource);
		
			return JasperExportManager.exportReportToPdf(jasperPrint);
		} catch (Exception e) {
			throw new ReportException("Não foi possível emitir relatório de assitente social estatísticas ", e);
		}
	}

}
