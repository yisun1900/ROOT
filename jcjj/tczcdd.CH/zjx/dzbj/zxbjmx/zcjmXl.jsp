<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
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
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
.STYLE4 {
	color: #990000;
	font-weight: bold;
}
-->
</style>
</head>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String bjjbbm=null;
String tccpdlbm=null;

String sfxzsl="";
String sfxzslStr="";
String sfkjm="";//�Ƿ�ɼ���  1�����ƣ�3��������
String sfkjmStr="";
double yxjmzdsl=0;//��������������
double jmdj=0;//���ⵥ��
double sjjmsl=0;//ʵ�ʼ�������
double sjjmje=0;//ʵ�ʼ�����
double sjsl=0;//ʵ������
double bzsl=0;//��׼����
String txxx="";
String sjjmslStr="";


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jxc_cldlbm.cldlbm";
	ls_sql+=" from  jxc_clxlbm,jxc_cldlbm";
	ls_sql+=" where jxc_clxlbm.cldlmc=jxc_cldlbm.cldlmc and jxc_clxlbm.clxlbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccpdlbm=cf.fillNull(rs.getString("cldlbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select bjjbbm";
	ls_sql+=" from  bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select sfxzsl,DECODE(sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzslStr,sfkjm,DECODE(sfkjm,'1','���ɼ���','2','�ɼ���') sfkjmStr,yxjmzdsl,jmdj,sjjmsl,sjjmje,sjsl,bzsl";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		sfxzslStr=cf.fillNull(rs.getString("sfxzslStr"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		sfkjmStr=cf.fillNull(rs.getString("sfkjmStr"));
		yxjmzdsl=rs.getDouble("yxjmzdsl");
		jmdj=rs.getDouble("jmdj");
		sjjmsl=rs.getDouble("sjjmsl");
		sjjmje=rs.getDouble("sjjmje");
		sjsl=rs.getDouble("sjsl");
		bzsl=rs.getDouble("bzsl");
	}
	rs.close();
	ps.close();

	if (sjsl>0)
	{
		out.println("������ѡ����������:"+sjsl+"�����ɼ��⣬����ɾ������");
		return;
	}

	if (sjjmsl==0)
	{
		sjjmslStr="";
	}
	else{
		sjjmslStr=""+sjjmsl;
	}

	if (sfkjm.equals("1"))//�Ƿ�ɼ��� 1�����ɼ��⣻2���ɼ���
	{
		out.println("���󣡲��ɼ���");
		return;
	}
	else{
		if (sjsl>(bzsl-sjjmsl))
		{
			txxx="���ѣ�����������������׼����:"+bzsl+"��ʵ�ʼ�������:"+sjjmsl+"��ʵ������:"+sjsl+"��������ѡ��������"+(bzsl-sjjmsl-sjsl);
		}
	}

}
catch (Exception e) {
	out.print("<BR>����:" + e);
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
<form method="post" action="SaveZcjmXl.jsp" name="insertform">
<div align="center">���ļ���</div>

<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%"><span class="STYLE2"><span class="STYLE1">*</span>���ۼ���</span></td>
	<td  width="3%"><span class="STYLE2"><span class="STYLE1">*</span>����</span></td>
	<td  width="7%"><span class="STYLE2">���ײ�Ʒ˵��</span></td>
	<td  width="5%">��Ʒ����</td>
	<td  width="4%">SKU��</td>
	<td  width="7%">��Ʒ����</td>
	<td  width="6%">Ʒ��</td>
	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="3%">������λ</td>
	<td  width="3%">���</td>
	<td  width="2%">�Ƿ��в�Ʒ</td>
	<td  width="5%">��Ʒ����</td>
	<td  width="5%">��Ʒ���</td>
	<td  width="14%">��Ӧ��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT bjjbmc,bj_khzcxmh.sl,bj_khzcxmh.ptcpsm,bj_khzcxmh.cpbm,bj_khzcxmh.sku,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.gg,bj_khzcxmh.jldw,bj_khzcxmh.sh, DECODE(bj_khzcxmh.sfcscp,'Y','��','N','��') sfcscp,jxc_cldlbm.cldlmc,clxlmc,bj_khzcxmh.gysmc ";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_khzcxmh  ";
    ls_sql+=" where bj_khzcxmh.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxmh.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"' and bj_khzcxmh.jgwzbm='"+jgwzbm+"' and bj_khzcxmh.tccplbbm='"+tccplbbm+"'";
    ls_sql+=" and bj_khzcxmh.zclx='1'";//1���ײ��ڣ�2���ײ���
    ls_sql+=" order by bj_khzcxmh.bjjbbm,bj_khzcxmh.tccpdlbm,bj_khzcxmh.tccplbbm,bj_khzcxmh.cpbm";

    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");

//��������
	String[] keyName={"cpbm"};
	pageObj.setKey(keyName);

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%>
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">�ͻ����</span></td> 
  <td width="32%"> 
    <input type="text" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">��Ʒ����</span></td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by cldlmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">��Ʒ���</span></td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">�ṹλ��</span></td>
  <td><select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<OPTION SELECTED value="<%=jgwzbm%>"><%=jgwzbm%></OPTION>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">���ۼ���</span></td>
  <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">�Ƿ���������</span></td>
  <td><%=sfxzslStr%></td>
  <td align="right"><span class="STYLE4">��׼����</span></td>
  <td><%=bzsl%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">�Ƿ�ɼ���</span></td>
  <td><%=sfkjmStr%></td>
  <td align="right"><span class="STYLE4">��������������</span></td>
  <td><%=yxjmzdsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">ʵ������</span></td>
  <td><%=sjsl%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">ʵ�ʼ��ⵥ��</span></td>
  <td><input type="text" name="jmdj" value="<%=jmdj%>" size="20" maxlength="17" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE3">ʵ�ʼ�����</span></td>
  <td><input type="text" name="sjjmje" value="<%=sjjmje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ʵ�ʼ�������</td>
  <td><input type="text" name="sjjmsl" value="<%=sjjmslStr%>" size="20" maxlength="17" onChange="f_jsjg(insertform)"></td>
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

function f_jsjg(FormName)//����FormName:Form������
{
	var sjjmje=FormName.jmdj.value*FormName.sjjmsl.value;
	sjjmje=round(sjjmje,2);

	FormName.sjjmje.value=sjjmje;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[�ͻ����]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("��ѡ��[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sjjmsl)=="") {
		alert("������[��������]��");
		FormName.sjjmsl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmsl, "��������"))) {
		return false;
	}


	if (<%=sfxzsl%>!="3")
	{
		if (parseFloat(FormName.sjjmsl.value)><%=yxjmzdsl%>)
		{
			alert("����[��������]�����������ֵ<%=yxjmzdsl%>");
			FormName.sjjmsl.select();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
