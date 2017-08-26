<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gtpjbh=null;
String gtpjmc=null;
String xinghao=null;
String guige=null;
String dj=null;
String bz=null;
String jjpjflbm=null;
String jldwbm=null;
String wheregtpjbh=cf.GB2Uni(request.getParameter("gtpjbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gtpjbh,gtpjmc,xinghao,guige,dj,bz,jjpjflbm,jldwbm ";
	ls_sql+=" from  jc_jjpjbj";
	ls_sql+=" where  (gtpjbh='"+wheregtpjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gtpjbh=cf.fillNull(rs.getString("gtpjbh"));
		gtpjmc=cf.fillNull(rs.getString("gtpjmc"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		guige=cf.fillNull(rs.getString("guige"));
		dj=cf.fillNull(rs.getString("dj"));
		bz=cf.fillNull(rs.getString("bz"));
		jjpjflbm=cf.fillNull(rs.getString("jjpjflbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditJc_jjpjbj.jsp" name="editform">
  <div align="center">���޸ļҾ��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">������</td>
      <td width="35%"> 
        <input type="text" name="gtpjbh" size="20" maxlength="4"  value="<%=gtpjbh%>" >
      </td>
      <td align="right" width="15%">����</td>
      <td width="35%"> 
        <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�������</td>
      <td colspan="3"> 
        <input type="text" name="gtpjmc" size="73" maxlength="50"  value="<%=gtpjmc%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�������</td>
      <td width="35%"> 
        <select name="jjpjflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jjpjflbm,jjpjflmc from jdm_jjpjflbm order by jjpjflbm",jjpjflbm);
%> 
        </select>
      </td>
      <td align="right" width="15%">������λ</td>
      <td width="35%"> 
        <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwmc",jldwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">�ͺ�</td>
      <td colspan="3"> 
        <input type="text" name="xinghao" size="73" maxlength="50"  value="<%=xinghao%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">���</td>
      <td colspan="3"> 
        <input type="text" name="guige" size="73" maxlength="50"  value="<%=guige%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="15%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <input type="hidden" name="wheregtpjbh"  value="<%=wheregtpjbh%>" >
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
	if(	javaTrim(FormName.gtpjbh)=="") {
		alert("������[������]��");
		FormName.gtpjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gtpjmc)=="") {
		alert("������[�������]��");
		FormName.gtpjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("������[����]��");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.jjpjflbm)=="") {
		alert("��ѡ��[�������]��");
		FormName.jjpjflbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
