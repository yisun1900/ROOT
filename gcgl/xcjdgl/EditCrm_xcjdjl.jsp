<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<%@ page import='java.sql.*,java.io.*' %>
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
String jdlxbm=null;
String sfycp=null;
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

int row=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,sqrq,sqr,sqrlxdh,sfxtp,jhjdrq,jhjdsj,sqsm,zcwcsj,lrr,lrsj,lrbm,jdlxbm,sfycp ";
	ls_sql+=" from  crm_xcjdjl";
	ls_sql+=" where  (jdjlh='"+jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
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
		lrbm=cf.fillNull(rs.getString("lrbm"));
		jdlxbm=cf.fillNull(rs.getString("jdlxbm"));
		sfycp=cf.fillNull(rs.getString("sfycp"));
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


%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">�޸Ľ������루���׼�¼�ţ�<%=jdjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td width="32%"><%=hth%> </td>
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
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>

<tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>��������</td>
    <td><select name="jdlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <OPTION  value=""></OPTION>
        <%
cf.selectItem(out,"select jdlxbm,jdlxmc from dm_jdlxbm order by jdlxbm",jdlxbm);
%>
      </select>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>������Ŀ</td>
    <td colspan="3">
<%
	if (sfycp.equals("2"))//1���в�Ʒ��2���޲�Ʒ
	{
		%>
		<input type="checkbox" name="jdxmbm" value="00" checked onClick="f_no(insertform)">�޲�Ʒ
		<%
	}
	else
	{
		%>
		<input type="checkbox" name="jdxmbm" value="00" onClick="f_no(insertform)">�޲�Ʒ
		<%
	}

	String jdxmbm=null;
	String jdxmmc=null;

	ls_sql="SELECT jdxmbm,jdxmmc";
	ls_sql+=" FROM dm_jdxmbm";
	ls_sql+=" order by jdxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		row++;
		jdxmbm=cf.fillNull(rs.getString("jdxmbm"));
		jdxmmc=cf.fillNull(rs.getString("jdxmmc"));

		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_jdxmmx";
		ls_sql+=" where jdjlh='"+jdjlh+"' and jdxmbm='"+jdxmbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			%>
			<input type="checkbox" name="jdxmbm" value="<%=jdxmbm%>" checked onClick="f_change(insertform)"><%=jdxmmc%>
			<%
		}
		else
		{
			%>
			<input type="checkbox" name="jdxmbm" value="<%=jdxmbm%>" onClick="f_change(insertform)"><%=jdxmmc%>
			<%
		}
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"> 
    <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>������</td> 
  <td width="32%"> 
    <input type="text" name="sqr" size="20" maxlength="20"  value="<%=sqr%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��������ϵ�绰</td> 
  <td colspan="3"> 
    <input type="text" name="sqrlxdh" size="72" maxlength="40"  value="<%=sqrlxdh%>" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�ƻ���������</td> 
  <td width="32%"> 
    <input type="text" name="jhjdrq" size="20" maxlength="10"  value="<%=jhjdrq%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�ƻ�����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="jhjdsj" size="6" maxlength="8"  value="<%=jhjdsj%>" >
    ʱ
    ��<strong>¼��Сʱ</strong>�� </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�������</td>
  <td><%
	cf.radioToken(out, "sfxtp","Y+��&N+��",sfxtp);
%></td>
  <td align="right">������ʱ��</td>
  <td><input type="text" name="zcwcsj" size="20" maxlength="10"  value="<%=zcwcsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����˵��</td> 
  <td colspan="3"> 
    <textarea name="sqsm" cols="71" rows="3"><%=sqsm%></textarea>  </td>
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
    <tr> 
      <td colspan="4" >
	<div align="center">
    <input type="hidden" name="jdjlh" value="<%=jdjlh%>" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly> 
	  <input type="button"  value="����" onClick="f_do(insertform)">
	  <input type="button" onClick="f_lr(insertform)"  value="¼�뽻����ϸ"  name="mx" <%if (sfycp.equals("2")) out.println("disabled");%>>
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
function f_no(FormName)//����FormName:Form������
{
	for (var i=1;i<=<%=row%> ;i++ )
	{
		FormName.jdxmbm[i].checked=false;
	}
	FormName.mx.disabled=true;
}

function f_change(FormName)//����FormName:Form������
{
	FormName.jdxmbm[0].checked=false;
	FormName.mx.disabled=false;
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("������[���׼�¼��]��");
		FormName.jdjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.jdlxbm)=="") {
		alert("������[��������]��");
		FormName.jdlxbm.focus();
		return false;
	}
    if(	!radioChecked(FormName.jdxmbm)) {
		alert("��ѡ��[������Ŀ]��");
		FormName.jdxmbm[0].focus();
		return false;
	}
	if(	javaTrim(FormName.sqrq)=="") {
		alert("������[��������]��");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.sqr)=="") {
		alert("������[������]��");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.sqrlxdh)=="") {
		alert("������[��������ϵ�绰]��");
		FormName.sqrlxdh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxtp)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxtp[0].focus();
		return false;
	}
	if(	javaTrim(FormName.jhjdrq)=="") {
		alert("������[�ƻ���������]��");
		FormName.jhjdrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjdrq, "�ƻ���������"))) {
		return false;
	}
	if(	javaTrim(FormName.jhjdsj)=="") {
		alert("������[�ƻ�����ʱ��]��");
		FormName.jhjdsj.focus();
		return false;
	}
	if(!(isNumber(FormName.jhjdsj, "�ƻ�����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zcwcsj, "������ʱ��"))) {
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
	FormName.action="SaveEditCrm_xcjdjl.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("������[���׼�¼��]��");
		FormName.jdjlh.focus();
		return false;
	}
	FormName.action="InsertCrm_jdxmmx.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
