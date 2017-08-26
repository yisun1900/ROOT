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

if (lx.equals("1"))//1：已有项目；2：新增项目
{
	response.sendRedirect("EditOldJc_zcddmx.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
}
else
{
	if (sxbz.equals("1"))//1：非手写；2：手写
	{
		if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
		{
			if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
			{
				response.sendRedirect("EditNewJc_zcddmxDjBl.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
			}
			else{
				response.sendRedirect("EditNewJc_zcddmxDj.jsp?ddbh="+ddbh+"&zjxbh="+zjxbh+"&xh="+xh);
			}
		}
		else if (djlrfs.equals("2"))
		{
			if (kgcxhdbl.equals("Y"))//Y：可改；N：不可改
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
		if (djlrfs.equals("1"))//1：录入单价算折扣；2：录入折扣算单价；3：不可打折
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
