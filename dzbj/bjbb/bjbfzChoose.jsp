<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE4 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<%
String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String oldbjbbh=cf.GB2Uni(request.getParameter("oldbjbbh"));
String newbjbbh=cf.GB2Uni(request.getParameter("newbjbbh"));
String gcbj=request.getParameter("gcbj");
String tcjg=request.getParameter("tcjg");
String tcsj=request.getParameter("tcsj");
String tcbzgc=request.getParameter("tcbzgc");
String tcbzzc=request.getParameter("tcbzzc");
String tczcbj=request.getParameter("tczcbj");

String count=cf.executeQuery("select count(*) from bj_jzbjb where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+oldbjbbh+"'");
%>


<body bgcolor="#FFFFFF">
<CENTER>
  <B>���ӱ��ۣ��汾����</B><BR>
  <HR>
<form method="post" action="" name="insertform" >
    <table width="100%" border="0">
      
      <tr align="center">
        <td height="33" align="right">�ü��𱨼���Ŀ�Ѵ��ڡ�<%=count%>������</td>
        <td height="33" align="left"><input name="button" type="button" onClick="f_delete(loadform)"  value="ɾ��������Ŀ"></td>
      </tr>
      <tr align="center">
        <td height="34" align="right"><span class="STYLE1">*</span>������</td>
        <td height="34" align="left"><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'","");
%>
          </select>        </td>
      </tr>
      <tr align="center"> 
        <td width="36%" height="33" align="right"><span class="STYLE1">*</span>�����ư汾��</td>
        <td width="64%" height="33" align="left"><input type="text" name="oldbjbbh" value="<%=oldbjbbh%>" size="40" maxlength="50" readonly>		</td>
      </tr>
      <tr align="center">
        <td height="33" align="right"><span class="STYLE1">*</span>���ư汾��</td>
        <td height="33" align="left"><input type="text" name="newbjbbh" value="<%=newbjbbh%>" size="40" maxlength="50" readonly>        </td>
      </tr>
      <tr align="center">
        <td height="157" align="right"><span class="STYLE1">*</span>��������</td>
        <td height="157" align="left">
			���̱���
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%if(gcbj!=null) out.println("<span class=\"STYLE4\">ѡ����</span>"); else out.println("<span class=\"STYLE2\">������</span>");%>
			<BR>
			�ײͣ��۸��
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%if(tcjg!=null) out.println("<span class=\"STYLE4\">ѡ����</span>"); else out.println("<span class=\"STYLE2\">������</span>");%>
			<BR>
			�ײͣ�������۱�
			&nbsp;
			<%if(tcsj!=null) out.println("<span class=\"STYLE4\">ѡ����</span>"); else out.println("<span class=\"STYLE2\">������</span>");%>
			<BR>
			�ײͣ���׼������Ŀ
			<%if(tcbzgc!=null) out.println("<span class=\"STYLE4\">ѡ����</span>"); else out.println("<span class=\"STYLE2\">������</span>");%>
			<BR>
			�ײͣ���׼������Ŀ
			<%if(tcbzzc!=null) out.println("<span class=\"STYLE4\">ѡ����</span>"); else out.println("<span class=\"STYLE2\">������</span>");%>
			<BR>
			�ײͣ����ı���	    
			&nbsp;&nbsp;&nbsp;
			<%if(tczcbj!=null) out.println("<span class=\"STYLE4\">ѡ����</span>"); else out.println("<span class=\"STYLE2\">������</span>");%>		</td>
		
		</td>
      </tr>
      
      <tr> 
        <td colspan="2" align="center"> 
          <p>&nbsp;</p>
          <p> 
            <input type="button"  value="��ʼ����" onClick="f_onclick(insertform)">
            <input type="hidden" name="gcbj" value="<%=gcbj%>"  >
            <input type="hidden" name="tcjg" value="<%=tcjg%>"  >
            <input type="hidden" name="tcsj" value="<%=tcsj%>"  >
            <input type="hidden" name="tcbzgc" value="<%=tcbzgc%>"  >
            <input type="hidden" name="tcbzzc" value="<%=tcbzzc%>"  >
            <input type="hidden" name="tczcbj" value="<%=tczcbj%>"  >
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
function f_delete(FormName)
{
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("��ѡ��[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	if (!confirm("ע�⣺ɾ���󲻿ɻָ���ȷʵҪ������") )	
	{
		return;
	}

	FormName.target="_blank";
	FormName.action="deleteBjxm.jsp";
	FormName.submit();
	return true;
} 

function f_onclick(FormName)
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.oldbjbbh)=="") {
		alert("��ѡ��[�����ư汾��]��");
		FormName.oldbjbbh.focus();
		return false;
	}
	if(	javaTrim(FormName.newbjbbh)=="") {
		alert("��ѡ��[���ư汾��]��");
		FormName.newbjbbh.focus();
		return false;
	}

	if (FormName.oldbjbbh.value==FormName.newbjbbh.value)
	{
		alert("����[�����ư汾��]������[���ư汾��]��ͬ");
		FormName.newbjbbh.focus();
		return false;
	}

	FormName.target="";
	FormName.action="SaveBjbfz.jsp";
	FormName.submit();
	return true;
} 
//-->
</script>