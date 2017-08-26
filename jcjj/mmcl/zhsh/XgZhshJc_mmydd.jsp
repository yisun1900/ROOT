<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String jc_mmydd_yddbh=null;
String jc_mmydd_khbh=null;
String jc_mmydd_wjqk=null;
String jc_mmydd_sqdj=null;
String jc_mmydd_yddmmje=null;
String jc_mmydd_yddwjje=null;
String jc_mmydd_yddblje=null;
String jc_mmydd_yddbzje=null;
String jc_mmydd_mmzkl=null;
String jc_mmydd_wjzkl=null;
String jc_mmydd_blzkl=null;
String jc_mmydd_yddze=null;
String jc_mmydd_clgw=null;
String jc_mmydd_zhshr=null;
String jc_mmydd_zhshsj=null;
String jc_mmydd_zhshyj=null;
String jc_mmydd_clzt=null;
String jc_mmydd_lrr=null;
String jc_mmydd_lrsj=null;
String sq_dwxx_dwmc=null;
String jc_mmydd_tzsfqz=null;
String jc_mmydd_sffqk=null;
String jc_mmydd_bz=null;

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dwmc=null;
String sgd=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select jc_mmydd.mmzkl as jc_mmydd_mmzkl,jc_mmydd.wjzkl as jc_mmydd_wjzkl,jc_mmydd.blzkl as jc_mmydd_blzkl,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as jc_mmydd_khbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.yddmmje as jc_mmydd_yddmmje,jc_mmydd.yddwjje as jc_mmydd_yddwjje,jc_mmydd.yddblje as jc_mmydd_yddblje,jc_mmydd.yddbzje as jc_mmydd_yddbzje,jc_mmydd.yddze as jc_mmydd_yddze,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.zhshr as jc_mmydd_zhshr,jc_mmydd.zhshsj as jc_mmydd_zhshsj,jc_mmydd.zhshyj as jc_mmydd_zhshyj,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.tzsfqz as jc_mmydd_tzsfqz,jc_mmydd.sffqk as jc_mmydd_sffqk,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" from  sq_dwxx,jc_mmydd";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jc_mmydd_mmzkl=cf.fillNull(rs.getString("jc_mmydd_mmzkl"));
		jc_mmydd_wjzkl=cf.fillNull(rs.getString("jc_mmydd_wjzkl"));
		jc_mmydd_blzkl=cf.fillNull(rs.getString("jc_mmydd_blzkl"));
		jc_mmydd_yddbh=cf.fillNull(rs.getString("jc_mmydd_yddbh"));
		jc_mmydd_khbh=cf.fillNull(rs.getString("jc_mmydd_khbh"));
		jc_mmydd_wjqk=cf.fillNull(rs.getString("jc_mmydd_wjqk"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("jc_mmydd_sqdj"));
		jc_mmydd_yddmmje=cf.fillNull(rs.getString("jc_mmydd_yddmmje"));
		jc_mmydd_yddwjje=cf.fillNull(rs.getString("jc_mmydd_yddwjje"));
		jc_mmydd_yddblje=cf.fillNull(rs.getString("jc_mmydd_yddblje"));
		jc_mmydd_yddbzje=cf.fillNull(rs.getString("jc_mmydd_yddbzje"));
		jc_mmydd_yddze=cf.fillNull(rs.getString("jc_mmydd_yddze"));
		jc_mmydd_clgw=cf.fillNull(rs.getString("jc_mmydd_clgw"));
		jc_mmydd_zhshr=cf.fillNull(rs.getString("jc_mmydd_zhshr"));
		jc_mmydd_zhshsj=cf.fillNull(rs.getDate("jc_mmydd_zhshsj"));
		jc_mmydd_zhshyj=cf.fillNull(rs.getString("jc_mmydd_zhshyj"));
		jc_mmydd_clzt=cf.fillNull(rs.getString("jc_mmydd_clzt"));
		jc_mmydd_lrr=cf.fillNull(rs.getString("jc_mmydd_lrr"));
		jc_mmydd_lrsj=cf.fillNull(rs.getDate("jc_mmydd_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		jc_mmydd_tzsfqz=cf.fillNull(rs.getString("jc_mmydd_tzsfqz"));
		jc_mmydd_sffqk=cf.fillNull(rs.getString("jc_mmydd_sffqk"));
		jc_mmydd_bz=cf.fillNull(rs.getString("jc_mmydd_bz"));
	}
	rs.close();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,sgdmc sgd";
	ls_sql+=" from  sq_dwxx a,sq_sgd,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and  crm_khxx.sgd=sq_sgd.sgd(+) and  (crm_khxx.khbh='"+jc_mmydd_khbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
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
		dwmc=cf.fillNull(rs.getString("dm"));
		sgd=cf.fillNull(rs.getString("sgd"));
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>ľ��Ԥ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center">ľ��Ԥ����---�ۺϾ�Ӫ����� 
</div>
  
<form method="post" action="SaveXgZhshJc_mmydd.jsp" name="selectform">
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="22%">�ۺϾ�Ӫ���ʱ��</td>
    <td width="28%"> 
        <input type="text" name="zhshsj" size="20" maxlength="10" value="<%=jc_mmydd_zhshsj%>" readonly>
    </td>
      <td width="23%" bgcolor="#E8E8FF" align="right">�ۺϾ�Ӫ�������</td>
    <td width="27%"> 
        <input type="text" name="zhshr" size="20" maxlength="20" value="<%=jc_mmydd_zhshr%>" readonly>
    </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
    <td align="right" width="22%">�ۺϾ�Ӫ������</td>
    <td colspan="3"> 
      <textarea name="zhshyj" rows="3" cols="71"><%=jc_mmydd_zhshyj%></textarea>
    </td>
  </tr>
  <tr bgcolor="#E8E8FF"> 
      <td colspan="4" height="39"> 
        <div align="center">
		<input type="button"  value="�� ��" onClick="f_do(selectform)">
          <input type="button" name="Button" value="�鿴Ԥ������ϸ" onClick="window.open('/jcjj/mmdd/ViewJc_mmydmx.jsp?yddbh=<%=yddbh%>')">
          <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
      </div>
    </td>
  </tr>
</table>
</form>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="21%"> 
      <div align="right">�ͻ����</div>
    </td>
    <td width="29%"><%=jc_mmydd_khbh%> </td>
    <td width="21%"> 
      <div align="right">�ͻ�����</div>
    </td>
    <td width="29%"><%=khxm%> </td>
  </tr>
  <tr> 
    <td width="21%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
    <td width="29%" bgcolor="#CCCCFF"><%=dwmc%></td>
    <td width="21%" bgcolor="#CCCCFF" align="right">��ͬ��</td>
    <td width="29%" bgcolor="#CCCCFF"><%=hth%></td>
  </tr>
  <tr> 
    <td width="21%" align="right" bgcolor="#CCCCFF">��ϵ��ʽ</td>
    <td width="29%" bgcolor="#CCCCFF"><%=lxfs%></td>
    <td width="21%" align="right" bgcolor="#CCCCFF">����ǩԼ��</td>
    <td width="29%" bgcolor="#CCCCFF"><%=qye%></td>
  </tr>
  <tr> 
    <td width="21%" align="right" bgcolor="#CCCCFF">���ݵ�ַ</td>
    <td colspan="3" bgcolor="#CCCCFF"><%=fwdz%></td>
  </tr>
  <tr> 
    <td width="21%" bgcolor="#CCCCFF"> 
      <div align="right">װ�����ʦ</div>
    </td>
    <td width="29%" bgcolor="#CCCCFF"><%=sjs%> </td>
    <td width="21%" bgcolor="#CCCCFF"> 
      <div align="right">ʩ����</div>
    </td>
    <td width="29%" bgcolor="#CCCCFF"><%=sgd%> </td>
  </tr>
  <tr> 
    <td width="21%" align="right" bgcolor="#CCCCFF">Ӧ��������</td>
    <td width="29%" bgcolor="#CCCCFF"><%=kgrq%></td>
    <td width="21%" align="right" bgcolor="#CCCCFF">Ӧ��������</td>
    <td width="29%" bgcolor="#CCCCFF"><%=jgrq%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%"> 
      <div align="right">������</div>
    </td>
    <td width="30%"> <%
	cf.radioToken(out, "1+�ͻ��Թ�&2+��˾����",jc_mmydd_wjqk,true);
%> </td>
    <td width="21%"> 
      <div align="right">פ��Ҿӹ���</div>
    </td>
    <td width="29%"><%=jc_mmydd_clgw%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right">��ȡ����</td>
    <td width="30%"><%=jc_mmydd_sqdj%></td>
    <td width="21%" align="right">&nbsp;</td>
    <td width="29%">&nbsp;</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%"> 
      <div align="right">ľ�ű�׼���</div>
    </td>
    <td width="30%"><%=jc_mmydd_yddmmje%> </td>
    <td width="21%"> 
      <div align="right">ľ���ۿ���</div>
    </td>
    <td width="29%"><%=jc_mmydd_mmzkl%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" align="right">����׼���</td>
    <td width="30%"><%=jc_mmydd_yddwjje%></td>
    <td width="21%" align="right">����ۿ���</td>
    <td width="29%"><%=jc_mmydd_wjzkl%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="20%"> 
      <div align="right">������׼���</div>
    </td>
    <td width="30%"><%=jc_mmydd_yddblje%> </td>
    <td width="21%"> 
      <div align="right">�����ۿ���</div>
    </td>
    <td width="29%"><%=jc_mmydd_blzkl%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%"> 
      <div align="right">Ԥ������׼���</div>
    </td>
    <td width="30%"><%=jc_mmydd_yddbzje%> </td>
    <td width="21%"> 
      <div align="right">Ԥ�����ܶ�</div>
    </td>
    <td width="29%"><%=jc_mmydd_yddze%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%"> 
      <div align="right">¼����</div>
    </td>
    <td width="30%"><%=jc_mmydd_lrr%> </td>
    <td width="21%"> 
      <div align="right">¼��ʱ��</div>
    </td>
    <td width="29%"><%=jc_mmydd_lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%"> 
      <div align="right">¼�벿��</div>
    </td>
    <td width="30%"><%=sq_dwxx_dwmc%> </td>
    <td width="21%"> 
      <div align="right">����״̬</div>
    </td>
    <td width="29%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%"> 
      <div align="right">ͼֽ�Ƿ�ǩ��</div>
    </td>
    <td width="30%"> <%
	cf.selectToken(out,"Y+��&N+��",jc_mmydd_tzsfqz,true);
%> </td>
    <td width="21%"> 
      <div align="right">�Ƿ�ȫ��</div>
    </td>
    <td width="29%"> <%
	cf.selectToken(out,"Y+��&N+��",jc_mmydd_sffqk,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="20%" bgcolor="#FFFFCC" align="right">��ע</td>
    <td colspan="3"><%=jc_mmydd_bz%></td>
  </tr>
</table>

</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zhshyj)=="") {
		alert("������[�ۺϾ�Ӫ������]��");
		FormName.zhshyj.focus();
		return false;
	}
	if(	javaTrim(FormName.zhshr)=="") {
		alert("������[�ۺϾ�Ӫ�������]��");
		FormName.zhshr.focus();
		return false;
	}
	if(	javaTrim(FormName.zhshsj)=="") {
		alert("������[�ۺϾ�Ӫ���ʱ��]��");
		FormName.zhshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zhshsj, "�ۺϾ�Ӫ���ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}


//-->
</SCRIPT>
