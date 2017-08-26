<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ygbh=null;
String sjd=null;
String gzdwbm=null;
String drzw=null;
String dwdh=null;
String zmr=null;
String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
String wheresjd=cf.getParameter(request,"sjd");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ygbh,sjd,gzdwbm,drzw,dwdh,zmr ";
	ls_sql+=" from  rs_gzjl";
	ls_sql+=" where  (ygbh="+whereygbh+") and  (sjd='"+wheresjd+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ygbh=cf.fillNull(rs.getString("ygbh"));
		sjd=cf.fillNull(rs.getString("sjd"));
		gzdwbm=cf.fillNull(rs.getString("gzdwbm"));
		drzw=cf.fillNull(rs.getString("drzw"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		zmr=cf.fillNull(rs.getString("zmr"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
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
<title>�޸Ĺ�������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditRs_gzjl.jsp" name="editform">
<div align="center">�޸Ĺ�������</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%"><font color="#000ff">Ա�����</font></td>
      <td width="35%"> 
        <input type="text" name="ygbh" size="20" maxlength="8"  value="<%=ygbh%>" readonly>
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">ʱ���</td>
      <td colspan="3"> 
        <input type="text" name="sjd" size="50" maxlength="50"  value="<%=sjd%>" >
        <font color="#FF0000">�������κη�ʽ��ʾʱ��Σ�</font> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������λ�β���</td>
      <td colspan="3">
        <input type="text" name="gzdwbm" size="73" maxlength="100"  value="<%=gzdwbm%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">����ְ��</td>
      <td width="35%">
        <input type="text" name="drzw" size="20" maxlength="50"  value="<%=drzw%>" >
      </td>
      <td align="right" width="15%">֤����</td>
      <td width="35%">
        <input type="text" name="zmr" size="20" maxlength="20"  value="<%=zmr%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��λ�绰</td>
      <td width="35%"> 
        <input type="text" name="dwdh" size="20" maxlength="50"  value="<%=dwdh%>" >
      </td>
      <td align="right" width="15%">&nbsp;</td>
      <td width="35%">&nbsp; </td>
    </tr>
    <input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
    <input type="hidden" name="wheresjd"  value="<%=wheresjd%>" >
    <tr> 
      <td colspan="4" height="2"> &nbsp; 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
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
	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjd)=="") {
		alert("������[ʱ���]��");
		FormName.sjd.focus();
		return false;
	}
	if(	javaTrim(FormName.gzdwbm)=="") {
		alert("������[������λ�β���]��");
		FormName.gzdwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.drzw)=="") {
		alert("������[����ְ��]��");
		FormName.drzw.focus();
		return false;
	}
	if(	javaTrim(FormName.dwdh)=="") {
		alert("������[��λ�绰]��");
		FormName.dwdh.focus();
		return false;
	}
	if(	javaTrim(FormName.zmr)=="") {
		alert("������[֤����]��");
		FormName.zmr.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
