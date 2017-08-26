<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String khbh=null;
String cpflbm=null;
String cpjkr=null;
String cpkf=null;
String vipkf=null;
String fssj=null;
String cplhsj=null;
String jhbhwcsj=null;
String jhazsj=null;
String fbwxfa=null;
String falrr=null;
String falrsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String qksm=null;
String fbdbh=cf.GB2Uni(request.getParameter("fbdbh"));

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

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,cpflbm,cpjkr,cpkf,vipkf,fssj,cplhsj,jhbhwcsj,jhazsj,fbwxfa,falrr,falrsj,lrr,lrsj,lrbm,bz,qksm ";
	ls_sql+=" from  crm_fbdgl";
	ls_sql+=" where fbdbh='"+fbdbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		cpflbm=cf.fillNull(rs.getString("cpflbm"));
		cpjkr=cf.fillNull(rs.getString("cpjkr"));
		cpkf=cf.fillNull(rs.getString("cpkf"));
		vipkf=cf.fillNull(rs.getString("vipkf"));
		fssj=cf.fillNull(rs.getDate("fssj"));
		cplhsj=cf.fillNull(rs.getDate("cplhsj"));
		jhbhwcsj=cf.fillNull(rs.getDate("jhbhwcsj"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		fbwxfa=cf.fillNull(rs.getString("fbwxfa"));
		falrr=cf.fillNull(rs.getString("falrr"));
		falrsj=cf.fillNull(rs.getDate("falrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		qksm=cf.fillNull(rs.getString("qksm"));
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

	if (gcjdbm.equals("4") || gcjdbm.equals("5"))
	{
//		out.println("<BR>���������󣬿ͻ����깤");
//		return;
	}

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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveFaCrm_fbdgl.jsp" name="editform">
<div align="center">����ά�޵���������������������ţ�<%=fbdbh%>��</div>
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
    <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2"><font color="#0000FF">�ܼ�</font></span></td>
    <td><%=gj%></td>
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2"><font color="#0000FF">����</font></span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE2"><font color="#0000FF">�ͻ�����</font></span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
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
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">��Ʒ����</font></td> 
  <td width="32%">
    <%
	cf.selectItem(out,"select cpflbm,cpflmc from dm_cpflbm where cpflbm='"+cpflbm+"'",cpflbm,true);
%>
  </td>
  <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">����ά�޷���ʱ��</font></td> 
  <td width="32%"><%=fssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">����ά�����˵��</font></td>
  <td colspan="3"><%=qksm%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">¼����</font></td>
  <td><%=lrr%></td>
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">¼��ʱ��</font></td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">¼�벿��</font></td>
  <td>
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>
  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">��ע</font></td>
  <td colspan="3"><%=bz%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��Ʒ�ӿ���</td> 
  <td width="32%"> 
    <input type="text" name="cpjkr" size="20" maxlength="20"  value="<%=cpjkr%>" >  </td>
  <td align="right" width="18%">��Ʒ�ͷ�</td> 
  <td width="32%"> 
    <input type="text" name="cpkf" size="20" maxlength="20"  value="<%=cpkf%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">VIP�ͷ�</td> 
  <td width="32%"> 
    <input type="text" name="vipkf" size="20" maxlength="20"  value="<%=vipkf%>" >  </td>
  <td align="right" width="18%">��Ʒ����ʱ��</td> 
  <td width="32%"><input type="text" name="cplhsj" size="20" maxlength="10"  value="<%=cplhsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�ƻ��������ʱ��</td> 
  <td width="32%"><input type="text" name="jhbhwcsj" size="20" maxlength="10"  value="<%=jhbhwcsj%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�ƻ���װʱ��</td> 
  <td width="32%"><input type="text" name="jhazsj" size="20" maxlength="10"  value="<%=jhazsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>����ά�޷���</td> 
  <td colspan="3"><textarea name="fbwxfa" cols="71" rows="5"><%=fbwxfa%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">����¼����</font></td> 
  <td width="32%"> 
    <input type="text" name="falrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">����¼��ʱ��</font></td> 
  <td width="32%"> 
    <input type="text" name="falrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>

    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="fbdbh"  value="<%=fbdbh%>" >
		<input type="hidden" name="khbh" value="<%=khbh%>" > 
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
	if(	javaTrim(FormName.cpjkr)=="") {
		alert("������[��Ʒ�ӿ���]��");
		FormName.cpjkr.focus();
		return false;
	}
	if(!(isDatetime(FormName.cplhsj, "��Ʒ����ʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.jhbhwcsj)=="") {
		alert("������[�ƻ��������ʱ��]��");
		FormName.jhbhwcsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhbhwcsj, "�ƻ��������ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jhazsj)=="") {
		alert("������[�ƻ���װʱ��]��");
		FormName.jhazsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhazsj, "�ƻ���װʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.fbwxfa)=="") {
		alert("������[����ά�޷���]��");
		FormName.fbwxfa.focus();
		return false;
	}
	if(	javaTrim(FormName.falrr)=="") {
		alert("������[����¼����]��");
		FormName.falrr.focus();
		return false;
	}
	if(	javaTrim(FormName.falrsj)=="") {
		alert("������[����¼��ʱ��]��");
		FormName.falrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.falrsj, "����¼��ʱ��"))) {
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
