<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
%>

<html>
<head>
<title>�ɹ��ƻ���ά��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>


<%

String lx=cf.GB2Uni(request.getParameter("lx"));
if (lx.equals("1"))//��ʾ¼�����ֱ��ת����
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("���̳ɹ���");
	//-->
	</SCRIPT>
	<%
}

String cgjhmc=null;
String cgsqr=null;
String jhkssj=null;
String jhjssj=null;
String jhje=null;
String jhnr=null;
String jhdzt=null;
String ssfgs=null;
String lrr=null;
String lrsj=null;
String shr=null;
String shsj=null;
String shjg=null;
String shnr=null;
String jhfkjd=null;
String bz=null;
String dqbm=null;
String cgjhph=cf.GB2Uni(request.getParameter("cgjhph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select cgjhmc,cgsqr,jhkssj,jhjssj,jhje,jhnr,jhdzt,ssfgs,lrr,lrsj,shr,shsj,shjg,shnr,bz,jhfkjd ";
	ls_sql+=" from  jxc_clcgjh";
	ls_sql+=" where  (cgjhph='"+cgjhph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgjhmc=cf.fillNull(rs.getString("cgjhmc"));
		cgsqr=cf.fillNull(rs.getString("cgsqr"));
		jhje=cf.fillNull(rs.getString("jhje"));
		jhnr=cf.fillNull(rs.getString("jhnr"));
		jhdzt=cf.fillNull(rs.getString("jhdzt"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shjg=cf.fillNull(rs.getString("shjg"));
		shnr=cf.fillNull(rs.getString("shnr"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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
<form method="post" action="" name="insertform" target="_blank">
<div align="center">�ɹ��ƻ���ά�����ɹ��ƻ����ţ�<%=cgjhph%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#CC0000">*</font>������˾</td> 
  <td width="32%">
  <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
	<%
			cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%>
  </select></td>
  <td align="right" width="18%"><font color="#CC0000">*</font>�ɹ�������</td> 
  <td width="32%"><input type="text" name="cgsqr" value="<%=cgsqr%>" size="20" maxlength="20" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>�������</td>
  <td><select name="cllb" style="FONT-SIZE:12PX;WIDTH:152PX">
  <option value="1">����</option>
  </select></td>
  <td align="right"><font color="#CC0000">*</font>�ɹ����</td>
  <td><select name="cglb" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value="J">���Ųɹ�</option>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>�ɹ��ƻ�����</td>
  <td colspan="3"><input type="text" name="cgjhmc" value="<%=cgjhmc%>" size="73" maxlength="50" ></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><span class="STYLE2 STYLE1">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE2"><font color="#CC0000">*</font><span class="STYLE1">¼��ʱ��</span></span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font><font color="#0000CC">¼�벿��</font></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3" ></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="cgjhph"  value="<%=cgjhph%>" >
	  <input type="hidden" name="dqbm" value="<%=dqbm%>" >
	  <input type="button"  value="����" onClick="f_do(insertform)">
	  
	  <input name="button2" type="button" onClick="f_to(insertform)"  value="�깺��ת�ɹ��ƻ�">
	  <input type="button"  value="���ò���¼��" onClick="f_pllr(insertform)" name="pllr">
      <input type="button"  value="ѡ��¼��" onClick="f_cklr(insertform)" name="cklr" >
      <input type="button"  value="�鿴��ϸ" onClick="f_ck(insertform)" name="ckmx" >
      <input type="button"  value=" �� �� " onClick="f_tj(insertform)" name="tj" >
      <input name="button" type="button" onClick="f_print(insertform)"  value="��ӡ�깺��">
      <input type="reset"  value="����">
	</div>      </td>
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
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("������[�ɹ��ƻ�����]��");
		FormName.cgjhph.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[������˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.cgsqr)=="") {
		alert("������[�ɹ�������]��");
		FormName.cgsqr.focus();
		return false;
	}
	if(	javaTrim(FormName.cglb)=="") {
		alert("������[�ɹ����]��");
		FormName.cglb.focus();
		return false;
	}

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�ɹ����]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.cgjhmc)=="") {
		alert("������[�ɹ��ƻ�����]��");
		FormName.cgjhmc.focus();
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
		alert("������[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	FormName.action="SaveEditJxc_clcgjh.jsp";
	FormName.submit();
	return true;
}


function f_to(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("������[�ɹ��ƻ�����]��");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_clsgd.jsp";
	FormName.submit();
	return true;
}

function f_pllr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("������[�ɹ��ƻ�����]��");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="PlLrJxc_clbm.jsp";
	FormName.submit();
	return true;
}


function f_cklr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("������[�ɹ��ƻ�����]��");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="SelectCxJxc_cljgb.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("������[�ɹ��ƻ�����]��");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="EditAllJxc_clbm.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("������[�ɹ��ƻ�����]��");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="tjcgjh.jsp";
	FormName.submit();
	return true;
}
function f_print(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.cgjhph)=="") {
		alert("������[�ɹ��ƻ�����]��");
		FormName.cgjhph.focus();
		return false;
	}

	FormName.action="/jxcdy/printfcsgd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
