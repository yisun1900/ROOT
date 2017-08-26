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

if (sxbz.equals("1"))//1：非手写；2：手写
{
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
		{
			response.sendRedirect("EditDjBlJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
		}
		else{
			response.sendRedirect("EditDjJc_zcddmx.jsp?ddbh="+ddbh+"&xh="+xh);
		}
	}
	else if (djlrfs.equals("2"))
	{
		if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
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
	if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
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
