<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�����ѣ��޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE6 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String bgfjlh=cf.GB2Uni(request.getParameter("bgfjlh"));

String khbh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bjjb=null;
String bjjbmc=null;
double clf=0;
double sgebfb=0;
String zjxxh=null;

double zqgcf=0;
double zhgcf=0;
double zjxje=0;
double gcfzk=0;
double ssk=0;
double clk=0;

String bz=null;
String bfrq=null;
String bfcs=null;
String bfjs=null;
double bfbl=0;
double bcrgf=0;
double bfje=0;
double yfgf=0;
double sjbk=0;
String sfkclk=null;
double clkzdbl=0;
String sfkybgf=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select bfcs,khbh,sgd,sgbz,zqgcf,zhgcf,gcfzk,bfrq,bfjs,bfbl,bfje,yfgf,sjbk,lrbm,bz,ssk,clk,sfkclk,clkzdbl,sfkybgf ";
	ls_sql+=" from  cw_lfbgfjl";
	ls_sql+=" where bgfjlh='"+bgfjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bfcs=cf.fillNull(rs.getString("bfcs"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zqgcf=rs.getDouble("zqgcf");
		zhgcf=rs.getDouble("zhgcf");
		gcfzk=rs.getDouble("gcfzk");
		bfrq=cf.fillNull(rs.getDate("bfrq"));
		bfjs=cf.fillNull(rs.getString("bfjs"));
		bfbl=rs.getDouble("bfbl");
		bfje=rs.getDouble("bfje");
		yfgf=rs.getDouble("yfgf");
		sjbk=rs.getDouble("sjbk");
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		ssk=rs.getDouble("ssk");
		clk=rs.getDouble("clk");
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		clkzdbl=rs.getDouble("clkzdbl");
		sfkybgf=cf.fillNull(rs.getString("sfkybgf"));
	}
	rs.close();
	ps.close();

	ls_sql="select gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,zjxm";
	ls_sql+=" ,zjxje,crm_khxx.bjjb,bjjbmc,clf,sgebfb,zjxxh";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxje=rs.getDouble("zjxje");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		clf=rs.getDouble("clf");
		sgebfb=rs.getDouble("sgebfb");
		zjxxh=cf.fillNull(rs.getString("zjxxh"));

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (gdjsjd.equals("B"))
	{
		out.println("<BR>�������������깤����");
		return;
	}



	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();




}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<div align="center">�����ѣ��޸�</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����Ѽ�¼��</td>
	<td  width="7%">��������</td>
	<td  width="8%">��������</td>
	<td  width="5%">��������</td>
	<td  width="8%">�������</td>
	<td  width="8%">�Ѹ��˹���</td>
	<td  width="8%">����Ӧ���˹���</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="40%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_lfbgfjl.bgfjlh,gdjsjdmc,DECODE(cw_lfbgfjl.bfjs,'1','��ǰ���̷�','2','�ۺ󹤳̷�'),cw_lfbgfjl.bfbl||'%',TO_CHAR(cw_lfbgfjl.bfje),TO_CHAR(cw_lfbgfjl.yfgf),cw_lfbgfjl.sjbk,cw_lfbgfjl.lrr,cw_lfbgfjl.lrsj,cw_lfbgfjl.bz ";
	ls_sql+=" FROM cw_lfbgfjl,dm_gdjsjd  ";
    ls_sql+=" where cw_lfbgfjl.bfcs=dm_gdjsjd.gdjsjd(+) and cw_lfbgfjl.khbh='"+khbh+"'";
	ls_sql+=" order by cw_lfbgfjl.bgfjlh ";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();

%>
</table>

