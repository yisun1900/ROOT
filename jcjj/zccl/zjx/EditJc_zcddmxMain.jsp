<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
String lx=cf.executeQuery("select lx from jc_zczjxmx where zjxbh='"+zjxbh+"' and xh="+xh);
String sxbz=cf.executeQuery("select sxbz from jc_zczjxmx where zjxbh='"+zjxbh+"' and xh="+xh);
String djlrfs=cf.executeQuery("select sq_dwxx.djlrfs from sq_dwxx,jc_zcdd where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");
String kgcxhdbl=cf.executeQuery("select sq_dwxx.kgcxhdbl from sq_dwxx,jc_zcdd where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'");

if (lx.equals("1"))//1��������Ŀ��2��������Ŀ
{
	response.sendRedirect("EditOldJc_zcddmx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
}
else
{
	if (sxbz.equals("1"))//1������д��2����д
	{
		if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
		{
			if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
			{
				response.sendRedirect("EditNewJc_zcddmxDjBl.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
			}
			else{
				response.sendRedirect("EditNewJc_zcddmxDj.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
			}
		}
		else if (djlrfs.equals("2"))
		{
			if (kgcxhdbl.equals("Y"))//Y���ɸģ�N�����ɸ�
			{
				response.sendRedirect("EditNewJc_zcddmxZkBl.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
			}
			else{
				response.sendRedirect("EditNewJc_zcddmxZk.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
			}
		}
		else
		{
			response.sendRedirect("EditNewJc_zcddmx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
		}
	}
	else
	{
		if (djlrfs.equals("1"))//1��¼�뵥�����ۿۣ�2��¼���ۿ��㵥�ۣ�3�����ɴ���
		{
			response.sendRedirect("TqLrEditNewJc_zcddmxDj.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
		}
		else if (djlrfs.equals("2"))
		{
			response.sendRedirect("TqLrEditNewJc_zcddmxZk.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
		}
		else
		{
			response.sendRedirect("TqLrEditNewJc_zcddmx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
		}
	}


}


%>
