<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String wheresql="";


String fgs=null;
String crm_khxx_dwbh=null;
String crm_khxx_khbh=null;
String crm_khxx_hth=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_sjs=null;
String crm_khxx_zjxm=null;
String crm_khxx_sgd=null;
String crm_khxx_sgbz=null;
String crm_khxx_qye=null;
String crm_khxx_qyrq=null;
String ywy=null;

String crm_khxx_zt=null;
String crm_khxx_gcjdbm=null;
String crm_khxx_zsbz=null;
String crm_khxx_wgbz=null;
String crm_khxx_pdclzt=null;


crm_khxx_khbh=request.getParameter("crm_khxx_khbh");
if (crm_khxx_khbh!=null)
{
	crm_khxx_khbh=cf.GB2Uni(crm_khxx_khbh);
	if (!(crm_khxx_khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+crm_khxx_khbh+"')";
}

ywy=request.getParameter("ywy");
if (ywy!=null)
{
	ywy=cf.GB2Uni(ywy);
	if (!(ywy.equals("")))	wheresql+=" and  (crm_khxx.ywy='"+ywy+"')";
}


fgs=request.getParameter("fgs");
if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";

crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
if (crm_khxx_khxm!=null)
{
	crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
	if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
}
crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
if (crm_khxx_fwdz!=null)
{
	crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
	if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
}
crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
if (crm_khxx_lxfs!=null)
{
	crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
	if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
}
crm_khxx_hth=request.getParameter("crm_khxx_hth");
if (crm_khxx_hth!=null)
{
	crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
	if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
}
crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
if (crm_khxx_sjs!=null)
{
	crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
	if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
}
crm_khxx_qye=request.getParameter("crm_khxx_qye");
if (crm_khxx_qye!=null)
{
	crm_khxx_qye=crm_khxx_qye.trim();
	if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+crm_khxx_qye+") ";
}
crm_khxx_qye=request.getParameter("crm_khxx_qye2");
if (crm_khxx_qye!=null)
{
	crm_khxx_qye=crm_khxx_qye.trim();
	if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+crm_khxx_qye+") ";
}
crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
if (crm_khxx_qyrq!=null)
{
	crm_khxx_qyrq=crm_khxx_qyrq.trim();
	if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
}
crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
if (crm_khxx_qyrq!=null)
{
	crm_khxx_qyrq=crm_khxx_qyrq.trim();
	if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
}
crm_khxx_gcjdbm=request.getParameter("crm_khxx_gcjdbm");
if (crm_khxx_gcjdbm!=null)
{
	crm_khxx_gcjdbm=cf.GB2Uni(crm_khxx_gcjdbm);
	if (!(crm_khxx_gcjdbm.equals("")))	wheresql+=" and  (crm_khxx.gcjdbm='"+crm_khxx_gcjdbm+"')";
}
crm_khxx_zsbz=request.getParameter("crm_khxx_zsbz");
if (crm_khxx_zsbz!=null)
{
	if (crm_khxx_zsbz.equals("1"))//1+未开工&2+已开工&3+已完工
	{
		wheresql+=" and  (crm_khxx.gcjdbm='1')";
	}
	else if (crm_khxx_zsbz.equals("2"))//1+未开工&2+已开工&3+已完工
	{
		wheresql+=" and  (crm_khxx.gcjdbm in('2','3','4'))";
	}
	else if (crm_khxx_zsbz.equals("3"))//1+未开工&2+已开工&3+已完工
	{
		wheresql+=" and  (crm_khxx.gcjdbm='5')";
	}
}
crm_khxx_wgbz=request.getParameter("crm_khxx_wgbz");
if (crm_khxx_wgbz!=null)
{
	if (crm_khxx_wgbz.equals("1"))//1+未完工&2+已完工
	{
		wheresql+=" and  (crm_khxx.gcjdbm in('1','2','3','4'))";
	}
	else if (crm_khxx_wgbz.equals("2"))//1+未完工&2+已完工
	{
		wheresql+=" and  (crm_khxx.gcjdbm='5')";
	}
}
crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
if (crm_khxx_dwbh!=null)
{
	crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
	if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
}
crm_khxx_pdclzt=request.getParameter("crm_khxx_pdclzt");
if (crm_khxx_pdclzt!=null)
{
	crm_khxx_pdclzt=cf.GB2Uni(crm_khxx_pdclzt);
	if (!(crm_khxx_pdclzt.equals("")))	wheresql+=" and  (crm_khxx.pdclzt='"+crm_khxx_pdclzt+"')";
}
crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
if (crm_khxx_sgd!=null)
{
	crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
	if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
}
crm_khxx_sgbz=request.getParameter("crm_khxx_sgbz");
if (crm_khxx_sgbz!=null)
{
	crm_khxx_sgbz=cf.GB2Uni(crm_khxx_sgbz);
	if (!(crm_khxx_sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+crm_khxx_sgbz+"')";
}
crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
if (crm_khxx_zjxm!=null)
{
	crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
	if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
}
crm_khxx_zt=request.getParameter("crm_khxx_zt");
if (crm_khxx_zt!=null)
{
	crm_khxx_zt=cf.GB2Uni(crm_khxx_zt);
	if (!(crm_khxx_zt.equals("")))	wheresql+=" and  (crm_khxx.zt='"+crm_khxx_zt+"')";
}

%>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<table border="1" width="300%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">合同号</td>
	<td  width="3%">退单</td>
	<td  width="3%">客户姓名</td>
	<td  width="14%">房屋地址</td>

	<td  width="5%">工程签约额</td>
	<td  width="3%">工程增项</td>
	<td  width="3%">工程减项</td>
	<td  width="3%">工程结算款</td>
	<td  width="3%">工程实收款</td>

	<td  width="4%">木门合同</td>
	<td  width="3%">木门增项</td>
	<td  width="3%">木门减项</td>
	<td  width="3%">木门结算款</td>
	<td  width="3%">木门实收款</td>

	<td  width="4%">橱柜合同</td>
	<td  width="3%">橱柜增项</td>
	<td  width="3%">橱柜减项</td>
	<td  width="3%">橱柜结算款</td>
	<td  width="3%">橱柜实收款</td>

	<td  width="4%">家具合同</td>
	<td  width="3%">家具增项</td>
	<td  width="3%">家具减项</td>
	<td  width="3%">家具结算款</td>
	<td  width="3%">家具实收款</td>

	<td  width="4%">主材合同</td>
	<td  width="3%">主材增项</td>
	<td  width="3%">主材减项</td>
	<td  width="3%">主材结算款</td>
	<td  width="3%">主材实收款</td>

	<td  width="3%">总结算款</td>
	<td  width="3%">总实收款</td>

	<td  width="4%">签约日期</td>
	<td  width="5%">工程进度</td>
	<td  width="3%">设计师</td>
	<td  width="3%">施工队</td>
	<td  width="3%">质检</td>
	<td  width="7%">签约店面</td>
</tr>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String bgcolor=null;

String khbh=null;
String hth=null;
String zt=null;
String khxm=null;
String fwdz=null;
String qyrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String qydm=null;
String gcjdmc=null;

String qye=null;
String zxje=null;
String jxje=null;
String gcjsk=null;
String gcssk=null;

String mmhtje=null;
String mmzxje=null;
String mmjxje=null;
String mmjsk=null;
String mmssk=null;

String cghtje=null;
String cgzxje=null;
String cgjxje=null;
String cgjsk=null;
String cgssk=null;

String jjhtje=null;
String jjzxje=null;
String jjjxje=null;
String jjjsk=null;
String jjssk=null;

String zchtje=null;
String zczxje=null;
String zcjxje=null;
String zcjsk=null;
String zcssk=null;
try {
	conn=cf.getConnection();

	int row=0;
	ls_sql="SELECT crm_khxx.khbh,crm_khxx.hth,DECODE(zt,'2','未退','3','<font color=\"#FF0000\">已退单</font>') zt";
	ls_sql+=" ,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,a.dwmc qydm,crm_khxx.qyrq,gcjdmc  ";
	ls_sql+=" ,crm_khxx.qye,crm_khxx.wdzgce,crm_khxx.sjf,crm_khxx.glf";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by khbh";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=cf.fillHtml(rs.getString("hth"));
		zt=rs.getString("zt");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		qye=rs.getString("qye");
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		qydm=cf.fillHtml(rs.getString("qydm"));
		gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));


		ls_sql="SELECT sum(zjje)";
		ls_sql+=" FROM crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"' and fylxbm='01'";//01：增项；02：减项
		ps1=conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zxje=cf.fillHtml(rs1.getString(1));
		}
		rs1.close();
		ps1.close();

		ls_sql="SELECT sum(zjje)";
		ls_sql+=" FROM crm_zjxdj";
		ls_sql+=" where khbh='"+khbh+"' and fylxbm='02'";//01：增项；02：减项
		ps1=conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			jxje=cf.fillHtml(rs1.getString(1));
		}
		rs1.close();
		ps1.close();


		gcjsk=null;
		gcssk=null;
		
		//木门
		ls_sql="SELECT sum(htje),sum(zxje),sum(jxje)";
		ls_sql+=" FROM jc_mmydd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1=conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			mmhtje=cf.fillHtml(rs1.getString(1));
			mmzxje=cf.fillHtml(rs1.getString(2));
			mmjxje=cf.fillHtml(rs1.getString(3));
		}
		rs1.close();
		ps1.close();

		//橱柜
		ls_sql="SELECT sum(htze),sum(cgzxje)+sum(wjzxje)+sum(dqzxje),sum(cgjxje)+sum(wjjxje)+sum(dqjxje)";
		ls_sql+=" FROM jc_cgdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1=conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			cghtje=cf.fillHtml(rs1.getString(1));
			cgzxje=cf.fillHtml(rs1.getString(2));
			cgjxje=cf.fillHtml(rs1.getString(3));
		}
		rs1.close();
		ps1.close();

		//家具
		ls_sql="SELECT sum(htze),sum(zxje),sum(jxje)";
		ls_sql+=" FROM jc_jjdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1=conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			jjhtje=cf.fillHtml(rs1.getString(1));
			jjzxje=cf.fillHtml(rs1.getString(2));
			jjjxje=cf.fillHtml(rs1.getString(3));
		}
		rs1.close();
		ps1.close();

		//主材
		ls_sql="SELECT sum(hkze),sum(zczxje),sum(zcjxje)";
		ls_sql+=" FROM jc_zcdd";
		ls_sql+=" where khbh='"+khbh+"'";
		ps1=conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			zchtje=cf.fillHtml(rs1.getString(1));
			zczxje=cf.fillHtml(rs1.getString(2));
			zcjxje=cf.fillHtml(rs1.getString(3));
		}
		rs1.close();
		ps1.close();
		
		row++;
		if (row>100)
		{
			break;
		}
		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%>
		<tr bgcolor="<%=bgcolor%>"  align="center">
			<td><%=hth%></td>
			<td><%=zt%></td>
			<td><%=khxm%></td>
			<td><%=fwdz%></td>
			<td align="right"><%=qye%></td>
			<td align="right"><%=zxje%></td>
			<td align="right"><%=jxje%></td>
			<td align="right"><%=mmhtje%></td>
			<td align="right"><%=mmzxje%></td>
			<td align="right"><%=mmjxje%></td>
			<td align="right"><%=cghtje%></td>
			<td align="right"><%=cgzxje%></td>
			<td align="right"><%=cgjxje%></td>
			<td align="right"><%=jjhtje%></td>
			<td align="right"><%=jjzxje%></td>
			<td align="right"><%=jjjxje%></td>
			<td align="right"><%=zchtje%></td>
			<td align="right"><%=zczxje%></td>
			<td align="right"><%=zcjxje%></td>
			<td><%=qyrq%></td>
			<td><%=gcjdmc%></td>
			<td><%=sjs%></td>
			<td><%=sgd%></td>
			<td><%=zjxm%></td>
			<td><%=qydm%></td>
		</tr>
		<%
	
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>
</body>
</html>
