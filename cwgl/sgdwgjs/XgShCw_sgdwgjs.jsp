<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String sgd=null;
String sgbz=null;
String jsjs=null;
String jsbl=null;
String tzjsbl=null;
String sdlje=null;
String sdljsbl=null;
String jsje=null;
String clf=null;
String clyf=null;
String gdyp=null;
String yfgck=null;
String kzbjbl=null;
String clfk=null;
String yfje=null;
String jsrq=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String kzbj=null;
String htje=null;
String zjxje=null;
String qtf=null;
String qtfsm=null;
String ssk=null;
String jsjsze=null;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkyfgf=null;
String sfkzbj=null;
String kzbjjs=null;
String fkje=null;
String jlje=null;
String qtje=null;

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
String gdjsjd=null;


String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgd,sgbz,jsjs,jsbl,tzjsbl,sdlje,sdljsbl,jsje,clf,clyf,gdyp,yfgck,kzbjbl,clfk,yfje,jsrq,clzt,lrr,lrsj,lrbm,bz,kzbj,htje,zjxje,qtf,qtfsm,ssk,jsjsze,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,kzbjjs,fkje,jlje,qtje ";
	ls_sql+=" from  cw_sgdwgjs";
	ls_sql+=" where  (jsjlh='"+jsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		jsjs=cf.fillNull(rs.getString("jsjs"));
		jsbl=cf.fillNull(rs.getString("jsbl"));
		tzjsbl=cf.fillNull(rs.getString("tzjsbl"));
		sdlje=cf.fillNull(rs.getString("sdlje"));
		sdljsbl=cf.fillNull(rs.getString("sdljsbl"));
		jsje=cf.fillNull(rs.getString("jsje"));
		clf=cf.fillNull(rs.getString("clf"));
		clyf=cf.fillNull(rs.getString("clyf"));
		gdyp=cf.fillNull(rs.getString("gdyp"));
		yfgck=cf.fillNull(rs.getString("yfgck"));
		kzbjbl=cf.fillNull(rs.getString("kzbjbl"));
		clfk=cf.fillNull(rs.getString("clfk"));
		yfje=cf.fillNull(rs.getString("yfje"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		kzbj=cf.fillNull(rs.getString("kzbj"));
		htje=cf.fillNull(rs.getString("htje"));
		zjxje=cf.fillNull(rs.getString("zjxje"));
		qtf=cf.fillNull(rs.getString("qtf"));
		qtfsm=cf.fillNull(rs.getString("qtfsm"));
		ssk=cf.fillNull(rs.getString("ssk"));
		jsjsze=cf.fillNull(rs.getString("jsjsze"));
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		fkje=cf.fillNull(rs.getString("fkje"));
		jlje=cf.fillNull(rs.getString("jlje"));
		qtje=cf.fillNull(rs.getString("qtje"));
	}
	rs.close();
	ps.close();

	ls_sql="select gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,wdzgce";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
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
<title>���</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE3 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveXgShCw_sgdwgjs.jsp" name="insertform">
<div align="center">���</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����¼��</td>
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

	ls_sql="SELECT cw_sgdzqjs.jsjlh,gdjsjdmc,cw_sgdzqjs.jsrq,cw_sgdzqjs.htje,cw_sgdzqjs.zjxje, DECODE(cw_sgdzqjs.jsjs,'1','���̷�','2','���̷ѣ�������','3','ʵ�տ��ܶ�','4','һ�ڿ�','5','���ڿ�','6','���ڿ�','7','���̻�������','8','���̻������ۣ������ѻ�������','9','����ʩ���ɱ���','A','����ʩ���ɱ��ۣ�������ʩ���ɱ�','B','���̳ɱ���','C','���̳ɱ��ۣ������ѳɱ�'),cw_sgdzqjs.jsjsze,cw_sgdzqjs.jsbl||'%',cw_sgdzqjs.jsje,cw_sgdzqjs.clf,cw_sgdzqjs.gdyp,cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.bz  ";
	ls_sql+=" FROM cw_sgdzqjs,dm_gdjsjd  ";
    ls_sql+=" where cw_sgdzqjs.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_sgdzqjs.khbh='"+khbh+"'";
    ls_sql+=" order by cw_sgdzqjs.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_sgdzqjsCxList.jsp","","","");

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%>
</table>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="15%" align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td width="35%"><%=hth%> </td>
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
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">�����¼��</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>
    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">�ͻ����</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">ʩ����</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>
    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">�ֳ�������</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�������</span></td>
    <td><select name="jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectToken(out,"1+���̷�&2+���̷ѣ�������&3+ʵ�տ��ܶ�&4+һ�ڿ�&5+���ڿ�&6+���ڿ�&7+���̻�������&8+���̻������ۣ������ѻ�������&9+����ʩ���ɱ���&A+����ʩ���ɱ��ۣ�������ʩ���ɱ�&B+���̳ɱ���&C+���̳ɱ��ۣ������ѳɱ�",jsjs,false);
