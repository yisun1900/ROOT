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
double htje=0;
double zjxje=0;
double jlje=0;
double sdljsje=0;
String jsjs=null;
double jsbl=0;
double tzjsbl=0;
double sdlje=0;
double sdljsbl=0;
double jsje=0;
double clf=0;
double clyf=0;
double gdyp=0;
double yfgck=0;
double kzbjbl=0;
double clfk=0;
double fkje=0;
double yfje=0;
String jsrq=null;
String clzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bz=null;
String kzbj=null;

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

double qtf=0;
String qtfsm=null;
double ssk=0;
double jsjsze=0;
String sdljsfs=null;
String sfkclk=null;
String sfkgdyp=null;
String sfkzbj=null;
String sfkyfgf=null;
String kzbjjs=null;
double qtje=0;

double khpck=0;
double yqf=0;
double jsyh=0;
double khqk=0;

double kkhpck=0;
double kyqf=0;
double kkhqk=0;
double zxxs=0;
double jxxs=0;
double kghzx=0;
double kghjx=0;

String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsjlh,khbh,sgd,sgbz,htje,zjxje,jlje,sdljsje,jsjs,jsbl,tzjsbl,sdlje,sdljsbl,jsje,clf,clyf,gdyp,yfgck,kzbjbl,clfk,fkje,yfje,jsrq,clzt,lrr,lrsj,lrbm,bz,kzbj ";
	ls_sql+=" ,qtf,qtfsm,ssk,jsjsze,sdljsfs,sfkclk,sfkgdyp,sfkyfgf,sfkzbj,kzbjjs,qtje,khpck,jsyh,yqf,khqk,kkhpck,kyqf,kkhqk";
	ls_sql+=" ,zxxs,jxxs,kghzx,kghjx ";
	ls_sql+=" from  cw_sgdwgjsty";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxxs=rs.getDouble("zxxs");
		jxxs=rs.getDouble("jxxs");
		kghzx=rs.getDouble("kghzx");
		kghjx=rs.getDouble("kghjx");

		khpck=rs.getDouble("khpck");
		jsyh=rs.getDouble("jsyh");
		yqf=rs.getDouble("yqf");
		khqk=rs.getDouble("khqk");

		kkhpck=rs.getDouble("kkhpck");
		kyqf=rs.getDouble("kyqf");
		kkhqk=rs.getDouble("kkhqk");

		qtf=rs.getDouble("qtf");
		qtfsm=cf.fillNull(rs.getString("qtfsm"));
		ssk=rs.getDouble("ssk");
		jsjsze=rs.getDouble("jsjsze");
		sdljsfs=cf.fillNull(rs.getString("sdljsfs"));
		sfkclk=cf.fillNull(rs.getString("sfkclk"));
		sfkgdyp=cf.fillNull(rs.getString("sfkgdyp"));
		sfkyfgf=cf.fillNull(rs.getString("sfkyfgf"));
		sfkzbj=cf.fillNull(rs.getString("sfkzbj"));
		kzbjjs=cf.fillNull(rs.getString("kzbjjs"));
		qtje=rs.getDouble("qtje");

		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		htje=rs.getDouble("htje");
		zjxje=rs.getDouble("zjxje");
		jlje=rs.getDouble("jlje");
		sdljsje=rs.getDouble("sdljsje");
		jsjs=cf.fillNull(rs.getString("jsjs"));
		jsbl=rs.getDouble("jsbl");
		tzjsbl=rs.getDouble("tzjsbl");
		sdlje=rs.getDouble("sdlje");
		sdljsbl=rs.getDouble("sdljsbl");
		jsje=rs.getDouble("jsje");
		clf=rs.getDouble("clf");
		clyf=rs.getDouble("clyf");
		gdyp=rs.getDouble("gdyp");
		yfgck=rs.getDouble("yfgck");
		kzbjbl=rs.getDouble("kzbjbl");
		clfk=rs.getDouble("clfk");
		fkje=rs.getDouble("fkje");
		yfje=rs.getDouble("yfje");
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		clzt=cf.fillNull(rs.getString("clzt"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
		kzbj=cf.fillNull(rs.getString("kzbj"));
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditCw_sgdwgjsty.jsp" name="insertform">
<div align="center">���޸���Ϣ</div>
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
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">�����¼��</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
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
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">�������</span></td> 
  <td width="32%"> 
    <select name="jsjs" style="FONT-SIZE:12PX;WIDTH:152PX">
      <%
	cf.selectToken(out,"1+���̷�&2+���̷ѣ�������&3+ʵ�տ��ܶ�&4+һ�ڿ�&5+���ڿ�&6+���ڿ�&7+���̻�������&8+���̻������ۣ������ѻ�������&9+����ʩ���ɱ���&A+����ʩ���ɱ��ۣ�������ʩ���ɱ�&B+���̳ɱ���&C+���̳ɱ��ۣ������ѳɱ�",jsjs,false);
%>
    </select>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ͬ���̶�</span></td>
  <td><input type="text" name="htje" value="<%=htje%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ۼ�������</span></td>
  <td><input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ͬ������</span></td>
  <td><input type="text" name="qtf" value="<%=qtf%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ʵ�տ�</span></td>
  <td><input type="text" name="ssk" size="20" maxlength="17" value=<%=ssk%> readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE4">������˵��</span></td>
  <td colspan="3"><input type="text" name="qtfsm" value="<%=qtfsm%>" size="72" maxlength="100" readonly>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right">���±����ܶ�</td>
  <td colspan="3"><%=cf.round(htje+qtf+zjxje,2)%><strong>&nbsp;&nbsp;&nbsp;&nbsp;���±����ܶ�=��ͬ���̶�+��ͬ������+�ۼ�������</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">Ӧ�ս��</td>
  <td colspan="3"><%=cf.round(htje+qtf+zjxje-ssk,2)%><strong>&nbsp;&nbsp;&nbsp;&nbsp;Ӧ�ս��=���±����ܶ�-ʵ�տ�</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�����Ż�</span></td>
  <td><input type="text" name="jsyh" value="<%=jsyh%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ͻ��⳥��</span></td>
  <td><input type="text" name="khpck" value="<%=khpck%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">���ڷ�</span></td>
  <td><input type="text" name="yqf" value="<%=yqf%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ͻ�Ƿ��</span></td>
  <td colspan="3"><input type="text" name="khqk" value="<%=khqk%>" size="20" maxlength="17" readonly>
    <strong>�ͻ�Ƿ��=���±����ܶ�-�����Ż�-�ͻ��⳥��-���ڷ�-ʵ�տ�</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�����ڷ�</td>
  <td><input type="text" name="kyqf" value="<%=kyqf%>" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>�ۿͻ��⳥��</td>
  <td><input type="text" name="kkhpck" value="<%=kkhpck%>" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�ۿͻ�Ƿ��</td>
  <td><input type="text" name="kkhqk" value="<%=kkhqk%>" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">����ϵ��</span></td>
  <td><input name="zxxs" type="text" value="<%=zxxs%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">����ϵ��</span></td>
  <td><input type="text" name="jxxs" value="<%=jxxs%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">����������ʩ���ɱ�</span></td>
  <td><input type="text" name="kghzx" value="<%=kghzx%>" size="20" maxlength="17" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">����������ۺ���</span></td>
  <td><input type="text" name="kghjx" value="<%=kghjx%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��������ܶ�</span></td>
  <td colspan="3"><input type="text" name="jsjsze" value="<%=jsjsze%>" size="20" maxlength="17" readonly>
    <strong>��������ܶ�=�������+����������ʩ���ɱ�*����ϵ��-����������ۺ���*����ϵ��-�ۿͻ�Ƿ��-�ۿͻ��⳥��-�����ڷ�</strong></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�������</span></td>
  <td><input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="9" >
% </td>
  <td align="right"><font color="#FF0000">*</font>�����������</td>
  <td><input type="text" name="tzjsbl" value="<%=tzjsbl%>" size="10" maxlength="9" onChange="jsValue(insertform)">
% </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·���㷽ʽ</span></td> 
  <td width="32%">
    <%
	cf.radioToken(out, "sdljsfs","1+ͳһ��������&2+������������&3+������",sdljsfs,true);
%></td>
  <td align="right" width="18%"><span class="STYLE4"><font color="#FF0000">*</font>ˮ��·���</span></td> 
  <td width="32%"> 
    <input type="text" name="sdlje" value="<%=sdlje%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE4"><font color="#FF0000">*</font>ˮ��·�������</span></td> 
  <td width="32%"> 
    <input type="text" name="sdljsbl" value="<%=sdljsbl%>" size="10" maxlength="9" readonly>
    % </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·������</span></td> 
  <td width="32%"><input type="text" name="sdljsje" value="<%=sdljsje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�����ܶ�</span></td>
  <td colspan="3"><input type="text" name="jsje" value="<%=jsje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5"><span class="STYLE2">�����ܶ�</span>��<span class="STYLE4">��������ܶ�</span>����<span class="STYLE4">�������</span>��<span class="STYLE4">�����������</span>��</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2"><font color="#FF0000">*</font>�Ƿ�۲��Ͽ�</span></td>
  <td><%
	cf.radioToken(out, "sfkclk","Y+��&N+��",sfkclk,true);
%></td>
  <td align="right"><font color="#FF0000">*</font>���Ϸ���</td>
  <td><input type="text" name="clfk" value="<%=clfk%>" size="20" maxlength="17" onChange="jsValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">���Ϸ�</span></td> 
  <td width="32%"><input type="text" name="clf" value="<%=clf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%"><font color="#FF0000">*</font>�����˷�</td> 
  <td width="32%"> 
    <input type="text" name="clyf" value="<%=clyf%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
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
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ���Ѹ�����</span></td> 
  <td width="32%"><%
	cf.radioToken(out, "sfkyfgf","Y+��&N+��",sfkyfgf,true);
%></td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">�Ѹ����̿�</span></td> 
  <td width="32%"><input name="yfgck" type="text"  value="<%=yfgck%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">�Ƿ���ʱ���</span></td>
  <td><%
	cf.radioToken(out, "sfkzbj","Y+���ʱ���������ɸ�&M+���ʱ�������ɸ�&N+�����ʱ���",sfkzbj,true);
%></td>
  <td align="right">���ʱ������</td>
  <td>
    <%
	cf.radioToken(out, "kzbjjs","1+�������&2+�����ܶ�",kzbjjs,true);
%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>Ӧ���ʱ������</td> 
  <td width="32%"> 
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" <%if (!sfkzbj.equals("M")) out.println("readonly");%> size="10" maxlength="9" onChange="jsValue(insertform)">
    % </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE2">���ʱ���</span></td> 
  <td width="32%"><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>������</td>
  <td><input type="text" name="fkje" value="<%=fkje%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="jlje" value="<%=jlje%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="qtje" value="<%=qtje%>" size="20" maxlength="17" onChange="jsValue(insertform)">  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">Ӧ�����</span></td>
  <td><input type="text" name="yfje" value="<%=yfje%>" size="20" maxlength="17" readonly>
    <span class="STYLE5">��ˮ�粿��</span></td>
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
  </select>  </td>
  <td align="right">��������</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ע</td>
  <td colspan="3"><textarea name="bz" cols="71" rows="3"></textarea>  </td>
</tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="����" onClick="f_do(insertform)">
	<input name="button" type="button" onClick="window.open('dyjsd.jsp?jsjlh=<%=jsjlh%>')"  value="��ӡ���㵥">
	<input type="reset"  value="����" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function jsValue(FormName)//����FormName:Form������
{
	var jsjsze=<%=(jsjsze+kghzx*zxxs-kghjx*jxxs+kkhqk+kkhpck+kyqf)%>-FormName.kkhqk.value*1.0-FormName.kkhpck.value*1.0-FormName.kyqf.value*1.0;//������
	jsjsze=round(jsjsze,2);
	FormName.jsjsze.value=jsjsze;

	var jsje=FormName.jsjsze.value/100*(FormName.jsbl.value*1.0+FormName.tzjsbl.value*1.0);//������
	jsje=round(jsje,2);
	FormName.jsje.value=jsje;

	
	var kzbj=FormName.jsjsze.value/100*FormName.kzbjbl.value;
	kzbj=round(kzbj,2);
	FormName.kzbj.value=kzbj;

	var yfje=FormName.jsje.value*1;//ʵ�ʲ���
	if ("<%=sfkclk%>"=="Y")//�Ƿ�۲��Ͽ�
	{
		yfje=yfje-FormName.clf.value*1;
	}
	if ("<%=sfkgdyp%>"=="Y")//�Ƿ�۹�����Ʒ
	{
		yfje=yfje-FormName.gdyp.value*1;
	}
	if ("<%=sfkyfgf%>"=="Y")//�Ƿ���Ѹ�����
	{
		yfje=yfje-FormName.yfgck.value*1;
	}

	yfje=yfje-FormName.kzbj.value*1-FormName.clfk.value*1-FormName.clyf.value*1-FormName.fkje.value*1+FormName.jlje.value*1+FormName.qtje.value*1;
	yfje=round(yfje,2);
	FormName.yfje.value=yfje;

}

function f_do(FormName)//����FormName:Form������
{
	jsValue(FormName);

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

	if(	javaTrim(FormName.khpck)=="") {
		alert("������[�ͻ��⳥��]��");
		FormName.khpck.focus();
		return false;
	}
	if(!(isFloat(FormName.khpck, "�ͻ��⳥��"))) {
		return false;
	}
	if(	javaTrim(FormName.yqf)=="") {
		alert("������[���ڷ�]��");
		FormName.yqf.focus();
		return false;
	}
	if(!(isFloat(FormName.yqf, "���ڷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.jsyh)=="") {
		alert("������[�����Ż�]��");
		FormName.jsyh.focus();
		return false;
	}
	if(!(isFloat(FormName.jsyh, "�����Ż�"))) {
		return false;
	}
	if(	javaTrim(FormName.khqk)=="") {
		alert("������[�ͻ�Ƿ��]��");
		FormName.khqk.focus();
		return false;
	}
	if(!(isFloat(FormName.khqk, "�ͻ�Ƿ��"))) {
		return false;
	}
	
	if(	javaTrim(FormName.kkhpck)=="") {
		alert("������[�ۿͻ��⳥��]��");
		FormName.kkhpck.focus();
		return false;
	}
	if(!(isFloat(FormName.kkhpck, "�ۿͻ��⳥��"))) {
		return false;
	}
	if(	javaTrim(FormName.kyqf)=="") {
		alert("������[�����ڷ�]��");
		FormName.kyqf.focus();
		return false;
	}
	if(!(isFloat(FormName.kyqf, "�����ڷ�"))) {
		return false;
	}
	if(	javaTrim(FormName.kkhqk)=="") {
		alert("������[�ۿͻ�Ƿ��]��");
		FormName.kkhqk.focus();
		return false;
	}
	if(!(isFloat(FormName.kkhqk, "�ۿͻ�Ƿ��"))) {
		return false;
	}

	if(	javaTrim(FormName.zxxs)=="") {
		alert("������[����ϵ��]��");
		FormName.zxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.zxxs, "����ϵ��"))) {
		return false;
	}
	
	if(	javaTrim(FormName.kghzx)=="") {
		alert("������[����������ʩ���ɱ�]��");
		FormName.kghzx.focus();
		return false;
	}
	if(!(isFloat(FormName.kghzx, "����������ʩ���ɱ�"))) {
		return false;
	}
	
	if(	javaTrim(FormName.jxxs)=="") {
		alert("������[����ϵ��]��");
		FormName.jxxs.focus();
		return false;
	}
	if(!(isFloat(FormName.jxxs, "����ϵ��"))) {
		return false;
	}
	
	if(	javaTrim(FormName.kghjx)=="") {
		alert("������[����������ۺ���]��");
		FormName.kghjx.focus();
		return false;
	}
	if(!(isFloat(FormName.kghjx, "����������ۺ���"))) {
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
