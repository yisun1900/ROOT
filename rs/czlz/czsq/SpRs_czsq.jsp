<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String shr=(String)session.getAttribute("yhmc");

String fgsbh=null;
String dwbh=null;
String ygbh=null;
String yhmc=null;
String bianhao=null;
String sfzh=null;
String rzsj=null;
String xzzwbm=null;

String lzyyflbm=null;
String yysm=null;

String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sqrq=null;
String clzt=null;
String ztbm=null;

String shjl=null;
String shyj=null;
String spxh=null;
String czsqsplc="";

String sqxh=cf.GB2Uni(request.getParameter("sqxh"));
String spztbm=cf.GB2Uni(request.getParameter("ztbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,ygbh,yhmc,bianhao,sfzh,rzsj,xzzwbm,lzyyflbm,yysm,lrr,lrsj,lrbm,bz,sqrq,clzt,ztbm,shjl,shyj,spxh,shr,shsj";
	ls_sql+=" from  rs_czsq";
	ls_sql+=" where sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		ygbh=cf.fillNull(rs.getString("ygbh"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sfzh=cf.fillNull(rs.getString("sfzh"));
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		xzzwbm=cf.fillNull(rs.getString("xzzwbm"));

		lzyyflbm=cf.fillNull(rs.getString("lzyyflbm"));
		yysm=cf.fillNull(rs.getString("yysm"));

		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		ztbm=cf.fillNull(rs.getString("ztbm"));

		shjl=cf.fillNull(rs.getString("shjl"));
		shyj=cf.fillNull(rs.getString("shyj"));
		spxh=cf.fillNull(rs.getString("spxh"));
	}
	rs.close();
	ps.close();

	if (!ztbm.equals(spztbm))
	{
		out.println("���󣡡�����״̬���Ѹı�");
		return;
	}

	String ztmc=null;
	ls_sql="select ztmc";
	ls_sql+=" from  rs_czsqsplc,rs_ztbm";
	ls_sql+=" where rs_czsqsplc.ztbm=rs_ztbm.ztbm and rs_czsqsplc.sqxh='"+sqxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		ztmc=cf.fillNull(rs.getString("ztmc"));

		czsqsplc+="-->"+ztmc;
	}
	rs.close();
	ps.close();
	if (!czsqsplc.equals(""))
	{
		czsqsplc=czsqsplc.substring(3);
	}
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
<title>����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveSpRs_czsq.jsp" name="editform">
  <div align="center">��ְ������������ְ������ţ�<%=sqxh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">Ա�����</font></td>
      <td width="33%"><%=ygbh%> </td>
      <td align="right" width="17%"><font color="#0000CC">Ա������</font></td>
      <td width="33%"><%=yhmc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">����</font></td>
      <td width="33%"> <%=bianhao%> </td>
      <td align="right" width="17%"><font color="#0000CC">ְ��</font></td>
      <td width="33%"><%=xzzwbm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">���֤��</font></td>
      <td width="33%"><%=sfzh%></td>
      <td align="right" width="17%"><font color="#0000CC">��ְ����</font></td>
      <td width="33%"><%=rzsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">�����ֹ�˾</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh,true);
%> </td>
      <td align="right" width="17%"><font color="#0000CC">��������</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td colspan="4" height="23">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">����״̬</font></td>
      <td width="33%"> <%
	cf.selectToken(out,"00+��������&01+�ȴ�����&02+��������&03+����ͨ��&04+����ȡ��&05+����ְ",clzt,true);
%> </td>
      <td align="right" width="17%"><font color="#0000CC">����״̬</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select ztbm,ztmc from rs_ztbm where ztbm='"+ztbm+"'",ztbm,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">��ְԭ�����</font></td>
      <td width="33%"><%
	cf.selectItem(out,"select lzyyflbm,lzyyflmc from dm_lzyyflbm where lzyyflbm='"+lzyyflbm+"'",lzyyflbm,true);
%></td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">��ְԭ��</font></td>
      <td colspan="3"><%=yysm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">¼����</font></td>
      <td width="33%"><%=lrr%> </td>
      <td align="right" width="17%"><font color="#0000CC">¼��ʱ��</font></td>
      <td width="33%"><%=lrsj%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#0000CC">¼�벿��</font></td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> </td>
      <td align="right" width="17%"><font color="#0000CC">��������</font></td>
      <td width="33%"><%=sqrq%> </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="17%"><font color="#0000CC">��ע</font></td>
      <td colspan="3"><%=bz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><b>��ְ����������</b></td>
      <td colspan="3"><%=czsqsplc%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" colspan="4" height="34">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">�����</font></td>
      <td width="33%"> 
        <input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" readonly>
      </td>
      <td align="right" width="17%"><font color="#CC0000">*</font><font color="#0000CC">���ʱ��</font></td>
      <td width="33%"> 
        <input type="text" name="shsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%"><font color="#CC0000">*</font>��˽���</td>
      <td width="33%"> 
        <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rs_shjlbm.shjl,shjlmc from rs_shjlbm,rs_shztlc where rs_shjlbm.shjl=rs_shztlc.shjl and rs_shztlc.ztbm='"+ztbm+"' order by rs_shjlbm.shjl","");
%> 
        </select>
      </td>
      <td align="right" width="17%">&nbsp;</td>
      <td width="33%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="17%">������</td>
      <td colspan="3"> 
        <textarea name="shyj" cols="73" rows="3"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" > 
        <div align="center"> 
          <input type="hidden" name="sqxh"  value="<%=sqxh%>" >
          <input type="hidden" name="ztbm"  value="<%=ztbm%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
          <input type="reset"  value="����">
        </div>
      </td>
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
	if(	javaTrim(FormName.shr)=="") {
		alert("������[�����]��");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("������[���ʱ��]��");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("��ѡ��[��˽���]��");
		FormName.shjl.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
