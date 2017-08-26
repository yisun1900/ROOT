<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sgbz=null;
String sjs=null;
String sgdmc=null;
String zjxm=null;
String mbbm=null;

String rwmc=null;
String rwdx=null;
String yjhkssj=null;
String yjhjssj=null;
String yjhgzr=null;
String zxjhkssj=null;
String zxjhjssj=null;
String zxjhgzr=null;
String rwsfwc=null;
String rwsfwcmc=null;
String sjkssj=null;
String sjjssj=null;
String sjgzr=null;

String khbh=request.getParameter("khbh");
String rwbm=request.getParameter("rwbm");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sgdmc,sjs,zjxm,sgbz,mbbm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		mbbm=cf.fillNull(rs.getString("mbbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select rwmc,DECODE(rwdx,'1','�ͻ�','2','ʩ����','3','��Ӧ��','4','���ʦ','5','�ʼ�') rwdx ";
	ls_sql+=" ,yjhkssj,yjhjssj,yjhgzr,zxjhkssj,zxjhjssj,zxjhgzr,rwsfwc,DECODE(rwsfwc,'Y','���','N','��') rwsfwcmc";
	ls_sql+=" ,sjkssj,sjjssj,sjgzr";
	ls_sql+=" from  crm_khsgjhb,jdm_zcddzt a,jdm_zcddzt b,dm_gcysxm";
	ls_sql+=" where  crm_khsgjhb.clzt=a.clzt(+)";
	ls_sql+=" and  crm_khsgjhb.sjzcjd=b.clzt(+)";
	ls_sql+=" and  crm_khsgjhb.gcysxmbm=dm_gcysxm.gcysxmbm(+)";
	ls_sql+=" and khbh='"+khbh+"'";
	ls_sql+=" and rwbm='"+rwbm+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwdx=cf.fillNull(rs.getString("rwdx"));

		yjhkssj=cf.fillNull(rs.getDate("yjhkssj"));
		yjhjssj=cf.fillNull(rs.getDate("yjhjssj"));
		yjhgzr=cf.fillNull(rs.getString("yjhgzr"));
		zxjhkssj=cf.fillNull(rs.getDate("zxjhkssj"));
		zxjhjssj=cf.fillNull(rs.getDate("zxjhjssj"));
		zxjhgzr=cf.fillNull(rs.getString("zxjhgzr"));
		rwsfwc=cf.fillNull(rs.getString("rwsfwc"));
		rwsfwcmc=cf.fillNull(rs.getString("rwsfwcmc"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjgzr=cf.fillNull(rs.getString("sjgzr"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>����:" + e);
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

<html>
<head>
<title>ʵ�ʸ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSjCrm_khsgjhb.jsp" name="editform" >
<div align="center">ʵ�ʸ���</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#000099">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#000099">ʵ��������</font> </td>
    <td width="32%"><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">�ͻ�����</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#000099">��ϵ��ʽ</font></td>
    <td><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="�鿴�绰" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">���ʦ</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#000099">ʩ����</font></td>
    <td><%=sgdmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">�ʼ�����</font></td>
    <td><%=zjxm%></td>
    <td align="right"><font color="#000099">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�������</td>
    <td><%=rwbm%></td>
    <td align="right">��������</td>
    <td><%=rwmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ԭ�ƻ���ʼʱ��</td>
    <td><%=yjhkssj%></td>
    <td align="right">ԭ�ƻ�����ʱ��</td>
    <td><%=yjhjssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">ԭ�ƻ�������</td>
    <td><%=yjhgzr%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ƻ���ʼʱ��</td>
    <td><%=zxjhkssj%></td>
    <td align="right">�ƻ�����ʱ��</td>
    <td><%=zxjhjssj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ƻ�������</td>
    <td><%=zxjhgzr%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#CC0000">*</font>ʵ�ʿ�ʼʱ��</td>
    <td><input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" onDblClick="JSCalendar(this)"></td>
    <td align="right"><font color="#CC0000">*</font>ʵ�ʽ���ʱ��</td>
    <td><input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#CC0000">*</font>ʵ�ʹ�����</td>
    <td><input type="text" name="sjgzr" size="20" maxlength="10"  value="<%=sjgzr%>" ></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="khbh"  value="<%=khbh%>" >
	<input type="hidden" name="rwbm"  value="<%=rwbm%>" >
	<input type="button"  value="����" onClick="f_do(editform)">
	<input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>

</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sjkssj)=="") {
		alert("������[ʵ�ʿ�ʼʱ��]��");
		FormName.sjkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjkssj, "ʵ�ʿ�ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjssj)=="") {
		alert("������[ʵ�ʽ���ʱ��]��");
		FormName.sjjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjssj, "ʵ�ʽ���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjgzr)=="") {
		alert("������[ʵ�ʹ�����]��");
		FormName.sjgzr.focus();
		return false;
	}
	if(!(isNumber(FormName.sjgzr, "ʵ�ʹ�����"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
