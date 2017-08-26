<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String blxhbm=null;
String dj=null;
String bzdj=null;
String sl=null;
String zjhsl=null;
String bz=null;
String lrxh=cf.GB2Uni(request.getParameter("lrxh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String dqbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String lx=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,blxhbm,dj,bzdj,sl,zjhsl,bz ";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		blxhbm=cf.fillNull(rs.getString("blxhbm"));
		dj=cf.fillNull(rs.getString("dj"));
		bzdj=cf.fillNull(rs.getString("bzdj"));
		sl=cf.fillNull(rs.getString("sl"));
		zjhsl=cf.fillNull(rs.getString("zjhsl"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from jc_mmydd,sq_dwxx ";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select lx";
	ls_sql+=" from  jc_blzjxmx";
	ls_sql+=" where zjxxh='"+zjxxh+"' and lrxh="+lrxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		lx=rs.getString(1);
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
      <div align="center">���޸Ĳ�����������ϸ����������ţ�<%=zjxxh%>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_blddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�����ͺ�</td>
              <td colspan="3">
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:520PX" onChange="changelx(editform)">
                  <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select blxhbm,blxh||'��'||blyt||'��'||'��:'||jg from jc_blbj,jdm_blytbm where jc_blbj.blytbm=jdm_blytbm.blytbm(+) and jc_blbj.dqbm='"+dqbm+"' order by blxhbm",blxhbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">����</font></td>
              <td width="35%">
                <input type="text" name="dj" size="20" maxlength="9"  value="<%=bzdj%>" readonly></td>
              <td width="15%" align="right">��������</td>
              <td width="35%">
                <input type="text" name="zjhsl" size="20" maxlength="8"  value="<%=zjhsl%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td height="2" colspan="4" align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
              <input type="reset"  value="����">
              <input type="hidden" name="lx"  value="<%=lx%>" >
              <input type="hidden" name="lrxh"  value="<%=lrxh%>" >
              <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
              <input type="hidden" name="yddbh" value="<%=yddbh%>"></td>
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
function changelx(FormName)//����FormName:Form������
{
	FormName.dj.value=FormName.blxhbm.options[FormName.blxhbm.selectedIndex].text.substring(FormName.blxhbm.options[FormName.blxhbm.selectedIndex].text.indexOf(":")+1);
}
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.blxhbm)=="") {
		alert("��ѡ��[�����ͺ�]��");
		FormName.blxhbm.focus();
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
	if(	javaTrim(FormName.zjhsl)=="") {
		alert("������[����������]��");
		FormName.zjhsl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjhsl, "����������"))) {
		return false;
	}
	if (parseFloat(FormName.zjhsl.value)<=0)
	{
		alert("����[����]�������0��");
		FormName.zjhsl.select();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
