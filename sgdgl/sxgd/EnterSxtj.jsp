<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhdlm=(String)session.getAttribute("yhdlm");

String fgs=request.getParameter("fgs");
String dqbm=cf.executeQuery("select dqbm from sq_dwxx where dwbh='"+fgs+"'");
String sxjlh=request.getParameter("sxjlh");
String sx=cf.GB2Uni(request.getParameter("sx"));
if (sx.equals("new"))
{
	sxjlh=String.valueOf(Integer.parseInt(sxjlh)+1);
}

%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���ɸѡ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertKp_sxgdjl.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="50%" align="right" height="52">ɸѡ��¼��</td>
              <td width="50%" height="52"> 
                <input type="text" name="sxjlh" size="20" maxlength="20" value="<%=sxjlh%>" readonly>
                <input type="hidden" name="yhdlm" value="<%=yhdlm%>" readonly>
                <input type="hidden" name="fgs" value="<%=fgs%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="50%" align="right" height="45">�Ƿ��鹤�̽���</td>
              <td width="50%" height="45"> 
                <input type="radio" name="gcjd" value="Y" checked>
                ��鹤�̽��� 
                <input type="radio" name="gcjd" value="N">
                ����� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="50%" align="right" height="51">ɸѡ����</td>
              <td width="50%" height="51"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="50%" align="right" height="45">��ѡ�񹤵�����</td>
              <td width="50%" height="45"> 
                <input type="text" name="sl" size="20" maxlength="20">
              </td>
            </tr>
            <tr> 
              <td colspan="2" align="center"> 
                <input type="button"  value="ɸѡ����" onClick="f_do(insertform)">
                <input type="button"  value="�鿴ɸѡ���" onClick="window.open('ViewKp_sxgdjl.jsp?sxjlh=<%=sxjlh%>')" >
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sl)=="") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "��������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
