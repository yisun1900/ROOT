<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpxmbm=null;
String kpxmmc=null;
String kpdlbm=null;
String kpjg=null;
String kpjgdy=null;
String kpkfbm=null;
String sgdfk=null;
String kpcfbm=null;
String wherekpxmbm=cf.GB2Uni(request.getParameter("kpxmbm"));
String wherekpjg=cf.GB2Uni(request.getParameter("kpjg"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select kpxmbm,kpxmmc,kpdlbm,kpjg,kpjgdy,kpkfbm,kpcfbm,sgdfk ";
	ls_sql+=" from  kp_gckpxm";
	ls_sql+=" where  (kpxmbm='"+wherekpxmbm+"') and  (kpjg='"+wherekpjg+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpxmbm=cf.fillNull(rs.getString("kpxmbm"));
		kpxmmc=cf.fillNull(rs.getString("kpxmmc"));
		kpdlbm=cf.fillNull(rs.getString("kpdlbm"));
		kpjg=cf.fillNull(rs.getString("kpjg"));
		kpjgdy=cf.fillNull(rs.getString("kpjgdy"));
		kpkfbm=cf.fillNull(rs.getString("kpkfbm"));
		kpcfbm=cf.fillNull(rs.getString("kpcfbm"));
		sgdfk=cf.fillNull(rs.getString("sgdfk"));
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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_gckpxm.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������Ŀ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpxmbm" size="20" maxlength="4"  value="<%=kpxmbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">������Ŀ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpxmmc" size="20" maxlength="50"  value="<%=kpxmmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="kpdlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpdlbm,kpdlmc from kp_kpdlbm order by kpdlbm",kpdlbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">���س̶�</div>
              </td>
              <td width="35%"> 
                <select name="kpjg" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,ydcdmc from kp_sgdyzcdbm order by yzcdbm",kpjg);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�۷�</div>
              </td>
              <td width="35%"> 
                <select name="kpkfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpkfbm,kpkfmc from kp_kpkfbm order by kpkfbm",kpkfbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <select name="kpcfbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kpcfbm,kpcfmc from kp_kpcfbm order by kpcfbm",kpcfbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">����</td>
              <td width="35%"> 
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="16" >
              </td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">���س̶ȶ���</td>
              <td colspan="3"> 
                <textarea name="kpjgdy" cols="71" rows="5"><%=kpjgdy%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekpxmbm"  value="<%=wherekpxmbm%>" >
            <input type="hidden" name="wherekpjg"  value="<%=wherekpjg%>" >
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
	if(	javaTrim(FormName.kpxmbm)=="") {
		alert("������[������Ŀ����]��");
		FormName.kpxmbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpxmmc)=="") {
		alert("������[������Ŀ����]��");
		FormName.kpxmmc.focus();
		return false;
	}
	if(	javaTrim(FormName.kpdlbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.kpdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.kpjg)=="") {
		alert("��ѡ��[���س̶�]��");
		FormName.kpjg.focus();
		return false;
	}
	if(	javaTrim(FormName.kpkfbm)=="") {
		alert("��ѡ��[�۷�]��");
		FormName.kpkfbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("��ѡ��[����]��");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.kpjgdy)=="") {
		alert("������[���س̶ȶ���]��");
		FormName.kpjgdy.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
