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
String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));


String dqbm=null;
String bjjbbm=null;
String tccpdlbm=null;

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

	ls_sql="select dqbm ";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where crm_zxkhxx.ssfgs=sq_dwxx.dwbh";
	ls_sql+=" and crm_zxkhxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

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

	double tcwsjsl=0;//�ײ���ʵ������
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1���ײ��ڣ�2���ײ����շѣ�3�����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcwsjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tcwsjsl>0)
	{
		out.println("������ѡ�������ģ�������ѡ���ײ�����");
		return;
	}

	ls_sql="select bjjbbm,sfxzsl,DECODE(sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzslStr,bzsl,sjjmsl,sjsl,tcsjflbm";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		sfxzslStr=cf.fillNull(rs.getString("sfxzslStr"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		sjsl=rs.getDouble("sjsl");
	}
	rs.close();
	ps.close();

	if (sjjmsl>0)
	{
		out.println("�Ѽ��ⲻ����ѡ�񣬼�������:"+sjjmsl);
		return;
	}

	if (sfxzsl.equals("1"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		txxx="<span class=\"STYLE1\"><B>���ѣ�����������������׼����:"+bzsl+"��ʵ������:"+sjsl+"��������׼�������շ�</B></span>";
	}
	else if (sfxzsl.equals("2"))//1:������Ӽ�;2:���ɳ���;3:����������
	{
		if (sjsl>bzsl)
		{
			txxx="<span class=\"STYLE1\"><B>���ѣ������������������ɳ�������׼����:"+bzsl+"��ʵ������:"+sjsl+"��������¼��</B></span>";
		}
	}
	else{
		txxx="";
	}

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR><BR>SQL=" + ls_sql);
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
<form method="post" action="SaveInsertBj_khzcxm.jsp" name="insertform">
<div align="center">¼��ͻ�������Ŀ</div>

<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="2%">���</td>
	<td  width="3%"><span class="STYLE2"><span class="STYLE1">*</span>���ۼ���</span></td>
	<td  width="2%"><span class="STYLE2"><span class="STYLE1">*</span>����</span></td>
	<td  width="3%">����</td>
	<td  width="4%">�շ�</td>
	<td  width="12%"><span class="STYLE2">���ײ�Ʒ˵��</span></td>
	<td  width="5%">��Ʒ����</td>
	<td  width="7%">��Ʒ����</td>
	<td  width="6%">Ʒ��</td>
	<td  width="5%">�ͺ�</td>
	<td  width="5%">���</td>
	<td  width="3%">������λ</td>
	<td  width="3%">���</td>
	<td  width="5%">��Ʒ���</td>
	<td  width="10%">��Ӧ��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT TO_CHAR(bj_khzcxm.sxh) sxh,bjjbmc,bj_khzcxm.sl,TO_CHAR(bj_khzcxm.dj),ROUND(bj_khzcxm.sl*bj_khzcxm.dj,2),bj_khzcxm.ptcpsm,bj_khzcxm.cpbm,bj_khzcxm.cpmc,bj_khzcxm.ppmc,bj_khzcxm.xh,bj_khzcxm.gg,bj_khzcxm.jldw,bj_khzcxm.sh||'%',clxlmc,bj_khzcxm.gysmc ";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_khzcxm  ";
    ls_sql+=" where bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.jgwzbm='"+jgwzbm+"' and bj_khzcxm.tccplbbm='"+tccplbbm+"'";
    ls_sql+=" and bj_khzcxm.zclx in('1','2')";//�������� 1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
    ls_sql+=" order by bj_khzcxm.cpbm,bj_khzcxm.sxh";


    pageObj.sql=ls_sql;
	pageObj.initPage("","","DeleteBj_khzcxm.jsp?khbh="+khbh+"&jgwzbm="+jgwzbm,"EditBj_khzcxm.jsp?khbh="+khbh+"&jgwzbm="+jgwzbm);

//��������
	String[] keyName={"sxh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("ɾ��");
	pageObj.setViewBolt("");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>

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
  <td align="right"><span class="STYLE4">�Ƿ���������</span></td>
  <td><%=sfxzslStr%></td>
  <td align="right"><span class="STYLE4">��׼����</span></td>
  <td><%=bzsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">ʵ�ʼ�������</span></td>
  <td><%=sjjmsl%></td>
  <td align="right"><span class="STYLE4">ʵ������</span></td>
  <td><%=sjsl%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">&nbsp;</td>
  <td colspan="3"><%=txxx%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>Ʒ��</td>
  <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changePp(insertform)">
    <option value=""></option>
    <%
	String sql="";
	sql="select distinct  ppmc c1,ppmc c2 from bj_tczcbj where tccplbbm='"+tccplbbm+"' and  bjjbbm='"+bjjbbm+"' and  dqbm='"+dqbm+"'  and cpbm not in(select cpbm from bj_khzcxm where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and zclx='1') and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE))) order by ppmc";
	cf.selectItem(out,sql,"");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><input type="text" name="sl" value="" size="20" maxlength="17" >  </td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>��Ʒ</td> 
  <td colspan="3"> 
  <select name="cpbm" style="FONT-SIZE:12PX;WIDTH:512PX">
    <option value=""></option>
    <option value="0">����ѡ��Ʒ��</option>
  </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>
    <%if (tccplbbm.equals("36")) out.println("�����ͺ�");if (tccplbbm.equals("50")) out.println("�Ӿ�");%></td><td colspan="3"> 
    <input type="text" name="ptcpsm" value="" size="73" maxlength="200" <%if (!tccplbbm.equals("36") && !tccplbbm.equals("50") ) out.println("disabled");%>>  </td>
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

function changePp(FormName)
{
	FormName.cpbm.length=1;

	if (FormName.ppmc.value=="")
	{
		return;
	}

	var sql;
	sql="select cpbm,cpmc||'��'||xh||'����'||gg||'��'||'��'||jldw||'��' from bj_tczcbj where ppmc='"+FormName.ppmc.value+"' and  dqbm='<%=dqbm%>' and  tccplbbm='"+FormName.tccplbbm.value+"' and  bjjbbm='"+FormName.bjjbbm.value+"'  and cpbm not in(select cpbm from bj_khzcxm where khbh='<%=khbh%>' and jgwzbm='"+FormName.jgwzbm.value+"' and zclx='1') and ((sfyx='1') OR (sfyx='3' and yxkssj<=TRUNC(SYSDATE) and yxjzsj>=TRUNC(SYSDATE))) order by cpmc,xh ";

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
		alert("��ѡ��[��Ʒ]��");
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
	//if(	javaTrim(FormName.ptcpsm)=="") {
//		alert("��ѡ��[�����ͺŻ��߿Ӿ�]��");
//		FormName.ptcpsm.focus();
//		return false;
//	}
	FormName.submit();
	return true;
}

 
//-->
</SCRIPT>


