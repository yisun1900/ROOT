<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cgbm=null;
String tggdbm=null;
String tgjsbm=null;
String lsj=null;
String yhj=null;
String wherecgbm=cf.GB2Uni(request.getParameter("cgbm"));
String wheretggdbm=cf.GB2Uni(request.getParameter("tggdbm"));
String wheretgjsbm=cf.GB2Uni(request.getParameter("tgjsbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cgbm,tggdbm,tgjsbm,lsj,yhj ";
	ls_sql+=" from  jc_tgjgb";
	ls_sql+=" where  (cgbm='"+wherecgbm+"') and  (tggdbm='"+wheretggdbm+"') and  (tgjsbm='"+wheretgjsbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgbm=cf.fillNull(rs.getString("cgbm"));
		tggdbm=cf.fillNull(rs.getString("tggdbm"));
		tgjsbm=cf.fillNull(rs.getString("tgjsbm"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">���޸ĵع�۸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_tgjgb.jsp" name="editform">
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
    <div align="right">�������</div>
  </td>
  <td width="35%"> 
    <input type="text" name="cgbm" size="20" maxlength="5"  value="<%=cgbm%>" readonly>
  </td>
  <td width="15%"> 
                <div align="right"></div>
  </td>
              <td width="35%">&nbsp; </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">�ع�߶�����</div>
  </td>
              <td width="35%">
                <select name="tggdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tggdbm,tggdmc from jdm_tggdbm order by tggdbm",tggdbm);
%> 
                </select>
              </td>
  <td width="15%"> 
                <div align="right">�ع��������</div>
  </td>
              <td width="35%">
                <select name="tgjsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tgjsbm,tgjsmc from jdm_tgjsbm order by tgjsbm",tgjsbm);
%> 
                </select>
              </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="15%"> 
                <div align="right">���ۼ�</div>
  </td>
              <td width="35%">
                <input type="text" name="lsj" size="20" maxlength="9"  value="<%=lsj%>" >
              </td>
  <td width="15%"> 
                <div align="right">�Żݼ�</div>
  </td>
  <td width="35%">
                <input type="text" name="yhj" size="20" maxlength="9"  value="<%=yhj%>" >
              </td>
</tr>
<input type="hidden" name="wherecgbm"  value="<%=wherecgbm%>" >
<input type="hidden" name="wheretggdbm"  value="<%=wheretggdbm%>" >
<input type="hidden" name="wheretgjsbm"  value="<%=wheretgjsbm%>" >
	    <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
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
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�������]��");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tggdbm)=="") {
		alert("��ѡ��[�ع�߶�����]��");
		FormName.tggdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tgjsbm)=="") {
		alert("��ѡ��[�ع��������]��");
		FormName.tgjsbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("������[���ۼ�]��");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "���ۼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.yhj)=="") {
		alert("������[�Żݼ�]��");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "�Żݼ�"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
