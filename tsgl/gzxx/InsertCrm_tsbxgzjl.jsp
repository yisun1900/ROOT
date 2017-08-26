<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String khbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String gzjlh=null;
try {
	conn=cf.getConnection();

	ls_sql="select khbh";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(gzjlh,11,2)),0)";
	ls_sql+=" from  crm_tsbxgzjl";
	ls_sql+=" where tsjlh='"+tsjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	gzjlh=tsjlh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCrm_tsbxgzjl.jsp" name="insertform" >
<div align="center">Ͷ�߱��޸��ټ�¼</div>

	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">���ټ�¼��</td>
	<td  width="7%">����</td>
	<td  width="58%">�������</td>
	<td  width="9%">¼��ʱ��</td>
	<td  width="6%">¼����</td>
	<td  width="11%">¼�벿��</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT crm_tsbxgzjl.gzjlh, DECODE(crm_tsbxgzjl.lx,'1','����רԱ','2','�ͷ�'),crm_tsbxgzjl.qksm,crm_tsbxgzjl.lrsj,crm_tsbxgzjl.lrr,dwmc  ";
	ls_sql+=" FROM crm_tsbxgzjl,crm_tsjl,crm_khxx,sq_dwxx  ";
    ls_sql+=" where crm_tsbxgzjl.tsjlh=crm_tsjl.tsjlh and crm_tsbxgzjl.khbh=crm_khxx.khbh and crm_tsbxgzjl.lrbm=sq_dwxx.dwbh";
    ls_sql+=" and crm_tsbxgzjl.tsjlh='"+tsjlh+"'";
    ls_sql+=" order by crm_tsbxgzjl.gzjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span><span class="STYLE2">���ټ�¼��</span></td> 
  <td width="33%"> 
    <input type="text" name="gzjlh" value="<%=gzjlh%>" size="20" maxlength="12" readonly>  </td>
  <td align="right" width="17%"><span class="STYLE1">*</span>����</td> 
  <td width="33%"><input type="radio" name="lx"  value="1">
����רԱ
  <input type="radio" name="lx"  value="2">
�ͷ� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="17%"><span class="STYLE1">*</span><span class="STYLE2">Ͷ�߱��޼�¼��</span></td> 
  <td width="33%"><input type="text" name="tsjlh" value="<%=tsjlh%>" size="20" maxlength="10" readonly></td>
  <td align="right" width="17%"><span class="STYLE2"><span class="STYLE1">*</span>�ͻ����</span></td> 
  <td width="33%"><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���˵��</td>
  <td colspan="3"><textarea name="qksm" cols="71" rows="6"></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.gzjlh)=="") {
		alert("������[���ټ�¼��]��");
		FormName.gzjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("������[Ͷ�߱��޼�¼��]��");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.qksm)=="") {
		alert("������[���˵��]��");
		FormName.qksm.focus();
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
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