<form method="post" action="SaveEditCw_lfbgfjl.jsp" name="insertform"  >
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
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><span class="STYLE1">���ۼ���</span></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
    <td><%=sjkgrq%> </td>
    <td align="right"><font color="#0000FF">ʵ�ʿ�������</font></td>
    <td><%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">�����Ѽ�¼��</font></span></td>
    <td><input type="text" name="bgfjlh" value="<%=bgfjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">�ͻ����</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">ʩ����</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">�ֳ�������</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>��ǰ���̷�</td> 
  <td width="32%"><input type="text" name="zqgcf" value="<%=zqgcf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�ۺ󹤳̷�</td> 
  <td width="32%"><input type="text" name="zhgcf" value="<%=zhgcf%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���̷��ۿ�</td>
  <td><input type="text" name="gcfzk" value="<%=gcfzk%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font>��������</td>
  <td><input type="text" name="bfrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>ʵ�տ�</td>
  <td><input type="text" name="ssk" value="<%=ssk%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font>���Ͽ�</td>
  <td><input type="text" name="clk" value="<%=clk%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��������</td>
  <td><select name="bfcs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectItem(out,"select gdjsjd,gdjsjdmc from dm_gdjsjd where gdjsjd='"+bfcs+"'",bfcs);
	%>
  </select></td>
  <td align="right"><span class="STYLE1">*</span>��������</td>
  <td><select name="bfjs" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
		cf.selectToken(out,"1+��ǰ���̷�&2+�ۺ󹤳̷�&3+ʵ�տ�&9+�ɴ������Ⱦ�����ǰ�ۺ�",bfjs,false);
	%>
  </select></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ�۲��Ͽ�</td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk,true);
%></td>
  <td align="right">���Ͽ���ͱ���</td>
  <td><input name="clkzdbl" type="text" id="clkzdbl" value="<%=clkzdbl%>" size="10" maxlength="9" readonly>
    �ٷֱ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�Ƿ���Ѳ�����</td>
  <td colspan="3"><%
	cf.radioToken(out, "sfkybgf","Y+��&N+��",sfkybgf,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>��������</td>
  <td><input type="text" name="bfbl" value="<%=bfbl%>" size="10" maxlength="9" readonly>
%</td>
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="bfje" value="<%=bfje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>�Ѹ�����</td> 
  <td width="32%"><input type="text" name="yfgf" value="<%=yfgf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">����Ӧ���˹���</span></td> 
  <td width="32%"><input type="text" name="sjbk" value="<%=sjbk%>" size="20" maxlength="17" readonly></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2">¼����</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">¼��ʱ��</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2">¼�벿��</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>    </td>
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
function calValue(FormName)
{  
	var bcrgf=FormName.ysglk.value/100*FormName.bfbl.value;
	FormName.bcrgf.value=round(bcrgf,2);
}    


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.bgfjlh)=="") {
		alert("������[�����Ѽ�¼��]��");
		FormName.bgfjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.bfcs)=="") {
		alert("������[��������]��");
		FormName.bfcs.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.zqgcf)=="") {
		alert("������[��ǰ���̷�]��");
		FormName.zqgcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zqgcf, "��ǰ���̷�"))) {
		return false;
	}
	if(	javaTrim(FormName.zhgcf)=="") {
		alert("������[�ۺ󹤳̷�]��");
		FormName.zhgcf.focus();
		return false;
	}
	if(!(isFloat(FormName.zhgcf, "�ۺ󹤳̷�"))) {
		return false;
	}
	if(	javaTrim(FormName.gcfzk)=="") {
		alert("������[���̷��ۿ�]��");
		FormName.gcfzk.focus();
		return false;
	}
	if(!(isFloat(FormName.gcfzk, "���̷��ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.bfrq)=="") {
		alert("������[��������]��");
		FormName.bfrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.bfrq, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.bfjs)=="") {
		alert("������[��������]��");
		FormName.bfjs.focus();
		return false;
	}
	if(	javaTrim(FormName.bfbl)=="") {
		alert("������[��������]��");
		FormName.bfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bfbl, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.bfje)=="") {
		alert("������[�������]��");
		FormName.bfje.focus();
		return false;
	}
	if(!(isFloat(FormName.bfje, "�������"))) {
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
	if(	javaTrim(FormName.sjbk)=="") {
		alert("������[����ʵ�ʲ���]��");
		FormName.sjbk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjbk, "����ʵ�ʲ���"))) {
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
