<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String ygbh=(String)session.getAttribute("ygbh");
String dwbh=(String)session.getAttribute("dwbh");
%>
<%

String khbh=null;
String smsj=null;
String smmd=null;
String jdr=null;
String jdrbh=null;
String jdrbm=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String ssfgs=null;
String bz=null;
String sjjdqk=null;
String jlh=cf.GB2Uni(request.getParameter("jlh"));

String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sbyybm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String sjsbh=null;

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;

String sgd=null;
String zjxm=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	
	ls_sql="select khbh,smsj,smmd,jdr,jdrbh,jdrbm,lrr,lrsj,lrbm,ssfgs,bz,sjjdqk ";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where jlh='"+jlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		smsj=cf.fillNull(rs.getDate("smsj"));
		smmd=cf.fillNull(rs.getString("smmd"));
		jdr=cf.fillNull(rs.getString("jdr"));
		jdrbh=cf.fillNull(rs.getString("jdrbh"));
		jdrbm=cf.fillNull(rs.getString("jdrbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bz=cf.fillNull(rs.getString("bz"));
		sjjdqk=cf.fillNull(rs.getString("sjjdqk"));
	}
	rs.close();
	ps.close();

	String maxjlh=null;
	ls_sql="select max(jlh)";
	ls_sql+=" from  crm_khsmjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		maxjlh=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();
	if (!jlh.equals(maxjlh))
	{
		out.println("����ֻ���޸��������ż�¼��"+maxjlh);
		return;
	}

	ls_sql="select sgd,zjxm,khjl,sjs,ywy,dwmc,sjsbh,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') zxzt,zxdjbm,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,cqbm,cgdz,hdr ";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sjs=cf.fillNull(rs.getString("sjs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
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
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCrm_khsmjlZj.jsp" name="editform">
<div align="center">���޸���Ϣ</div>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            �ͻ�����            </span></td>
            <td width="32%"> <%=khxm%> </td>
            <td width="18%" align="right"> 
              <span class="STYLE2">�Ա�</span> </td>
            <td width="32%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%> </td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            ���ݵ�ַ            </span></td>
            <td colspan="3"> <%=fwdz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><span class="STYLE2">��ѯ����</span></td>
            <td><%=dwmc%></td>
            <td align="right"><span class="STYLE2">���ʦ</span></td>
            <td><%=sjs%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><span class="STYLE2">�ͻ�����</span></td>
            <td><%=khjl%></td>
            <td align="right"><span class="STYLE2">ҵ��Ա</span></td>
            <td><%=ywy%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            ��������            </span></td>
            <td width="32%"> <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
            <td width="18%" align="right"><span class="STYLE2"> 
            ����            </span></td>
            <td width="32%"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            ���ڽ������            </span></td>
            <td width="32%" bgcolor="#FFFFFF"> <%=fwmj%> </td>
            <td width="18%" align="right"><span class="STYLE2"> 
            ���Ҫ��            </span></td>
            <td width="32%"> <%
	cf.selectItem(out,"select fgyqbm,fgyqmc from dm_fgyqbm order by fgyqbm",fgyqbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            װ��Ԥ��            </span></td>
            <td width="32%"><%
	cf.selectItem(out,"select zxysbm,zxysmc from dm_zxysbm order by zxysbm",zxysbm,true);
%> </td>
            <td width="18%" align="right"><span class="STYLE2"> 
            ��ϵ�ͻ�            </span></td>
            <td width="32%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE2"> 
            �ص���־            </span></td>
            <td width="32%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,true);
%> </td>
            <td width="18%" align="right"><span class="STYLE2"> 
            �ص���            </span></td>
            <td width="32%"><%=hdr%></td>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2">�ص�װ�޵�ַ</span></td>
            <td colspan="3"><%=cgdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2">��ѯ״̬</span></td>
            <td width="32%"><%=zxzt%> </td>
            <td width="18%" align="right"><span class="STYLE2">��ѯ�Ǽǲ���</span></td>
            <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
			%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><span class="STYLE2"> 
            ��ע            </span></td>
            <td colspan="3"> <%=bz%> </td>
          </tr>
      </table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>����ʱ��</td> 
  <td width="32%"> 
    <input type="text" name="smsj" size="20" maxlength="10"  value="<%=smsj%>" onDblClick="JSCalendar(this)">  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>����Ŀ��</td> 
  <td width="32%"> 
    <select name="smmd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	cf.selectItem(out,"select smmd c1,smmd c2 from dm_smmd order by smmd",smmd);
%>
    </select>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ӵ��˲���</td> 
  <td width="32%"> 
    <select name="jdrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeBm(editform)">
    <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' and ssfgs='"+ssfgs+"' and dwlx not in('F3','F4') order by dwlx desc,dwbh",jdrbm);
%>
    </select>  </td>
  <td align="right" width="18%"><span class="STYLE1">*</span>�Ӵ���</td> 
  <td width="32%">
  <select name="jdrbh" style="FONT-SIZE:12PX;WIDTH:152PX">
    <option value=""></option>
<%
	String sql="";
	sql =" select sq_yhxx.ygbh,sq_yhxx.yhmc||'��'||xzzwbm||'��' c1";
	sql+=" from sq_yhxx ";
	sql+=" where sq_yhxx.dwbh='"+jdrbm+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" UNION ";

	sql+=" select sq_yhxx.ygbh,sq_yhxx.yhmc||'��'||xzzwbm||'��' c1";
	sql+=" from sq_yhxx,sq_sqbm ";
	sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+jdrbm+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" ORDER BY c1";
  
	cf.selectItem(out,sql,jdrbh);
%>
  </select>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>ʵ�ʽӴ����</td>
  <td colspan="3"><textarea name="sjjdqk" cols="72" rows="6"><%=sjjdqk%></textarea>
  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">�����ֹ�˾</span></td>
  <td><select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%>
  </select></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"><textarea name="bz" cols="72" rows="3"><%=bz%></textarea></td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="jlh"  value="<%=jlh%>" >
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
<%
	cf.ajax(out);//����AJAX
%>

function changeBm(FormName) 
{
	FormName.jdrbh.length=1;

	if (FormName.jdrbm.value=="")
	{
		return;
	}

	var sql;
	sql =" select sq_yhxx.ygbh,sq_yhxx.yhmc||'��'||xzzwbm||'��' c1";
	sql+=" from sq_yhxx ";
	sql+=" where sq_yhxx.dwbh='"+FormName.jdrbm.value+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" UNION ";

	sql+=" select sq_yhxx.ygbh,sq_yhxx.yhmc||'��'||xzzwbm||'��' c1";
	sql+=" from sq_yhxx,sq_sqbm ";
	sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+FormName.jdrbm.value+"' ";
	sql+=" and sq_yhxx.sfzszg in('Y','N') ";

	sql+=" ORDER BY c1";

	var actionStr="/ajax/selectstr.jsp?sql="+sql;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getAjax(ajaxRetStr) 
{
	strToSelect(editform.jdrbh,ajaxRetStr);
}

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.smsj)=="") {
		alert("������[����ʱ��]��");
		FormName.smsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.smsj, "����ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.smmd)=="") {
		alert("��ѡ��[����Ŀ��]��");
		FormName.smmd.focus();
		return false;
	}

	if(	javaTrim(FormName.jdrbh)=="") {
		alert("������[�Ӵ���]��");
		FormName.jdrbh.focus();
		return false;
	}
	if(!(isNumber(FormName.jdrbh, "�Ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.jdrbm)=="") {
		alert("��ѡ��[�Ӵ��˲���]��");
		FormName.jdrbm.focus();
		return false;
	}
	if(	javaTrim(FormName.sjjdqk)=="") {
		alert("������[ʵ�ʽӴ����]��");
		FormName.sjjdqk.focus();
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
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
