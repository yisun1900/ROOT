<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hfwtbm=null;
String hfwtmc=null;
String hflxbm=null;

String wherehfwtbm=cf.GB2Uni(request.getParameter("hfwtbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hfwtbm,hfwtmc,hflxbm ";
	ls_sql+=" from  dm_hfwtbm";
	ls_sql+=" where  (hfwtbm='"+wherehfwtbm+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hfwtbm=cf.fillNull(rs.getString("hfwtbm"));
		hfwtmc=cf.fillNull(rs.getString("hfwtmc"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditDm_hfwtbm.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
              <td width="18%"> 
                <div align="right">�ط��������</div>  </td>
              <td width="32%"> 
                <input type="text" name="hfwtbm" size="20" maxlength="4"  value="<%=hfwtbm%>" >  </td>
              <td width="18%"> 
                <div align="right">�ط���������</div>  </td>
              <td width="32%"> 
                <input type="text" name="hfwtmc" size="20" maxlength="50"  value="<%=hfwtmc%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
              <td width="18%"> 
                <div align="right">�ط����ͱ���</div>  </td>
              <td width="32%"> 
                <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm order by hflxbm",hflxbm);
%>
    </select>  </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
</tr>
<input type="hidden" name="wherehfwtbm"  value="<%=wherehfwtbm%>" >
	    <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>              </td>
              <td width="32%" height="2"> 
                <input type="reset"  value="����">              </td>
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
	if(	javaTrim(FormName.hfwtbm)=="") {
		alert("������[�ط��������]��");
		FormName.hfwtbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hfwtmc)=="") {
		alert("������[�ط���������]��");
		FormName.hfwtmc.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("��ѡ��[�ط����ͱ���]��");
		FormName.hflxbm.focus();
		return false;
	}
 	FormName.submit();
	return true;
}
//-->
</SCRIPT>
