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
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String zjxxh=request.getParameter("zjxxh");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String tcmc=cf.GB2Uni(cf.getParameter(request,"tcmc"));
String hxbm=cf.GB2Uni(request.getParameter("hxbm"));
String lx=request.getParameter("lx");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int bzmj=0;
double tcjg=0;
double pmzjdj=0;
int sjmj=0;
String sjmjStr="";
String mjsfkzj=null;
String zcsfxxz=null;
String mjsfkzjmc=null;
String zcsfxxzmc=null;

String sjmjMark="";

try {
	conn=cf.getConnection();

	ls_sql="SELECT bzmj,tcjg,pmzjdj";
	ls_sql+=" ,bj_wntcmc.mjsfkzj,DECODE(bj_wntcmc.mjsfkzj,'1','��������','2','���ӼӼ�') mjsfkzjmc,bj_wntcmc.zcsfxxz,DECODE(bj_wntcmc.zcsfxxz,'1','�Զ�ѡ��','2','�˹�ѡ��') zcsfxxzmc";
	ls_sql+=" FROM bj_wntcmc";
    ls_sql+=" where dqbm='"+dqbm+"' and hxbm='"+hxbm+"' and tcmc='"+tcmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mjsfkzj=rs.getString("mjsfkzj");
		zcsfxxz=rs.getString("zcsfxxz");
		mjsfkzjmc=rs.getString("mjsfkzjmc");
		zcsfxxzmc=rs.getString("zcsfxxzmc");
		bzmj=rs.getInt("bzmj");
		tcjg=rs.getDouble("tcjg");
		pmzjdj=rs.getDouble("pmzjdj");
	}
	rs.close();
	ps.close();

	if (mjsfkzj.equals("1"))
	{
		sjmjMark="readonly";
	}
	else {
		sjmjMark="";
	}

	ls_sql="SELECT sjmj";
	ls_sql+=" FROM bj_khwntcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tcmc='"+tcmc+"' and lx='"+lx+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjmj=rs.getInt("sjmj");
	}
	rs.close();
	ps.close();

	if (sjmj!=0)
	{
		sjmjStr=sjmj+"";
	}
	else{
		sjmjStr=bzmj+"";
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
<div align="center">������ʵ�����</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">���������</span></td> 
  <td width="32%"><%=zjxxh%> </td>
  <td align="right" width="18%"><span class="STYLE2">�ײͼ۸�</span></td> 
  <td width="32%"><%=tcjg%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">�ײ�����</span></td> 
  <td colspan="3"><%=tcmc%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">��׼���</span></td> 
  <td width="32%"><%=bzmj%></td><td align="right" width="18%"><span class="STYLE2">ƽ�����ӵ���</span></td> 
    <td width="32%"><%=pmzjdj%></td></tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">����Ƿ������</span></td>
  <td><%=mjsfkzjmc%></td>
  <td align="right"><span class="STYLE2">�����Ƿ���ѡ��</span></td>
  <td><%=zcsfxxzmc%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>ʵ�����</td> 
  <td width="32%"> 
    <input type="text" name="sjmj" value="<%=sjmjStr%>" size="20" maxlength="8" <%=sjmjMark%>>  
	
	</td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="zjxxh" value="<%=zjxxh%>" >
	<input type="hidden" name="khbh" value="<%=khbh%>" >
	<input type="hidden" name="lx" value="<%=lx%>" >
	<input type="hidden" name="dqbm" value="<%=dqbm%>" >
	<input type="hidden" name="hxbm" value="<%=hxbm%>" >
	<input type="hidden" name="tcmc" value="<%=tcmc%>" >
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="xzmx" type="button" onClick="f_xzmx(insertform)"  value="ѡ����ϸ" disabled>
	<input type="reset"  value="����" name="reset">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<A HREF="ViewBj_wntczcmx.jsp?dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=tcmc%>" target="_blank">�鿴�ײ���ϸ</A>
	</td>
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.sjmj)=="") {
		alert("������[ʵ�����]��");
		FormName.sjmj.focus();
		return false;
	}
	if(!(isNumber(FormName.sjmj, "ʵ�����"))) {
		return false;
	}
	if (parseInt(FormName.sjmj.value)==0)
	{
		alert("����[ʵ�����]����Ϊ0");
		FormName.sjmj.select();
		return false;
	}

	FormName.action="SaveInsertBj_khwntcmc.jsp";
	FormName.submit();

	if ("<%=zcsfxxz%>"=="2")//�ֹ�ѡ��
	{
		FormName.xzmx.disabled=false;
	}
	return true;
}

function f_xzmx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tcmc)=="") {
		alert("��ѡ��[�ײ�����]��");
		FormName.tcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("��ѡ��[����]��");
		FormName.hxbm.focus();
		return false;
	}

	window.open("Bj_wntczcmxList.jsp?khbh=<%=khbh%>&dqbm=<%=dqbm%>&hxbm=<%=hxbm%>&tcmc=<%=java.net.URLEncoder.encode(tcmc,"UTF-8")%>&lx=<%=lx%>");
}
//-->
</SCRIPT>
