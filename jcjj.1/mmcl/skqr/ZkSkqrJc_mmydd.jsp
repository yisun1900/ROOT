<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String jc_mmydd_yddbh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_kgrq=null;
String crm_khxx_jgrq=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String jc_mmydd_wjqk=null;
String jc_mmydd_sqdj=null;
String jc_mmydd_clgw=null;
String pdgc=null;
String pdgcmc=null;
String jc_mmydd_mmcljs=null;
String jc_mmydd_jhccsj=null;
String jc_mmydd_sccsj=null;
String jc_mmydd_ccsm=null;

String jc_mmydd_htrq=null;
String jc_mmydd_htqdr=null;
String jc_mmydd_htbz=null;
String jc_mmydd_wjsgsbz=null;
String jc_mmydd_swjsj=null;
String jc_mmydd_wjjsr=null;
String jc_mmydd_wjjsqk=null;
String jc_mmydd_srksj=null;
String jc_mmydd_rkr=null;
String jc_mmydd_rksm=null;
String jc_mmydd_jhazsj=null;
String jc_mmydd_sshsj=null;
String jc_mmydd_azkssj=null;
String jc_mmydd_azjssj=null;
String jc_mmydd_mmycyybm=null;
String jc_mmydd_ycsm=null;
String jc_mmydd_zsycyybm=null;
String jc_mmydd_ychsqk=null;
String jc_mmydd_ychsr=null;
String jc_mmydd_ychssj=null;
String jc_mmydd_sfjs=null;
String jc_mmydd_clzt=null;
String jc_mmydd_lrr=null;
String jc_mmydd_lrsj=null;
String sq_dwxx_dwmc=null;
String jc_mmydd_bz=null;

String sgbz=null;
String lxfs=null;

String paidr=null;
String paidsj=null;
String ycclzt=null;

String cxhdbm=null;

double wdzje=0;
double htje=0;
double zqmmhtje=0;
double zqwjhtje=0;
double zqblhtje=0;
double mmhtje=0;
double wjhtje=0;
double blhtje=0;
double zjhze=0;

double mmzkl=0;
double wjzkl=0;
double blzkl=0;
String dzyy=null;

