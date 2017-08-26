<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=null;
String rwbm=null;
String rwmc=null;
String rwflbm=null;
String zdjkrw=null;
String bjlb=null;
String sqtxnr=null;
String sqtxts=null;
String shtxnr=null;
String shtxts=null;
String sfyxhxgq=null;
String sfyxfc=null;
String sfxys=null;
String sfwlcb=null;
String zyrwbm=null;
String rwxh=null;
String zrr=null;
String jddf=null;
String jhkssj=null;
String jhjssj=null;
String jhgzr=null;
String jdsyts=null;
String sjkssj=null;
String sjjssj=null;
String sjgzr=null;
String sfyq=null;
String yqts=null;
String yqzrf=null;
String sfybgd=null;
String zgfa=null;
String yjzgwcsj=null;
String zgsfwc=null;
String zgwcsj=null;
String sjzgqk=null;
String sfyfbd=null;
String fbsfwc=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String sfxtx=null;
String txrq=null;
String txxs=null;
String txnr=null;
String bjjbbm=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,rwbm,rwmc,rwflbm,zdjkrw,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfyxhxgq,sfyxfc,sfxys,sfwlcb,zyrwbm,rwxh,zrr,jddf,jhkssj,jhjssj,jhgzr,jdsyts,sjkssj,sjjssj,sjgzr,sfyq,yqts,yqzrf,sfybgd,zgfa,yjzgwcsj,zgsfwc,zgwcsj,sjzgqk,sfyfbd,fbsfwc,lrr,lrsj,lrbm,bz ";
	ls_sql+=" ,sfxtx,bjjbbm,txxs,txrq,txnr";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		sfxtx=cf.fillNull(rs.getString("sfxtx"));
		txrq=cf.fillNull(rs.getDate("txrq"));
		txxs=cf.fillNull(rs.getString("txxs"));
		txnr=cf.fillNull(rs.getString("txnr"));

		khbh=cf.fillNull(rs.getString("khbh"));
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));
		rwflbm=cf.fillNull(rs.getString("rwflbm"));
		zdjkrw=cf.fillNull(rs.getString("zdjkrw"));
		bjlb=cf.fillNull(rs.getString("bjlb"));
		sqtxnr=cf.fillNull(rs.getString("sqtxnr"));
		sqtxts=cf.fillNull(rs.getString("sqtxts"));
		shtxnr=cf.fillNull(rs.getString("shtxnr"));
		shtxts=cf.fillNull(rs.getString("shtxts"));
		sfyxhxgq=cf.fillNull(rs.getString("sfyxhxgq"));
		sfyxfc=cf.fillNull(rs.getString("sfyxfc"));
		sfxys=cf.fillNull(rs.getString("sfxys"));
		sfwlcb=cf.fillNull(rs.getString("sfwlcb"));
		zyrwbm=cf.fillNull(rs.getString("zyrwbm"));
		rwxh=cf.fillNull(rs.getString("rwxh"));
		zrr=cf.fillNull(rs.getString("zrr"));
		jddf=cf.fillNull(rs.getString("jddf"));
		jhkssj=cf.fillNull(rs.getDate("jhkssj"));
		jhjssj=cf.fillNull(rs.getDate("jhjssj"));
		jhgzr=cf.fillNull(rs.getString("jhgzr"));
		jdsyts=cf.fillNull(rs.getString("jdsyts"));
		sjkssj=cf.fillNull(rs.getDate("sjkssj"));
		sjjssj=cf.fillNull(rs.getDate("sjjssj"));
		sjgzr=cf.fillNull(rs.getString("sjgzr"));
		sfyq=cf.fillNull(rs.getString("sfyq"));
		yqts=cf.fillNull(rs.getString("yqts"));
		yqzrf=cf.fillNull(rs.getString("yqzrf"));
		sfybgd=cf.fillNull(rs.getString("sfybgd"));
		zgfa=cf.fillNull(rs.getString("zgfa"));
		yjzgwcsj=cf.fillNull(rs.getDate("yjzgwcsj"));
		zgsfwc=cf.fillNull(rs.getString("zgsfwc"));
		zgwcsj=cf.fillNull(rs.getDate("zgwcsj"));
		sjzgqk=cf.fillNull(rs.getString("sjzgqk"));
		sfyfbd=cf.fillNull(rs.getString("sfyfbd"));
		fbsfwc=cf.fillNull(rs.getString("fbsfwc"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
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
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveTxSzCrm_xmrwgl.jsp" name="editform">
<div align="center">��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ͻ����</td> 
  <td width="35%"><%=khbh%></td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"><%=rwbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��������</td> 
  <td width="35%"><%=rwmc%></td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
<%
	cf.selectItem(out,"select rwflbm,rwflmc from dm_rwflbm order by rwflbm",rwflbm,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�ص�������</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"1+�ص���&2+���ص���",zdjkrw,true);
%>  </td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"1+��ǰ����&2+�º�����&3+��ǰ�º�����&9+һ���¼",bjlb,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ǰ��������</td> 
  <td width="35%"><%=sqtxnr%></td>
  <td align="right" width="15%">��ǰ��������</td> 
  <td width="35%"><%=sqtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�º���������</td> 
  <td width="35%"><%=shtxnr%></td>
  <td align="right" width="15%">�º���������</td> 
  <td width="35%"><%=shtxts%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ƿ�Ӱ���������</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"Y+��&N+��",sfyxhxgq,true);
%>  </td>
  <td align="right" width="15%">�Ƿ�Ӱ�츴��</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"Y+��&N+��",sfyxfc,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�Ƿ�������</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"Y+��&N+��",sfxys,true);
