<%@ page contentType="text/html;charset=gb2312" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%
String khbh=request.getParameter("khbh");
String zjxxh=request.getParameter("zjxxh");
String dqbm=request.getParameter("dqbm");
String jzbz=request.getParameter("jzbz");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="main">
  <table width="100%" border="0" style="FONT-SIZE:12">
    <tr> 
      <td colspan="2"> 
        <input type="button"  value="��Ŀ������" onClick="f_lr1(editform)" name="xmlr" >
        <input type="button"  value="���乤����" onClick="f_lr2(editform)" name="fjlr" >
        <input type="button"  value="�Զ�����" onClick="f_lr4(editform)" name="cp">
        <input type="button"  value="�ۺ�¼��" onClick="f_lr3(editform)" name="zhlr">
        <input type="button"  value="ɾ��δ����" onClick="f_scxm(editform)" >
	    ���� 
        <input type="text" name="xmmc" size="14" maxlength="200" >
        ����
        <select name="smbm" style="FONT-SIZE:12PX;WIDTH:80PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm","");
%>
        </select>

        <input type="button" value="����" onClick="f_gl(editform)">
        <input type="button"  value="Execel����" onClick="f_lr5(editform)" name="cp" disabled>
      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_gl(FormName)//����FormName:Form������
{
	if(FormName.xmmc.value=="" && FormName.smbm.value=="") {
		alert("������[��������]��");
		FormName.xmmc.focus();
		return false;
	}


	FormName.target="main";
	FormName.action="Bj_jzbjbXmbhCxList.jsp?jzbz=<%=jzbz%>&dqbm=<%=dqbm%>&khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	return true;
}
function f_lr1(FormName)//����FormName:Form������
{
	FormName.target="main";
	FormName.action="Bj_khbjmxList1.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	FormName.xmlr.disabled=true;
	return true;
}
function f_lr2(FormName)//����FormName:Form������
{
	FormName.target="main";
	FormName.action="Bj_khbjmxList2.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	FormName.fjlr.disabled=true;
	return true;
}
function f_lr3(FormName)//����FormName:Form������
{
	FormName.target="main";
	FormName.action="Bj_khbjmxList3.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	FormName.zhlr.disabled=true;
	return true;
}
function f_lr4(FormName)//����FormName:Form������
{
	FormName.target="main";
	FormName.action="/dzbjone/bjbz/InsertBj_zdyxmb1.jsp?dqbm=<%=dqbm%>&khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	return true;
}
function f_lr5(FormName)//����FormName:Form������
{
	FormName.target="main";
	FormName.action="EnetrExcelCopy.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	return true;
}
function f_scxm(FormName)//����FormName:Form������
{
	if ( confirm("ϵͳ��ɾ��δ¼����������Ŀ��ɾ���󲻿ɻָ���ȷʵҪɾ����") )	
	{
		FormName.target="_blank";
		FormName.action="deleteWyXm.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
		FormName.submit();
		return true;
	}
}
//-->
</SCRIPT>
