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
String ysr=null;
String yssj=null;
String ysjl=null;
String yssm=null;
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
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String whererwbm=cf.GB2Uni(request.getParameter("rwbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,rwbm,rwmc,rwflbm,zdjkrw,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfyxhxgq,sfyxfc,sfxys,sfwlcb,zyrwbm,rwxh,zrr,jddf,jhkssj,jhjssj,jhgzr,jdsyts,sjkssj,sjjssj,sjgzr,ysr,yssj,ysjl,yssm,sfyq,yqts,yqzrf,sfybgd,zgfa,yjzgwcsj,zgsfwc,zgwcsj,sjzgqk,sfyfbd,fbsfwc,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (rwbm='"+whererwbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
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
		ysr=cf.fillNull(rs.getString("ysr"));
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysjl=cf.fillNull(rs.getString("ysjl"));
		yssm=cf.fillNull(rs.getString("yssm"));
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
<form method="post" action="SaveEditCrm_xmrwgl.jsp" name="editform">
<div align="center">����ʵ�����</div>
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
  <td align="right" width="15%"><span class="STYLE1">*</span>������</td> 
  <td width="35%"> 
    <input type="text" name="zrr" size="20" maxlength="50"  value="<%=zrr%>" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>�ڵ�÷�</td> 
  <td width="35%"> 
    <input type="text" name="jddf" size="20" maxlength="8"  value="<%=jddf%>" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>ʵ�ʿ�ʼʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sjkssj" size="20" maxlength="10"  value="<%=sjkssj%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>ʵ�ʽ���ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="sjjssj" size="20" maxlength="10"  value="<%=sjjssj%>" onDblClick="JSCalendar(this)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>ʵ�ʹ�����</td> 
  <td width="35%"> 
    <input type="text" name="sjgzr" size="20" maxlength="8"  value="<%=sjgzr%>" >  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>�ڵ�˳������</td> 
  <td width="35%"><input type="text" name="jdsyts" size="20" maxlength="8"  value="<%=jdsyts%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">������</td>
  <td><input type="text" name="ysr" size="20" maxlength="20"  value="<%=ysr%>" ></td>
  <td align="right">����ʱ��</td>
  <td><input type="text" name="yssj" size="20" maxlength="10"  value="<%=yssj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ս���</td> 
  <td width="35%"><%
	cf.radioToken(out, "ysjl","Y+ͨ��&N+δͨ��",ysjl);
%></td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">����˵��</td> 
  <td colspan="3"> 
    <textarea name="yssm" cols="71" rows="3"><%=yssm%></textarea>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�����</td>
  <td><%
	cf.radioToken(out, "sfyq","Y+��&N+��",sfyq);
%></td>
  <td align="right">��������</td>
  <td><input type="text" name="yqts" size="20" maxlength="8"  value="<%=yqts%>" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�������η�</td> 
  <td width="35%"><input type="text" name="yqzrf" size="20" maxlength="20"  value="<%=yqzrf%>" ></td>
  <td align="right" width="15%">�Ƿ��й��ڱ����</td> 
  <td width="35%"><%
	cf.radioToken(out, "sfybgd","Y+��&N+��",sfybgd);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">���ķ���</td> 
  <td colspan="3"><textarea name="zgfa" cols="71" rows="3"><%=zgfa%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">Ԥ���������ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="yjzgwcsj" size="20" maxlength="10"  value="<%=yjzgwcsj%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="15%">&nbsp;</td> 
  <td width="35%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">�����Ƿ����</td> 
  <td width="35%"><%
	cf.radioToken(out, "zgsfwc","Y+���&N+δ���",zgsfwc);
%></td>
  <td align="right" width="15%">ʵ���������ʱ��</td> 
  <td width="35%"><input type="text" name="zgwcsj" size="20" maxlength="10"  value="<%=zgwcsj%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">ʵ���������</td>
  <td colspan="3"><textarea name="sjzgqk" cols="71" rows="3"><%=sjzgqk%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>�Ƿ��з�����</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "sfyfbd","Y+��&N+��",sfyfbd);
%>  </td>
  <td align="right" width="15%">�����Ƿ����</td> 
  <td width="35%"> 
<%
	cf.radioToken(out, "fbsfwc","Y+���&N+��",fbsfwc);
%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%"><span class="STYLE1">*</span>¼����</td> 
  <td width="35%"> 
    <input type="text" name="lrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>  </td>
  <td align="right" width="15%"><span class="STYLE1">*</span>¼��ʱ��</td> 
  <td width="35%"> 
    <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>¼�벿��</td>
  <td>
	<select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
	  <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%> 
	</select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="15%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea></td>
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
	if(	javaTrim(FormName.zrr)=="") {
		alert("������[������]��");
		FormName.zrr.focus();
		return false;
	}
	if(	javaTrim(FormName.jddf)=="") {
		alert("������[�ڵ�÷�]��");
		FormName.jddf.focus();
		return false;
	}
	if(!(isNumber(FormName.jddf, "�ڵ�÷�"))) {
		return false;
	}
	if(	javaTrim(FormName.jdsyts)=="") {
		alert("������[�ڵ�˳������]��");
		FormName.jdsyts.focus();
		return false;
	}
	if(!(isNumber(FormName.jdsyts, "�ڵ�˳������"))) {
		return false;
	}
	if(	javaTrim(FormName.sjkssj)=="") {
		alert("������[ʵ�ʿ�ʼʱ��]��");
		FormName.sjkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjkssj, "ʵ�ʿ�ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjjssj)=="") {
		alert("������[ʵ�ʽ���ʱ��]��");
		FormName.sjjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sjjssj, "ʵ�ʽ���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.sjgzr)=="") {
		alert("������[ʵ�ʹ�����]��");
		FormName.sjgzr.focus();
		return false;
	}
	if(!(isNumber(FormName.sjgzr, "ʵ�ʹ�����"))) {
		return false;
	}
	if(!(isDatetime(FormName.yssj, "����ʱ��"))) {
		return false;
	}
	if(!(isNumber(FormName.yqts, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.yjzgwcsj, "Ԥ���������ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.zgwcsj, "�������ʱ��"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyq)) {
		alert("��ѡ��[�Ƿ�����]��");
		FormName.sfyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfyfbd)) {
		alert("��ѡ��[�Ƿ��з�����]��");
		FormName.sfyfbd[0].focus();
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

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
