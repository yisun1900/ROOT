<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
String jhjdrq=null;
String jhjdsj=null;
String sqsm=null;
String zcwcsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));


String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String dmjl="";
String dmjldh="";

String zzqrjdrq=null;
String zzqrjdsj=null;
String fbr=null;
String fbsj=null;

String jdsfcg=null;
String sfkkg=null;
String tzsfqr=null;
String fasfkx=null;
String khsfqr=null;
String xcfzrqr=null;
String qtczdqr=null;
 
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,sqrq,sqr,sqrlxdh,DECODE(sfxtp,'Y','��','N','��') sfxtp,jhjdrq,jhjdsj,sqsm,zcwcsj,lrr,lrsj,dwmc ";
	ls_sql+=" ,zzqrjdrq,zzqrjdsj,fbr,fbsj,jdsfcg,sfkkg,tzsfqr,fasfkx,khsfqr,xcfzrqr,qtczdqr";
	ls_sql+=" from  crm_xcjdjl,sq_dwxx";
	ls_sql+=" where crm_xcjdjl.jdjlh='"+jdjlh+"' and crm_xcjdjl.lrbm=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zzqrjdrq=cf.fillNull(rs.getDate("zzqrjdrq"));
		zzqrjdsj=cf.fillNull(rs.getString("zzqrjdsj"));
		fbr=cf.fillNull(rs.getString("fbr"));
		fbsj=cf.fillNull(rs.getDate("fbsj"));
		jdsfcg=cf.fillNull(rs.getString("jdsfcg"));
		sfkkg=cf.fillNull(rs.getString("sfkkg"));
		tzsfqr=cf.fillNull(rs.getString("tzsfqr"));
		fasfkx=cf.fillNull(rs.getString("fasfkx"));
		khsfqr=cf.fillNull(rs.getString("khsfqr"));
		xcfzrqr=cf.fillNull(rs.getString("xcfzrqr"));
		qtczdqr=cf.fillNull(rs.getString("qtczdqr"));

		khbh=cf.fillNull(rs.getString("khbh"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		sqr=cf.fillNull(rs.getString("sqr"));
		sqrlxdh=cf.fillNull(rs.getString("sqrlxdh"));
		sfxtp=cf.fillNull(rs.getString("sfxtp"));
		jhjdrq=cf.fillNull(rs.getDate("jhjdrq"));
		jhjdsj=cf.fillNull(rs.getString("jhjdsj"));
		sqsm=cf.fillNull(rs.getString("sqsm"));
		zcwcsj=cf.fillNull(rs.getDate("zcwcsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='���澭��' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
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
<title>ʵ�ʽ���¼��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXgJdCrm_xcjdjl.jsp" name="editform">
<div align="center">�޸�ʵ�ʽ������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">���̵���</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ܼ�</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">�곤���绰</span></td>
    <td><%=dmjl%>��<%=dmjldh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">���齻������</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��������</td>
    <td><%=sqrq%></td>
    <td align="right">������</td>
    <td><%=sqr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��������ϵ�绰</td>
    <td colspan="3"><%=sqrlxdh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�ƻ���������</td>
    <td><%=jhjdrq%></td>
    <td align="right">�ƻ�����ʱ��</td>
    <td><%=jhjdsj%>ʱ</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">�Ƿ�������</td>
    <td><%=sfxtp%></td>
    <td align="right">������ʱ��</td>
    <td><%=zcwcsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����˵��</td>
    <td colspan="3"><%=sqsm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">¼����</td>
    <td><%=lrr%></td>
    <td align="right">¼��ʱ��</td>
    <td><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF">¼�벿��</td>
    <td><%=dwmc%> </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">����ȷ�Ͻ�������</td>
    <td><%=zzqrjdrq%></td>
    <td align="right">����ȷ�Ͻ���ʱ��</td>
    <td><%=zzqrjdsj%>      ʱ</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">���׷�����</span></td>
    <td><%=fbr%></td>
    <td align="right"><span class="STYLE2">���׷���ʱ��</span></td>
    <td><%=fbsj%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����Ƿ�ɹ�</td>
  <td><%
	cf.radioToken(out, "jdsfcg","Y+�ɹ�&N+��",jdsfcg);
%></td>
  <td align="right"><span class="STYLE1">*</span>ʵ�ʽ���ʱ��</td>
  <td><input type="text" name="sjjdsj" size="20" maxlength="10"  value="<%=cf.today()%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ƿ�ɿ���</td> 
  <td width="32%"><%
	cf.radioToken(out, "sfkkg","Y+��&N+��",sfkkg);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>ͼֽ�Ƿ�����</td> 
  <td width="32%"><%
	cf.radioToken(out, "tzsfqr","Y+��&N+��",tzsfqr);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�����Ƿ����</td> 
  <td width="32%"><%
	cf.radioToken(out, "fasfkx","Y+��&N+��",fasfkx);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�ͻ��Ƿ��Ͽ�</td> 
  <td width="32%"><%
	cf.radioToken(out, "khsfqr","Y+��&N+��",khsfqr);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ֳ������˳�����ȷ��</td> 
  <td width="32%"><%
	cf.radioToken(out, "xcfzrqr","Y+��&N+��",xcfzrqr);
%></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>ǽ�崹ֱ���Ƿ�ȷ��</td> 
  <td width="32%"><%
	cf.radioToken(out, "qtczdqr","Y+��&N+��",qtczdqr);
%></td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="jdjlh"  value="<%=jdjlh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("������[���׼�¼��]��");
		FormName.jdjlh.focus();
		return false;
	}
	if(	!radioChecked(FormName.jdsfcg)) {
		alert("��ѡ��[�����Ƿ�ɹ�]��");
		FormName.jdsfcg[0].focus();
		return false;
	}

	if(	javaTrim(FormName.sjjdsj)=="") {
		alert("������[ʵ�ʽ���ʱ��]��");
		FormName.sjjdsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjdsj, "ʵ�ʽ���ʱ��"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfkkg)) {
		alert("��ѡ��[�Ƿ�ɿ���]��");
		FormName.sfkkg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.tzsfqr)) {
		alert("��ѡ��[ͼֽ�Ƿ�����]��");
		FormName.tzsfqr[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.fasfkx)) {
		alert("��ѡ��[�����Ƿ����]��");
		FormName.fasfkx[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.khsfqr)) {
		alert("��ѡ��[�ͻ��Ƿ��Ͽ�]��");
		FormName.khsfqr[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.xcfzrqr)) {
		alert("��ѡ��[�ֳ������˳�����ȷ��]��");
		FormName.xcfzrqr[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.qtczdqr)) {
		alert("��ѡ��[ǽ�崹ֱ���Ƿ�ȷ��]��");
		FormName.qtczdqr[0].focus();
		return false;
	}
	
	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
