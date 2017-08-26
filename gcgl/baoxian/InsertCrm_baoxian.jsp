<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
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
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String gcjdmc=null;
String dwmc=null;
String zjxm=null;
String sgd=null;
String sgbz=null;
String sfysbx=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,sjkgrq,sjjgrq,sjwjrq,sq_dwxx.dwmc dm,zjxm,sgdmc sgd,sgbz,gcjdmc,sfysbx";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and  crm_khxx.khbh='"+khbh+"' ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		gcjdmc=cf.fillNull(rs.getString("gcjdmc"));
		sfysbx=cf.fillNull(rs.getString("sfysbx"));
	}
	rs.close();
	ps.close();

	if (sfysbx.equals("2"))//1��δ�ϱ��գ�2���ѱ���
	{
		out.println("�������ϱ���");
		return;
	}

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
<form method="post" action="SaveInsertCrm_baoxian.jsp" name="insertform" >
<div align="center">��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF">
    <td align="right">�ͻ����</td>
    <td><%=khbh%> </td>
    <td align="right">��ͬ��</td>
    <td><%=hth%> </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#CCCCFF">�ͻ�����</td>
    <td bgcolor="#CCCCFF"><%=khxm%> </td>
    <td align="right" bgcolor="#CCCCFF">��ϵ��ʽ</td>
    <td bgcolor="#CCCCFF"><%=lxfs%> </td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">���ݵ�ַ</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCFF" align="right">ǩԼ����</td>
    <td bgcolor="#CCCCFF"><%=dwmc%></td>
    <td bgcolor="#CCCCFF" align="right">ǩԼ��</td>
    <td bgcolor="#CCCCFF"><%=qye%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">װ�����ʦ</td>
    <td><%=sjs%></td>
    <td align="right">���̵���</td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">ʩ����</td>
    <td><%=sgd%></td>
    <td align="right">ʩ������</td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">��ͬ��������</td>
    <td><%=kgrq%></td>
    <td align="right">��ͬ��������</td>
    <td><%=jgrq%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">ʵ�ʿ�������</td>
    <td><%=sjkgrq%></td>
    <td align="right">ʵ�ʿ�������</td>
    <td><%=sjjgrq%></td>
  </tr>
  <tr bgcolor="#CCCCFF">
    <td align="right">���̽���</td>
    <td><%=gcjdmc%></td>
    <td align="right">���ʱ��</td>
    <td><%=sjwjrq%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">�ͻ����</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>���ر��ս��</td> 
  <td><input type="text" name="cdbxje" value="" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>��Ա���ս��</td>
  <td><input type="text" name="rybxje" value="" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>���տ�ʼʱ��</td>
  <td><input type="text" name="baokssj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">  </td>
  <td align="right"><span class="STYLE1">*</span>������ֹʱ��</td>
  <td width="32%"><input type="text" name="baozzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
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

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"></textarea>      </td>
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

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cdbxje)=="") {
		alert("������[���ر��ս��]��");
		FormName.cdbxje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdbxje, "���ر��ս��"))) {
		return false;
	}
	if(	javaTrim(FormName.rybxje)=="") {
		alert("������[��Ա���ս��]��");
		FormName.rybxje.focus();
		return false;
	}
	if(!(isFloat(FormName.rybxje, "��Ա���ս��"))) {
		return false;
	}
	if(	javaTrim(FormName.baokssj)=="") {
		alert("������[���տ�ʼʱ��]��");
		FormName.baokssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.baokssj, "���տ�ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.baozzsj)=="") {
		alert("������[������ֹʱ��]��");
		FormName.baozzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.baozzsj, "������ֹʱ��"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>