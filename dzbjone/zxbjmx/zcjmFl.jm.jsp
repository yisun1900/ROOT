<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
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
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String tcsjflbm=cf.GB2Uni(request.getParameter("tcsjflbm"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String bjjbbm=null;
String tccplbbm=null;

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


	ls_sql="select bjjbbm";
	ls_sql+=" from  bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select sfxzsl,DECODE(sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzslStr,sfkjm,DECODE(sfkjm,'1','���ɼ���','2','�ɼ���') sfkjmStr,yxjmzdsl,jmdj,sjjmsl,sjjmje,sjsl,bzsl";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
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
		bzsl=rs.getDouble("bzsl");
	}
	rs.close();
	ps.close();

	ls_sql="select sum(sjsl) sjsl ";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble("sjsl");
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
<form method="post" action="SaveZcjmFl.jsp" name="insertform">
<div align="center">���ļ���</div>





<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">�ͻ����</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">�ײ���������</span></td> 
  <td width="32%"><select name="tcsjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select tcsjflbm,tcsjflmc from bj_tcsjflbm order by tcsjflmc",tcsjflbm);
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
  <td align="right"><span class="STYLE1">*</span>ʵ�ʼ�������</td>
  <td><input type="text" name="sjjmsl" value="<%=sjjmslStr%>" size="20" maxlength="17"  ></td>
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
 
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("��ѡ��[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcsjflbm)=="") {
		alert("��ѡ��[�ײ���������]��");
		FormName.tcsjflbm.focus();
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
