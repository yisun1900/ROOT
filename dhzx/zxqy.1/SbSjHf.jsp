<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");
String yhjs=(String)session.getAttribute("yhjs");

String khbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String fwlxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String qtqk=null;
String sbyybm=null;
String sjs=null;
String zxhfsj=null;
String hfjlh=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String lrr=null;
String lrsj=null;
String bz=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String ssfgs=null;
String sbsj=null;
String sbkhlx=null;
String sbyyxs=null;

String zxdjbm=null;

String khfwjlh=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select ssfgs,sjs,zxdjbm,khbh,khxm,xb,fwdz,cqbm,lxfs,fwlxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,zxhfsj,hfjlh,sfxhf,hfrq,hdbz,khlxbm,lrr,lrsj,bz,cgdz,hdr,zxzt ";
	ls_sql+=" ,sbsj,sbkhlx,sbyyxs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where (1=1) and  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sbsj=cf.fillNull(rs.getDate("sbsj"));
		sbkhlx=cf.fillNull(rs.getString("sbkhlx"));
		sbyyxs=cf.fillNull(rs.getString("sbyyxs"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		zxhfsj=cf.fillNull(rs.getDate("zxhfsj"));
		hfjlh=cf.fillNull(rs.getString("hfjlh"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
	}
	rs.close();

	if (zxzt.equals("3"))
	{
		out.println("���󣡸ÿͻ���ǩ��");
		return;
	}



	int count=0;
	ls_sql="select NVL(max(substr(khfwjlh,8,3)),0)";
	ls_sql+=" from  crm_zxkhfwjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	khfwjlh=wherekhbh+cf.addZero(count+1,3);
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
<title>ʧ�ܿͻ�����ط�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<form method="post" action="SaveSbSjHf.jsp" name="selectform">
<div align="center">ʧ�ܿͻ�����ط�</div>
	<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#CCCCCC" cellpadding="2" cellspacing="2">
	  
	  <tr bgcolor="#E8E8FF">
        <td align="right">�ͻ����� </td>
	    <td><%=khxm%></td>
	    <td align="right">�Ա� </td>
	    <td><%
	cf.radioToken(out, "M+��&W+Ů",xb,true);
%></td>
      </tr>
	  <tr bgcolor="#E8E8FF">
        <td align="right"><strong>��ϵ��ʽ</strong></td>
	    <td><%=lxfs%></td>
	    <td align="right"> ���ݵ�ַ </td>
	    <td><%=fwdz%> </td>
      </tr>
	  <tr bgcolor="#E8E8FF">
        <td align="right"> �������� </td>
	    <td><%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%>        </td>
	    <td align="right"> ���ڽ������ </td>
	    <td><%=fwmj%> </td>
      </tr>
	  <tr bgcolor="#E8E8FF">
        <td align="right">��ϵ�ͻ�</td>
	    <td><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></td>
	    <td align="right"> װ��Ԥ�� </td>
	    <td><%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm,true);
%>        </td>
      </tr>
	  
	  <tr bgcolor="#E8E8FF">
        <td align="right">��ѯ����</td>
	    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'",zxdm,true);
%></td>
	    <td align="right">���ʦ</td>
	    <td><%=sjs%></td>
      </tr>
	  <tr bgcolor="#E8E8FF">
        <td align="right">�ص���־</td>
	    <td><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,true);
%></td>
	    <td align="right">�ص���</td>
	    <td><%=hdr%></td>
      </tr>
   
      <tr bgcolor="#E8E8FF">
        <td align="right">��ѯ״̬</td>
        <td><%
	cf.selectToken(out,"0+δ�������&1+�������&2+���ʦ�ύ�ɵ�&3+��ǩԼ&4+�ɵ�&5+�ɵ����δͨ��",zxzt,true);
%></td>
        <td align="right"><strong>ʧ��ʱ��</strong></td>
        <td><%=sbsj%></td>
      </tr>
      <tr bgcolor="#E8E8FF"> 
    <td width="16%" align="right"><strong>ʧ��ԭ��</strong></td>
    <td width="34%"><%
	cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm",sbyybm,true);
%></td>
    <td width="15%" align="right"><strong>ʧ�ܿͻ�����</strong></td>
    <td width="35%"><%=sbkhlx%></td>
  </tr>
      <tr bgcolor="#E8E8FF">
        <td align="right"><strong>ʧ��ԭ������</strong></td>
        <td colspan="3"><%=sbyyxs%></td>
      </tr>
      <tr bgcolor="#E8E8FF"> 
    <td width="16%" align="right">��ע</td>
    <td colspan="3"><%=bz%></td>
  </tr>
     <tr bgcolor="#FFFFFF">
        <td width="16%" align="right"><span class="STYLE1">*</span><span class="STYLE2">�ǼǱ��</span></td>
        <td width="34%">
          <input type="text" name="khfwjlh" value="<%=khfwjlh%>" readonly>        </td>
        <td width="15%" align="right"><span class="STYLE1">*</span><span class="STYLE2">�ͻ����</span></td>
        <td width="35%">
          <input type="text" name="khbh" value="<%=wherekhbh%>" readonly>        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="16%" align="right"><span class="STYLE1">*</span>ʧ��ԭ��</td>
        <td width="34%"> 
          <select name="sbyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
            <option value=""></option>
            <%
			cf.selectItem(out,"select sbyybm,sbyymc from dm_sbyybm order by sbyybm","");
			%> 
          </select>        </td>
        <td width="15%" align="right"><span class="STYLE1">*</span>ʧ�ܿͻ�����</td>
        <td width="35%"><select name="sbkhlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select sbkhlx c1,sbkhlx c2 from crm_sbkhlx where ssfgs='"+ssfgs+"' order by xh","");
