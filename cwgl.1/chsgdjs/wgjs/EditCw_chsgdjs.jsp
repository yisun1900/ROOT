<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>���㣭�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE4 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String jsjlh=request.getParameter("jsjlh");



String khbh=null;
String jsrq=null;
String lrr=null;
String lrsj=null;
String bz=null;
String bqtfsm=null;
String kqtfsm=null;

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
String sgd=null;
String sgbz=null;
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
String zjxxh="";
int fwmj=0;

double clcb=0;
double kgcyz=0;

double kzbjbl=2;
double kfxbzjbl=3;
double zjcbglfbl=0;
double sdlcbfbl=70;
double htwzjcbbl=75;
double sjfbl=5;
double htnsdjebl=70;
double ycfbl=0;
double cldbbl=21;

double qye=0;
double zjxje=0;
double zxje=0;
double jxje=0;
double htsgcb=0;
double zjxsgcb=0;


double zjcbglf=0;
double sdlzxje=0;
double sldzjcb=0;
double htwzjje=0;
double htwzjcb=0;
double sgcb=0;
double sgcbclf=0;
double sgcbrgf=0;

double sssjf=0;
double sjftc=0;
double kqzlf=0;
double bbjf=0;
double bqtf=0;
double htnsdje=0;
double bsdcb=0;
double ycfje=0;

