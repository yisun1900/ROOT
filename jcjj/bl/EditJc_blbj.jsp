<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String lrr=(String)session.getAttribute("yhmc");
	String lrbm=(String)session.getAttribute("dwbh");
%>
<%

String blxhbm=null;
String blxh=null;
String jg=null;
String bllxbm=null;
String blytbm=null;
String zp=null;
String bz=null;
String dqbm=null;
String whereblxhbm=cf.GB2Uni(request.getParameter("blxhbm"));
String wheredqbm=cf.GB2Uni(request.getParameter("dqbm"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select blxhbm,blxh,bllxbm,blytbm,jg,zp,bz,dqbm ";
	ls_sql+=" from  jc_blbj";
	ls_sql+=" where blxhbm='"+whereblxhbm+"' and dqbm='"+wheredqbm+"' ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		blxhbm=cf.fillNull(rs.getString("blxhbm"));
		blxh=cf.fillNull(rs.getString("blxh"));
		bllxbm=cf.fillNull(rs.getString("bllxbm"));
		blytbm=cf.fillNull(rs.getString("blytbm"));
		zp=cf.fillNull(rs.getString("zp"));
		jg=cf.fillNull(rs.getString("jg"));
		bz=cf.fillNull(rs.getString("bz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
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

<form method="post" action="" name="editform" target='_blank'>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000FF">�����ͺű���</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="blxhbm" size="20" maxlength="2"  value="<%=blxhbm%>" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>��������</div>
              </td>
              <td width="33%"> 
                <input type="text" name="blxh" size="20" maxlength="50"  value="<%=blxh%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>��������</div>
              </td>
              <td width="33%"> 
                <select name="bllxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bllxbm,bllxmc from jdm_bllxbm order by bllxbm",bllxbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>�۸�</div>
              </td>
              <td width="33%"> 
                <input type="text" name="jg" size="20" maxlength="9"  value="<%=jg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">������;</td>
              <td width="33%"> 
                <select name="blytbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select blytbm,blyt from jdm_blytbm order by blytbm",blytbm);
%> 
                </select>
              </td>
              <td width="17%" align="right">��Ƭ</td>
              <td width="33%"> 
                <input type="text" name="zp" value="<%=zp%>" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼����</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼��ʱ��</font></div>
              </td>
              <td width="33%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font><font color="#0000CC">¼�벿��</font></td>
              <td width="33%"> 
                <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">��������</font></td>
              <td width="33%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm",dqbm);
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)" name="button2">
                  <input type="reset"  value="����" name="reset">
                  <input type="button"  value="�ϴ���Ƭ" onClick="f_do1(editform)" name="button">
                  <input type="button"  value="�鿴��Ƭ" onClick="f_do2(editform)" name="button">
                </div>
              </td>
            </tr>
            <input type="hidden" name="whereblxhbm"  value="<%=whereblxhbm%>" >
            <input type="hidden" name="wheredqbm"  value="<%=wheredqbm%>" >
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
	if(	javaTrim(FormName.blxhbm)=="") {
		alert("������[�����ͺű���]��");
		FormName.blxhbm.focus();
		return false;
	}
	if(	javaTrim(FormName.blxh)=="") {
		alert("������[��������]��");
		FormName.blxh.focus();
		return false;
	}
	if(	javaTrim(FormName.bllxbm)=="") {
		alert("������[��������]��");
		FormName.bllxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jg)=="") {
		alert("������[�۸�]��");
		FormName.jg.focus();
		return false;
	}
	if(!(isFloat(FormName.jg, "�۸�"))) {
		return false;
	}

	
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.lrbm)=="") {
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}

	FormName.action="SaveEditJc_blbj.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.blxhbm)=="") {
		alert("������[�����ͺű���]��");
		FormName.blxhbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zp)=="") {
		alert("������[��Ƭ]��");
		FormName.zp.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.blxhbm)=="") {
		alert("������[�����ͺű���]��");
		FormName.blxhbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zp)=="") {
		alert("������[��Ƭ]��");
		FormName.zp.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
