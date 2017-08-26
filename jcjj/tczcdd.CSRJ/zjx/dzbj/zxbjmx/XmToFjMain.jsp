<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>电子报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%
	String khbh=request.getParameter("khbh");
	String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));

	String dqbm=cf.executeQuery("select sq_dwxx.dqbm from crm_zxkhxx,sq_dwxx where crm_zxkhxx.zxdm=sq_dwxx.dwbh and crm_zxkhxx.khbh='"+khbh+"'");
	String jzbz=cf.executeQuery("select jzbz from crm_zxkhxx where khbh='"+khbh+"'");

%>



<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

  <table width="100%" border="0" height="540">
    <tr>
      <td width="28%" valign="top">
		<iframe width="100%" height="100%" src="menuFj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&dqbm=<%=dqbm%>&jzbz=<%=jzbz%>" name="menu" marginwidth="0" marginheight="0" scrolling="YES" FrameBorder="0"> 
		</iframe> 
      </td>
      <td width="72%" valign="top">
		<iframe width="100%" height="100%" src="noteFj.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&dqbm=<%=dqbm%>&jzbz=<%=jzbz%>" name="main" marginwidth="0" marginheight="0" scrolling="NO" FrameBorder="0"> 
		</iframe> 
	  </td>
    </tr>
  </table>

</body>
</html>
