<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String zjxwcbz="";
String jsjlh=null;
String khbh=null;
String sgd=null;
String sgbz=null;
String jsrq=null;
String jsbl=null;
String jsje=null;
String clf=null;
String gdyp=null;
String sjbk=null;
String gdjsjd=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String jsjs=null;
String htje=null;
String zjxje=null;
String jsjsze=null;

String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String jzssk=null;
String yfgf=null;
double lkhjbfb=0;

String wherejsjlh=cf.GB2Uni(request.getParameter("jsjlh"));

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgd,sgbz,jsrq,jsbl,jsje,clf,gdyp,sjbk,gdjsjd,lrr,lrsj,lrbm,bz,jsjs,htje,zjxje,jsjsze ";
	ls_sql+=" ,sfkclk,sfkgdyp,sfkyfgf,jzssk,yfgf,lkhjbfb";
	ls_sql+=" from  cw_sgdbgfty";
	ls_sql+=" where  (jsjlh='"+wherejsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		jzssk=cf.fillNull(rs.getString("jzssk"));
		yfgf=cf.fillNull(rs.getString("yfgf"));
		lkhjbfb=rs.getDouble("lkhjbfb");

		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		jsbl=cf.fillNull(rs.getString("jsbl"));
		jsje=cf.fillNull(rs.getString("jsje"));
		clf=cf.fillNull(rs.getString("clf"));
		gdyp=cf.fillNull(rs.getString("gdyp"));
		sjbk=cf.fillNull(rs.getString("sjbk"));
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		jsjs=cf.fillNull(rs.getString("jsjs"));
		htje=cf.fillNull(rs.getString("htje"));
		zjxje=cf.fillNull(rs.getString("zjxje"));
		jsjsze=cf.fillNull(rs.getString("jsjsze"));
	}
	rs.close();
	ps.close();

	ls_sql="select zjxwcbz,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));


		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
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
<title>�����ѣ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE5 {color: #CC0033; font-weight: bold; }
.STYLE6 {color: #0000CC}
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveShCw_sgdbgfty.jsp" name="editform">
<div align="center">�����ѣ����</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����Ѽ�¼��</td>
	<td  width="8%">����</td>
	<td  width="7%">��������</td>
	<td  width="7%">��ͬ���</td>
	<td  width="6%">��������</td>
	<td  width="8%">�������</td>
	<td  width="7%">��������ܶ�</td>
	<td  width="4%">�������</td>
	<td  width="7%">������</td>
	<td  width="5%">���Ϸ�</td>
	<td  width="5%">������Ʒ</td>
	<td  width="7%">ʵ�ʲ���</td>
	<td  width="5%">¼����</td>
	<td  width="54%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_sgdbgfty.jsjlh,gdjsjdmc,cw_sgdbgfty.jsrq,TO_CHAR(cw_sgdbgfty.htje),TO_CHAR(cw_sgdbgfty.zjxje), DECODE(cw_sgdbgfty.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','���¹���ʩ���ɱ���','A','���¹���ʩ���ɱ��ۣ�������ʩ���ɱ�','D','��ͬ����ʩ���ɱ���','E','��ͬ����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),TO_CHAR(cw_sgdbgfty.jsjsze),cw_sgdbgfty.jsbl||'%',TO_CHAR(cw_sgdbgfty.jsje),TO_CHAR(cw_sgdbgfty.clf),TO_CHAR(cw_sgdbgfty.gdyp),cw_sgdbgfty.sjbk,cw_sgdbgfty.lrr,cw_sgdbgfty.bz  ";
	ls_sql+=" FROM cw_sgdbgfty,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdbgfty.gdjsjd=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdbgfty.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdbgfty.lrsj";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdbgftyCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">�ʼ�����</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ܼ�</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">���齻������</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF"><input name="button3" type="button" onClick="window.open('/dzbj/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>')" value="���ӱ���">
        <input name="button4" type="button" onClick="window.open('/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>')"  value="���ռ�¼">
        <input name="button5" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="������Ϣ">
        <input name="button6" type="button" onClick="window.open('/khxx/Jxc_clpsdCxList.jsp?khbh=<%=khbh%>')"  value="���ϵ�"></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">�����Ѽ�¼��</font></td> 
  <td width="32%"> 
    <input type="text" name="jsjlh" size="20" maxlength="9"  value="<%=jsjlh%>" readonly>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">�ͻ����</font></td> 
  <td width="32%"> 
    <input type="text" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">ʩ����</font></td> 
  <td width="32%"> 
    <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
<%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd);
%>
    </select>  </td>
  <td align="right" width="18%"><font color="#0000CC">�ֳ�������</font></td> 
  <td width="32%"> 
    <input type="text" name="sgbz" size="20" maxlength="20"  value="<%=sgbz%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><font color="#0000CC">�������</font></td>
  <td colspan="3"><select name="jsjs" style="FONT-SIZE:12PX;WIDTH:512PX">
    <%
		cf.selectItem(out,"select jsjsbm,jsjsmc from dm_jsjsbm where jsjsbm='"+jsjs+"'",jsjs);
%>
  </select></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">��ͬ��������</span></td>
  <td><input type="text" name="htje" size="20" maxlength="17"  value="<%=htje%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�����������</span></td>
  <td><input type="text" name="zjxje" size="20" maxlength="17"  value="<%=zjxje%>" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�����Ѵ���</span></td>
  <td><select name="gdjsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
	cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='"+gdjsjd+"'",gdjsjd);
%>
  </select></td>
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>������ϼưٷֱ�</span></td>
  <td><input type="text" name="lkhjbfb" value="<%=lkhjbfb%>" size="10" maxlength="17" readonly>
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2 STYLE6">��װʵ�տ�</span></td>
  <td><input type="text" name="jzssk" value="<%=jzssk%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFCC">
  <td colspan="4" align="right">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6">��������ܶ�</span></td>
  <td><input type="text" name="jsjsze" size="20" maxlength="17"  value="<%=jsjsze%>" readonly>  </td>
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9"  onchange="f_jsje(editform)">
%</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">������</span></td> 
  <td colspan="3"> 
    <input type="text" name="jsje" size="20" maxlength="17"  value="<%=jsje%>" readonly>
    <span class="STYLE5">�������=���������ܶ����������</span> </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">�Ƿ�۲��Ͽ�</font></span></td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk,true);
%>  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6"><span class="STYLE2">����</span>���Ϸ�</span></td>
  <td><input type="text" name="clf" size="20" maxlength="17"  value="<%=clf%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">�Ƿ�۹�����Ʒ</font></span></td>
  <td><%
	cf.radioToken(out, "sfkgdyp","Y+��&N+��",sfkgdyp,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6"><span class="STYLE2">����</span>������Ʒ</span></td>
  <td><input type="text" name="gdyp" size="20" maxlength="17"  value="<%=gdyp%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">�Ƿ���Ѹ�����</font></span></td>
  <td><%
	cf.radioToken(out, "sfkyfgf","Y+��&N+��",sfkyfgf,true);
%></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">����ȡ����</span></td>
  <td><input type="text" name="yfgf" value="<%=yfgf%>" size="20" maxlength="17" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6">ʵ�ʲ���</span></td>
  <td><input type="text" name="sjbk" size="20" maxlength="17"  value="<%=sjbk%>" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td> 
  <td width="32%"><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select></td>
  <td align="right" width="18%"><span class="STYLE1">*</span>��������</td> 
  <td width="32%"><input type="text" name="jsrq" size="20" maxlength="10"  value="<%=jsrq%>" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>  </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="wherejsjlh"  value="<%=wherejsjlh%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input name="bx" type="button" onClick="window.open('SaveZjxbz.jsp?khbh=<%=khbh%>');this.disabled=true;yx.disabled=false;"  value="����¼��������" <%if (zjxwcbz.equals("3")) out.print("disabled");%>>
	  <input type="reset"  value="����">
	  <input name="yx" type="button" onClick="window.open('SaveYxZjxbz.jsp?khbh=<%=khbh%>');this.disabled=true;bx.disabled=false;"  value="����¼��������" <%if (!zjxwcbz.equals("3")) out.print("disabled");%>>
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
function f_jsje(FormName)//����FormName:Form������
{
	var jsje=FormName.jsjsze.value*1.0*FormName.jsbl.value/100.0;
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;

	var sjbk=FormName.jsje.value*1.0;

	if ("<%=sfkclk%>"=="Y")//�Ƿ�۲��Ͽ�
	{
		sjbk=sjbk-FormName.clf.value*1.0;
	}
	if ("<%=sfkgdyp%>"=="Y")//�Ƿ�۹�����Ʒ
	{
		sjbk=sjbk-FormName.gdyp.value*1.0;
	}
	if ("<%=sfkyfgf%>"=="Y")//�Ƿ���Ѹ�����
	{
		sjbk=sjbk-FormName.yfgf.value*1.0;
	}

	sjbk=sjbk-sjbk%100;

	sjbk=round(sjbk,0);

	FormName.sjbk.value=sjbk;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsje(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[������¼��]��");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("��ѡ��[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("������[��������]��");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.htje)=="") {
		alert("������[��ͬ���]��");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "��ͬ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[��������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jzssk)=="") {
		alert("������[��װʵ�տ�]��");
		FormName.jzssk.focus();
		return false;
	}
	if(!(isFloat(FormName.jzssk, "��װʵ�տ�"))) {
		return false;
	}
	if(	javaTrim(FormName.clf)=="") {
		alert("������[���Ϸ�]��");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.gdyp)=="") {
		alert("������[������Ʒ]��");
		FormName.gdyp.focus();
		return false;
	}
	if(!(isFloat(FormName.gdyp, "������Ʒ"))) {
		return false;
	}
	if(	javaTrim(FormName.yfgf)=="") {
		alert("������[�Ѹ�����]��");
		FormName.yfgf.focus();
		return false;
	}
	if(!(isFloat(FormName.yfgf, "�Ѹ�����"))) {
		return false;
	}


	if(	javaTrim(FormName.jsjsze)=="") {
		alert("������[��������ܶ�]��");
		FormName.jsjsze.focus();
		return false;
	}
	if(!(isFloat(FormName.jsjsze, "��������ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("������[��������]��");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.jsje)=="") {
		alert("������[�������]��");
		FormName.jsje.focus();
		return false;
	}
	if(!(isFloat(FormName.jsje, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.sjbk)=="") {
		alert("������[ʵ�ʲ���]��");
		FormName.sjbk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjbk, "ʵ�ʲ���"))) {
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
		alert("��ѡ��[¼�벿��]��");
		FormName.lrbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
