<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getcheck.jsp" %>

<html>
<head>
<title>���Ʊ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE2 {color: #FF0000}
-->
</style>
</head>
<%
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
%>


<body bgcolor="#FFFFFF">
<CENTER><B>���Ʊ���</B>
<form method="post" action="" name="loadform"  target="_blank" >
    <table width="100%" border="0">
     
      <tr align="center">
        <td height="33" align="right"><span class="STYLE2">*</span>�����Ƶ���</td>
        <td height="33" align="left">
		<select name="dqbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
		   <option value=""></option>
          <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%>
        </select></td>
      </tr>
      <tr align="center"> 
        <td height="34" align="right" width="48%"><span class="STYLE2">*</span>���Ƶ���</td>
        <td height="34" align="left" width="52%"> 
          <select name="dqbm2" size="12" multiple style="FONT-SIZE:12PX;WIDTH:152PX">
           <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm","");
%> 
          </select>        </td>
      </tr>
      
      <tr> 
        <td height="23" colspan="2" align="center" bgcolor="#999999"> 
            <input type="button"  value="����" onClick="f_do(loadform)">
        </td>
      </tr>
    </table>
</form>
</CENTER>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)
{
	if(	javaTrim(FormName.dqbm1)=="") {
		alert("��ѡ��[�����Ƶ���]��");
		FormName.dqbm1.focus();
		return false;
	}
	if(	!selectChecked(FormName.dqbm2)) {
		alert("������[���Ƶ���]��");
		FormName.dqbm2.focus();
		return false;
	}
	if (!confirm("ȷʵҪ������") )	
	{
		return;
	}

	FormName.action="copyBj.jsp";
	FormName.submit();
	return true;
} 

//-->
</script>