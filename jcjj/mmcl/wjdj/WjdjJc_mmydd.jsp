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
		out.println("错误！延迟未处理，不能完结");
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
<title>木门预订单处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
  
<form method="post" action="" name="selectform" >
 <div align="center">木门预订单---完结登记 </div>
 <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF"> 
      <td width="17%" align="right">计划安装时间</td>
      <td width="33%"><%=jc_mmydd_jhazsj%></td>
      <td width="17%" align="right">安装开始时间</td>
      <td width="33%"><%=jc_mmydd_azkssj%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="17%" align="right"> 
        延迟原因      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm where mmycyybm='"+jc_mmydd_mmycyybm+"'",jc_mmydd_mmycyybm,true);
%> </td>
      <td width="17%" align="right"> 
        延迟处理状态      </td>
      <td width="33%"> <%
	cf.radioToken(out, "1+延迟未核实&2+延迟原因属实&3+延迟原因不属实&4+延迟已处理",ycclzt,true);
%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td width="17%" align="right" bgcolor="#CCCCFF">延迟说明</td>
      <td colspan="3"><%=jc_mmydd_ycsm%></td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right" width="17%">延迟核实时间</td>
      <td width="33%"> <%=jc_mmydd_ychssj%> </td>
      <td width="17%" align="right">延迟核实人</td>
      <td width="33%"> <%=jc_mmydd_ychsr%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right" width="17%">延迟原因是否属实</td>
      <td width="33%"> <%
	cf.selectToken(out,"2+延迟原因属实&3+延迟原因不属实",ycclzt,true);
%> </td>
      <td width="17%" align="right">真实延迟原因</td>
      <td width="33%"> <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm where mmycyybm='"+jc_mmydd_zsycyybm+"'",jc_mmydd_zsycyybm,true);
%> </td>
    </tr>
    <tr bgcolor="#CCCCFF"> 
      <td align="right" width="17%">延迟核实情况</td>
      <td colspan="3"> <%=jc_mmydd_ychsqk%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="17%">完结时间</td>
      <td width="33%"> 
        <input type="text" name="wjsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
      </td>
      <td width="17%" bgcolor="#E8E8FF" align="right">完结录入人</td>
      <td width="33%"> 
        <input type="text" name="wjlrr" size="20" maxlength="10" value="<%=yhmc%>" readonly>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4" align="center"> 
          <input type="button"  value="存 盘" onClick="f_do(selectform)">
          <input type="reset" name="Reset" value="重输">
      <input type="hidden" name="yddbh"  value="<%=yddbh%>" >      </td>
    </tr>
  </table>
</form>


<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      客户编号    </td>
    <td width="33%"> <%=jc_mmydd_khbh%></td>
    <td width="17%" align="right"> 
      合同号    </td>
    <td width="33%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      客户姓名    </td>
    <td width="33%"> <%=crm_khxx_khxm%>（<%=lxfs%>） </td>
    <td width="17%" align="right">    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right">房屋地址</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF">签约店面</td>
    <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
    <td width="17%" align="right">设计师</td>
    <td width="33%"><%=crm_khxx_sjs%>（<%=sjsdh%>）</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      施工队    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>（<%=dzdh%>） </td>
    <td width="17%" align="right"> 
      班长    </td>
    <td width="33%"><%=sgbz%>（<%=bzdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      家装签约日期    </td>
    <td width="33%"> <%=crm_khxx_qyrq%> </td>
    <td width="17%" align="right"> 
      质检    </td>
    <td width="33%"><%=crm_khxx_zjxm%>（<%=zjdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      合同开工日期    </td>
    <td width="33%"> <%=crm_khxx_kgrq%> </td>
    <td width="17%" align="right"> 
      合同竣工日期    </td>
    <td width="33%"> <%=crm_khxx_jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4"> 
    <div align="center"></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      五金情况    </td>
    <td width="33%"> <%
	cf.radioToken(out, "1+客户自购&2+公司购买",jc_mmydd_wjqk,true);
