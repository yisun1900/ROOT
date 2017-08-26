<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cpjjbh=null;
String cpjjfg=null;
String cpjjmc=null;
String xh=null;
String gg=null;
String cpjjxl=null;
String cpjjcz=null;
String dj=null;
String cktp=null;
String cptp=null;
String cpsm=null;
String dqbm=null;
String bz=null;
String wherecpjjbh=cf.GB2Uni(request.getParameter("cpjjbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select cpjjbh,cpjjfg,cpjjmc,xh,gg,cpjjxl,cpjjcz,dj,cktp,cptp,cpsm,dqbm,bz ";
	ls_sql+=" from  jc_cpjjbj";
	ls_sql+=" where  (cpjjbh='"+wherecpjjbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cpjjbh=cf.fillNull(rs.getString("cpjjbh"));
		cpjjfg=cf.fillNull(rs.getString("cpjjfg"));
		cpjjmc=cf.fillNull(rs.getString("cpjjmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		cpjjxl=cf.fillNull(rs.getString("cpjjxl"));
		cpjjcz=cf.fillNull(rs.getString("cpjjcz"));
		dj=cf.fillNull(rs.getString("dj"));
		cktp=cf.fillNull(rs.getString("cktp"));
		cptp=cf.fillNull(rs.getString("cptp"));
		cpsm=cf.fillNull(rs.getString("cpsm"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<form method="post" action="" name="editform" target="_blank">
  <div align="center">���޸ĳ�Ʒ�Ҿ߱���</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>����</td>
      <td width="31%"> 
        <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' order by dqbm",dqbm);
%> 
        </select>
      </td>
      <td align="right" width="21%"><font color="#CC0000">*</font>���</td>
      <td width="29%"> 
        <select name="cpjjfg" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjfg c1,cpjjfg c2 from jdm_cpjjfg order by cpjjfg",cpjjfg);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>��Ʒ�Ҿ߱�ţ�4λ��</td>
      <td width="31%"> 
        <input type="text" name="cpjjbh" size="20" maxlength="4"  value="<%=cpjjbh%>" >
      </td>
      <td align="right" width="21%"><font color="#CC0000">*</font>����</td>
      <td width="29%"> 
        <select name="cpjjmc" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjmc c1,cpjjmc c2 from jdm_cpjjmc order by cpjjmc",cpjjmc);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>�ͺ�</td>
      <td width="31%"> 
        <input type="text" name="xh" size="20" maxlength="50"  value="<%=xh%>" >
      </td>
      <td align="right" width="21%"><font color="#CC0000">*</font>���</td>
      <td width="29%"> 
        <input type="text" name="gg" size="20" maxlength="50"  value="<%=gg%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>ϵ������</td>
      <td width="31%"> 
        <select name="cpjjxl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjxl c1,cpjjxl c2 from jdm_cpjjxl order by cpjjxl",cpjjxl);
%> 
        </select>
      </td>
      <td align="right" width="21%"><font color="#CC0000">*</font>����</td>
      <td width="29%"> 
        <select name="cpjjcz" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cpjjcz c1,cpjjcz c2 from jdm_cpjjcz order by cpjjcz",cpjjcz);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%"><font color="#CC0000">*</font>����</td>
      <td width="31%">
        <input type="text" name="dj" size="20" maxlength="17"  value="<%=dj%>" >
      </td>
      <td align="right" width="21%">&nbsp;</td>
      <td width="29%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">�ο�ͼƬ</td>
      <td width="31%"> 
        <input type="text" name="cktp" size="20" maxlength="50"  value="<%=cktp%>" >
      </td>
      <td align="right" width="21%">��ƷͼƬ</td>
      <td width="29%"> 
        <input type="text" name="cptp" size="20" maxlength="50"  value="<%=cptp%>" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��Ʒ˵��</td>
      <td colspan="3"> 
        <textarea name="cpsm" cols="74" rows="7"><%=cpsm%></textarea>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="19%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="74" rows="3"><%=bz%></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
          <input type="button"  value="�ϴ���Ƭ" onClick="f_do1(editform)" name="button">
          <input type="button"  value="�鿴��Ƭ" onClick="f_do2(editform)" name="button">
			<input type="hidden" name="wherecpjjbh"  value="<%=wherecpjjbh%>" >
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
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[����]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjfg)=="") {
		alert("��ѡ��[���]��");
		FormName.cpjjfg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjbh)=="") {
		alert("������[��Ʒ�Ҿ߱�ţ�4λ��]��");
		FormName.cpjjbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjmc)=="") {
		alert("��ѡ��[����]��");
		FormName.cpjjmc.focus();
		return false;
	}
	if(	javaTrim(FormName.xh)=="") {
		alert("������[�ͺ�]��");
		FormName.xh.focus();
		return false;
	}
	if(	javaTrim(FormName.gg)=="") {
		alert("������[���]��");
		FormName.gg.focus();
		return false;
	}
	if(	javaTrim(FormName.cpjjcz)=="") {
		alert("��ѡ��[����]��");
		FormName.cpjjcz.focus();
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

	FormName.action="SaveEditJc_cpjjbj.jsp";
	FormName.submit();
	return true;
}

function f_do1(FormName)//����FormName:Form������
{
	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//����FormName:Form������
{
	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
