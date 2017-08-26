<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khr=(String)session.getAttribute("yhmc");

String dwbh=null;
String yhmc=null;
String zw=null;
double byrw=0;
int byqds=0;
double byyj=0;
double dzkhbl=0;
String lrr=null;
String lrsj=null;
String bz=null;
String wherekhzq=cf.GB2Uni(request.getParameter("khzq"));
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dwbh,yhmc,zw,byrw,byqds,byyj,dzkhbl,lrr,lrsj,bz ";
	ls_sql+=" from  cw_jryjkh";
	ls_sql+=" where khzq='"+wherekhzq+"' and ygbh='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwbh=cf.fillNull(rs.getString("dwbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		zw=cf.fillNull(rs.getString("zw"));
		byrw=rs.getDouble("byrw");
		byqds=rs.getInt("byqds");
		byyj=rs.getDouble("byyj");
		dzkhbl=rs.getDouble("dzkhbl");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditKhCw_jryjkh.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">��������</span></td> 
  <td width="32%"> 
    <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">����</span></td> 
  <td width="32%"> 
    <input type="text" name="yhmc" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">ְ��</span></td> 
  <td width="32%"> 
    <select name="zw" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm where zwbm='"+zw+"'",zw);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">��������</span></td> 
  <td width="32%"> 
    <input type="text" name="byrw" size="20" maxlength="17"  value="<%=byrw%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����ǩ����</td>
  <td><input type="text" name="byqds" size="20" maxlength="17"  value="<%=byqds%>" ></td>
  <td align="right"><span class="STYLE1">*</span>����ҵ��</td>
  <td><input type="text" name="byyj" size="20" maxlength="17"  value="<%=byyj%>" onChange="calValue(editform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">���˱���</span></td>
  <td><input type="text" name="dzkhbl" size="10" maxlength="17"  value="<%=dzkhbl%>" readonly>
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">������</span></td>
  <td><input type="text" name="khr" size="20" maxlength="20"  value="<%=khr%>" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">����ʱ��</span></td>
  <td><input type="text" name="khsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wherekhzq"  value="<%=wherekhzq%>" >
	<input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	var dzkhbl=FormName.byyj.value*100.0/FormName.byrw.value*1.0;
	FormName.dzkhbl.value=round(dzkhbl,2);
}    


function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);

	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��������]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[����]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("��ѡ��[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.byrw)=="") {
		alert("������[��������]��");
		FormName.byrw.focus();
		return false;
	}
	if(!(isFloat(FormName.byrw, "��������"))) {
		return false;
	}

	if(	javaTrim(FormName.khr)=="") {
		alert("������[������]��");
		FormName.khr.focus();
		return false;
	}
	if(	javaTrim(FormName.khsj)=="") {
		alert("������[����ʱ��]��");
		FormName.khsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.khsj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