%> </td>
    <td width="17%" align="right"> 
      收取定金    </td>
    <td width="33%"> <%=jc_mmydd_sqdj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right" bgcolor="#99CCFF"> 
      驻店家居顾问    </td>
    <td width="33%"> <%=jc_mmydd_clgw%> </td>
    <td width="17%" align="right">    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      录入人    </td>
    <td width="33%"> <%=jc_mmydd_lrr%> </td>
    <td width="17%" align="right"> 
      录入时间    </td>
    <td width="33%"> <%=jc_mmydd_lrsj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      录入部门    </td>
    <td width="33%"> <%=sq_dwxx_dwmc%> </td>
    <td width="17%" align="right"> 
      处理状态    </td>
    <td width="33%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" bgcolor="#99CCFF" align="right">备注</td>
    <td colspan="3"><%=jc_mmydd_bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" align="center"> 
      <div align="center"> 
        <input type="button" value="木门初测单" onClick="window.open('/jcjj/mmdd/ViewJc_mmccd.jsp?yddbh=<%=yddbh%>')" name="button">
        <input type="button" value="合同明细" onClick="window.open('/jcjj/mmdd/ViewJc_mmdgdmx.jsp?yddbh=<%=yddbh%>')" name="button2">
        <input type="button" value="安装反馈单"  onClick="window.open('/jcjj/mmdd/ViewJc_mmazsfd.jsp?yddbh=<%=yddbh%>')" name="button3"></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      派单工厂    </td>
    <td width="33%"> <%=pdgcmc%> </td>
    <td width="17%" align="right"> 
      木门测量技师    </td>
    <td width="33%"><%=jc_mmydd_mmcljs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">派单人</td>
    <td width="33%"><%=paidr%></td>
    <td width="17%" align="right">派单时间</td>
    <td width="33%"><%=paidsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right" bgcolor="#FFFFCC"> 
      计划初测时间    </td>
    <td width="33%"><%=jc_mmydd_jhccsj%> </td>
    <td width="17%" align="right"> 
      实初测时间    </td>
    <td width="33%"><%=jc_mmydd_sccsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right" bgcolor="#FFFFCC">初测说明</td>
    <td colspan="3"><%=jc_mmydd_ccsm%></td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4"> 
    <div align="center"></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      木门合同金额    </td>
    <td width="33%"> <%=jc_mmydd_mmhtje%> </td>
    <td width="17%" align="right"> 
      五金合同金额    </td>
    <td width="33%"> <%=jc_mmydd_wjhtje%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right"> 
      玻璃合同金额    </td>
    <td width="33%"> <%=jc_mmydd_blhtje%> </td>
    <td width="17%" align="right"> 
      合同金额    </td>
    <td width="33%"> <%=jc_mmydd_htje%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right" bgcolor="#CCCCFF"> 
      签合同日期    </td>
    <td width="33%"> <%=jc_mmydd_htrq%> </td>
    <td width="17%" align="right"> 
      合同签定人    </td>
    <td width="33%"> <%=jc_mmydd_htqdr%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="17%" align="right">合同备注</td>
    <td colspan="3"><%=jc_mmydd_htbz%></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      自购五金件送到公司    </td>
    <td width="33%"><%
	cf.selectToken(out,"Y+已送公司&N+未送公司",jc_mmydd_wjsgsbz,true);
%> </td>
    <td width="17%" align="right">    </td>
    <td width="33%">&nbsp; </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      送五金时间    </td>
    <td width="33%" bgcolor="#99CCFF"> <%=jc_mmydd_swjsj%> </td>
    <td width="17%" align="right"> 
      五金接收人    </td>
    <td width="33%"> <%=jc_mmydd_wjjsr%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right">五金接收情况</td>
    <td colspan="3"><%=jc_mmydd_wjjsqk%></td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4"> 
      <div align="center"></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"> 
      实入库时间    </td>
    <td width="33%"><%=jc_mmydd_srksj%> </td>
    <td width="17%" align="right"> 
      入库人    </td>
    <td width="33%"><%=jc_mmydd_rkr%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right">入库说明</td>
    <td colspan="3"><%=jc_mmydd_rksm%></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right"> 
      计划安装时间    </td>
    <td width="33%"> <%=jc_mmydd_jhazsj%> </td>
    <td width="17%" align="right"> 
      实送货时间    </td>
    <td width="33%"> <%=jc_mmydd_sshsj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="17%" align="right" bgcolor="#99CCFF"> 
      安装开始时间    </td>
    <td width="33%"> <%=jc_mmydd_azkssj%> </td>
    <td width="17%" align="right"> 
      安装结束时间    </td>
    <td width="33%"> <%=jc_mmydd_azjssj%> </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.wjsj)=="") {
		alert("请输入[完结时间]！");
		FormName.wjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.wjsj, "完结时间"))) {
		return false;
	}
	if(	javaTrim(FormName.wjlrr)=="") {
		alert("请输入[完结录入人]！");
		FormName.wjlrr.focus();
		return false;
	}

	FormName.action="SaveWjdjJc_mmydd.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
