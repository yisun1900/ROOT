<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String kpr=null;
String kpsj=null;
String kplx=null;
String bz=null;
String wherekpxh=cf.GB2Uni(request.getParameter("kpxh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select khbh,kpr,kpsj,kplx,bz ";
	ls_sql+=" from  kp_gczljcb";
	ls_sql+=" where  (kpxh='"+wherekpxh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		kpr=cf.fillNull(rs.getString("kpr"));
		kpsj=cf.fillNull(rs.getDate("kpsj"));
		kplx=cf.fillNull(rs.getString("kplx"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
	}
	rs.close();


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
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"> ���̿�����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_gczljcb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#000099">�ͻ����</font></div>
              </td>
              <td width="35%"><%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#000099">ʵ��������</font></div>
              </td>
              <td width="35%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">�ͻ�����</font></td>
              <td width="35%"><%=khxm%></td>
              <td width="15%" align="right"><font color="#000099">��ϵ��ʽ</font></td>
              <td width="35%"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">���ݵ�ַ</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#000099">�������</font></div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpxh" value="<%=wherekpxh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="kplx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+�ʼ�Ա&2+Ѳ��Ա&3+��˾���",kplx);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpr" size="20" maxlength="20"  value="<%=kpr%>" >
              </td>
              <td width="15%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="kpsj" size="20" maxlength="10"  value="<%=kpsj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekpxh"  value="<%=wherekpxh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center">
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="button"  value="¼�뿼����Ŀ" onClick="window.open('yrk_lrxxmain.jsp?kpxh=<%=wherekpxh%>')" name="lr" >
                  <input type="button"  value="�鿴������Ŀ" onClick="window.open('Kp_jcmxbList.jsp?kpxh=<%=wherekpxh%>')" name="cx">
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
	if(	javaTrim(FormName.kpr)=="") {
		alert("������[������]��");
		FormName.kpr.focus();
		return false;
	}
	if(	javaTrim(FormName.kpsj)=="") {
		alert("������[����ʱ��]��");
		FormName.kpsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kpsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kplx)=="") {
		alert("��ѡ��[��������]��");
		FormName.kplx.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
