<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String zjxbz=null;
String mmzjxyybm=null;
String lrr=null;
String lrsj=null;
String dwbh=null;
String bz=null;
String clzt=null;
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

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
String jc_mmydd_pdgc=null;
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
String jhazsj=null;
String fkje=null;
String fwf=null;
String wdzje=null;
String zjhmmje=null;
String zjhwjje=null;
String zjhblje=null;
String zjhze=null;
String jc_mmydd_xmzy=null;
String jc_mmydd_ztjjgw=null;
String cxhdbm=null;
double mmzkl=0;
String dzyy=null;

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
String kjxsj=null;
String zjxze=null;
String zjxfssj=null;


try {
	conn=cf.getConnection();

	ls_sql="select mmzkl,dzyy,yddbh,khbh,mmzjxyybm,lrr,lrsj,dwbh,bz,clzt,jhazsj,zjxfssj ";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmzkl=rs.getDouble("mmzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		yddbh=cf.fillNull(rs.getString("yddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		mmzjxyybm=cf.fillNull(rs.getString("mmzjxyybm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		jhazsj=cf.fillNull(rs.getDate("jhazsj"));
		zjxfssj=cf.fillNull(rs.getDate("zjxfssj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		bz=cf.fillNull(rs.getString("bz"));
		clzt=cf.fillNull(rs.getString("clzt"));
	}
	rs.close();
	ps.close();

	ls_sql="select crm_khxx.fgsbh,jc_mmydd.fwf,jc_mmydd.wdzje,jc_mmydd.zjhmmje,jc_mmydd.zjhwjje,jc_mmydd.zjhblje,kjxsj,zjhze,cxhdbm,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.ztjjgw as jc_mmydd_ztjjgw,jc_mmydd.xmzy as jc_mmydd_xmzy,jc_mmydd.pdgc as jc_mmydd_pdgc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.mmhtje as jc_mmydd_mmhtje,jc_mmydd.wjhtje as jc_mmydd_wjhtje,jc_mmydd.blhtje as jc_mmydd_blhtje,jc_mmydd.htje as jc_mmydd_htje,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		fwf=cf.fillNull(rs.getString("fwf"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zjhmmje=cf.fillNull(rs.getString("zjhmmje"));
		zjhwjje=cf.fillNull(rs.getString("zjhwjje"));
		zjhblje=cf.fillNull(rs.getString("zjhblje"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		zjhze=cf.fillNull(rs.getString("zjhze"));
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
		jc_mmydd_xmzy=cf.fillNull(rs.getString("jc_mmydd_xmzy"));
		jc_mmydd_ztjjgw=cf.fillNull(rs.getString("jc_mmydd_ztjjgw"));
		jc_mmydd_pdgc=cf.fillNull(rs.getString("jc_mmydd_pdgc"));
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改木门增减项（增减项序号：<%=zjxxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                客户编号              </td>
              <td width="32%"> <%=khbh%></td>
              <td width="18%" align="right"> 
                合同号              </td>
              <td width="32%"><%=crm_khxx_hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                客户姓名              </td>
              <td width="32%"> <%=crm_khxx_khxm%>（
                <input type="button" value="查看电话" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" name="button4" >
） </td>
              <td width="18%" align="right">房屋地址 </td>
              <td width="32%"><%=crm_khxx_fwdz%> </td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">签约店面</td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
              <td width="18%" align="right">设计师</td>
              <td width="32%"><%=crm_khxx_sjs%>（<%=sjsdh%>）</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                施工队              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%>（<%=dzdh%>） </td>
              <td width="18%" align="right"> 
                班长              </td>
              <td width="32%"><%=sgbz%>（<%=bzdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                家装签约日期              </td>
              <td width="32%"> <%=crm_khxx_qyrq%> </td>
              <td width="18%" align="right"> 
                质检              </td>
              <td width="32%"><%=crm_khxx_zjxm%>（<%=zjdh%>） </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                合同开工日期              </td>
              <td width="32%"> <%=crm_khxx_kgrq%> </td>
              <td width="18%" align="right"> 
                合同竣工日期              </td>
              <td width="32%"> <%=crm_khxx_jgrq%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right"> 
                五金情况              </td>
              <td width="32%"> <%
	cf.radioToken(out, "1+客户自购&2+公司购买",jc_mmydd_wjqk,true);
%> </td>
              <td width="18%" align="right"> 
                木门定金              </td>
              <td width="32%"> <%=jc_mmydd_sqdj%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right" bgcolor="#99CCFF"> 
                驻店家居顾问              </td>
              <td width="32%"> <%=jc_mmydd_clgw%> </td>
              <td width="18%" align="right">              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            
            <tr bgcolor="#99CCFF"> 
              <td width="18%" align="right"> 
                录入部门              </td>
              <td width="32%"> <%=sq_dwxx_dwmc%> </td>
              <td width="18%" align="right"> 
                处理状态              </td>
              <td width="32%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
            </tr>
            <tr bgcolor="#99CCFF"> 
              <td width="18%" bgcolor="#99CCFF" align="right">备注</td>
              <td colspan="3"><%=jc_mmydd_bz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                木门合同金额              </td>
              <td width="32%"> <%=jc_mmydd_mmhtje%> </td>
              <td width="18%" align="right"> 
                五金合同金额              </td>
              <td width="32%"> <%=jc_mmydd_wjhtje%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                玻璃合同金额              </td>
              <td width="32%"> <%=jc_mmydd_blhtje%> </td>
              <td width="18%" align="right"> 
                服务费              </td>
              <td width="32%"><%=fwf%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" bgcolor="#CCCCFF" align="right">合同金额</td>
              <td width="32%"><%=jc_mmydd_htje%></td>
              <td width="18%" align="right">未打折金额</td>
              <td width="32%"><%=wdzje%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                签合同日期              </td>
              <td width="32%"> <%=jc_mmydd_htrq%> </td>
              <td width="18%" align="right"> 
                合同签定人              </td>
              <td width="32%"> <%=jc_mmydd_htqdr%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">合同备注</td>
              <td colspan="3"><%=jc_mmydd_htbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">增减后木门金额</td>
              <td width="32%"><%=zjhmmje%> </td>
              <td width="18%" align="right">增减后五金金额</td>
              <td width="32%"><%=zjhwjje%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">增减后玻璃金额</td>
              <td width="32%"><%=zjhblje%></td>
              <td width="18%" align="right">增减后总额</td>
              <td width="32%"><%=zjhze%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="18%" align="right">合同安装时间</td>
              <td width="32%"><%=jc_mmydd_jhazsj%></td>
              <td width="18%" bgcolor="#CCFFCC" align="right">可减项截止时间</td>
              <td width="32%"><%=kjxsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>订单折扣</td>
              <td colspan="3"><input type="text" name="mmzkl" size="8" maxlength="8" value="<%=mmzkl%>" readonly>
                  <b><font color="#0000FF">（>0且<=10）</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">打折原因</td>
              <td colspan="3"><textarea name="dzyy" cols="71" rows="3" readonly><%=dzyy%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font>增减项原因              </td>
              <td width="32%"> 
                <select name="mmzjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmzjxyybm,mmzjxyymc from jdm_mmzjxyybm order by mmzjxyybm",mmzjxyybm);
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000FF"></font>计划安装时间              </td>
              <td width="32%">
                <input type="text" name="jhazsj" value="<%=jhazsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font>增减项发生时间              </td>
              <td width="32%">
                <input type="text" name="zjxfssj" value="<%=zjxfssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000FF">录入时间</font>              </td>
              <td width="32%">
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000FF">录入人</font>              </td>
              <td width="32%">
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>              </td>
              <td width="18%" align="right"> 
                <font color="#FF0033">*</font><font color="#0000FF">录入部门</font>              </td>
              <td width="32%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
		</table>

			<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="3" cellspacing="3">
 
			<tr> 
              <td align="center" > 
					<input type="hidden" name="yddbh"  value="<%=yddbh%>" >
					<input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="button"  value="完成" onClick="f_end(editform)" name="wc" <% if (!clzt.equals("00")) out.println("disabled");%>>
              <input type="button"  value="打印" onClick="window.open('/jcjj/dygl/dymmhtfjzjx.jsp?zjxxh=<%=zjxxh%>')" >			</td>
            </tr>
			<tr>
			  <td align="center" ><input type="button"  value="增减已有木门项目" onClick="f_zjmm(editform)" >
                <input type="button"  value="增加新木门项目" onClick="f_newmm(editform)" >
                <input type="button"  value="确定木门增减数量" onClick="f_mmsl(editform)" ></td>
			  </tr>
			<tr>
			  <td align="center" ><input type="button"  value="增减已有五金项目" onClick="f_zjwj(editform)" >
                <input type="button"  value="增加新五金项目" onClick="f_newwj(editform)" >
                <input type="button"  value="确定五金增减数量" onClick="f_wjsl(editform)" ></td>
			  </tr>
			<tr>
			  <td align="center" ><input type="button"  value="增减已有玻璃项目" onClick="f_zjbl(editform)" >
                <input type="button"  value="增加新玻璃项目" onClick="f_newbl(editform)" >
                <input type="button"  value="确定玻璃增减数量" onClick="f_blsl(editform)" ></td>
			  </tr>
        </table>
</form>

	  
	  
    </td>
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
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	if(	javaTrim(FormName.mmzjxyybm)=="") {
		alert("请选择[增减项原因]！");
		FormName.mmzjxyybm.focus();
		return false;
	}
	if(	javaTrim(FormName.jhazsj)=="") {
		alert("请输入[计划安装时间]！");
		FormName.jhazsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhazsj, "计划安装时间"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxfssj)=="") {
		alert("请输入[增减项发生时间]！");
		FormName.zjxfssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zjxfssj, "增减项发生时间"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if (FormName.zjxfssj.value>FormName.lrsj.value)
	{
		alert("[增减项发生时间]不能大于[录入时间]！");
		FormName.zjxfssj.select();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="SaveEditJc_mmzjx.jsp";
	FormName.submit();
	return true;
}
function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	FormName.action="EndJc_mmzjx.jsp";
	FormName.submit();
	return true;
}
function f_zjmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}
	
	FormName.action="Jc_mmdgdmxList.jsp";
	FormName.submit();
	return true;
}

function f_newmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_mmdgdmxMain.jsp";
	FormName.submit();
	return true;
}
function f_mmsl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_mmdgdmxZjxList.jsp";
	FormName.submit();
	return true;
}

function f_zjwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_wjjddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_newwj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="InsertJc_wjjddmxMain.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_wjsl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_wjjddmxZjxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_zjbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}


	FormName.action="Jc_blddmxList.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_newbl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="InsertJc_blddmx.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_blsl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxxh)=="") {
		alert("请输入[增减项序号]！");
		FormName.zjxxh.focus();
		return false;
	}
	if(!(isNumber(FormName.zjxxh, "增减项序号"))) {
		return false;
	}

	FormName.action="Jc_blddmxZjxList.jsp";

	FormName.target="_blank";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
