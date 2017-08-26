<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String blxhbm=null;
String dj=null;
String sl=null;
String blzjxyybm=null;
String bz=null;
String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,blxhbm,dj,sl,bz,blzjxyybm ";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		blxhbm=cf.fillNull(rs.getString("blxhbm"));
		dj=cf.fillNull(rs.getString("dj"));
		sl=cf.fillNull(rs.getString("sl"));
		blzjxyybm=cf.fillNull(rs.getString("blzjxyybm"));
		bz=cf.fillNull(rs.getString("bz"));
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
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">��������</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveJxJc_blddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">Ԥ�������</font></div>
              </td>
              <td width="25%"> <%=yddbh%> </td>
              <td width="19%"> 
                <div align="right">�����ͺ�</div>
              </td>
              <td width="40%"><%
	cf.selectItem(out,"select blxhbm,blxh||'��:'||jg from jc_blbj order by blxhbm",blxhbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%"> 
                <div align="right"><font color="#0000CC">����</font></div>
              </td>
              <td width="25%"> <%=dj%> </td>
              <td width="19%"> 
                <div align="right">��������</div>
              </td>
              <td width="40%"> <%=sl%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="16%" align="right">��ע</td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="16%"> 
                <div align="right">�����־</div>
              </td>
              <td width="25%"> 
                <input type="radio" name="lx" value="3">
                ���� 
                <input type="radio" name="lx" value="1">
                ��ͬ��</td>
              <td width="19%"> 
                <div align="right">����������ԭ��</div>
              </td>
              <td width="40%"> 
                <select name="blzjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select blzjxyybm,blzjxyymc from jdm_blzjxyybm order by blzjxyybm",blzjxyybm);
%> 
                </select>
              </td>
            </tr>
            <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
            <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
            <tr> 
              <td width="16%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="25%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="19%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="40%" height="2"> 
                <input type="reset"  value="����">
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.lx)) {
		alert("��ѡ��[�����־]��");
		FormName.lx[0].focus();
		return false;
	}
	if (FormName.lx[0].checked)
	{
		if(	javaTrim(FormName.blzjxyybm)=="") {
			alert("������[����������ԭ��]��");
			FormName.blzjxyybm.focus();
			return false;
		}
	}
	else{
		FormName.blzjxyybm.value="";
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