%>  </td>
  <td align="right" width="15%">�Ƿ�Ϊ��̱�</td> 
  <td width="35%"> 
<%
	cf.radioToken(out,"Y+��&N+��",sfwlcb,true);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">ժҪ����</td> 
  <td width="35%"> 
<%
	cf.selectItem(out,"select zyrwbm,zyrwmc from dm_zyrwbm order by zyrwbm",zyrwbm,true);
%>  </td>
  <td align="right" width="15%">�������</td> 
  <td width="35%"><%=rwxh%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ���ʼʱ��</td>
  <td><%=jhkssj%></td>
  <td align="right">�ƻ�����ʱ��</td>
  <td><%=jhjssj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�ƻ�������</td>
  <td><%=jhgzr%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#FFFFCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>�Ƿ�������</td>
  <td bgcolor="#FFFFCC"><%
	cf.radioToken(out, "sfxtx","Y+������&N+��","Y");
%></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>��������</td>
  <td bgcolor="#FFFFCC">
  <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX"  >
    <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjjbbm,bjjbmc from dm_bjjbbm order by bjjbbm",bjjbbm);
	%>
  </select>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>��������</td>
  <td bgcolor="#FFFFCC"><input type="text" name="txrq" size="20" maxlength="8"  value="<%=txrq%>" onDblClick="JSCalendar(this)"></td>
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>����Сʱ</td>
  <td bgcolor="#FFFFCC"><input type="text" name="txxs" size="20" maxlength="8"  value="<%=txxs%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC"><span class="STYLE1">*</span>��������</td>
  <td colspan="3" bgcolor="#FFFFCC"><textarea name="txnr" cols="71" rows="3"><%=txnr%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
		<input type="hidden" name="whererwbm"  value="<%=whererwbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
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
	if(	!radioChecked(FormName.sfxtx)) {
		alert("��ѡ��[�Ƿ�������]��");
		FormName.sfxtx[0].focus();
		return false;
	}

	if(	javaTrim(FormName.txrq)=="") {
		alert("������[��������]��");
		FormName.txrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.txrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.txxs)=="") {
		alert("������[����Сʱ]��");
		FormName.txxs.focus();
		return false;
	}
	if(!(isNumber(FormName.txxs, "����Сʱ"))) {
		return false;
	}
	if(	javaTrim(FormName.txxs)=="") {
		alert("������[����Сʱ]��");
		FormName.txxs.focus();
		return false;
	}
	if(	javaTrim(FormName.txnr)=="") {
		alert("������[��������]��");
		FormName.txnr.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("������[��������]��");
		FormName.bjjbbm.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