double yfkze=0;
double mmfk=0;
int yfksl=0;
String mark="";

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="select cxhdbm,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.pdgc,jc_mmydd.pdgcmc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" ,jc_mmydd.wdzje,jc_mmydd.htje,jc_mmydd.zqmmhtje,jc_mmydd.zqwjhtje,jc_mmydd.zqblhtje,jc_mmydd.mmhtje,jc_mmydd.wjhtje,jc_mmydd.blhtje,jc_mmydd.zjhze ";
	ls_sql+=" ,jc_mmydd.mmzkl,jc_mmydd.wjzkl,jc_mmydd.blzkl,jc_mmydd.dzyy";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wdzje=rs.getDouble("wdzje");
		htje=rs.getDouble("htje");
		zqmmhtje=rs.getDouble("zqmmhtje");
		zqwjhtje=rs.getDouble("zqwjhtje");
		zqblhtje=rs.getDouble("zqblhtje");
		mmhtje=rs.getDouble("mmhtje");
		wjhtje=rs.getDouble("wjhtje");
		blhtje=rs.getDouble("blhtje");
		zjhze=rs.getDouble("zjhze");

		mmzkl=rs.getDouble("mmzkl");
		wjzkl=rs.getDouble("wjzkl");
		blzkl=rs.getDouble("blzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));

		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		paidr=cf.fillNull(rs.getString("paidr"));
		paidsj=cf.fillNull(rs.getDate("paidsj"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
		lxfs=cf.fillNull(rs.getString("lxfs"));

		jc_mmydd_yddbh=cf.fillNull(rs.getString("jc_mmydd_yddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_kgrq=cf.fillNull(rs.getDate("crm_khxx_kgrq"));
		crm_khxx_jgrq=cf.fillNull(rs.getDate("crm_khxx_jgrq"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		jc_mmydd_wjqk=cf.fillNull(rs.getString("jc_mmydd_wjqk"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("jc_mmydd_sqdj"));
		jc_mmydd_clgw=cf.fillNull(rs.getString("jc_mmydd_clgw"));
		pdgc=cf.fillNull(rs.getString("pdgc"));
		pdgcmc=cf.fillNull(rs.getString("pdgcmc"));
		jc_mmydd_mmcljs=cf.fillNull(rs.getString("jc_mmydd_mmcljs"));
		jc_mmydd_jhccsj=cf.fillNull(rs.getDate("jc_mmydd_jhccsj"));
		jc_mmydd_sccsj=cf.fillNull(rs.getDate("jc_mmydd_sccsj"));
		jc_mmydd_ccsm=cf.fillNull(rs.getString("jc_mmydd_ccsm"));
		jc_mmydd_htrq=cf.fillNull(rs.getDate("jc_mmydd_htrq"));
		jc_mmydd_htqdr=cf.fillNull(rs.getString("jc_mmydd_htqdr"));
		jc_mmydd_htbz=cf.fillNull(rs.getString("jc_mmydd_htbz"));
		jc_mmydd_wjsgsbz=cf.fillNull(rs.getString("jc_mmydd_wjsgsbz"));
		jc_mmydd_swjsj=cf.fillNull(rs.getDate("jc_mmydd_swjsj"));
		jc_mmydd_wjjsr=cf.fillNull(rs.getString("jc_mmydd_wjjsr"));
		jc_mmydd_wjjsqk=cf.fillNull(rs.getString("jc_mmydd_wjjsqk"));
		jc_mmydd_srksj=cf.fillNull(rs.getDate("jc_mmydd_srksj"));
		jc_mmydd_rkr=cf.fillNull(rs.getString("jc_mmydd_rkr"));
		jc_mmydd_rksm=cf.fillNull(rs.getString("jc_mmydd_rksm"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("jc_mmydd_jhazsj"));
		jc_mmydd_sshsj=cf.fillNull(rs.getDate("jc_mmydd_sshsj"));
		jc_mmydd_azkssj=cf.fillNull(rs.getDate("jc_mmydd_azkssj"));
		jc_mmydd_azjssj=cf.fillNull(rs.getDate("jc_mmydd_azjssj"));
		jc_mmydd_mmycyybm=cf.fillNull(rs.getString("jc_mmydd_mmycyybm"));
		jc_mmydd_ycsm=cf.fillNull(rs.getString("jc_mmydd_ycsm"));
		jc_mmydd_zsycyybm=cf.fillNull(rs.getString("jc_mmydd_zsycyybm"));
		jc_mmydd_ychsqk=cf.fillNull(rs.getString("jc_mmydd_ychsqk"));
		jc_mmydd_ychsr=cf.fillNull(rs.getString("jc_mmydd_ychsr"));
		jc_mmydd_ychssj=cf.fillNull(rs.getDate("jc_mmydd_ychssj"));
		jc_mmydd_sfjs=cf.fillNull(rs.getString("jc_mmydd_sfjs"));
		jc_mmydd_clzt=cf.fillNull(rs.getString("jc_mmydd_clzt"));
		jc_mmydd_lrr=cf.fillNull(rs.getString("jc_mmydd_lrr"));
		jc_mmydd_lrsj=cf.fillNull(rs.getDate("jc_mmydd_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		jc_mmydd_bz=cf.fillNull(rs.getString("jc_mmydd_bz"));
	}
	rs.close();
	ps.close();

	//�Ҿ�Ԥ����
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where ddbh='"+yddbh+"' and scbz='N' and fklxbm='21'";//21:ľ�ţ�22:����23:���ģ�24���Ҿ�
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		mmfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if ( mmfk < (zjhze-11))
	{
		if ( yfkze < (zjhze-11-mmfk))
		{
			mark="1";//Ԥ����㣬�˳�
			out.println("<strong><font color=\"#FF0000\">���ѣ�����㣬����ȷ�ϣ�</font></strong>");
			out.println("<BR>����ʵ�����"+mmfk+",���üҾ�Ԥ�����"+yfkze);
			out.println("<BR>��������"+cf.formatDouble(zjhze)+"��Ӧ���������"+cf.formatDouble(zjhze-mmfk));
			return ;
		}
		else{
			mark="2";//�����,��Ԥ����ת��
		}
	}

%>

<html>
<head>
<title>ľ��Ԥ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
  
<form method="post" action="" name="selectform">

<div align="center">ľ��Ԥ����---�տ�ȷ�ϣ�Ԥ������ţ�<%=jc_mmydd_yddbh%>������11Ԫ���ڿ�ȷ�ϣ�</div>
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#CCCCFF">
      <td width="18%" align="right" bgcolor="#FFFFFF"><b>����ԭ��</b></td>
      <td colspan="4" bgcolor="#FFFFFF"><%=dzyy%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#FFFFFF"><strong>ľ�ź�ͬ���-��ǰ</strong></td>
      <td width="21%" bgcolor="#FFFFFF"><%=zqmmhtje%></td>
      <td width="21%" align="center" bgcolor="#FFFFFF">ľ���ۿ��ʣ�<%=mmzkl%></td>
      <td width="18%" align="right" bgcolor="#FFFFFF"><strong>ľ�ź�ͬ���-�ۺ�</strong></td>
      <td width="22%" bgcolor="#FFFFFF"><%=mmhtje%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#FFFFFF"><strong>����ͬ���-��ǰ</strong></td>
      <td bgcolor="#FFFFFF"><%=zqwjhtje%></td>
      <td align="center" bgcolor="#FFFFFF">����ۿ��ʣ�<%=wjzkl%></td>
      <td align="right" bgcolor="#FFFFFF"><strong>����ͬ���-�ۺ�</strong></td>
      <td bgcolor="#FFFFFF"><%=wjhtje%> </td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right" bgcolor="#FFFFFF"><strong>������ͬ���-��ǰ</strong></td>
      <td bgcolor="#FFFFFF"><%=zqblhtje%></td>
      <td align="center" bgcolor="#FFFFFF">�����ۿ��ʣ�<%=blzkl%></td>
      <td align="right" bgcolor="#FFFFFF"><strong>������ͬ���-�ۺ�</strong></td>
      <td bgcolor="#FFFFFF"><%=blhtje%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td bgcolor="#FFFFFF" align="right"><strong>��ͬ���-��ǰ</strong></td>
      <td bgcolor="#FFFFFF"><%=wdzje%></td>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td align="right" bgcolor="#FFFFFF"><strong>��ͬ���-�ۺ�</strong></td>
      <td bgcolor="#FFFFFF"><%=htje%></td>
    </tr>

  </TABLE>

<%
	  if (mark.equals("2"))
	  {
%>
  
	<BR>	 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC" ><strong><font color="#FF0000">���ѣ�����㣬����Ԥ����ת����</font></strong></td>
	</tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2" rowspan="5" align="center" valign="top" >


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="10%">&nbsp;</td>
	<td  width="45%">����Ԥ����</td>
	<td  width="45%">���ý��</td>
  </tr>
  <%
	String fklxbm=null;
	String fklxmc=null;
	double fkje=0;

	ls_sql="SELECT cw_khfkjl.fklxbm,cw_fklxbm.fklxmc,sum(cw_khfkjl.fkje) fkje";
	ls_sql+=" FROM cw_khfkjl,cw_fklxbm";
	ls_sql+=" where cw_khfkjl.fklxbm=cw_fklxbm.fklxbm(+) ";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62������Ԥ���63��ľ��Ԥ���64������Ԥ���65���Ҿ�Ԥ����
	ls_sql+=" group by cw_khfkjl.fklxbm,cw_fklxbm.fklxmc";
	ls_sql+=" having sum(cw_khfkjl.fkje)!=0 ";
	ls_sql+=" order by sum(cw_khfkjl.fkje) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fklxbm=rs.getString("fklxbm");
		fklxmc=cf.fillHtml(rs.getString("fklxmc"));
		fkje=rs.getDouble("fkje");

		yfksl++;

		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td>
				<input name="fklxbm" type="checkbox" value="<%=fklxbm%>">			</td>
			<td><%=fklxmc%></td>
			<td align="right"><%=cf.formatDouble(fkje)%>
				<input name="fkje" type="hidden" value="<%=fkje%>">			</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	%> 
</table>	  </td>
      <td width="21%" align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">�������</font></b></td>
      <td width="29%" bgcolor="#FFFFCC"><%=cf.round(zjhze,2)%>����ͬ�������</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">�����Ѹ���</font></b></td>
      <td bgcolor="#FFFFCC"><%=mmfk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong><font color="#0000FF">Ӧ��������</font></strong></td>
      <td bgcolor="#FFFFCC"><%=cf.round(zjhze-mmfk,2)%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong><font color="#0000FF">����Ԥ����</font></strong></td>
      <td bgcolor="#FFFFCC"><%=yfkze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>Ԥ����ת����</td>
      <td bgcolor="#FFFFCC"><input type="text" name="sfkje" size="20" maxlength="20" value="<%=cf.round(zjhze-mmfk,2)%>"></td>
    </tr>
  </TABLE>

<%
	}
	else{
		%>
	<BR>	 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">�Ҿ�Ԥ����</font></b></td>
      <td width="21%" bgcolor="#FFFFFF"><%=yfkze%></td>
      <td width="21%" align="center" bgcolor="#FFFFFF"><font color="#CC0033"><strong>Ƿ�<%=cf.round(zjhze-mmfk,2)%></strong></font></td>
      <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">�����Ѹ���</font></b></td>
      <td width="22%" bgcolor="#FFFFFF"><%=mmfk%><input type="hidden" name="sfkje" value="0"></td>
    </tr>
  </TABLE>
		<%
	}
		
%>

	<BR>	 

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

    <tr bgcolor="#E8E8FF"> 
      <td width="18%" align="right" bgcolor="#FFFFFF">�տ�ȷ��ʱ��</td>
      <td width="21%" bgcolor="#FFFFFF"> 
      <input type="text" name="skqrsj" size="18" maxlength="10"  value="<%=cf.today()%>" readonly>      </td>
      <td width="21%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
      <td width="18%" bgcolor="#FFFFFF" align="right">�տ�ȷ����</td>
      <td width="22%" bgcolor="#FFFFFF"> 
      <input type="text" name="skqrr" size="18" maxlength="20"  value="<%=yhmc%>" readonly>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="5" align="center"> 
          <input type="button"  value="�� ��" onClick="f_do(selectform)">
          <input type="hidden" name="yddbh"  value="<%=yddbh%>" >      </td>
    </tr>
  </table>
</form>
<%
}
catch (Exception e) {
	out.print("Exception: " + e);
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

  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right"> 
        �ͻ����      </td>
      <td width="28%"> <%=khbh%></td>
      <td width="21%" align="right"> 
        ��ͬ��      </td>
      <td width="29%"><%=crm_khxx_hth%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right"> 
        �ͻ�����      </td>
      <td width="28%"> <%=crm_khxx_khxm%></td>
      <td width="21%" align="right">      </td>
      <td width="29%">&nbsp; </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right">���ݵ�ַ</td>
      <td colspan="3"><%=crm_khxx_fwdz%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right" bgcolor="#CCCCFF">ǩԼ����</td>
      <td width="28%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
      <td width="21%" align="right">���ʦ</td>
      <td width="29%"><%=crm_khxx_sjs%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right"> 
        ʩ����      </td>
      <td width="28%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%></td>
      <td width="21%" align="right"> 
        �೤      </td>
      <td width="29%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right"> 
        ��װǩԼ����      </td>
      <td width="28%"> <%=crm_khxx_qyrq%> </td>
      <td width="21%" align="right"> 
        �ʼ�      </td>
      <td width="29%"><%=crm_khxx_zjxm%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right"> 
        ��ͬ��������      </td>
      <td width="28%"> <%=crm_khxx_kgrq%> </td>
      <td width="21%" align="right"> 
        ��ͬ��������      </td>
      <td width="29%"> <%=crm_khxx_jgrq%> </td>
    </tr>
    <tr bgcolor="#CCCCFF" align="center"> 
      <td colspan="4"> 
        <input type="button" value="ľ�ų��ⵥ" onClick="window.open('/jcjj/mmdd/ViewJc_mmccd.jsp?yddbh=<%=yddbh%>')" name="button2">
        <input type="button" value="��ͬ��ϸ" onClick="window.open('/jcjj/mmdd/ViewJc_mmdgdmx.jsp?yddbh=<%=yddbh%>')" name="button3">      </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="22%" align="right"> 
        �ɵ�����      </td>
      <td width="28%"> <%=pdgc%> </td>
      <td width="21%" align="right"> 
        ľ�Ų�����ʦ      </td>
      <td width="29%"><%=jc_mmydd_mmcljs%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="22%" align="right">�ɵ���</td>
      <td width="28%"><%=paidr%></td>
      <td width="21%" align="right">�ɵ�ʱ��</td>
      <td width="29%"><%=paidsj%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right" bgcolor="#CCCCFF"> 
        ǩ��ͬ����      </td>
      <td width="28%"> <%=jc_mmydd_htrq%> </td>
      <td width="21%" align="right"> 
        ��ͬǩ����      </td>
      <td width="29%"> <%=jc_mmydd_htqdr%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="22%" align="right">��ͬ��ע</td>
      <td colspan="3"><%=jc_mmydd_htbz%></td>
    </tr>
  </table>

</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
<%
if (mark.equals("2"))
{
	%>

	if(	javaTrim(FormName.sfkje)=="") {
		alert("����㣬����Ԥ����ת����������[Ԥ����ת����]��");
		FormName.sfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.sfkje, "Ԥ����ת����"))) {
		return false;
	}
	if (parseFloat(FormName.sfkje.value)< <%=(zjhze-mmfk-11)%> || parseFloat(FormName.sfkje.value)> <%=(zjhze-mmfk+11)%>)
	{
		alert("[Ԥ����ת����]����С��[<%=cf.round(zjhze-mmfk-11,2)%>]�������[<%=cf.round(zjhze-mmfk+11,2)%>]��");
		FormName.sfkje.select();
		return false;
	}

	
	
	var choo=0;
	var zkje=0;

	if (<%=yfksl%>==1)
	{
		if( FormName.fklxbm.checked )
		{
			choo=1;
			zkje=zkje+parseFloat(FormName.fkje.value);
		}
	} 
	else
	{ 
		for (var i=0;i <<%=yfksl%>;i++ )
		{
			if( FormName.fklxbm[i].checked )
			{
				choo=1;
				zkje=zkje+parseFloat(FormName.fkje[i].value);
			}
		} 
	} 

	if (choo == 0){
		alert("����㣬��Ԥ����ת�����������ѡ��ת������");
		return false;
	}

	if (zkje < parseFloat(FormName.sfkje.value) ){
		alert("ת��㣬ת��ϼƣ�"+zkje+"����ת�"+parseFloat(FormName.sfkje.value));
		return false;
	}

	<%
}
%>
	if(	javaTrim(FormName.skqrsj)=="") {
		alert("������[�տ�ȷ��ʱ��]��");
		FormName.skqrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.skqrsj, "�տ�ȷ��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.skqrr)=="") {
		alert("������[�տ�ȷ����]��");
		FormName.skqrr.focus();
		return false;
	}


	FormName.action="SaveZkSkqrJc_mmydd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
