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


String bjjbbm=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
 
 
	String khbh=null;
	ls_sql="select khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select bjjb";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjb"));
	}
	rs.close();
	ps.close();



%>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertBj_khzcxmTcwXp.jsp" name="insertform">
<div align="center">¼�룭�ײ�ѡ������</div>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">����</td>
	<td  width="5%">����</td>
	<td  width="5%">����</td>
	<td  width="6%">�շ�</td>
	<td  width="21%">���ײ�Ʒ˵��</td>
	<td  width="9%">��Ʒ����</td>
	<td  width="9%">��Ʒ����</td>
	<td  width="8%">Ʒ��</td>
	<td  width="12%">�ͺ�</td>
	<td  width="9%">���</td>
	<td  width="5%">������λ</td>
</tr>
<%
	String lx=null;
	String lxmc=null;
	String sxh=null;
	String bjjbmc=null;
	double sl=0;
	double dj=0;
	double je=0;
	String ptcpsm=null;
	String cpbm=null;
	String cpmc=null;
	String ppmc=null;
	String xh=null;
	String gg=null;
	String jldw=null;
	ls_sql="SELECT bj_khzcxmh.lx,DECODE(bj_khzcxmh.lx,'1','ԭ��Ŀ','2','����','3','����','4','������') lxmc,bj_khzcxmh.sxh,bjjbmc,bj_khzcxmh.sl,bj_khzcxmh.dj,ROUND(bj_khzcxmh.sl*bj_khzcxmh.dj,2) je,bj_khzcxmh.ptcpsm,bj_khzcxmh.cpbm,bj_khzcxmh.cpmc,bj_khzcxmh.ppmc,bj_khzcxmh.xh,bj_khzcxmh.gg,bj_khzcxmh.jldw";
	ls_sql+=" FROM bdm_bjjbbm,bj_khzcxmh  ";
    ls_sql+=" where bj_khzcxmh.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxmh.zjxxh='"+zjxxh+"'";
    ls_sql+=" and bj_khzcxmh.zclx in('4')";//�������� 1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
    ls_sql+=" and bj_khzcxmh.ddcljjfs in('3')";//0���Ǵ����ϣ�1����������������ۣ���2�����������������Ƽۣ���3���ײ�ѡ��
    ls_sql+=" order by bj_khzcxmh.cpbm,bj_khzcxmh.sxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		lx=cf.fillNull(rs.getString("lx"));
		lxmc=cf.fillNull(rs.getString("lxmc"));
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		je=rs.getDouble("je");
		ptcpsm=cf.fillHtml(rs.getString("ptcpsm"));
		cpbm=cf.fillHtml(rs.getString("cpbm"));
		cpmc=cf.fillHtml(rs.getString("cpmc"));
		ppmc=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		jldw=cf.fillHtml(rs.getString("jldw"));

		if (lx.equals("4"))//1��ԭ��Ŀ��2�����3�����4��������
		{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>
					<A HREF="EditNewBj_khzcxmTcwXp.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>" target="_blank">�޸�</A>  
					<A HREF="DeleteBj_khzcxmTcwXp.jsp?zjxxh=<%=zjxxh%>&sxh=<%=sxh%>" target="_blank">ɾ��</A>
				</td>
				<td><%=lxmc%></td>
				<td><%=sl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=jldw%></td>
			</tr>
			<%
		}
		else{
			%>
			<tr bgcolor="#FFFFF"  align="center">
				<td>&nbsp;</td>
				<td><%=lxmc%></td>
				<td><%=bjjbmc%></td>
				<td><%=sl%></td>
				<td><%=dj%></td>
				<td><%=je%></td>
				<td><%=ptcpsm%></td>
				<td><%=cpbm%></td>
				<td><%=cpmc%></td>
				<td><%=ppmc%></td>
				<td><%=xh%></td>
				<td><%=gg%></td>
				<td><%=jldw%></td>
			</tr>
			<%
		}
	}
	rs.close();
	ps.close();
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
</table>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">���������</span></td> 
  <td width="32%"> 
    <input type="text" name="zjxxh" value="<%=zjxxh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE3">���ۼ���</span></td> 
  <td width="32%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
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
	sql="select distinct  ppmc c1,ppmc c2 from bj_tcwzck where jjfs='3' and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE))) order by ppmc";
	cf.selectItem(out,sql,"");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>��Ʒ</td>
  <td colspan="3">
  <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX" onChange="changeCpbm(insertform)">
    <option value=""></option>
    <option value="0">����ѡ��Ʒ��</option>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><input type="text" name="sl" value="" size="20" maxlength="17" ></td>
  <td align="right"><span class="STYLE1">*</span>ʵ�ʵ���</td>
  <td><input type="text" name="dj" value="" size="20" maxlength="17"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ṹλ��</td>
  <td>
  <select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxxh where zjxxh='"+zjxxh+"'  order by jgwzbm","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">���ײ�Ʒ˵��</td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="" size="73" maxlength="200"  >  </td>
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
<%
	//����Ajax
	cf.ajax(out);
%>

var mark="";
function changePp(FormName)
{
	FormName.cpbm.length=1;

	if (FormName.ppmc.value=="")
	{
		return;
	}
	mark="pp";

	var sql;
	sql="select cpbm,cpmc||'��'||xh||'����'||gg||'��'||'����'||dj||'/'||jldw||'��' from bj_tcwzck where ppmc='"+FormName.ppmc.value+"' and jjfs='3' and cpbm not in(select cpbm from bj_khzcxmh where zjxxh='<%=zjxxh%>' and zclx in('3','4')) and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE)))  order by cpmc,xh";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function changeCpbm(FormName)
{
	if (FormName.cpbm.value=="")
	{
		return;
	}

	mark="cpbm";

	var sql;
	sql="select sfkgdj from bj_tcwzck where cpbm='"+FormName.cpbm.value+"'";

	var actionStr="/ajax/getValue.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getAjax(ajaxRetStr) 
{
	if (mark=="pp")
	{
		strToSelect(insertform.cpbm,ajaxRetStr);
	}
	else if (mark=="cpbm")
	{
		ajaxRetStr=ajaxRetStr.substring(10,ajaxRetStr.length-4);

		if (ajaxRetStr=="Y")
		{
			insertform.dj.readOnly=false;
			insertform.dj.value="";
		}
		else {
			insertform.dj.readOnly=true;
			insertform.dj.value="0";
		}
	}
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("������[���������]��");
		FormName.zjxxh.focus();
		return false;
	}
	if(	javaTrim(FormName.jgwzbm)=="") {
		alert("��ѡ��[�ṹλ��]��");
		FormName.jgwzbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpbm)=="") {
		alert("��ѡ��[��Ʒ]��");
		FormName.cpbm.focus();
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
	if(	javaTrim(FormName.dj)=="") {
		alert("������[ʵ�ʵ���]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "ʵ�ʵ���"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
