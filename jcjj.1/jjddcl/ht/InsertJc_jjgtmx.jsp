<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String gtxh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(gtxh,10,2)),0)";
	ls_sql+=" from  jc_jjgtmx";
	ls_sql+=" where ddbh='"+ddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gtxh=ddbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<form method="post" action="" name="insertform" target="_blank">
  <div align="center"></div>  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="4">¼�������Ϣ
	  &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" name="copygt" value="Excel��������" onClick="f_copygt(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#0000FF">�������</font></td>
      <td width="35%"> 
        <input type="text" name="gtxh" value="<%=gtxh%>" size="20" maxlength="11" readonly>
      </td>
      <td align="right" width="15%"><font color="#0000FF">�������</font></td>
      <td width="35%"> 
        <input type="text" name="ddbh" value="<%=ddbh%>" size="20" maxlength="9" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font>��������</td>
      <td width="35%"> 
        <input type="text" name="gtmc" value="" size="20" maxlength="50" >
      </td>
      <td align="right" width="15%"><font color="#FF0000">*</font>��װλ��</td>
      <td width="35%"> 
        <select name="jjazwz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jjazwzmc c1,jjazwzmc c2 from jdm_jjazwzbm order by jjazwzmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���</td>
      <td width="35%"> 
        <input type="text" name="guige" value="" size="20" maxlength="50" >
      </td>
      <td align="right" width="15%">�Ҿ�ϵ��</td>
      <td width="35%">
        <select name="jjlx" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jjlbmc c1,jjlbmc c2 from jdm_jjlbbm order by jjlbmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font>�������</td>
      <td width="35%">
        <select name="bclx" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select distinct bclx c1,bclx c2 from jc_jjbjbj order by bclx","");
%> 
        </select>
      </td>
      <td align="right" width="15%"><font color="#FF0000">*</font>�����ɫ</td>
      <td width="35%">
        <select name="bcys" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select gtbcysmc c1,gtbcysmc c2 from jdm_gtbcysbm order by gtbcysmc","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font><font color="#0000FF">��Ĳ��ֽ��</font></td>
      <td width="35%"> 
        <input type="text" name="bcbfje" value="0" size="20" maxlength="17" onChange="f_wdzje(insertform)" readonly>
      </td>
      <td align="right" width="15%"><font color="#FF0000">*</font><font color="#0000FF">������ֽ��</font></td>
      <td width="35%"> 
        <input type="text" name="pjbfje" value="0" size="20" maxlength="17" onChange="f_wdzje(insertform)" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#FF0000">*</font><font color="#0000FF">�ܼ�</font></td>
      <td width="35%"> 
        <input type="text" name="zj" value="0" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">
		  &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="lrbj" value="¼����" onClick="f_lrbj(insertform)" disabled>
          <input type="button" name="copybj" value="Excel�������" onClick="f_copybj(insertform)" disabled>
		  &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" name="lrpj" value="¼�����" onClick="f_lrpj(insertform)" disabled>
          <input type="button" name="copypj" value="Excel�������" onClick="f_copypj(insertform)" disabled>
        <input type="button" name="ckpj" value="�鿴���" onClick="f_ckpj(insertform)" disabled>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_wdzje(FormName)//����FormName:Form������
{
	var je=0;
	je=FormName.bcbfje.value*1.0+FormName.pjbfje.value*1.0;
	je=round(je,2);
	FormName.zj.value=je;
}
function f_copygt(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="EnetrExcelCopyGt.jsp";
	FormName.submit();
	return true;
}
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gtmc)=="") {
		alert("������[��������]��");
		FormName.gtmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jjazwz)=="") {
		alert("������[��װλ��]��");
		FormName.jjazwz.focus();
		return false;
	}
	if(	javaTrim(FormName.bclx)=="") {
		alert("������[�������]��");
		FormName.bclx.focus();
		return false;
	}
	if(	javaTrim(FormName.bcys)=="") {
		alert("������[�����ɫ]��");
		FormName.bcys.focus();
		return false;
	}
	if(	javaTrim(FormName.bcbfje)=="") {
		alert("������[��Ĳ��ֽ��]��");
		FormName.bcbfje.focus();
		return false;
	}
	if(!(isFloat(FormName.bcbfje, "��Ĳ��ֽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.pjbfje)=="") {
		alert("������[������ֽ��]��");
		FormName.pjbfje.focus();
		return false;
	}
	if(!(isFloat(FormName.pjbfje, "������ֽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zj)=="") {
		alert("������[�ܼ�]��");
		FormName.zj.focus();
		return false;
	}
	if(!(isFloat(FormName.zj, "�ܼ�"))) {
		return false;
	}

	FormName.action="SaveInsertJc_jjgtmx.jsp";
	FormName.submit();
	FormName.lrbj.disabled=false;
	FormName.copybj.disabled=false;
	FormName.lrpj.disabled=false;
	FormName.copypj.disabled=false;
	FormName.ckpj.disabled=false;
	return true;
}
function f_lrbj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="InsertJc_gtbjmxMain.jsp";
	FormName.submit();
	return true;
}
function f_copybj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="EnetrExcelCopyBj.jsp";
	FormName.submit();
	return true;
}
function f_ckbj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="Jc_gtbjmxList.jsp";
	FormName.submit();
	return true;
}
function f_lrpj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="InsertJc_gtpjmxMain.jsp";
	FormName.submit();
	return true;
}
function f_copypj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="EnetrExcelCopyPj.jsp";
	FormName.submit();
	return true;
}
function f_ckpj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gtxh)=="") {
		alert("������[�������]��");
		FormName.gtxh.focus();
		return false;
	}

	FormName.action="Jc_gtpjmxList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
