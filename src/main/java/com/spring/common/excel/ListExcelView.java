package com.spring.common.excel;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import net.sf.jxls.transformer.XLSTransformer;

public class ListExcelView extends AbstractXlsView {
	private Logger log = LoggerFactory.getLogger(ListExcelView.class);
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setHeader("Content-Disposition", "attachment;fileName=\""+model.get("file_name")+"_"+new SimpleDateFormat("yyyyMMDD").format(Calendar.getInstance().getTime())+".xlsx"+"\"");
		response.setContentType("application/x-msexcel); charset=EUC-KR");
		
		String docRoot = request.getSession().getServletContext().getRealPath("/WEB-INF/excel/");
		log.info("경로 체크(docRoot) : " + docRoot);
		InputStream is = new BufferedInputStream(new FileInputStream(docRoot + model.get("template")));
		
		XLSTransformer trans = new XLSTransformer();
		workbook = trans.transformXLS(is, model);
		is.close();
		
		workbook.write(response.getOutputStream());
		
	}
}