%>
      </select>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">���̺�ͬ��</span></td>
    <td><input type="text" name="htje" value="<%=htje%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">����������</span></td>
    <td><input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">������</span></td>
    <td><input type="text" name="qtf" value="<%=qtf%>" size="20" maxlength="17" >
    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ʵ�տ�</span></td>
    <td><input type="text" name="ssk" size="20" maxlength="17" value=<%=ssk%>></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE4">������˵��</span></td>
    <td colspan="3"><input type="text" name="qtfsm" value="<%=qtfsm%>" size="72" maxlength="100" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��������ܶ�</span></td>
    <td><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�������</span></td>
    <td><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" >
      % </td>
    <td align="right"><font color="#FF0000">*</font>�����������</td>
    <td><input type="text" name="tzjsbl" value="<%=tzjsbl%>" size="10" maxlength="9" >
      % </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·���㷽ʽ</span></td>
    <td><%
	cf.radioToken(out, "sdljsfs","1+ͳһ��������&2+������������&3+������",sdljsfs,true);
%>
    </td>
    <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>ˮ��·���</span></td>
    <td><input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE4"><font color="#FF0000">*</font>ˮ��·�������</span></td>
    <td><input type="text" name="sdljsbl" value="<%=sdljsbl%>" size="10" maxlength="9" >
      % </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�����ܶ�</span></td>
    <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�۲��Ͽ�</span></td>
    <td><%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk,true);
%></td>
    <td align="right"><font color="#FF0000">*</font>���Ϸ���</td>
    <td><input type="text" name="clfk" value="0" size="20" maxlength="17" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">���Ϸ�</span></td>
    <td><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" readonly></td>
    <td align="right"><font color="#FF0000">*</font>�����˷�</td>
    <td><input type="text" name="clyf" value="0" size="20" maxlength="17" >
    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ�۹�����Ʒ</span></td>
    <td><%
	cf.radioToken(out, "sfkgdyp","Y+��&N+��",sfkgdyp,true);
%></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">������Ʒ</span></td>
    <td><input type="text" name="gdyp" value="<%=gdyp%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ���Ѹ�����</span></td>
    <td><%
	cf.radioToken(out, "sfkyfgf","Y+��&N+��",sfkyfgf,true);
%></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ѹ����̿�</span></td>
    <td><input name="yfgck" type="text" id="yfgck" value="<%=yfgck%>" size="20" maxlength="17" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ���ʱ���</span></td>
    <td><%
	cf.radioToken(out, "sfkzbj","Y+��&N+��",sfkzbj,true);
