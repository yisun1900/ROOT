<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸ģ��ײ�Ʒ��������۱�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String dqbm=null;
String bjjbbm=null;
String bjjbbm1=null;
String tccplbbm=null;
String ppmc=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
bjjbbm1=cf.GB2Uni(request.getParameter("bjjbbm1"));
tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));
ppmc=cf.getParameter(request,"ppmc");

String jldw=null;
String sjcj=null;

String yxkssj=null;
String yxjzsj=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select jldw,sjcj,yxkssj,yxjzsj ";
	ls_sql+=" from  tckd_tcppsjcjb";
	ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and bjjbbm1='"+bjjbbm1+"' and tccplbbm='"+tccplbbm+"' and ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jldw=cf.fillNull(rs.getString("jldw"));
		sjcj=cf.fillNull(rs.getString("sjcj"));

		yxkssj=cf.fillNull(rs.getDate("yxkssj"));
		yxjzsj=cf.fillNull(rs.getDate("yxjzsj"));
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >
<div align="center">�޸ģ��ײ�Ʒ��������۱�</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  
  
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">��Ʒ���</font></td>
    <td><select name="tccplbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectItem(out,"select clxlbm,clxlmc from jxc_clxlbm where clxlbm='"+tccplbbm+"' order by clxlmc","");
%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">����</font></td>
    <td><select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"' ","");
%>
    </select></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">ԭ���ۼ���</font></td>
    <td><select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where  bjjbbm='"+bjjbbm+"'","");
	%>
    </select></td>
    <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�������ۼ���</font></td>
    <td><select name="bjjbbm1" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
		cf.selectItem(out,"select bjjbbm,bjjbmc from jdm_bjjbbm where  bjjbbm='"+bjjbbm1+"'","");
%>
    </select></td>
  </tr>
  
  <tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">������λ</font></td> 
  <td width="32%"><select name="jldw" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm where jldwmc='"+jldw+"'",jldw);
%>
  </select></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
  
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>��Ч��ʼʱ��</td>
    <td bgcolor="#E8E8FF"><input type="text" name="yxkssj" value="<%=yxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>��Ч����ʱ��</td>
    <td bgcolor="#E8E8FF"><input type="text" name="yxjzsj" value="<%=yxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>Ʒ��</td>
    <td bgcolor="#E8E8FF"><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
      <option value=""></option>
      <%
	cf.selectItem(out,"select ppmc c1,ppmc c2 from jxc_ppxx where pplb in('1','3') order by ppmc",ppmc);
%>
    </select></td>
    <td align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>�������</td>
    <td bgcolor="#E8E8FF"><input type="text" name="sjcj" value="<%=sjcj%>" size="20" maxlength="17" ></td>
  </tr>
  

    <tr align="center"> 
      <td colspan="4"> 
	<input type="hidden" name="whereppmc"  value="<%=ppmc%>" >
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input type="reset"  value="����" name="reset"></td>
    </tr>
</table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
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
	if(	javaTrim(FormName.tccplbbm)=="") {
		alert("��ѡ��[��Ʒ���]��");
		FormName.tccplbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("��ѡ��[ԭ���ۼ���]��");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm1)=="") {
		alert("��ѡ��[�������ۼ���]��");
		FormName.bjjbbm1.focus();
		return false;
	}
	if(	javaTrim(FormName.jldw)=="") {
		alert("��ѡ��[������λ]��");
		FormName.jldw.focus();
		return false;
	}


	if(	javaTrim(FormName.yxkssj)=="") {
		alert("������[��Ч��ʼʱ��]��");
		FormName.yxkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxkssj, "��Ч��ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.yxjzsj)=="") {
		alert("������[��Ч����ʱ��]��");
		FormName.yxjzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxjzsj, "��Ч����ʱ��"))) {
		return false;
	}
	if (FormName.yxkssj.value>FormName.yxjzsj.value)
	{
		alert("[��Ч��ʼʱ��]���ܴ���[��Ч����ʱ��]��");
		FormName.yxjzsj.select();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("��ѡ��[Ʒ��]��");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("������[�������]��");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "�������"))) {
		return false;
	}

	FormName.action="SaveEditTckd_tcppsjcjb.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
