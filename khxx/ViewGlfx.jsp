<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
	String khbh=request.getParameter("khbh");
	String zjxxh=cf.executeQuery("select zjxxh from crm_khxx where khbh='"+khbh+"'");
	String jzbz=cf.executeQuery("select jzbz from crm_khxx where khbh='"+khbh+"'");
	if (jzbz==null)
	{
		jzbz="1";
	}
	if (zjxxh==null)
	{
		if (jzbz.equals("1"))//1����װ��2����װ
		{
			response.sendRedirect("/dzbj/zxbjmx/Bj_khbjmxGlfxList.jsp?khbh="+khbh);
		}
		else{
			response.sendRedirect("/dzbj/zxbjmx/Bj_khbjmxGlfxList.jsp?khbh="+khbh);
		}
	}
	else{
		if (jzbz.equals("1"))//1����װ��2����װ
		{
			response.sendRedirect("/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxGlfxList.jsp?khbh="+khbh+"&zjxxh="+zjxxh);
		}
		else{
			response.sendRedirect("/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxGlfxList.jsp?khbh="+khbh+"&zjxxh="+zjxxh);
		}
	}
%>