double bycf=0;
double cbhjje=0;
double kzbj=0;
double kfxbzj=0;
double xxfh=0;
double clbdbkk=0;
double kgjsje=0;
double kqtf=0;
double kxcf=0;
double sjzfe=0;
double kfk=0;
double fwjcfk=0;
double kdkk=0;
double wxxkk=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();



	ls_sql="select wxxkk,kfk,fwjcfk,kdkk,khbh,jsrq,qye,zjxje,zxje,jxje,htsgcb,zjxsgcb,zjcbglfbl,zjcbglf,sdlzxje,sdlcbfbl,sldzjcb,htwzjje,htwzjcbbl,htwzjcb,sgcb,sgcbclf,sgcbrgf,sssjf,sjfbl,sjftc,fwmj,kqzlf,bbjf,bqtf,bqtfsm,htnsdje,htnsdjebl,bsdcb,ycfje,ycfbl,bycf,cbhjje,kzbjbl,kzbj,kgcyz,kfxbzjbl,kfxbzj,xxfh,clcb,cldbbl,clbdbkk,kgjsje,kqtf,kqtfsm,kxcf,sjzfe,lrr,lrsj,lrbm,bz ";
	ls_sql+=" from  cw_chsgdjs";
	ls_sql+=" where jsjlh='"+jsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxxkk=rs.getDouble("wxxkk");
		kfk=rs.getDouble("kfk");
		fwjcfk=rs.getDouble("fwjcfk");
		kdkk=rs.getDouble("kdkk");
		khbh=cf.fillNull(rs.getString("khbh"));
		jsrq=cf.fillNull(rs.getDate("jsrq"));
		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		zxje=rs.getDouble("zxje");
		jxje=rs.getDouble("jxje");
		htsgcb=rs.getDouble("htsgcb");
		zjxsgcb=rs.getDouble("zjxsgcb");
		zjcbglfbl=rs.getDouble("zjcbglfbl");
		zjcbglf=rs.getDouble("zjcbglf");
		sdlzxje=rs.getDouble("sdlzxje");
		sdlcbfbl=rs.getDouble("sdlcbfbl");
		sldzjcb=rs.getDouble("sldzjcb");
		htwzjje=rs.getDouble("htwzjje");
		htwzjcbbl=rs.getDouble("htwzjcbbl");
		htwzjcb=rs.getDouble("htwzjcb");
		sgcb=rs.getDouble("sgcb");
		sgcbclf=rs.getDouble("sgcbclf");
		sgcbrgf=rs.getDouble("sgcbrgf");
		sssjf=rs.getDouble("sssjf");
		sjfbl=rs.getDouble("sjfbl");
		sjftc=rs.getDouble("sjftc");
		fwmj=rs.getInt("fwmj");
		kqzlf=rs.getDouble("kqzlf");
		bbjf=rs.getDouble("bbjf");
		bqtf=rs.getDouble("bqtf");
		bqtfsm=cf.fillNull(rs.getString("bqtfsm"));
		htnsdje=rs.getDouble("htnsdje");
		htnsdjebl=rs.getDouble("htnsdjebl");
		bsdcb=rs.getDouble("bsdcb");
		ycfje=rs.getDouble("ycfje");
		ycfbl=rs.getDouble("ycfbl");
		bycf=rs.getDouble("bycf");
		cbhjje=rs.getDouble("cbhjje");
		kzbjbl=rs.getDouble("kzbjbl");
		kzbj=rs.getDouble("kzbj");
		kgcyz=rs.getDouble("kgcyz");
		kfxbzjbl=rs.getDouble("kfxbzjbl");
		kfxbzj=rs.getDouble("kfxbzj");
		xxfh=rs.getDouble("xxfh");
		clcb=rs.getDouble("clcb");
		cldbbl=rs.getDouble("cldbbl");
		clbdbkk=rs.getDouble("clbdbkk");
		kgjsje=rs.getDouble("kgjsje");
		kqtf=rs.getDouble("kqtf");
		kqtfsm=cf.fillNull(rs.getString("kqtfsm"));
		kxcf=rs.getDouble("kxcf");
		sjzfe=rs.getDouble("sjzfe");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select zjxxh,gdjsjd,khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" ,qye,zjxje,fwmj";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getDouble("qye");
		zjxje=rs.getDouble("zjxje");
		fwmj=rs.getInt("fwmj");

		zjxxh=cf.fillNull(rs.getString("zjxxh"));
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

	if (!gdjsjd.equals("Y"))//1:�������ڽ�������
	{
		out.println("<BR>���������󣬽�����Ȳ���ȷ");
		return;
	}



	

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
<form method="post" action="SaveEditCw_chsgdjs.jsp" name="insertform"  >
<div align="center">���㣭�޸�</div>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�����Ѽ�¼��</td>
	<td  width="8%">����</td>
	<td  width="7%">��������</td>
	<td  width="7%">��ͬ���</td>
	<td  width="6%">����ľ�Ž��</td>
	<td  width="8%">ʵ�տ�</td>
	<td  width="7%">�Ѹ�����</td>
	<td  width="4%">��������</td>
	<td  width="7%">�������</td>
	<td  width="5%">¼����</td>
	<td  width="54%">��ע</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_chbgfjl.bgfjlh,gdjsjdmc,cw_chbgfjl.bfrq,TO_CHAR(cw_chbgfjl.qye),TO_CHAR(cw_chbgfjl.zhhtzcbj),TO_CHAR(cw_chbgfjl.ssk),TO_CHAR(cw_chbgfjl.yfgf),cw_chbgfjl.bfbl||'%',cw_chbgfjl.bfje,cw_chbgfjl.lrr,cw_chbgfjl.bz  ";
	ls_sql+=" FROM cw_chbgfjl,dm_gdjsjd  ";
    ls_sql+=" where cw_chbgfjl.lx=dm_gdjsjd.gdjsjd(+) ";
    ls_sql+=" and cw_chbgfjl.khbh='"+khbh+"'";
    ls_sql+=" order by cw_chbgfjl.lrsj desc";
    pageObj.sql=ls_sql;
	pageObj.initPage("Cw_chbgfjlCxList.jsp","","","");

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
    <td colspan="4" align="center" bgcolor="#E8E8FF"><input name="button3" type="button" onClick="window.open('/dzbjtwo/zxbjmx/Bj_khbjmxViewList.jsp?khbh=<%=khbh%>')" value="���ӱ���">
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
    <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">ʩ����</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">�ֳ�������</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">��ͬ��</span></td> 
  <td width="30%"><input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly></td>
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">������</span></td> 
  <td width="30%"><input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">������</span></td> 
  <td width="30%"><input type="text" name="zxje" value="<%=zxje%>" size="20" maxlength="17" readonly></td>
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">������</span></td> 
  <td width="30%"><input type="text" name="jxje" value="<%=jxje%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">��ͬʩ���ɱ�</span></td> 
  <td width="30%"><input type="text" name="htsgcb" value="<%=htsgcb%>" size="20" maxlength="17" readonly></td>
  <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE4">������ʩ���ɱ�</span></td> 
  <td width="30%"><input type="text" name="zjxsgcb" value="<%=zjxsgcb%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF">������Ŀ</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>ֱ�ӳɱ�����ѱ���</td>
  <td><input type="text" name="zjcbglfbl" value="<%=zjcbglfbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %</td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ֱ�ӳɱ������</span></td>
  <td colspan="3"><input type="text" name="zjcbglf" value="<%=zjcbglf%>" size="20" maxlength="17" >
    ֱ�ӳɱ�����ѣ�ʩ���ɱ�(��ͬ��������)��ֱ�ӳɱ�����ѱ���</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·������</span></td>
  <td><input type="text" name="sdlzxje" value="<%=sdlzxje%>" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>ˮ��·�ɱ��ѱ���</td>
  <td><input type="text" name="sdlcbfbl" value="<%=sdlcbfbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ˮ��·����ֱ�ӳɱ���</span></td>
  <td colspan="3"><input type="text" name="sldzjcb" value="<%=sldzjcb%>" size="20" maxlength="17" >
    ˮ��·����ֱ�ӳɱ��ѣ�ˮ��·�������ˮ��·�ɱ��ѱ���</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ͬ����Ŀ���ӽ��</span></td>
  <td><input type="text" name="htwzjje" value="<%=htwzjje%>" size="20" maxlength="17" >
    ����ˮ��</td>
  <td align="right"><font color="#FF0000">*</font>��ͬ����Ŀ���ӳɱ�����</td>
  <td><input type="text" name="htwzjcbbl" value="<%=htwzjcbbl%>" size="10" maxlength="9" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ͬ����Ŀ����ֱ�ӳɱ���</span></td>
  <td colspan="3"><input type="text" name="htwzjcb" value="<%=htwzjcb%>" size="20" maxlength="17" >
    ��ͬ����Ŀ����ֱ�ӳɱ��ѣ���ͬ����Ŀ���ӽ�����ͬ����Ŀ���ӳɱ�����</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ʩ���ɱ��˹���</span></td>
  <td colspan="3"><input type="text" name="sgcb" value="<%=sgcb%>" size="20" maxlength="17" >
    ʩ���ɱ��˹��ѣ���ͬʩ���ɱ��ۣ�������Ŀʩ���ɱ�</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�ٲ��Ϸ�</span></td>
  <td><input type="text" name="sgcbclf" value="<%=sgcbclf%>" size="20" maxlength="17" >  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">���˹���</span></td>
  <td><input type="text" name="sgcbrgf" value="<%=sgcbrgf%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ʵ����Ʒ�</span></td>
  <td><input type="text" name="sssjf" value="<%=sssjf%>" size="20" maxlength="17" >  </td>
  <td align="right"><font color="#FF0000">*</font>��Ʒ���ɱ���</td>
  <td><input type="text" name="sjfbl" value="<%=sjfbl%>" size="10" maxlength="9" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">����Ʒ����</span></td>
  <td colspan="3"><input type="text" name="sjftc" value="<%=sjftc%>" size="20" maxlength="17" >
    ����Ʒ���ɣ�ʵ����Ʒѡ���Ʒ���ɱ���</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�������</span></td>
  <td><input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="8" ></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��������Э����</span></td>
  <td><input type="text" name="kqzlf" value="<%=kqzlf%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�������</td>
  <td><input type="text" name="bbjf" value="<%=bbjf%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>����������</td>
  <td><input type="text" name="bqtf" value="<%=bqtf%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">����������˵��</td>
  <td colspan="3"><input type="text" name="bqtfsm" value="<%=bqtfsm%>" size="73" maxlength="200" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ͬ��ˮ����</span></td>
  <td><input type="text" name="htnsdje" value="<%=htnsdje%>" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>��ͬ��ˮ�������</td>
  <td><input type="text" name="htnsdjebl" value="<%=htnsdjebl%>" size="10" maxlength="9" >
    % </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ʩ���鳤ˮ��ɱ�</span></td>
  <td><input type="text" name="bsdcb" value="<%=bsdcb%>" size="20" maxlength="17" >  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">Զ�̷ѽ��</span></td>
  <td><input type="text" name="ycfje" value="<%=ycfje%>" size="20" maxlength="17" ></td>
  <td align="right"><font color="#FF0000">*</font>Զ�̷ѱ���</td>
  <td><input type="text" name="ycfbl" value="<%=ycfbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">��ʩ���鳤Զ�̷�</span></td>
  <td colspan="3"><input type="text" name="bycf" value="<%=bycf%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ʩ���鳤�ɱ��ϼƽ��</span></td>
  <td colspan="3"><input type="text" name="cbhjje" value="<%=cbhjje%>" size="20" maxlength="17" >
      <BR>
      <strong>ʩ���鳤�ɱ��ϼƽ��=ֱ�ӳɱ������+ˮ��·����ֱ�ӳɱ���+��ͬ����Ŀ����ֱ�ӳɱ���+ʩ���ɱ��˹��� <BR>
        <BR>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+����Ʒ����+��������Э����+�������+����������+��ʩ���鳤ˮ��ɱ�+��ʩ���鳤Զ�̷� </strong></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="center" bgcolor="#E8E8FF">�ۿ���Ŀ</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�۹����ʱ������</td>
  <td><input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    %</td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�۹����ʱ���</span></td>
  <td><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" ></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�۷��ձ�֤�����</td>
  <td><input type="text" name="kfxbzjbl" value="<%=kfxbzjbl%>" size="10" maxlength="9" onChange="f_jsje(insertform)">
    % </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�۷��ձ�֤��</span></td>
  <td><input type="text" name="kfxbzj" value="<%=kfxbzj%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">�۹���Ԥ֧</span></td>
  <td><input type="text" name="kgcyz" value="<%=kgcyz%>" size="20" maxlength="17" ></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>ʩ���鳤��Ϣ����</td>
  <td><input type="text" name="xxfh" value="<%=xxfh%>" size="20" maxlength="17" onChange="f_jsje(insertform)">  </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">���ϳɱ�</span></td>
  <td><input type="text" name="clcb" value="<%=clcb%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���ϴ�����</td>
  <td><input type="text" name="cldbbl" value="<%=cldbbl%>" size="10" maxlength="9" >
    % </td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">���ϲ����ۿ�</span></td>
  <td><input type="text" name="clbdbkk" value="<%=clbdbkk%>" size="20" maxlength="17" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>�е��������ٽ��</td>
  <td><input type="text" name="kgjsje" value="<%=kgjsje%>" size="20" maxlength="17" onChange="f_jsje(insertform)">  </td>
  <td align="right"><font color="#FF0000">*</font>��ʩ���鳤��������</td>
  <td><input type="text" name="kqtf" value="<%=kqtf%>" size="20" maxlength="17" onChange="f_jsje(insertform)">  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">��ʩ���鳤��������˵��</td>
  <td colspan="3"><input type="text" name="kqtfsm" value="<%=kqtfsm%>" size="73" maxlength="200" >  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>���湤�̷���</td>
  <td><input type="text" name="kfk" value="<%=kfk%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>�����췣��</td>
  <td><input type="text" name="fwjcfk" value="<%=fwjcfk%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>����Ϣ�ۿ�</td>
  <td><input type="text" name="wxxkk" value="<%=wxxkk%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>�۴��ۿ�</td>
  <td><input type="text" name="kdkk" value="<%=kdkk%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>������������</td>
  <td><input type="text" name="kxcf" value="<%=kxcf%>" size="20" maxlength="17" onChange="f_jsje(insertform)"></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE4">ʵ��֧��ʩ���鳤���</span></td>
  <td colspan="3"><input type="text" name="sjzfe" value="<%=sjzfe%>" size="20" maxlength="17" >
      <BR>
      <strong>ʵ��֧��ʩ���鳤���=ʩ���鳤�ɱ��ϼƽ��-�۹����ʱ���-�۷��ձ�֤��-ʩ���鳤��Ϣ����-���ϳɱ� <BR>
