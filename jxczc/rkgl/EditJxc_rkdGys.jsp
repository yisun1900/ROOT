<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String ssfgs=(String)session.getAttribute("ssfgs");

String rkph=cf.GB2Uni(request.getParameter("rkph"));

String dqbm=null;
String ckbh=null;
String rksj=null;
String gysmc=null;
String rkcllx=null;
String rklx=null;
String lydh=null;
String rkr=null;
String rkrssbm=null;
String rkrssfgs=null;
String bz=null;
double yf = 0;
double qtfy = 0;

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//��ʾ¼�����ֱ��ת����
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql=" select dqbm,ckbh,rksj,gysmc,rkcllx,rklx,lydh,rkr,rkrssbm,rkrssfgs,bz,yf,qtfy";
	ls_sql+=" from jxc_rkd ";
	ls_sql+=" where rkph='"+rkph+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		ckbh=cf.fillNull(rs.getString("ckbh"));
		rksj=cf.fillNull(rs.getDate("rksj"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		rkcllx=cf.fillNull(rs.getString("rkcllx"));
		rklx=cf.fillNull(rs.getString("rklx"));
		lydh=cf.fillNull(rs.getString("lydh"));
		rkr=cf.fillNull(rs.getString("rkr"));
		rkrssbm=cf.fillNull(rs.getString("rkrssbm"));
		rkrssfgs=cf.fillNull(rs.getString("rkrssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
		yf=rs.getDouble("yf");
		qtfy=rs.getDouble("qtfy");
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
<title>�޸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target='_blank'>
<div align="center">�޸ģ���Ӧ�̶�������⣨������ţ�<%=rkph%>��</div>
<div align="center">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>����</td>
    <td width="32%">
	<select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changedqbm(insertform)">
        <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'  order by dqmc","");
%>
      </select>    </td>
    <td width="18%" align="right"><span class="STYLE1">*</span>���ֿ�</td>
    <td width="32%">
	<select name="ckbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <%
	cf.selectItem(out,"select jxc_ckmc.ckbh,ckmc from jxc_ckmc where jxc_ckmc.ckbh='"+ckbh+"'","");

%>
  </select></td>  
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span>��������</td>
    <td><select name="rkcllx" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value="0">����</option>
    </select></td>
    <td align="right"><span class="STYLE1">*</span>������� </td>
    <td><select name="rklx" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectToken(out,"C+�ɹ����&T+�˻����&R+�������&S+�깺���&J+����ȯ�˻����&D+���Ķ����˻�&F+���������&Z+ֱ�����",rklx,false);
%>
    </select>	  </td>
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>������λ</td> 
  <td colspan="3">
  <select name="gysmc" style="FONT-SIZE:12PX;WIDTH:522PX" >
<%
	String sql="select gysmc c1,gysmc c2 from jxc_rkd where rkph='"+rkph+"'";
	cf.selectItem(out,sql,gysmc);
%>
  </select>	</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Դ����</td> 
  <td colspan="3"><input type="text" name="lydh" value="<%=lydh%>" size="58" maxlength="50" readonly>
�ջ���ǩ�ֵ��ݺ�</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�˷�</td>
  <td><input type="text" name="yf" value="<%=yf%>" size="20" maxlength="16" ></td>
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><input type="text" name="qtfy" value="<%=qtfy%>" size="20" maxlength="16" ></td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�����</span></td>
  <td><input type="text" name="rkr" value="<%=yhmc%>" size="20"  readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">���ʱ��</span></td>
  <td><input type="text" name="rksj" value="<%=cf.today()%>" size="20"  readonly></td>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">��������</span></td>
  <td><select name="rkrssbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'  order by dwbh","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td>
  <td><select name="rkrssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'  order by dwbh","");
%>
</select></td>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3" ><%=bz%></textarea></td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	    <p>
	      <input type="hidden" name="rkph" value="<%=rkph%>"  ><input type="button"  value="��Դ��ת��" onClick="f_to(insertform)"  >
        <input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)" >
        <input type="button"  value=" �� �� " onClick="f_tj(insertform)" >	      
          <input type="button"  value="��ӡ��ⵥ" onClick="f_print(insertform)" name="print"  >
      </p>
      </td>
    </tr>
</table>
<br>
<center>
</center>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rkph)=="") {
		alert("������[�������]��");
		FormName.rkph.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("������[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ckbh)=="") {
		alert("������[���ֿ�]��");
		FormName.ckbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gysmc)=="") {
		alert("������[������λ]��");
		FormName.gysmc.focus();
		return false;
	}

	
	if(	javaTrim(FormName.rkcllx)=="") {
		alert("������[��������]��");
		FormName.rkcllx.focus();
		return false;
	}
	if(	javaTrim(FormName.rklx)=="") {
		alert("������[�������]��");
		FormName.rklx.focus();
		return false;
	}
	if(	javaTrim(FormName.yf)=="") {
		alert("������[�˷�]��");
		FormName.yf.select();
		return false;
	}
	if(!(isFloat(FormName.yf, "�˷�"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfy)=="") {
		alert("������[��������]��");
		FormName.qtfy.select();
		return false;
	}
	if(!(isFloat(FormName.qtfy, "��������"))) {
		return false;
	}

	FormName.action="SaveEditJxc_rkdGys.jsp";
	FormName.submit();
	return true;
}


function f_to(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rkph)=="") {
		alert("������[�������]��");
		FormName.rkph.focus();
		return false;
	}

	if ("<%=rklx%>"=="S")//C���ɹ���⣻T���˻���⣻R��������⣻S���깺��⣻J������ȯ�˻���⣻D�����Ķ����˻���F����������⣻Z��ֱ�����
	{
		FormName.action="SgdToRkd.jsp";
	}
	else if ("<%=rklx%>"=="C")
	{
		FormName.action="GysddToRkd.jsp";
	}
	else if ("<%=rklx%>"=="F")
	{
		FormName.action="CkdToRkd.jsp";
	}
	else{
		FormName.action="GysddToRkd.jsp";
	}

	FormName.submit();
	return true;
}

function f_pllr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rkph)=="") {
		alert("������[�������]��");
		FormName.rkph.focus();
		return false;
	}

	FormName.action="PlInsertJxc_rkmx.jsp";
	FormName.submit();
	return true;
}

function f_cklr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rkph)=="") {
		alert("������[�������]��");
		FormName.rkph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rkph)=="") {
		alert("������[�������]��");
		FormName.rkph.focus();
		return false;
	}

	FormName.action="AllEditRkmx.jsp.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rkph)=="") {
		alert("������[�������]��");
		FormName.rkph.focus();
		return false;
	}

	FormName.action="tjrkd.jsp";
	FormName.submit();
	return true;
}
function f_print(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.rkph)=="") {
		alert("������[�������]��");
		FormName.rkph.focus();
		return false;
	}

	FormName.action="/jxcdy/printzcrkd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>