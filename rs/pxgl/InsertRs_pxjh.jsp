<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.util.*'%>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%
String yhmc=(String)session.getAttribute("yhmc");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String pxjhbh=null;
int count=0;
try {
	conn=cf.getConnection();

	ls_sql="select NVL(max(substr(pxjhbh,6,3)),0)";
	ls_sql+=" from  rs_pxjh";
	ls_sql+=" where ssfgs='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
//	out.print(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1)+1;
//		out.print(count);
	}
	rs.close();
	ps.close();

	pxjhbh=ssfgs+cf.addZero(count,3);
}
catch (Exception e) {
	out.print("��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>
<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center"><b>��ѵ�ƻ�����ѵ�ƻ���ţ�<%=pxjhbh%>��</b></div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>��ѵ�ƻ�����</td> 
  <td width="35%"> 
    <input type="text" name="pxjhmc" value="" size="24" maxlength="50" >
  </td>
  <td align="right" width="15%"><font color=red>*</font>�ƻ����빫˾</td> 
  <td width="35%"> 
     <select name="fgs" style="FONT-SIZE:12PX;WIDTH:180PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0','A0') order by dwbh","");
	}
	else{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
	}
%> 
      </select>
  </td>
</tr>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color=red>*</font>�ȴ�����</td> 
  <td width="35%"> 
    <select name="ztbm" style="FONT-SIZE:12PX;WIDTH:180PX">
		<option value=""></option>
		                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{%> 
		<option value="0210">�ƻ��ڣ��ȴ��ֹ�˾�ܾ�������</option>
		<option value="0220">�ƻ��⣺�ȴ��ֹ�˾�ܾ������</option>
	<%}
	else{%> 
		<option value="0210">�ƻ��ڣ��ȴ��ֹ�˾�ܾ�������</option>
		<option value="0220">�ƻ��⣺�ȴ��ֹ�˾�ܾ������</option>
	<%}%>
    </select>
  </td>
  	<td align="right" width="15%"><font color=red>*</font>�Ƿ�ƻ���</td> 
	<td width="31%"> 
	<input type="radio" name="sfjhn"  value="0" >
	�ƻ��� 
	<input type="radio" name="sfjhn"  value="1" >
	�ƻ��� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><font color="#0000FF">¼����</font></td> 
  <td width="35%"> 
    <input type="text" name="lrr" value="<%=yhmc%>" size="24" maxlength="20" readonly>
  </td>
  <td align="right" width="15%"><font color="#0000FF">¼��ʱ��</font></td> 
  <td width="35%"> 
    <input type="text" name="lrsj" value="<%=cf.today()%>" size="24" maxlength="10" readonly>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%" >��ע</td> 
  <td width="35%" colspan="3"> 
     <textarea name="bz" cols="71" rows="2" onKeyUp="keyTo(savebutton)"></textarea>
  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
    <input name="pxjhbh" type="hidden" value="<%=pxjhbh%>">
    <input name="ssfgs" type="hidden" value="<%=ssfgs%>">
	<input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
	<input type="reset"  value="����" name="reset">
	<input type="button"  value="¼����ϸ" onClick="f_domx(insertform)" name="lrmxbutton" disabled>
	<input type="button"  value="¼�����" onClick="f_wc(insertform)" name="wcbutton" disabled>
      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{

	if(	javaTrim(FormName.pxjhmc)=="") {
		alert("������[��ѵ����]��");
		FormName.pxjhmc.focus();
		return false;
	}

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ztbm)=="") {
		alert("��ѡ��[�ȴ�����]��");
		FormName.ztbm.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfjhn)) {
		alert("��ѡ��[�Ƿ�ƻ���]��");
		FormName.sfjhn[0].focus();
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
	FormName.action="SaveInsertRs_pxjh.jsp";
	FormName.submit();
	FormName.savebutton.disabled=true;
	FormName.reset.disabled=true;
	FormName.lrmxbutton.disabled=false;
	//FormName.wcbutton.disabled=true;
	return true;
}
function f_domx(FormName)//����FormName:Form������
{
	FormName.action="InsertRs_pxjhmx.jsp";
	FormName.submit();
	FormName.wcbutton.disabled=false;
	return true;
}
function f_wc(FormName)//����FormName:Form������
{
	FormName.action="InsertRs_pxjhwc.jsp";
	FormName.submit();
	FormName.lrmxbutton.disabled=true;
	FormName.wcbutton.disabled=true;
	return true;
}
//-->
</SCRIPT>