-���ϲ����ۿ�-�е��������ٽ��-��ʩ���鳤��������-�����������ѣ����湤�̷�������췣��۴��ۿ����Ϣ�ۿ�</strong></td>
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
  <td align="right"><font color="#FF0000">*</font>��������</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="20%">��ע</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>      </td>
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

function f_jsje(FormName)//����FormName:Form������
{
	var zjcbglf=(FormName.htsgcb.value*1.0+FormName.zjxsgcb.value*1.0)*FormName.zjcbglfbl.value/100.0;
	zjcbglf=round(zjcbglf,2);
	FormName.zjcbglf.value=zjcbglf;

	var sldzjcb=FormName.sdlzxje.value*FormName.sdlcbfbl.value/100.0;
	sldzjcb=round(sldzjcb,2);
	FormName.sldzjcb.value=sldzjcb;

	var htwzjcb=FormName.htwzjje.value*FormName.htwzjcbbl.value/100.0;
	htwzjcb=round(htwzjcb,2);
	FormName.htwzjcb.value=htwzjcb;

	var sjftc=FormName.sssjf.value*FormName.sjfbl.value/100.0;
	sjftc=round(sjftc,2);
	FormName.sjftc.value=sjftc;

	var bsdcb=FormName.htnsdje.value*FormName.htnsdjebl.value/100.0;
	bsdcb=round(bsdcb,2);
	FormName.bsdcb.value=bsdcb;

	var bycf=FormName.ycfje.value*FormName.ycfbl.value/100.0;
	bycf=round(bycf,2);
	FormName.bycf.value=bycf;

	//ʩ���鳤�ɱ��ϼƽ��
	var cbhjje=FormName.zjcbglf.value*1.0+FormName.sldzjcb.value*1.0+FormName.htwzjcb.value*1.0+FormName.sgcb.value*1.0+FormName.sjftc.value*1.0+FormName.kqzlf.value*1.0+FormName.bbjf.value*1.0+FormName.bqtf.value*1.0+FormName.bsdcb.value*1.0+FormName.bycf.value*1.0;
	cbhjje=round(cbhjje,2);
	FormName.cbhjje.value=cbhjje;

	var kzbj=FormName.cbhjje.value*FormName.kzbjbl.value/100.0;
	kzbj=round(kzbj,2);
	FormName.kzbj.value=kzbj;

	var kfxbzj=FormName.cbhjje.value*FormName.kfxbzjbl.value/100.0;
	kfxbzj=round(kfxbzj,2);
	FormName.kfxbzj.value=kfxbzj;

	//ʵ��֧��ʩ���鳤���
	var sjzfe=FormName.cbhjje.value*1.0-FormName.kzbj.value*1.0-FormName.kfxbzj.value*1.0-FormName.kgcyz.value*1.0-FormName.xxfh.value*1.0-FormName.clcb.value*1.0-FormName.clbdbkk.value*1.0-FormName.kgjsje.value*1.0-FormName.kqtf.value*1.0-FormName.kxcf.value*1.0-FormName.kfk.value*1.0-FormName.fwjcfk.value*1.0-FormName.kdkk.value*1.0-FormName.wxxkk.value*1.0;
	sjzfe=round(sjzfe,2);
	FormName.sjzfe.value=sjzfe;
}

