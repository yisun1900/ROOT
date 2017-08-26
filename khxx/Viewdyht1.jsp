<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
	String khbh=request.getParameter("khbh");
	String jzbz=cf.executeQuery("select jzbz from crm_khxx where khbh='"+khbh+"'");
	String bjjb=cf.executeQuery("select bjjb from crm_khxx where khbh='"+khbh+"'");
	
	if (jzbz==null)
	{
		jzbz="1";
	}
   
     if(bjjb.equals("B")||bjjb.equals("D")||bjjb.equals("E")||bjjb.equals("F")||bjjb.equals("G")||bjjb.equals("H"))
	{
		if (jzbz.equals("1"))//1：家装；2：公装
		{
			response.sendRedirect("/dyht/dyht11.jsp?khbh="+khbh);
		}
		else{
			response.sendRedirect("/dyht/dyht11.jsp?khbh="+khbh);
		}
	}
	else
	{
		if (jzbz.equals("1"))//1：家装；2：公装
		{
			response.sendRedirect("/dyht/dyht1.jsp?khbh="+khbh);
		}
		else{
			response.sendRedirect("/dyht/dyht1.jsp?khbh="+khbh);
		}
	}
	
%>