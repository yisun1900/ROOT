<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String wjbm=null;
String wjmc=null;
String wjlbbm=null;
String xh=null;
String gg=null;
String jldw=null;
String cptz=null;
String cd=null;
String lsj=null;
String yhj=null;
String dwbh=null;
String zp=null;
String bz=null;
String wherewjbm=cf.GB2Uni(request.getParameter("wjbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wjbm,wjmc,wjlbbm,xh,gg,jldw,cptz,cd,lsj,yhj,dwbh,zp,bz ";
	ls_sql+=" from  jc_cgwjbj";
	ls_sql+=" where  (wjbm='"+wherewjbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wjbm=cf.fillNull(rs.getString("wjbm"));
		wjmc=cf.fillNull(rs.getString("wjmc"));
		wjlbbm=cf.fillNull(rs.getString("wjlbbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));
		cptz=cf.fillNull(rs.getString("cptz"));
		cd=cf.fillNull(rs.getString("cd"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zp=cf.fillNull(rs.getString("zp"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
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

<form method="post" action="SaveEditJc_cgwjbj.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="wjbm" size="20" maxlength="5"  value="<%=wjbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbh,gysmc from sq_gysxx order by gysmc",dwbh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�������</td>
              <td colspan="3"> 
                <input type="text" name="wjmc" size="73" maxlength="50"  value="<%=wjmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <select name="wjlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wjlbbm,wjlbmc from jdm_wjlbbm order by wjlbbm",wjlbbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�ͺ�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xh" size="20" maxlength="20"  value="<%=xh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gg" size="20" maxlength="20"  value="<%=gg%>" >
              </td>
              <td width="15%"> 
                <div align="right">������λ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jldw" size="20" maxlength="20"  value="<%=jldw%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ʒ����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cptz" size="20" maxlength="200"  value="<%=cptz%>" >
              </td>
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="cd" size="20" maxlength="20"  value="<%=cd%>" >
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
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��Ƭ</td>
              <td colspan="3"> 
                <input type="text" name="zp" size="73" maxlength="50"  value="<%=zp%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherewjbm"  value="<%=wherewjbm%>" >
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
	if(	javaTrim(FormName.wjbm)=="") {
		alert("������[������]��");
		FormName.wjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wjmc)=="") {
		alert("������[�������]��");
		FormName.wjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.wjlbbm)=="") {
		alert("��ѡ��[������]��");
		FormName.wjlbbm.focus();
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[��������]��");
		FormName.dwbh.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
