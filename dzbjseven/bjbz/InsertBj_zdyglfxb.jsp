<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String lrr=cf.GB2Uni(request.getParameter("lrr"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String yhdlm=(String)session.getAttribute("yhdlm");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String xmmc=null;

try {
	conn=cf.getConnection();

	ls_sql="SELECT xmmc";
	ls_sql+=" FROM bj_zdyxmb";
	ls_sql+=" where bj_zdyxmb.lrr='"+lrr+"' and bj_zdyxmb.xmbh='"+xmbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=rs.getString("xmmc");
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_zdyglfxb.jsp" name="insertform" target="_blank">
<div align="center">¼�룭�Զ�����Ŀ���Ϸ�����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">��Ŀ¼����</span></td> 
  <td width="32%"><input type="text" name="xmlrr" value="<%=lrr%>" size="20" maxlength="20" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>���Ϸ���</td> 
  <td width="32%"><%
	cf.radioItem(out,"select glflbm,glflmc from bdm_glflbm order by glflbm","glflbm","");
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">��Ŀ���</span></td> 
  <td width="32%"> 
    <input type="text" name="xmbh" value="<%=xmbh%>" size="20" maxlength="16" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE2">��Ŀ����</span></td> 
  <td width="32%"><%=xmmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���Ϸ�������</td>
  <td colspan="3">
	<input type="text" name="glfxclmc" value="" size="72" maxlength="100" onKeyUp="changheIn(insertform)">
	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������λ</td> 
  <td width="32%">
    <select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
	</select>  
  
  <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"><input type="text" name="dj" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������</td> 
  <td width="32%"><input type="text" name="xhl" value="" size="20" maxlength="17" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��ȩ�ͷ���</td> 
  <td width="32%"><input type="text" name="jqsfl" value="0" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���ͷ���</td> 
  <td width="32%"><input type="text" name="bsfl" value="0" size="20" maxlength="17" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>TVOC�ͷ���</td> 
  <td width="32%"><input type="text" name="tvocsfl" value="0" size="20" maxlength="17" ></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����</td> 
  <td width="32%"> 
    <input type="radio" name="lx"  value="1">��ӡ
    <input type="radio" name="lx"  value="2">����ӡ  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ���Ҫ��������</td> 
  <td width="32%"> 
    <input type="radio" name="wlllbz"  value="Y">��Ҫ
    <input type="radio" name="wlllbz"  value="N">��  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td> 
  <td width="32%"> 
    <input type="text" name="lrr" value="<%=yhdlm%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td> 
  <td width="32%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	  <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
	<input type="button"  value="����" onClick="f_do(insertform)"></td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	cf.ajax(out);//����AJAX
%>

//�����������ⵥ��ʱ����������ʧ
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}

//�ı�����ֵ
function changheIn(FormName)
{   

	if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//�ϼ�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.glfxclmc.value;

		FormName.glfxclmc.value=FormName.valuelist.options[FormName.valuelist.length-1].text;
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.glfxclmc.value;

		FormName.glfxclmc.value=FormName.valuelist.options[0].text;
	}
	else{//������
		if(FormName.glfxclmc.value=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

		//��ȡ�б�
		var actionStr="GetListByAjax.jsp?dqbm=<%=dqbm%>&invalue="+FormName.glfxclmc.value;

//		window.open(actionStr);
		openAjax(actionStr);  
	}

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
	//ȥ��ǰ��Ļ��з�
	while (true)
	{
		if (ajaxRetStr.substring(0,1)=="\r")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else if (ajaxRetStr.substring(0,1)=="\n")
		{
			ajaxRetStr=ajaxRetStr.substring(1);
		}
		else{
			break;
		}
	}

	//����������
	insertform.valuelist.length=0;

	if (ajaxRetStr!="")
	{
		insertform.valuelist.style.display='block';
		strToItem3(insertform.valuelist,ajaxRetStr);
	}
	else{
		insertform.valuelist.style.display='none';
	}

}

//�ı���������Ŀ
function changeItem(FormName,field)
{
	if(event.keyCode==38)//�ϼ�ͷ
	{
		if (mark=="last")
		{
			mark="";
		}

		FormName.glfxclmc.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext;

				FormName.glfxclmc.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//�¼�ͷ
	{
		if (mark=="first")
		{
			mark="";
		}

		FormName.glfxclmc.value=field.options[field.selectedIndex].text;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext
				FormName.glfxclmc.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//�س�
	{
		insertform.valuelist.style.display='none';
		FormName.glfxclmc.focus();
	}
}

//˫����������Ŀ
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	FormName.glfxclmc.value=field.options[field.selectedIndex].text;
	FormName.glfxclmc.focus();
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.xmlrr)=="") {
		alert("������[��Ŀ¼����]��");
		FormName.xmlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("������[��Ŀ���]��");
		FormName.xmbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.glflbm)) {
		alert("��ѡ��[���Ϸ���]��");
		FormName.glflbm[0].focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("������[���Ϸ�����������]��");
		FormName.glfxclmc.focus();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.xhl)=="") {
		alert("������[������]��");
		FormName.xhl.focus();
		return false;
	}
	if(!(isFloat(FormName.xhl, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jqsfl)=="") {
		alert("������[��ȩ�ͷ���]��");
		FormName.jqsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.jqsfl, "��ȩ�ͷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bsfl)=="") {
		alert("������[���ͷ���]��");
		FormName.bsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.bsfl, "���ͷ���"))) {
		return false;
	}
	if(	javaTrim(FormName.tvocsfl)=="") {
		alert("������[TVOC�ͷ���]��");
		FormName.tvocsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.tvocsfl, "TVOC�ͷ���"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