%></td>
    <td align="right">���ʱ������</td>
    <td><%
	cf.radioToken(out, "kzbjjs","1+�������&2+�����ܶ�",kzbjjs,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>Ӧ���ʱ������</td>
    <td><input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" >
      % </td>
    <td align="right"><font color="#FF0000">*</font>���ʱ���</td>
    <td><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>������</td>
    <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="17" ></td>
    <td align="right"><font color="#FF0000">*</font>�������</td>
    <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="17" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font>�������</td>
    <td><input type="text" name="qtje" value="<%=qtje%>" size="20" maxlength="17" ></td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE4">Ӧ�����</span></td>
    <td><input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼����</span></td>
    <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
    <td align="right"><span class="STYLE1">*</span><span class="STYLE2">¼��ʱ��</span></td>
    <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right" bgcolor="#FFFFFF"><span class="STYLE1">*</span><span class="STYLE2">¼�벿��</span></td>
    <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
      </select>
    </td>
    <td align="right">��������</td>
    <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">��ע</td>
    <td colspan="3"><textarea name="bz" cols="71" rows="3"><%=bz%></textarea>    </td>
  </tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	  <input type="button"  value="����" onClick="f_do(insertform)">
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
	if(	javaTrim(FormName.jsjlh)=="") {
		alert("������[�����¼��]��");
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


	if(!(isFloat(FormName.jsbl, "�������"))) {
		return false;
	}
	if(!(isFloat(FormName.tzjsbl, "�����������"))) {
		return false;
	}
	if(!(isFloat(FormName.sdlje, "ˮ��·���"))) {
		return false;
	}
	if(!(isFloat(FormName.sdljsbl, "ˮ��·�������"))) {
		return false;
	}
	if(!(isFloat(FormName.jsje, "�����ܶ�"))) {
		return false;
	}
	if(!(isFloat(FormName.clf, "���Ϸ�"))) {
		return false;
	}
	if(!(isFloat(FormName.clyf, "�����˷�"))) {
		return false;
	}
	if(!(isFloat(FormName.gdyp, "������Ʒ"))) {
		return false;
	}

	if(!(isFloat(FormName.yfgck, "�Ѹ����̿�"))) {
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "Ӧ���ʱ������"))) {
		return false;
	}
	if(!(isFloat(FormName.clfk, "���Ϸ���"))) {
		return false;
	}
	if(!(isFloat(FormName.yfje, "Ӧ�����"))) {
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
	if(!(isFloat(FormName.kzbj, "���ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.htje)=="") {
		alert("������[���̺�ͬ��]��");
		FormName.htje.focus();
		return false;
	}
	if(!(isFloat(FormName.htje, "���̺�ͬ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[����������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "����������"))) {
		return false;
	}
	if(	javaTrim(FormName.qtf)=="") {
		alert("������[������]��");
		FormName.qtf.focus();
		return false;
	}
	if(!(isFloat(FormName.qtf, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.ssk)=="") {
		alert("������[ʵ�տ�]��");
		FormName.ssk.focus();
		return false;
	}
	if(!(isFloat(FormName.ssk, "ʵ�տ�"))) {
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

/*
	if(	!radioChecked(FormName.sdljsfs)) {
		alert("��ѡ��[ˮ��·���㷽ʽ]��");
		FormName.sdljsfs[0].focus();
		return false;
	}
*/
	if(	javaTrim(FormName.sfkclk)=="") {
		alert("������[�Ƿ�۲��Ͽ�]��");
		FormName.sfkclk.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkgdyp)=="") {
		alert("������[�Ƿ�۹�����Ʒ]��");
		FormName.sfkgdyp.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkyfgf)=="") {
		alert("������[�Ƿ���Ѹ�����]��");
		FormName.sfkyfgf.focus();
		return false;
	}
	if(	javaTrim(FormName.sfkzbj)=="") {
		alert("������[�Ƿ���ʱ���]��");
		FormName.sfkzbj.focus();
		return false;
	}
	if(	javaTrim(FormName.fkje)=="") {
		alert("������[������]��");
		FormName.fkje.focus();
		return false;
	}
	if(!(isFloat(FormName.fkje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jlje)=="") {
		alert("������[�������]��");
		FormName.jlje.focus();
		return false;
	}
	if(!(isFloat(FormName.jlje, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.qtje)=="") {
		alert("������[�������]��");
		FormName.qtje.focus();
		return false;
	}
	if(!(isFloat(FormName.qtje, "�������"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
