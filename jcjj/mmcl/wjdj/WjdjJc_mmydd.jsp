<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String jc_mmydd_yddbh=null;
String jc_mmydd_khbh=null;
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
String pdgcmc=null;
String jc_mmydd_mmcljs=null;
String jc_mmydd_jhccsj=null;
String jc_mmydd_sccsj=null;
String jc_mmydd_ccsm=null;
String jc_mmydd_mmhtje=null;
String jc_mmydd_wjhtje=null;
String jc_mmydd_blhtje=null;
String jc_mmydd_htje=null;
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
String xmzy=null;

String sgbz=null;
String bzdh="";
String zjdh="";
String sjsdh="";
String dzdh=null;
String lxfs=null;

String paidr=null;
String paidsj=null;
String ycclzt=null;

String ssfgs=null;
String cxhdbm=null;
String fkje=null;

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.fgsbh,jc_mmydd.xmzy,cxhdbm,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as jc_mmydd_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.pdgcmc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.mmhtje as jc_mmydd_mmhtje,jc_mmydd.wjhtje as jc_mmydd_wjhtje,jc_mmydd.blhtje as jc_mmydd_blhtje,jc_mmydd.htje as jc_mmydd_htje,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		paidr=cf.fillNull(rs.getString("paidr"));
		paidsj=cf.fillNull(rs.getDate("paidsj"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
		lxfs=cf.fillNull(rs.getString("lxfs"));

		jc_mmydd_yddbh=cf.fillNull(rs.getString("jc_mmydd_yddbh"));
		jc_mmydd_khbh=cf.fillNull(rs.getString("jc_mmydd_khbh"));
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
		pdgcmc=cf.fillNull(rs.getString("pdgcmc"));
		jc_mmydd_mmcljs=cf.fillNull(rs.getString("jc_mmydd_mmcljs"));
		jc_mmydd_jhccsj=cf.fillNull(rs.getDate("jc_mmydd_jhccsj"));
		jc_mmydd_sccsj=cf.fillNull(rs.getDate("jc_mmydd_sccsj"));
		jc_mmydd_ccsm=cf.fillNull(rs.getString("jc_mmydd_ccsm"));
		jc_mmydd_mmhtje=cf.fillNull(rs.getString("jc_mmydd_mmhtje"));
		jc_mmydd_wjhtje=cf.fillNull(rs.getString("jc_mmydd_wjhtje"));
		jc_mmydd_blhtje=cf.fillNull(rs.getString("jc_mmydd_blhtje"));
		jc_mmydd_htje=cf.fillNull(rs.getString("jc_mmydd_htje"));
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

	if (ycclzt.equals("1"))
	{
		out.println("�����ӳ�δ�����������");
		return;
	}

	ls_sql=" select dh from sq_sgd";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+crm_khxx_dwbh+"' and yhmc ='"+crm_khxx_sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+crm_khxx_sgd+"' and bzmc ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where sq_yhxx.ssfgs='"+ssfgs+"' and yhmc ='"+crm_khxx_zjxm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

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

<html>
<head>
<title>ľ��Ԥ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
  
<form method="post" action="" name="selectform" >
 <div align="center">ľ��Ԥ����---���Ǽ� </div>
 <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="17%" align="right">�ƻ���װʱ��</td>
      <td width="33%"><%=jc_mmydd_jhazsj%></td>
      <td width="17%" align="right">��װ��ʼʱ��</td>
      <td width="33%"><%=jc_mmydd_azkssj%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="17%" align="right"> 
        �ӳ�ԭ��      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm where mmycyybm='"+jc_mmydd_mmycyybm+"'",jc_mmydd_mmycyybm,true);
%> </td>
      <td width="17%" align="right"> 
        �ӳٴ���״̬      </td>
      <td width="33%"> <%
	cf.radioToken(out, "1+�ӳ�δ��ʵ&2+�ӳ�ԭ����ʵ&3+�ӳ�ԭ����ʵ&4+�ӳ��Ѵ���",ycclzt,true);
%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="17%" align="right" bgcolor="#CCCCFF">�ӳ�˵��</td>
      <td colspan="3"><%=jc_mmydd_ycsm%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right" width="17%">�ӳٺ�ʵʱ��</td>
      <td width="33%"> <%=jc_mmydd_ychssj%> </td>
      <td width="17%" align="right">�ӳٺ�ʵ��</td>
      <td width="33%"> <%=jc_mmydd_ychsr%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right" width="17%">�ӳ�ԭ���Ƿ���ʵ</td>
      <td width="33%"> <%
	cf.selectToken(out,"2+�ӳ�ԭ����ʵ&3+�ӳ�ԭ����ʵ",ycclzt,true);
%> </td>
      <td width="17%" align="right">��ʵ�ӳ�ԭ��</td>
      <td width="33%"> <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm where mmycyybm='"+jc_mmydd_zsycyybm+"'",jc_mmydd_zsycyybm,true);
%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right" width="17%">�ӳٺ�ʵ���</td>
      <td colspan="3"> <%=jc_mmydd_ychsqk%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="17%">���ʱ��</td>
      <td width="33%"> 
        <input type="text" name="wjsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
      </td>
      <td width="17%" bgcolor="#E8E8FF" align="right">���¼����</td>
      <td width="33%"> 
        <input type="text" name="wjlrr" size="20" maxlength="10" value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" align="center"> 
          <input type="button"  value="�� ��" onClick="f_do(selectform)">
          <input type="reset" name="Reset" value="����">
      <input type="hidden" name="yddbh"  value="<%=yddbh%>" >      </td>
    </tr>
  </table>
</form>


<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      �ͻ����    </td>
    <td width="33%"> <%=jc_mmydd_khbh%></td>
    <td width="17%" align="right"> 
      ��ͬ��    </td>
    <td width="33%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      �ͻ�����    </td>
    <td width="33%"> <%=crm_khxx_khxm%>��<%=lxfs%>�� </td>
    <td width="17%" align="right">    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right">���ݵ�ַ</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">ǩԼ����</td>
    <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
    <td width="17%" align="right">���ʦ</td>
    <td width="33%"><%=crm_khxx_sjs%>��<%=sjsdh%>��</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      ʩ����    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>��<%=dzdh%>�� </td>
    <td width="17%" align="right"> 
      �೤    </td>
    <td width="33%"><%=sgbz%>��<%=bzdh%>�� </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      ��װǩԼ����    </td>
    <td width="33%"> <%=crm_khxx_qyrq%> </td>
    <td width="17%" align="right"> 
      �ʼ�    </td>
    <td width="33%"><%=crm_khxx_zjxm%>��<%=zjdh%>�� </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      ��ͬ��������    </td>
    <td width="33%"> <%=crm_khxx_kgrq%> </td>
    <td width="17%" align="right"> 
      ��ͬ��������    </td>
    <td width="33%"> <%=crm_khxx_jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4"> 
    <div align="center"></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      ������    </td>
    <td width="33%"> <%
	cf.radioToken(out, "1+�ͻ��Թ�&2+��˾����",jc_mmydd_wjqk,true);
%> </td>
    <td width="17%" align="right"> 
      ��ȡ����    </td>
    <td width="33%"> <%=jc_mmydd_sqdj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right" bgcolor="#99CCFF"> 
      פ��Ҿӹ���    </td>
    <td width="33%"> <%=jc_mmydd_clgw%> </td>
    <td width="17%" align="right">    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      ¼����    </td>
    <td width="33%"> <%=jc_mmydd_lrr%> </td>
    <td width="17%" align="right"> 
      ¼��ʱ��    </td>
    <td width="33%"> <%=jc_mmydd_lrsj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      ¼�벿��    </td>
    <td width="33%"> <%=sq_dwxx_dwmc%> </td>
    <td width="17%" align="right"> 
      ����״̬    </td>
    <td width="33%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" bgcolor="#99CCFF" align="right">��ע</td>
    <td colspan="3"><%=jc_mmydd_bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" align="center"> 
      <div align="center"> 
        <input type="button" value="ľ�ų��ⵥ" onClick="window.open('/jcjj/mmdd/ViewJc_mmccd.jsp?yddbh=<%=yddbh%>')" name="button">
        <input type="button" value="��ͬ��ϸ" onClick="window.open('/jcjj/mmdd/ViewJc_mmdgdmx.jsp?yddbh=<%=yddbh%>')" name="button2">
        <input type="button" value="��װ������"  onClick="window.open('/jcjj/mmdd/ViewJc_mmazsfd.jsp?yddbh=<%=yddbh%>')" name="button3"></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      �ɵ�����    </td>
    <td width="33%"> <%=pdgcmc%> </td>
    <td width="17%" align="right"> 
      ľ�Ų�����ʦ    </td>
    <td width="33%"><%=jc_mmydd_mmcljs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">�ɵ���</td>
    <td width="33%"><%=paidr%></td>
    <td width="17%" align="right">�ɵ�ʱ��</td>
    <td width="33%"><%=paidsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right" bgcolor="#FFFFCC"> 
      �ƻ�����ʱ��    </td>
    <td width="33%"><%=jc_mmydd_jhccsj%> </td>
    <td width="17%" align="right"> 
      ʵ����ʱ��    </td>
    <td width="33%"><%=jc_mmydd_sccsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right" bgcolor="#FFFFCC">����˵��</td>
    <td colspan="3"><%=jc_mmydd_ccsm%></td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4"> 
    <div align="center"></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      ľ�ź�ͬ���    </td>
    <td width="33%"> <%=jc_mmydd_mmhtje%> </td>
    <td width="17%" align="right"> 
      ����ͬ���    </td>
    <td width="33%"> <%=jc_mmydd_wjhtje%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      ������ͬ���    </td>
    <td width="33%"> <%=jc_mmydd_blhtje%> </td>
    <td width="17%" align="right"> 
      ��ͬ���    </td>
    <td width="33%"> <%=jc_mmydd_htje%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF"> 
      ǩ��ͬ����    </td>
    <td width="33%"> <%=jc_mmydd_htrq%> </td>
    <td width="17%" align="right"> 
      ��ͬǩ����    </td>
    <td width="33%"> <%=jc_mmydd_htqdr%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right">��ͬ��ע</td>
    <td colspan="3"><%=jc_mmydd_htbz%></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      �Թ������͵���˾    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+���͹�˾&N+δ�͹�˾",jc_mmydd_wjsgsbz,true);
%> </td>
    <td width="17%" align="right">    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      �����ʱ��    </td>
    <td width="33%" bgcolor="#99CCFF"> <%=jc_mmydd_swjsj%> </td>
    <td width="17%" align="right"> 
      ��������    </td>
    <td width="33%"> <%=jc_mmydd_wjjsr%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right">���������</td>
    <td colspan="3"><%=jc_mmydd_wjjsqk%></td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4"> 
      <div align="center"></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      ʵ���ʱ��    </td>
    <td width="33%"><%=jc_mmydd_srksj%> </td>
    <td width="17%" align="right"> 
      �����    </td>
    <td width="33%"><%=jc_mmydd_rkr%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">���˵��</td>
    <td colspan="3"><%=jc_mmydd_rksm%></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      �ƻ���װʱ��    </td>
    <td width="33%"> <%=jc_mmydd_jhazsj%> </td>
    <td width="17%" align="right"> 
      ʵ�ͻ�ʱ��    </td>
    <td width="33%"> <%=jc_mmydd_sshsj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right" bgcolor="#99CCFF"> 
      ��װ��ʼʱ��    </td>
    <td width="33%"> <%=jc_mmydd_azkssj%> </td>
    <td width="17%" align="right"> 
      ��װ����ʱ��    </td>
    <td width="33%"> <%=jc_mmydd_azjssj%> </td>
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
	if(	javaTrim(FormName.wjsj)=="") {
		alert("������[���ʱ��]��");
		FormName.wjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.wjsj, "���ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.wjlrr)=="") {
		alert("������[���¼����]��");
		FormName.wjlrr.focus();
		return false;
	}

	FormName.action="SaveWjdjJc_mmydd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
