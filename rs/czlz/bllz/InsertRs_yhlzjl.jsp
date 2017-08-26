<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrr=(String)session.getAttribute("yhmc");

String yhmc=null;
String bianhao=null;
String sfzh=null;
String xzzwbm=null;
String lzrq=null;
String lzyy=null;
String dwbh=null;
String ssfgs=null;
String lzyyflbm="";
String yysm="";
String sjsjbmc="";

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
String ygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	if (!sqxh.equals(""))
	{
		ls_sql="select ygbh,lzyyflbm,yysm";
		ls_sql+=" from  rs_czsq";
		ls_sql+=" where  (sqxh='"+sqxh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ygbh=cf.fillNull(rs.getString("ygbh"));
			lzyyflbm=cf.fillNull(rs.getString("lzyyflbm"));
			yysm=cf.fillNull(rs.getString("yysm"));
		}
		rs.close();
		ps.close();
	}

	ls_sql="select yhmc,bianhao,sfzh,xzzwbm,lzrq,lzyy,dwbh,ssfgs,sjsjbmc";
	ls_sql+=" from  sq_yhxx,rs_sjsjb";
	ls_sql+=" where sq_yhxx.sjsjb=rs_sjsjb.sjsjb(+) and ygbh='"+ygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));
		lzrq=cf.fillNull(rs.getDate("lzrq"));
		lzyy=cf.fillNull(rs.getString("lzyy"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sjsjbmc=cf.fillNull(rs.getString("sjsjbmc"));
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
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertRs_yhlzjl.jsp" name="insertform" target="_blank">
  <div align="center">Ա����ְ��¼</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">�����ֹ�˾</font></td>
      <td width="34%"> 
        <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
        </select>      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">������λ</font></td>
      <td width="33%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"' ",dwbh);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">Ա�����</font></td>
      <td width="34%"> 
        <input type="text" name="ygbh" value="<%=ygbh%>" size="20" maxlength="8" readonly>      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">����</font></td>
      <td width="33%"> 
        <input type="text" name="bianhao" size="20" maxlength="20"  value="<%=bianhao%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">Ա������</font></td>
      <td width="34%"> 
        <input type="text" name="yhmc" size="20" maxlength="50"  value="<%=yhmc%>" readonly>      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">���֤��</font></td>
      <td width="33%"> 
        <input type="text" name="sfzh" size="20" maxlength="20"  value="<%=sfzh%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">����ְ��</font></td>
      <td width="34%"> 
        <input type="text" name="xzzwbm" size="20" maxlength="50"  value="<%=xzzwbm%>" readonly>      </td>
      <td align="right" width="17%"><font color="#0000CC"><span class="STYLE1">���ʦְ��</span></font></td>
      <td width="33%"><%=sjsjbmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="16%"><font color="#CC0000">*</font>��ְ����</td>
      <td width="34%">
        <input type="radio" name="lzlx" value="S">��ְ
        <input type="radio" name="lzlx" value="T">����      </td>
      <td align="right" width="17%"><font color="#0000CC">��ְ�������</font></td>
      <td width="33%"><input type="text" name="czsqxh" value="<%=sqxh%>" size="20" maxlength="10" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>��ְԭ�����</td>
      <td width="34%"> 
        <select name="lzyyflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <OPTION value=""></OPTION>
          <%
	cf.selectItem(out,"select lzyyflbm,lzyyflmc from dm_lzyyflbm order by lzyyflbm",lzyyflbm);
%> 
        </select>      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font>��ְ����</td>
      <td width="33%"> 
        <input type="text" name="lzrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font>��ְԭ��</td>
      <td colspan="3"> 
        <textarea name="lzyy" cols="73" rows="6"><%=yysm%></textarea>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="16%"><font color="#CC0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="34%"> 
        <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="����" onClick="f_do(insertform)">
        <input type="reset"  value="����" name="reset">      </td>
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
	if(	!radioChecked(FormName.lzlx)) {
		alert("��ѡ��[��ְ����]��");
		FormName.lzlx[0].focus();
		return false;
	}

	if(	javaTrim(FormName.ygbh)=="") {
		alert("������[Ա�����]��");
		FormName.ygbh.focus();
		return false;
	}
	if(!(isNumber(FormName.ygbh, "Ա�����"))) {
		return false;
	}
	if(	javaTrim(FormName.yhmc)=="") {
		alert("������[Ա������]��");
		FormName.yhmc.focus();
		return false;
	}
	if(	javaTrim(FormName.lzrq)=="") {
		alert("������[��ְ����]��");
		FormName.lzrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.lzrq, "��ְ����"))) {
		return false;
	}
	if(	javaTrim(FormName.lzyyflbm)=="") {
		alert("������[��ְԭ�����]��");
		FormName.lzyyflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lzyy)=="") {
		alert("������[��ְԭ��]��");
		FormName.lzyy.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[������λ]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.ssfgs.focus();
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
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
