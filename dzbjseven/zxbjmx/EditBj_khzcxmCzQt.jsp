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
.STYLE3 {color: #0000CC}
-->
</style>
</head>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sxh=cf.GB2Uni(request.getParameter("sxh"));


String cpbm=null;
String nbbm=null;
String bjjbbm=null;
String tccpdlbm=null;
String tccplbbm=null;
String ppmc=null;
String cpmc=null;
String xh=null;
String gg=null;
String jldw=null;
String xdjldw=null;
String ptcpsm=null;
String jgwzbm=null;
double sl=0;
double dj=0;
String slStr="";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cpbm,nbbm,tccpdlbm,tccplbbm,bjjbbm,ppmc,cpmc,xh,gg,jldw,xdjldw,ptcpsm,sl,jgwzbm,dj";
	ls_sql+=" from  tc_csrjkhzcqd";
	ls_sql+=" where sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpbm=cf.fillNull(rs.getString("cpbm"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		tccpdlbm=cf.fillNull(rs.getString("tccpdlbm"));
		tccplbbm=cf.fillNull(rs.getString("tccplbbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));
		xdjldw=cf.fillNull(rs.getString("xdjldw"));
		ptcpsm=cf.fillNull(rs.getString("ptcpsm"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
	}
	else{
		out.println("���󣡲����ڣ���ص��������³���");
		return;
	}
	rs.close();
	ps.close();

	if (sl!=0)
	{
		slStr=sl+"";
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
<form method="post" action="SaveEditBj_khzcxmCzQt.jsp" name="insertform">
<div align="center">�޸Ŀͻ�������Ŀ</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE3">�ͻ����</span></td> 
  <td width="32%"> 
    <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>  </td>
  <td align="right" width="18%"><span class="STYLE3">���ۼ���</span></td> 
  <td width="32%"><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjbbm+"'",bjjbbm);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE3">��Ʒ����</span></td>
  <td><select name="tccpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select cldlbm,cldlmc from jxc_cldlbm where cldlbm='"+tccpdlbm+"' order by cldlmc","");
%>
  </select></td>
  <td align="right"><span class="STYLE3">��ƷС��</span></td>
  <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"'",tccplbbm);
%>
  </select></td>
</tr>


<tr bgcolor="#FFFFFF">
  <td align="right">Ʒ��</td>
  <td><%=ppmc%>  </td>
  <td rowspan="8" align="right">��Ƭ</td>
  <td rowspan="8"><img src="\tc\csrjtc\zck\images\<%=nbbm%>.JPG" width="200"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">��Ʒ����</td>
  <td><%=cpmc%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ͺ�</td>
  <td><%=xh%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">���</td>
  <td><%=gg%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������λ</td>
  <td><%=jldw%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td><%=dj%>/<%=xdjldw%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�ṹλ��</td>
  <td>
	<select name="jgwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
		<OPTION value=""></OPTION>    
		<%
		cf.selectItem(out,"select jgwzbm c1,jgwzbm c2 from bj_fjxx where khbh='"+khbh+"' order by jgwzbm",jgwzbm);
	%>
	  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td><input type="text" name="sl" value="<%=slStr%>" size="20" maxlength="17" ></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����˵��</td> 
  <td colspan="3"> 
    <input type="text" name="ptcpsm" value="<%=ptcpsm%>" size="73" maxlength="200" >  </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset">
	<input type="hidden" name="sxh" value="<%=sxh%>">	</td>
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


	if(	javaTrim(FormName.sl)=="") {
		alert("������[����]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "����"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
