<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=null;
String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgmc=null;
String lrr=null;
String lrsj=null;
String bz=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;
String cfspbz=null;
String spyj=null;
String spr=null;
String spsj=null;
String kpbz=null;
String kpjlh=null;
String jsbz=null;
String jsjlh=null;
double fkze=0;
double kfzs=0;
double kcjdebl=0;
double jlje=0;
String lrdw=null;
String wtclbz=null;

String xjjlh=null;
xjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select dm_xjjgbm.xjjgmc as xjjgmc,jlje,lrdw,fkze,kfzs,kcjdebl,jsbz,jsjlh,kp_xjgdjl.spsj,kp_xjgdjl.spr,kp_xjgdjl.spyj,kp_xjgdjl.kpjlh,kp_xjgdjl.cfspbz,kp_xjgdjl.kpbz,kp_xjgdjl.xjjlh as xjjlh,kp_xjgdjl.khbh as khbh,kp_xjgdjl.xjr as xjr,kp_xjgdjl.xjsj as xjsj,kp_xjgdjl.xjlxbm as xjlxbm,kp_xjgdjl.lrr as lrr,kp_xjgdjl.lrsj as lrsj,kp_xjgdjl.bz as bz,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.lxfs as lxfs,crm_khxx.hth as hth,crm_khxx.sjs as sjs,crm_khxx.qyrq as qyrq,crm_khxx.dwbh as dwbh,kp_xjgdjl.sgd,crm_khxx.zjxm as zjxm ";
	ls_sql+=" ,wtclbz";
	ls_sql+=" from  crm_khxx,kp_xjgdjl,dm_xjjgbm";
	ls_sql+=" where kp_xjgdjl.khbh=crm_khxx.khbh and  (kp_xjgdjl.xjjlh='"+xjjlh+"')  ";
	ls_sql+=" and kp_xjgdjl.xjjgbm=dm_xjjgbm.xjjgbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wtclbz=cf.fillNull(rs.getString("wtclbz"));

		jlje=rs.getDouble("jlje");
		xjjgmc=cf.fillNull(rs.getString("xjjgmc"));
		lrdw=cf.fillNull(rs.getString("lrdw"));
		fkze=rs.getDouble("fkze");
		kfzs=rs.getDouble("kfzs");
		kcjdebl=rs.getDouble("kcjdebl");
		jsbz=cf.fillNull(rs.getString("jsbz"));
		jsjlh=cf.fillNull(rs.getString("jsjlh"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spr=cf.fillNull(rs.getString("spr"));
		spyj=cf.fillNull(rs.getString("spyj"));
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		cfspbz=cf.fillNull(rs.getString("cfspbz"));
		kpbz=cf.fillNull(rs.getString("kpbz"));
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
  out.print("Exception:" + e);
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">检查工地记录（检查记录号：<%=xjjlh%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">客户姓名</td>
    <td width="32%"><%=khxm%></td>
    <td width="18%" align="right">合同号</td>
    <td width="32%"><%=hth%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">房屋地址</td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      联系方式    </td>
    <td width="32%"><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" >
    <input name="button" type="button" onClick="window.open('viewAllPhoto.jsp?xjjlh=<%=xjjlh%>')" value="查看照片" ></td>
    <td width="18%" align="right"> 
      设计师    </td>
    <td width="32%"> <%=sjs%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      施工队    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%" align="right"> 
      监察    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      签约日期    </td>
    <td width="32%"> <%=qyrq%> </td>
    <td width="18%" align="right"> 
      签约分公司    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td colspan="4">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      检查类型    </td>
    <td width="32%"> <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm,true);
%> </td>
    <td width="18%" align="right"> 
      检查结果    </td>
    <td width="32%"><%=xjjgmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td align="right">罚款总额</td>
    <td><%=fkze%></td>
    <td align="right">扣分总数</td>
    <td><%=kfzs%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right">扣除接单额百分比</td>
    <td width="32%"><%=kcjdebl%>%</td>
    <td width="18%" align="right">奖励金额</td>
    <td width="32%"><%=jlje%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"> 
      检查人    </td>
    <td width="32%"> <%=xjr%> </td>
    <td width="18%" align="right"> 
      检查时间    </td>
    <td width="32%"> <%=xjsj%> </td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">奖罚审批标志</td>
    <td width="32%"><%
	cf.selectToken(out,"1+不需审批&2+未审批&3+审批通过&4+审批未通过",cfspbz,true);
%></td>
    <td width="18%" align="right">整改处理标志</td>
    <td width="32%"><%
	cf.selectToken(out,"B+无整改&N+整改未接收&C+在处理&Y+已解决",wtclbz,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">审批意见</td>
    <td colspan="3"><%=spyj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">审批人</td>
    <td width="32%"><%=spr%></td>
    <td width="18%" align="right">审批时间</td>
    <td width="32%"><%=spsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">考评标志</td>
    <td width="32%"><%
	cf.selectToken(out,"N+未考评&Y+已考评",kpbz,true);
%></td>
    <td width="18%" align="right">考评记录号</td>
    <td width="32%"><%=kpjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">结算标志</td>
    <td width="32%"><%
	cf.selectToken(out,"N+未结算&Y+已结算",jsbz,true);
%></td>
    <td width="18%" align="right">结算记录号</td>
    <td width="32%"><%=jsjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 录入人 </td>
    <td><%=lrr%> </td>
    <td align="right"> 录入时间 </td>
    <td><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入部门</td>
    <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw,true);
%></td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right">备注</td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>
<BR>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">项目大类</td>
	<td  width="15%">检查项目</td>
	<td  width="8%">违规分级</td>
	<td  width="7%">单次扣分</td>
	<td  width="8%">单次罚款</td>
	<td  width="7%">扣除接单额百分比</td>
	<td  width="14%">其它处罚</td>
	<td  width="7%">违章次数</td>
	<td  width="21%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT kp_kpdlbm.kpdlmc,kp_gckpxm.kpxmmc,ydcdmc,kp_xjgdmx.kf,kp_xjgdmx.sgdfk,kp_xjgdmx.kcjdebl||'%',kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc,wzcs,kp_xjgdmx.bz  ";
	ls_sql+=" FROM kp_xjgdmx,kp_gckpxm,kp_kpdlbm,kp_kpcfbm,kp_sgdyzcdbm  ";
    ls_sql+=" where kp_xjgdmx.kpxmbm=kp_gckpxm.kpxmbm and kp_xjgdmx.kpjg=kp_gckpxm.kpjg and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm";
    ls_sql+=" and kp_xjgdmx.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_xjgdmx.kpjg=kp_sgdyzcdbm.yzcdbm(+) and kp_xjgdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_xjgdmx.kpxmbm,kp_xjgdmx.kpjg";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("kp_kpdlbm_kpdlmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

<BR>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">整改记录号</td>
	<td  width="3%">处理状态</td>
	<td  width="3%">要求解决</td>
	<td  width="4%">反馈部门</td>
	<td  width="2%">接收人</td>
	<td  width="10%">整改项目</td>
	<td  width="16%">整改说明</td>
	<td  width="4%">整改处理记录号</td>
	<td  width="2%">接收人</td>
	<td  width="3%">接收时间</td>
	<td  width="12%">接收说明</td>
	<td  width="2%">处理人</td>
	<td  width="3%">处理时间</td>
	<td  width="16%">处理说明</td>
	<td  width="2%">验收人</td>
	<td  width="3%">验收时间</td>
	<td  width="12%">验收说明</td>
</tr>
<%
	ls_sql="SELECT kp_zggdmx.zgjlh, DECODE(kp_zggdmx.clzt,'1','未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') as clzt,kp_zggdmx.yqjjsj,dwmc,kp_zggdmx.fkbmjsr,kp_zggdmx.zgxm,kp_zggdmx.zgsm,kp_zggdmx.zgcljlh,kp_zggdmx.jsr,kp_zggdmx.jssj,kp_zggdmx.jssm,kp_zggdmx.clr,kp_zggdmx.clsj,kp_zggdmx.clsm,kp_zggdmx.ysr,kp_zggdmx.yssj,kp_zggdmx.yssm";
	ls_sql+=" FROM kp_zggdmx,sq_dwxx  ";
    ls_sql+=" where kp_zggdmx.fkbm=sq_dwxx.dwbh(+) ";
    ls_sql+=" and kp_zggdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_zggdmx.zgjlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>



</body>
</html>
