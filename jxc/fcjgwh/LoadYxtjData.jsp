<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String dqbm=request.getParameter("dqbm");//��������
String count=cf.executeQuery("select count(*) from jxc_clbm,jxc_cljgb where jxc_clbm.clbm=jxc_cljgb.clbm and jxc_clbm.cllb='1' and jxc_cljgb.dqbm='"+dqbm+"'");
%>


<body bgcolor="#FFFFFF">
<CENTER><B>Ԥ�ȵ����۸�</B><BR><HR>
<form method="post" action="" name="loadform" enctype="multipart/form-data" >
    <table width="100%" border="0">
      <tr align="center"> 
        <td colspan="2" height="52"><b>��ѡ������EXECEL�ļ�</b></td>
      </tr>
      <tr align="center">
        <td width="48%" height="33" align="right">�Ѵ��ڸ��ġ�<%=count%>������</td>
        <td width="52%" height="33" align="left">&nbsp;</td>
      </tr>
      <tr align="center"> 
        <td colspan="2" height="2"> 
          <input type="file" name="loadName" value="" size="60">        </td>
      </tr>
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
		<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
            <input type="button"  value="����" onClick="f_onclick(loadform)">
          </p>        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_onclick(FormName)
{
	FormName.target="";
	FormName.action="DisYxtjData.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>