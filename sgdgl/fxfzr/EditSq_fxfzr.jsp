<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ssfgs=null;
String sgd=null;
String fzrmc=null;
String xb=null;
String dh=null;
String zz=null;
String sfzh=null;
String lx=null;
String bz=null;
String wheressfgs=cf.GB2Uni(request.getParameter("ssfgs"));
String wherefzrmc=cf.getParameter(request,"fzrmc");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ssfgs,sgd,fzrmc,xb,dh,zz,sfzh,lx,bz ";
	ls_sql+=" from  sq_fxfzr";
	ls_sql+=" where  (ssfgs='"+wheressfgs+"') and  (fzrmc='"+wherefzrmc+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		fzrmc=cf.fillNull(rs.getString("fzrmc"));
		xb=cf.fillNull(rs.getString("xb"));
		dh=cf.fillNull(rs.getString("dh"));
		zz=cf.fillNull(rs.getString("zz"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		lx=cf.fillNull(rs.getString("lx"));
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
.STYLE1 {color: #CC0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditSq_fxfzr.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�����ֹ�˾</td> 
  <td width="32%"> 
    <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
    </select>  </td>
  <td align="right" width="17%">ʩ����</td> 
  <td width="33%"><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX" >
    <option value=""></option>
    <%
		cf.selectItem(out,"select sgd,sgdmc||'��'||dwmc||'��' from sq_sgd,sq_dwxx where sq_sgd.ssfgs=sq_dwxx.dwbh and sq_sgd.cxbz='N' and sq_sgd.ssfgs='"+ssfgs+"' order by sq_sgd.ssfgs,sgdmc",sgd);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����������</td>
  <td><input type="text" name="fzrmc" size="20" maxlength="20"  value="<%=fzrmc%>" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�Ա�</td> 
  <td width="32%"> 
<%
	cf.radioToken(out, "xb","M+��&W+Ů",xb);
%>  </td>
  <td align="right" width="17%">�绰</td> 
  <td width="33%"> 
    <input type="text" name="dh" size="20" maxlength="50"  value="<%=dh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">סַ</td> 
  <td width="32%"> 
    <input type="text" name="zz" size="20" maxlength="100"  value="<%=zz%>" >  </td>
  <td align="right" width="17%">���֤��</td> 
  <td width="33%"> 
    <input type="text" name="sfzh" size="20" maxlength="20"  value="<%=sfzh%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>����</td>
  <td colspan="3"><%
	cf.radioToken(out, "lx","1+ľ��&2+���߹�&3+ˮ�繤&4+���Ṥ",lx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="75" rows="2"><%=bz%></textarea></td>
  </tr>
<input type="hidden" name="wheressfgs"  value="<%=wheressfgs%>" >
<input type="hidden" name="wherefzrmc"  value="<%=wherefzrmc%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
/*
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[����ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.fzrmc)=="") {
		alert("������[�����������]��");
		FormName.fzrmc.focus();
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[����]��");
		FormName.lx[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