function f_do(FormName)//����FormName:Form������
{
	f_jsje(FormName);

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
		alert("������[ʩ����]��");
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
	if(	javaTrim(FormName.qye)=="") {
		alert("������[��ͬ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "��ͬ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("������[������]��");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.zxje)=="") {
		alert("������[������]��");
		FormName.zxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zxje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.jxje)=="") {
		alert("������[������]��");
		FormName.jxje.focus();
		return false;
	}
	if(!(isFloat(FormName.jxje, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.htsgcb)=="") {
		alert("������[��ͬʩ���ɱ�]��");
		FormName.htsgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.htsgcb, "��ͬʩ���ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxsgcb)=="") {
		alert("������[������ʩ���ɱ�]��");
		FormName.zjxsgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxsgcb, "������ʩ���ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zjcbglfbl)=="") {
		alert("������[ֱ�ӳɱ�����ѱ���]��");
		FormName.zjcbglfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjcbglfbl, "ֱ�ӳɱ�����ѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zjcbglf)=="") {
		alert("������[ֱ�ӳɱ������]��");
		FormName.zjcbglf.focus();
		return false;
	}
	if(!(isFloat(FormName.zjcbglf, "ֱ�ӳɱ������"))) {
		return false;
	}
	if(	javaTrim(FormName.sdlzxje)=="") {
		alert("������[ˮ��·������]��");
		FormName.sdlzxje.focus();
		return false;
	}
	if(!(isFloat(FormName.sdlzxje, "ˮ��·������"))) {
		return false;
	}
	if(	javaTrim(FormName.sdlcbfbl)=="") {
		alert("������[ˮ��·�ɱ��ѱ���]��");
		FormName.sdlcbfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sdlcbfbl, "ˮ��·�ɱ��ѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sldzjcb)=="") {
		alert("������[ˮ��·����ֱ�ӳɱ���]��");
		FormName.sldzjcb.focus();
		return false;
	}
	if(!(isFloat(FormName.sldzjcb, "ˮ��·����ֱ�ӳɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.htwzjje)=="") {
		alert("������[��ͬ����Ŀ���ӽ��]��");
		FormName.htwzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.htwzjje, "��ͬ����Ŀ���ӽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.htwzjcbbl)=="") {
		alert("������[��ͬ����Ŀ���ӳɱ�����]��");
		FormName.htwzjcbbl.focus();
		return false;
	}
	if(!(isFloat(FormName.htwzjcbbl, "��ͬ����Ŀ���ӳɱ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.htwzjcb)=="") {
		alert("������[��ͬ����Ŀ����ֱ�ӳɱ���]��");
		FormName.htwzjcb.focus();
		return false;
	}
	if(!(isFloat(FormName.htwzjcb, "��ͬ����Ŀ����ֱ�ӳɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcb)=="") {
		alert("������[ʩ���ɱ��˹���]��");
		FormName.sgcb.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcb, "ʩ���ɱ��˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbclf)=="") {
		alert("������[�ٲ��Ϸ�]��");
		FormName.sgcbclf.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbclf, "�ٲ��Ϸ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbrgf)=="") {
		alert("������[���˹���]��");
		FormName.sgcbrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbrgf, "���˹���"))) {
		return false;
	}
	if(	javaTrim(FormName.sssjf)=="") {
		alert("������[ʵ����Ʒ�]��");
		FormName.sssjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sssjf, "ʵ����Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjfbl)=="") {
		alert("������[��Ʒ���ɱ���]��");
		FormName.sjfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjfbl, "��Ʒ���ɱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.sjftc)=="") {
		alert("������[����Ʒ����]��");
		FormName.sjftc.focus();
		return false;
	}
	if(!(isFloat(FormName.sjftc, "����Ʒ����"))) {
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[�������]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.kqzlf)=="") {
		alert("������[��������Э����]��");
		FormName.kqzlf.focus();
		return false;
	}
	if(!(isFloat(FormName.kqzlf, "��������Э����"))) {
		return false;
	}
	if(	javaTrim(FormName.bbjf)=="") {
		alert("������[�������]��");
		FormName.bbjf.focus();
		return false;
	}
	if(!(isFloat(FormName.bbjf, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.bqtf)=="") {
		alert("������[����������]��");
		FormName.bqtf.focus();
		return false;
	}
	if(!(isFloat(FormName.bqtf, "����������"))) {
		return false;
	}
	if (parseFloat(FormName.bqtf.value)!=0)
	{
		if(	javaTrim(FormName.bqtfsm)=="") {
			alert("������[����������˵��]��");
			FormName.bqtfsm.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.htnsdje)=="") {
		alert("������[��ͬ��ˮ����]��");
		FormName.htnsdje.focus();
		return false;
	}
	if(!(isFloat(FormName.htnsdje, "��ͬ��ˮ����"))) {
		return false;
	}
	if(	javaTrim(FormName.htnsdjebl)=="") {
		alert("������[��ͬ��ˮ�������]��");
		FormName.htnsdjebl.focus();
		return false;
	}
	if(!(isFloat(FormName.htnsdjebl, "��ͬ��ˮ�������"))) {
		return false;
	}
	if(	javaTrim(FormName.bsdcb)=="") {
		alert("������[��ʩ���鳤ˮ��ɱ�]��");
		FormName.bsdcb.focus();
		return false;
	}
	if(!(isFloat(FormName.bsdcb, "��ʩ���鳤ˮ��ɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.ycfje)=="") {
		alert("������[Զ�̷ѽ��]��");
		FormName.ycfje.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfje, "Զ�̷ѽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ycfbl)=="") {
		alert("������[Զ�̷ѱ���]��");
		FormName.ycfbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ycfbl, "Զ�̷ѱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bycf)=="") {
		alert("������[��ʩ���鳤Զ�̷�]��");
		FormName.bycf.focus();
		return false;
	}
	if(!(isFloat(FormName.bycf, "��ʩ���鳤Զ�̷�"))) {
		return false;
	}
	if(	javaTrim(FormName.cbhjje)=="") {
		alert("������[ʩ���鳤�ɱ��ϼƽ��]��");
		FormName.cbhjje.focus();
		return false;
	}
	if(!(isFloat(FormName.cbhjje, "ʩ���鳤�ɱ��ϼƽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("������[�۹����ʱ������]��");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "�۹����ʱ������"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbj)=="") {
		alert("������[�۹����ʱ���]��");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "�۹����ʱ���"))) {
		return false;
	}
	if(	javaTrim(FormName.kgcyz)=="") {
		alert("������[�۹���Ԥ֧]��");
		FormName.kgcyz.focus();
		return false;
	}
	if(!(isFloat(FormName.kgcyz, "�۹���Ԥ֧"))) {
		return false;
	}
	if(	javaTrim(FormName.kfxbzjbl)=="") {
		alert("������[�۷��ձ�֤�����]��");
		FormName.kfxbzjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kfxbzjbl, "�۷��ձ�֤�����"))) {
		return false;
	}
	if(	javaTrim(FormName.kfxbzj)=="") {
		alert("������[�۷��ձ�֤��]��");
		FormName.kfxbzj.focus();
		return false;
	}
	if(!(isFloat(FormName.kfxbzj, "�۷��ձ�֤��"))) {
		return false;
	}
	if(	javaTrim(FormName.xxfh)=="") {
		alert("������[ʩ���鳤��Ϣ����]��");
		FormName.xxfh.focus();
		return false;
	}
	if(!(isFloat(FormName.xxfh, "ʩ���鳤��Ϣ����"))) {
		return false;
	}
	if(	javaTrim(FormName.clcb)=="") {
		alert("������[���ϳɱ�]��");
		FormName.clcb.focus();
		return false;
	}
	if(!(isFloat(FormName.clcb, "���ϳɱ�"))) {
		return false;
	}
	if(	javaTrim(FormName.cldbbl)=="") {
		alert("������[���ϴ�����]��");
		FormName.cldbbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cldbbl, "���ϴ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.clbdbkk)=="") {
		alert("������[���ϲ����ۿ�]��");
		FormName.clbdbkk.focus();
		return false;
	}
	if(!(isFloat(FormName.clbdbkk, "���ϲ����ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.kgjsje)=="") {
		alert("������[�е��������ٽ��]��");
		FormName.kgjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.kgjsje, "�е��������ٽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtf)=="") {
		alert("������[��ʩ���鳤��������]��");
		FormName.kqtf.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtf, "��ʩ���鳤��������"))) {
		return false;
	}
	if (parseFloat(FormName.kqtf.value)!=0)
	{
		if(	javaTrim(FormName.kqtfsm)=="") {
			alert("������[��ʩ���鳤��������˵��]��");
			FormName.kqtfsm.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.kfk)=="") {
		alert("������[���湤�̷���]��");
		FormName.kfk.focus();
		return false;
	}
	if(!(isFloat(FormName.kfk, "���湤�̷���"))) {
		return false;
	}
	if(	javaTrim(FormName.fwjcfk)=="") {
		alert("������[�����췣��]��");
		FormName.fwjcfk.focus();
		return false;
	}
	if(!(isFloat(FormName.fwjcfk, "�����췣��"))) {
		return false;
	}
	if(	javaTrim(FormName.kdkk)=="") {
		alert("������[�۴��ۿ�]��");
		FormName.kdkk.focus();
		return false;
	}
	if(!(isFloat(FormName.kdkk, "�۴��ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.kxcf)=="") {
		alert("������[������������]��");
		FormName.kxcf.focus();
		return false;
	}
	if(!(isFloat(FormName.kxcf, "������������"))) {
		return false;
	}
	if(	javaTrim(FormName.wxxkk)=="") {
		alert("������[����Ϣ�ۿ�]��");
		FormName.kxcf.focus();
		return false;
	}
	if(!(isFloat(FormName.wxxkk, "����Ϣ�ۿ�"))) {
		return false;
	}
	if(	javaTrim(FormName.sjzfe)=="") {
		alert("������[ʵ��֧��ʩ���鳤���]��");
		FormName.sjzfe.focus();
		return false;
	}
	if(!(isFloat(FormName.sjzfe, "ʵ��֧��ʩ���鳤���"))) {
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
