<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
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
String kazsj=null;
String aztzsj=null;

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
	ls_sql="select crm_khxx.fgsbh,aztzsj,kazsj,cxhdbm,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as jc_mmydd_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.pdgcmc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.mmhtje as jc_mmydd_mmhtje,jc_mmydd.wjhtje as jc_mmydd_wjhtje,jc_mmydd.blhtje as jc_mmydd_blhtje,jc_mmydd.htje as jc_mmydd_htje,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		aztzsj=cf.fillNull(rs.getDate("aztzsj"));
		kazsj=cf.fillNull(rs.getDate("kazsj"));
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
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="20%">协商安装时间</td>
	<td  width="10%">录入人</td>
	<td  width="20%">录入时间</td>
	<td  width="50%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql=" SELECT kazsj,lrr,lrsj,bz";
	ls_sql+=" FROM jc_mmazsjjl ";
    ls_sql+=" where yddbh='"+yddbh+"'";
    ls_sql+=" order by lrsj,kazsj";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>
<BR>
  
<form method="post" action="" name="selectform" target='_blank'>
 <div align="center">木门预订单---木门安装</div>
 <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%"><font color="#0000FF">合同安装时间</font></td>
      <td width="31%"> 
        <input type="text" name="jhazsj" size="20" maxlength="10"  value="<%=jc_mmydd_jhazsj%>" readonly>
      </td>
      <td width="20%" bgcolor="#E8E8FF" align="right"><font color="#0000FF">协商安装时间</font></td>
      <td width="30%"> 
        <input type="text" name="kazsj" size="20" maxlength="10" value="<%=kazsj%>">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%"><font color="#0000FF">发安装通知时间</font></td>
      <td width="31%"> 
        <input type="text" name="aztzsj" size="20" maxlength="10"  value="<%=aztzsj%>" readonly>
      </td>
      <td width="20%" bgcolor="#E8E8FF" align="right">送货时间</td>
      <td width="30%"> 
        <input type="text" name="sshsj" size="20" maxlength="10" value="<%=jc_mmydd_sshsj%>" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">安装开始时间</td>
      <td width="31%"> 
        <input type="text" name="azkssj" size="20" maxlength="10" value="<%=jc_mmydd_azkssj%>" onDblClick="JSCalendar(this)">
      </td>
      <td width="20%" bgcolor="#E8E8FF" align="right">安装结束时间</td>
      <td width="30%"> 
        <input type="text" name="azjssj" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">延迟原因</td>
      <td width="31%"> 
        <select name="mmycyybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(qye)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select mmycyybm,mmycyymc from jdm_mmycyybm order by mmycyybm",jc_mmydd_mmycyybm);
%> 
        </select>
      </td>
      <td width="20%" bgcolor="#E8E8FF" align="right">安装状态</td>
      <td width="30%">
<%
	cf.radioToken(out, "clzt","11+正在安装&15+安装完成","");
%>      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td align="right" width="19%">延迟说明</td>
      <td colspan="3"> 
        <textarea name="ycsm" cols="71" rows="3"><%=jc_mmydd_ycsm%></textarea>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td height="39" colspan="4" align="center"> 
        <div align="center"> 
          <p>
            <input type="button"  value="存 盘" onClick="f_do(selectform)">
            <input type="button"  value="录入安装记录" onClick="f_lraz(selectform)" name="lraz" >
            <input type="button"  value="查看安装记录" onClick="f_ckaz(selectform)" name="ckaz" >
          </p>
          <p>
            <input type="button"  value="录入安装反馈单" onClick="f_lr(selectform)" name="lr" disabled>
            <input type="button"  value="修改安装反馈单" onClick="f_ck(selectform)" name="ck" disabled>
            <input type="hidden" name="yddbh"  value="<%=yddbh%>" >
          </p>
        
      </td>
    </tr>
  </table>
</form>


<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      客户编号    </td>
    <td width="31%"> <%=jc_mmydd_khbh%></td>
    <td width="18%" align="right"> 
      合同号    </td>
    <td width="32%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      客户姓名    </td>
    <td width="31%"> <%=crm_khxx_khxm%>（<%=lxfs%>） </td>
    <td width="18%" align="right">    </td>
    <td width="32%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">房屋地址</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right" bgcolor="#CCCCFF">签约店面</td>
    <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
    <td width="18%" align="right">设计师</td>
    <td width="32%"><%=crm_khxx_sjs%>（<%=sjsdh%>）</td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      施工队    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>（<%=dzdh%>） </td>
    <td width="18%" align="right"> 
      班长    </td>
    <td width="32%"><%=sgbz%>（<%=bzdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      家装签约日期    </td>
    <td width="31%"> <%=crm_khxx_qyrq%> </td>
    <td width="18%" align="right"> 
      质检    </td>
    <td width="32%"><%=crm_khxx_zjxm%>（<%=zjdh%>） </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      合同开工日期    </td>
    <td width="31%"> <%=crm_khxx_kgrq%> </td>
    <td width="18%" align="right"> 
      合同竣工日期    </td>
    <td width="32%"> <%=crm_khxx_jgrq%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="19%" align="right">参加促销活动</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4"> 
    <div align="center"></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      五金情况    </td>
    <td width="31%"> <%
	cf.radioToken(out, "1+客户自购&2+公司购买",jc_mmydd_wjqk,true);
