<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="com.jspsmart.upload.*" %>

<%
	request.setCharacterEncoding("GBK");
	response.setCharacterEncoding("GBK");
	String fileName = request.getParameter("fileName");

	fileName = fileName+".jpg";

	// �½�һ��SmartUpload����
	SmartUpload su = new SmartUpload();

	// ��ʼ��
	su.initialize(pageContext);

	// �趨contentDispositionΪnull�Խ�ֹ������Զ����ļ���
	//��֤������Ӻ��������ļ��������趨�������ص��ļ���չ��Ϊ
	//docʱ����������Զ���word��������չ��Ϊpdfʱ��
	//���������acrobat�򿪡�
	su.setContentDisposition(null);

	String urlStr = "/yblimg/ewm/khewm/"+fileName;

	System.out.println("fileName--> "+urlStr);
	// �����ļ�
	su.downloadFile(urlStr);
/*
*/
%>


