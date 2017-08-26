<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String khxm=null;
String fwdz=null;
String lxfs=null;
String ywy=null;
String zt=null;
String sbyybm=null;
String sbyysm=null;
String sbdjr=null;
String sbdjsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String cqbm=null;
String jiedao=null;
String xqbm=null;
String louhao=null;
String ywyssxz=null;
String xqlx=null;
String fwmj=null;
String hxbm=null;
String fj=null;
String khzyxz=null;
String yjzxsj=null;
String jzdsmc=null;
String sfxhf=null;
String xchfsj=null;
String dqbm=null;

String scbkhbh=cf.GB2Uni(request.getParameter("scbkhbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khxm,fwdz,lxfs,ywy,zt,sbyybm,sbyysm,sbdjr,sbdjsj,lrr,lrsj,lrbm,crm_scbkhxx.ssfgs,crm_scbkhxx.bz,cqmc,jiedao,xqbm,louhao,dwmc ywyssxz,xqlx,fwmj,hxmc,fj,khzyxz,yjzxsj,jzdsmc,sfxhf,xchfsj ";
	ls_sql+=" from  crm_scbkhxx,dm_hxbm,sq_dwxx,dm_cqbm";
	ls_sql+=" where  crm_scbkhxx.hxbm=dm_hxbm.hxbm(+) and scbkhbh='"+scbkhbh+"'";
	ls_sql+=" and crm_scbkhxx.ywyssxz=sq_dwxx.dwbh(+) and crm_scbkhxx.cqbm=dm_cqbm.cqbm(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		zt=cf.fillNull(rs.getString("zt"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sbyysm=cf.fillNull(rs.getString("sbyysm"));
		sbdjr=cf.fillNull(rs.getString("sbdjr"));
		sbdjsj=cf.fillNull(rs.getDate("sbdjsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
		cqbm=cf.fillNull(rs.getString("cqmc"));
		jiedao=cf.fillNull(rs.getString("jiedao"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		louhao=cf.fillNull(rs.getString("louhao"));
		ywyssxz=cf.fillNull(rs.getString("ywyssxz"));
		xqlx=cf.fillNull(rs.getString("xqlx"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		hxbm=cf.fillNull(rs.getString("hxmc"));
		fj=cf.fillNull(rs.getString("fj"));
		khzyxz=cf.fillNull(rs.getString("khzyxz"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		jzdsmc=cf.fillNull(rs.getString("jzdsmc"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		xchfsj=cf.fillNull(rs.getDate("xchfsj"));
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

<html>
<head>
<title>ʧ�ܵǼ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveDjCrm_scbkhxx.jsp" name="editform">
<div align="center">�г����ͻ���ʧ�ܵǼ�</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khxm%></td>
    <td align="right"><span class="STYLE2">״̬</span></td>
    <td><%
	cf.radioToken(out, "1+����&2+ʧ��&3+�ƽ�&4+�ѽ���&5+׼���ƽ�&6+׼��ʧ��&7+�ƽ�����",zt,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">��ϵ��ʽ</span></td>
    <td colspan="3"><%=lxfs%></td>
    </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">��������</span></td>
    <td><%=cqbm%></td>
    <td align="right"><span class="STYLE2">�ֵ�</span></td>
    <td><%=jiedao%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">С��</span></td>
    <td><%=xqbm%></td>
    <td align="right"><span class="STYLE2">¥��</span></td>
    <td><%=louhao%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">���ݵ�ַ</span></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">С������</span></td>
    <td><%=xqlx%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=hxbm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�������</span></td>
    <td><%=fwmj%></td>
    <td align="right"><span class="STYLE2">���ۣ�Ԫ/m��</span></td>
    <td><%=fj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ���Դ����</span></td>
    <td><%=khzyxz%></td>
    <td align="right"><span class="STYLE2">Ԥ��װ��ʱ��</span></td>
    <td><%=yjzxsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�Ƿ���ط�</span></td>
    <td><%
	cf.radioToken(out,"Y+��Ҫ&N+��",sfxhf,true);
%>    </td>
    <td align="right"><span class="STYLE2">�´λط�ʱ��</span></td>
    <td><%=xchfsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">������������</span></td>
    <td colspan="3"><%=jzdsmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">ҵ��Ա</span></td>
    <td><%=ywy%> </td>
    <td align="right"><span class="STYLE2">ҵ��Ա����С��</span></td>
    <td><%=ywyssxz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2 STYLE2">¼����</span></td>
    <td><%=lrr%></td>
    <td align="right"><span class="STYLE2">¼��ʱ��</span></td>
    <td><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2 STYLE2">¼�벿��</span></td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%>    </td>
    <td align="right"><span class="STYLE2">�����ֹ�˾</span></td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">��ע</span></td>
    <td colspan="3"><%=bz%></td>
  </tr>
<tr bgcolor="#999999">
  <td colspan="4">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>״̬</td> 
  <td width="32%"> 
   <INPUT name="zt" type="radio" value="2" checked>
   ʧ��   </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>ʧ��ԭ��</td> 
  <td width="32%"> 
    <select name="sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sckhsbyybm order by sbyybm",sbyybm);
%>
    </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ʧ��ԭ��˵��</td>
  <td colspan="3"><textarea name="sbyysm" cols="72" rows="3"><%=sbyysm%></textarea></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">ʧ�ܵǼ���</span></td> 
  <td width="32%"><input type="text" name="sbdjr" size="20" maxlength="20"  value="<%=yhmc%>" readonly></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">ʧ�ܵǼ�ʱ��</span></td> 
  <td width="32%"><input type="text" name="sbdjsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly></td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="hidden" name="scbkhbh"  value="<%=scbkhbh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
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

	if(	javaTrim(FormName.sbyybm)=="") {
		alert("������[ʧ��ԭ��]��");
		FormName.sbyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.sbyysm)=="") {
		alert("������[ʧ��ԭ��˵��]��");
		FormName.sbyysm.focus();
		return false;
	}
	if(	javaTrim(FormName.sbdjr)=="") {
		alert("������[ʧ�ܵǼ���]��");
		FormName.sbdjr.focus();
		return false;
	}
	if(	javaTrim(FormName.sbdjsj)=="") {
		alert("������[ʧ�ܵǼ�ʱ��]��");
		FormName.sbdjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sbdjsj, "ʧ�ܵǼ�ʱ��"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>