%> </td>
    <td width="18%" align="right"> 
      木门定金    </td>
    <td width="32%"> <%=jc_mmydd_sqdj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right" bgcolor="#99CCFF"> 
      驻店家居顾问    </td>
    <td width="31%"> <%=jc_mmydd_clgw%> </td>
    <td width="18%" align="right">    </td>
    <td width="32%">&nbsp; </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      录入人    </td>
    <td width="31%"> <%=jc_mmydd_lrr%> </td>
    <td width="18%" align="right"> 
      录入时间    </td>
    <td width="32%"> <%=jc_mmydd_lrsj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      录入部门    </td>
    <td width="31%"> <%=sq_dwxx_dwmc%> </td>
    <td width="18%" align="right"> 
      处理状态    </td>
    <td width="32%">
<%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" bgcolor="#99CCFF" align="right">备注</td>
    <td colspan="3"><%=jc_mmydd_bz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="4" align="center"> 
      <div align="center"> 
        <input type="button" value="木门初测单" onClick="window.open('/jcjj/mmdd/ViewJc_mmccd.jsp?yddbh=<%=yddbh%>')" name="button">
        <input type="button" value="合同明细" onClick="window.open('/jcjj/mmdd/ViewJc_mmdgdmx.jsp?yddbh=<%=yddbh%>')" name="button2"></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right"> 
      派单工厂    </td>
    <td width="31%"> <%=pdgcmc%> </td>
    <td width="18%" align="right"> 
      木门测量技师    </td>
    <td width="32%"><%=jc_mmydd_mmcljs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">派单人</td>
    <td width="31%"><%=paidr%></td>
    <td width="18%" align="right">派单时间</td>
    <td width="32%"><%=paidsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right" bgcolor="#FFFFCC"> 
      计划初测时间    </td>
    <td width="31%"><%=jc_mmydd_jhccsj%></td>
    <td width="18%" align="right"> 
      实初测时间    </td>
    <td width="32%"><%=jc_mmydd_sccsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right" bgcolor="#FFFFCC">初测说明</td>
    <td colspan="3"><%=jc_mmydd_ccsm%></td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4"> 
      <div align="center"></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      木门合同金额    </td>
    <td width="31%"> <%=jc_mmydd_mmhtje%> </td>
    <td width="18%" align="right"> 
      五金合同金额    </td>
    <td width="32%"> <%=jc_mmydd_wjhtje%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      玻璃合同金额    </td>
    <td width="31%"> <%=jc_mmydd_blhtje%> </td>
    <td width="18%" align="right"> 
      合同金额    </td>
    <td width="32%"> <%=jc_mmydd_htje%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right" bgcolor="#CCCCFF"> 
      签合同日期    </td>
    <td width="31%"> <%=jc_mmydd_htrq%> </td>
    <td width="18%" align="right"> 
      合同签定人    </td>
    <td width="32%"> <%=jc_mmydd_htqdr%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">合同备注</td>
    <td colspan="3"><%=jc_mmydd_htbz%></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      自购五金件送到公司    </td>
    <td width="31%"><%
	cf.selectToken(out,"Y+已送公司&N+未送公司",jc_mmydd_wjsgsbz,true);
%> </td>
    <td width="18%" align="right">    </td>
    <td width="32%">&nbsp; </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      送五金时间    </td>
    <td width="31%" bgcolor="#99CCFF"> <%=jc_mmydd_swjsj%> </td>
    <td width="18%" align="right"> 
      五金接收人    </td>
    <td width="32%"> <%=jc_mmydd_wjjsr%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right">五金接收情况</td>
    <td colspan="3"><%=jc_mmydd_wjjsqk%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right"> 
      实入库时间    </td>
    <td width="31%"><%=jc_mmydd_srksj%> </td>
    <td width="18%" align="right"> 
      入库人    </td>
    <td width="32%"><%=jc_mmydd_rkr%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">入库说明</td>
    <td colspan="3"><%=jc_mmydd_rksm%></td>
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
	if(	javaTrim(FormName.sshsj)=="") {
		alert("请输入[实送货时间]！");
		FormName.sshsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.sshsj, "实送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.azkssj)=="") {
		alert("请输入[安装开始时间]！");
		FormName.azkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.azkssj, "安装开始时间"))) {
		return false;
	}

	if(	!radioChecked(FormName.clzt)) {
		alert("请选择[安装状态]！");
		FormName.clzt[0].focus();
		return false;
	}
	if (FormName.clzt[1].checked)
	{
		if(	javaTrim(FormName.azjssj)=="") {
			alert("请输入[安装结束时间]！");
			FormName.azjssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.azjssj, "安装结束时间"))) {
			return false;
		}
		if (FormName.azjssj.value>FormName.jhazsj.value)
		{
			if(	javaTrim(FormName.mmycyybm)=="") {
				alert("请输入[延迟原因]！");
				FormName.mmycyybm.focus();
				return false;
			}
			if(	javaTrim(FormName.ycsm)=="") {
				alert("请输入[延迟说明]！");
				FormName.ycsm.focus();
				return false;
			}
		}
	}
	


	FormName.action="SaveAzJc_mmydd.jsp";
	FormName.submit();
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}

function f_lraz(FormName)//参数FormName:Form的名称
{

	FormName.action="InsertJc_mmazjl.jsp";
	FormName.submit();
	return true;
}

function f_ckaz(FormName)//参数FormName:Form的名称
{

	FormName.action="Jc_mmazjlList.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{

	FormName.action="InsertJc_mmazfkd.jsp";
	FormName.submit();
	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{

	FormName.action="EditJc_mmazfkd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
