<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
String sxbz=cf.executeQuery("select sxbz from jc_zcddmx where ddbh='"+ddbh+"' and xh="+xh);
String djlrfs=cf.executeQuery("select sq_dwxx.djlrfs from sq_dwxx,jc_zcdd where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");
String kgcxhdbl=cf.executeQuery("select sq_dwxx.kgcxhdbl from sq_dwxx,jc_zcdd where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");

if (sxbz.equals("1"))//1������д��2����д
{
	if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	{
		if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
		{
			response.sendRedirect("EditDjBlJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
		}
		else{
			response.sendRedirect("EditDjJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
		{
			response.sendRedirect("EditZkBlJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
		}
		else{
			response.sendRedirect("EditZkJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
		}
	}
	else
	{
		response.sendRedirect("EditJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
	}
}
else
{
	if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
	{
		response.sendRedirect("TqLrEditJc_zcddmxDj.jsp?ddbh="+ddbh+"&xh="+xh);
	}
	else if (djlrfs.equals("2"))
	{
		response.sendRedirect("TqLrEditJc_zcddmxZk.jsp?ddbh="+ddbh+"&xh="+xh);
	}
	else
	{
		response.sendRedirect("TqLrEditJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
	}
}

%>
