<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸Ŀͻ�������Ŀ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {
	color: #0000FF;
	font-weight: bold;
}
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sxh=cf.GB2Uni(request.getParameter("sxh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String cpbm=null;
String bjjbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
String ppmc=null;
String ptcpsm=null;
double sl=0;


String sfkgh="";//�Ƿ�ɸ���  1�����ɻ���2���ɻ�
String sfkghStr="";
double khzdsl=0;//�ɻ��������
double ghzj=0;//�����ۼ�
String sfxzsl="";//�Ƿ���������  1�����ƣ�3��������
String sfxzslStr="";
double bzsl=0;//��׼����
double sjjmsl=0;//ʵ�ʼ�������
double sjsl=0;//ʵ������
String tcsjflbm="";
String txxx="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cpbm,tccpdlbm,tccplbbm,bjjbbm,ppmc,ptcpsm,sl";
	ls_sql+=" from  bj_khzcxm";
	ls_sql+=" where sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpbm=cf.fillNull(rs.getString("cpbm"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		ptcpsm=cf.fillNull(rs.getString("ptcpsm"));
		sl=rs.getDouble("sl");
	}
	else{
		out.println("���󣡲����ڣ���ص��������³���");
		return;
	}
	rs.close();
	ps.close();

	ls_sql="select sfxzsl,bzsl,sjjmsl,sjsl,tcsjflbm,sfkgh,sfkgh,DECODE(sfkgh,'1','���ɻ�','2','�ɻ�') sfkghStr,khzdsl,ghzj";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		sfkghStr=cf.fillNull(rs.getString("sfkghStr"));
		khzdsl=rs.getDouble("khzdsl");
		ghzj=rs.getDouble("ghzj");
	}
	rs.close();
	ps.close();

	bzsl=khzdsl;

	if (sfkgh.equals("1"))
	{
		out.println("���󣡲��ܸ���");
		return;
	}

	if (sjjmsl>0)
	{
		out.println("�Ѽ��ⲻ����ѡ�񣬼�������:"+sjjmsl);
		return;
	}

	if (sfxzsl.equals("1"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		txxx="<span class=\"STYLE1\"><B>���ѣ�����������������׼����:"+bzsl+"��ʵ������:"+sjsl+"��������׼�������շ�</B></span>";
		sfxzslStr="������Ӽ�";
	}
	else if (sfxzsl.equals("2"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		if (sjsl>bzsl)
		{
			txxx="<span class=\"STYLE1\"><B>���ѣ������������������ɳ�������׼����:"+bzsl+"��ʵ������:"+sjsl+"��������¼��</B></span>";
		}
		sfxzslStr="���ɳ���";
	}
	else{
		txxx="";
		sfxzslStr="������";
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
<form method="post" action="SaveEditBj_khzcxmTcw.jsp" name="insertform">
<div align="center">�޸Ŀͻ�������Ŀ</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">�ͻ����</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
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
  <td align="right"><span class="STYLE1">*</span>Ʒ��</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
	String sql="";
	sql="select distinct  ppmc c1,ppmc c2 from bj_tcwzck where tccplbbm='"+tccplbbm+"' and jjfs in('1') and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE))) order by ppmc";
	cf.selectItem(out,sql,ppmc);
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><input type="text" name="sl" value="<%=sl%>" size="20" maxlength="17" >
  </td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ</td> 
  <td colspan="3"> 
  <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX">
    <option value=""></option>
    <%
	sql="select cpbm,cpmc||'��'||xh||'����'||gg||'��'||'�������'||(CASE WHEN (dj-"+ghzj+") > 0 THEN (dj-"+ghzj+") ELSE 0 END)||'/'||jldw||'��' from bj_tcwzck where jjfs in('1') and ppmc='"+ppmc+"' and  tccplbbm='"+tccplbbm+"' order by cpmc,xh";
	cf.selectItem(out,sql,cpbm);
%>
  </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><%if (tccplbbm.equals("36")) out.println("�����ͺ�");if (tccplbbm.equals("50")) out.println("�Ӿ�");%></td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="<%=ptcpsm%>" size="73" maxlength="200" <%if (!tccplbbm.equals("36") && !tccplbbm.equals("50") ) out.println("disabled");%>>  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="oldcpbm" value="<%=cpbm%>"> 
	<input type="hidden" name="sxh" value="<%=sxh%>"> 
	</td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
<%
	//����Ajax
	cf.ajax(out);
%>

function changePp(FormName)
{
	FormName.cpbm.length=1;

	if (FormName.ppmc.value=="")
	{
		return;
	}

	var sql;
	sql="select cpbm,cpmc||'��'||xh||'����'||gg||'��'||'�������'||(CASE WHEN (dj-<%=ghzj%>) > 0 THEN (dj-<%=ghzj%>) ELSE 0 END)||'/'||jldw||'��' from bj_tcwzck where jjfs in('1') and ppmc='"+FormName.ppmc.value+"' and  tccplbbm='"+FormName.tccplbbm.value+"' order by cpmc,xh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	strToSelect(insertform.cpbm,ajaxRetStr);
}

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
	if(	javaTrim(FormName.cpbm)=="") {
		alert("������[��Ʒ����]��");
		FormName.cpbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tccpdlbm)=="") {
		alert("��ѡ��[��Ʒ����]��");
		FormName.tccpdlbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>