%>
        </select></td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="16%" align="right"><span class="STYLE1">*</span>ʧ��ԭ������</td>
        <td colspan="3"> 
          <textarea name="sbyyxs" cols="71" rows="6"></textarea>        </td>
      </tr>
      <tr bgcolor="#FFFFFF"> 
        <td width="16%" align="right"><span class="STYLE1">*</span><span class="STYLE2">�Ǽ���</span></td>
        <td width="34%"> 
          <input type="text" name="djr" value="<%=yhmc%>" size="20" maxlength="10" readonly>        </td>
        <td width="15%" align="right"><span class="STYLE2"><span class="STYLE1">*</span>�Ǽ�ʱ��</span></td>
        <td width="35%"> 
          <input type="text" name="djsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>        </td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td align="right"><span class="STYLE2"><span class="STYLE1">*</span>�Ǽǲ���</span></td>
        <td><select name="djbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
            <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
        </select></td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr bgcolor="#FFFFFF" align="center"> 
        <td colspan="4"> 
          <input type="button" name="cz" value="����" onClick="f_do(selectform)"></td>
      </tr>
    </table>
</form>


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">��ѯʱ��</td>
	<td  width="10%">����</td>
	<td  width="8%">���ʦ</td>
	<td  width="52%">��ѯ���</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT zxsj,dwmc,sjs,zxqk";
	ls_sql+=" FROM crm_sjszxqk,sq_dwxx  ";
    ls_sql+=" where crm_sjszxqk.dwbh=sq_dwxx.dwbh(+) ";
    ls_sql+=" and crm_sjszxqk.khbh='"+wherekhbh+"'";
	ls_sql+=" order by zxjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[3]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td width="6%">�طô���</td>
	<td width="9%">�ط�ʱ��</td>
	<td width="13%">�طò���</td>
	<td width="6%">�ط���</td>
	<td width="56%">�ͻ��ط����</td>
	<td width="10%">�Ƿ�����������</td>
</tr>
<%

	ls_sql="SELECT crm_zxhfjl.hfcs,crm_zxhfjl.hfsj,sq_dwxx.dwmc hfbm ,crm_zxhfjl.hfr,crm_zxhfjl.khhfqk as crm_zxhfjl_khhfqk,DECODE(crm_zxhfjl.clfs,'0','������','1','���ѵ���','2','�������ʦ')";
	ls_sql+=" FROM crm_zxhfjl,sq_dwxx";
    ls_sql+=" where crm_zxhfjl.khbh='"+wherekhbh+"' and crm_zxhfjl.hfbm=sq_dwxx.dwbh(+)";
	ls_sql+=" order by crm_zxhfjl.hfjlh";
    pageObj.sql=ls_sql;
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);
	pageObj.alignStr[3]="align='left'";
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

</table>

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
	if(	javaTrim(FormName.sbyyxs)=="") {
		alert("������[ʧ��ԭ������]��");
		FormName.sbyyxs.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
