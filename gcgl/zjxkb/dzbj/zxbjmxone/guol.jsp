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
String zjxxh=request.getParameter("zjxxh");
String khbh=request.getParameter("khbh");
String dqbm=request.getParameter("dqbm");
String jzbz=request.getParameter("jzbz");
%>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="main">
  <table width="100%" border="0" style="FONT-SIZE:12">
    <tr> 
      <td colspan="2"><input type="button"  value="���乤����" onClick="f_lr2(editform)" name="fjlr" >
        <input type="button"  value="��Ŀ������" onClick="f_lr1(editform)" name="xmlr" >
        <input name="button" type="button" onClick="f_lrfj(editform)"  value="���ӷ���" >
        <input name="button2" type="button" onClick="f_xgfj(editform)"  value="�޸ķ���">
        <input name="button3" type="button" onClick="f_fjxmpx(editform)"  value="����Ŀ˳��" >
        <input type="button"  value="ɾ��δ����" onClick="f_scxm(editform)" >
	    ���� 
        <input type="text" name="xmmc" size="14" maxlength="200" >

        <input type="button" value="����" onClick="f_gl(editform)">      </td>
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

	if(FormName.xmmc.value=="" ) {
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


function f_lrfj(FormName)//����FormName:Form������
{
	FormName.action="ChooseBj_fjxx.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//����FormName:Form������
{
	FormName.action="EditBj_fjxx.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>";
	FormName.submit();
	return true;
}


function f_fjxmpx(FormName)//����FormName:Form������
{
	winOpen("TzFjXhBjxmList.jsp?khbh=<%=khbh%>&zjxxh=<%=zjxxh%>",900,600,'YES',"NO");
}







//-->
</SCRIPT>
