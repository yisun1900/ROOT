<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xh=null;
String gysbm=null;
String lxrxm=null;
String zw=null;
String sj=null;
String bgdh=null;
String cz=null;
String sflz=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xh,gysbm,lxrxm,zw,sj,bgdh,cz,sflz,bz ";
	ls_sql+=" from  jxc_gyslxr";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		lxrxm=cf.fillNull(rs.getString("lxrxm"));
		zw=cf.fillNull(rs.getString("zw"));
		sj=cf.fillNull(rs.getString("sj"));
		bgdh=cf.fillNull(rs.getString("bgdh"));
		cz=cf.fillNull(rs.getString("cz"));
		sflz=cf.fillNull(rs.getString("sflz"));
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
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJxc_gyslxr.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��Ӧ�̱���</td> 
  <td colspan="3"><select name="gysbm" style="FONT-SIZE:12PX;WIDTH:522PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select gysbm,gysmc from jxc_gysxx order by gysmc",gysbm);
%>
    </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ϵ������</td> 
  <td width="32%"> 
    <input type="text" name="lxrxm" size="20" maxlength="20"  value="<%=lxrxm%>" >  </td>
  <td align="right" width="18%">�Ƿ���ְ</td> 
  <td width="32%"><select name="sflz" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
    <%
	cf.selectToken(out,"Y+��ְ&N+��ְ",sflz);
%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ְ��</td>
  <td colspan="3"><input type="text" name="zw" size="73" maxlength="50"  value="<%=zw%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ֻ�</td>
  <td colspan="3"><input type="text" name="sj" size="73" maxlength="50"  value="<%=sj%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�칫�绰</td>
  <td colspan="3"><input type="text" name="bgdh" size="73" maxlength="50"  value="<%=bgdh%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����</td>
  <td colspan="3"><input type="text" name="cz" size="73" maxlength="50"  value="<%=cz%>" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
<input type="hidden" name="wherexh"  value="<%=wherexh%>" >
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="xh" size="10" maxlength="8"  value="<%=xh%>" >
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
	if(	javaTrim(FormName.xh)=="") {
		alert("������[���]��");
		FormName.xh.focus();
		return false;
	}
	if(!(isNumber(FormName.xh, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.gysbm)=="") {
		alert("������[��Ӧ�̱���]��");
		FormName.gysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.gysbm, "��Ӧ�̱���"))) {
		return false;
	}
	if(	javaTrim(FormName.lxrxm)=="") {
		alert("������[��ϵ������]��");
		FormName.lxrxm.focus();
		return false;
	}
	if(	javaTrim(FormName.zw)=="") {
		alert("������[ְ��]��");
		FormName.zw.focus();
		return false;
	}
	if(	javaTrim(FormName.sflz)=="") {
		alert("������[�Ƿ���ְ]��");
		FormName.sflz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
