<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>删除[子品牌]报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<%
	String dqbm=cf.GB2Uni(cf.getParameter(request,"dqbm"));
	String cldlbm=cf.GB2Uni(cf.getParameter(request,"cldlbm"));
	String clxlbm=cf.GB2Uni(cf.getParameter(request,"clxlbm"));
	String ppmc=cf.GB2Uni(cf.getParameter(request,"ppmc"));
%>


<form method="post" action="" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:16">
    <tr align="center"> 
      <td colspan="2" height="94">删除[子品牌]报价</td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <p><b><font color="#FF0000">注意：会删除『<%=ppmc%>』全部报价，确认是否继续？？？</b></font></p>
      </td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td height="2" colspan="2">
        <div align="center">
		<A HREF=# onclick="f_del('DelPpmcBj.jsp?dqbm=<%=dqbm%>&cldlbm=<%=cldlbm%>&clxlbm=<%=clxlbm%>&ppmc=<%=ppmc%>')">删除报价</A>
		</div>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_del(link)//参数FormName:Form的名称
{
	if (!confirm("确实要－删除[<%=ppmc%>]全部报价?") )	
	{
		return;
	}
	else{
		window.open(link);
		window.close();
	}
}

//-->
</SCRIPT>
