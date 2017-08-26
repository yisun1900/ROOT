<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>

<%
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

	String wheresql="";
	String wheresql1="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	if (!(fgs.equals("")))	wheresql1+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
		if (!(dwbh.equals("")))	wheresql1+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";
	}

	String startStr=cf.firstDay();

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String getkhbh=null;

try {
	conn=cf.getConnection();
%>


	<CENTER >
	  <B><font size="3">已签单－当月未回访客户（起点：<%=startStr%>）</font></B>
	</CENTER>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="3%">序号</td>
		<td  width="7%">合同号</td>
		<td  width="7%">姓名</td>
		<td  width="20%">房屋地址</td>
		<td  width="7%">施工队</td>
		<td  width="7%">质检员</td>
		<td  width="7%">设计师</td>
		<td  width="8%">签约时间</td>
		<td  width="8%">实开工时间</td>
		<td  width="6%">工程进度</td>
		<td  width="11%">签约店面</td>
		<td  width="9%">分公司</td>
	</tr>

<%

	String khbh=null;
	String hth=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String fgsmc=null;
	String dwmc=null;
	String sgdmc=null;
	String sjs=null;
	String zjxm=null;
	String kgrq=null;
	String sjkgrq=null;
	String zxhfsj=null;
	String qyrq=null;
	String lrsj=null;
	String ysgcjdmc=null;

	int row=0;


		
	ls_sql="SELECT khbh,hth,khxm,fwdz,lxfs||','||qtdh lxfs,a.dwmc fgsmc,b.dwmc dwmc,sgdmc,sjs,zjxm,kgrq,sjkgrq,zxhfsj,crm_khxx.qyrq,crm_khxx.lrsj,ysgcjdmc ";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,dm_gcjdbm ";
	ls_sql+=" where crm_khxx.fgsbh=a.dwbh(+) and crm_khxx.dwbh=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=" and crm_khxx.zt='2'";
	ls_sql+=" and crm_khxx.zxhfsj is null";
	ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+startStr+"','YYYY-MM-DD')";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.fgsbh,lrsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fgsmc=rs.getString("fgsmc");
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		zxhfsj=cf.fillHtml(rs.getDate("zxhfsj"));
		qyrq=cf.fillHtml(rs.getDate("qyrq"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));
		ysgcjdmc=cf.fillHtml(rs.getString("ysgcjdmc"));

		row++;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><%=hth%></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=sgdmc%></td>
			<td><%=zjxm%></td>
			<td><%=sjs%></td>
			<td><%=qyrq%></td>
			<td><%=sjkgrq%></td>
			<td><%=ysgcjdmc%></td>
			<td><%=dwmc%></td>
			<td><%=fgsmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	
%>
	</table>

	<CENTER >
	  <B><font size="3">咨询客户－当月未回访</font></B>
	</CENTER>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="3%">序号</td>
		<td  width="7%">姓名</td>
		<td  width="18%">房屋地址</td>
		<td  width="6%">设计师</td>
		<td  width="5%">业务员</td>
		<td  width="7%">做报价时间</td>
		<td  width="7%">电子报价总额</td>
		<td  width="7%">交量房订金时间</td>
		<td  width="7%">录入时间</td>
		<td  width="7%">预计装修时间</td>
		<td  width="8%">咨询状态</td>
		<td  width="10%">咨询店面</td>
		<td  width="8%">分公司</td>
	</tr>

<%
	String ywy=null;
	String yjzxsj=null;
	String zjzbjsj=null;
	String dzbjze=null;
	String jlfdjsj=null;
	String zxztmc=null;

	row=0;

	ls_sql =" SELECT khbh,khxm,fwdz,lxfs||','||qtdh lxfs,a.dwmc fgsmc,b.dwmc dwmc,sjs,ywy,zxhfsj,crm_zxkhxx.lrsj";
	ls_sql+=" ,crm_zxkhxx.yjzxsj,crm_zxkhxx.zjzbjsj,crm_zxkhxx.dzbjze,crm_zxkhxx.jlfdjsj,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') zxztmc";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where crm_zxkhxx.ssfgs=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y：有效信息；N：无效信息
	ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4')";
	ls_sql+=" and crm_zxkhxx.zxhfsj is null";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+startStr+"','YYYY-MM-DD')";
	ls_sql+=wheresql1;
	ls_sql+=" order by crm_zxkhxx.ssfgs,crm_zxkhxx.zxhfsj,crm_zxkhxx.lrsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		fgsmc=rs.getString("fgsmc");
		dwmc=cf.fillHtml(rs.getString("dwmc"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		ywy=cf.fillHtml(rs.getString("ywy"));
		zxhfsj=cf.fillHtml(rs.getDate("zxhfsj"));
		lrsj=cf.fillHtml(rs.getDate("lrsj"));

		yjzxsj=cf.fillHtml(rs.getDate("yjzxsj"));
		zjzbjsj=cf.fillHtml(rs.getDate("zjzbjsj"));
		dzbjze=cf.fillHtml(rs.getString("dzbjze"));
		jlfdjsj=cf.fillHtml(rs.getDate("jlfdjsj"));
		zxztmc=cf.fillHtml(rs.getString("zxztmc"));

		row++;

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=row%></td>
			<td><A HREF="/dhzx/dhzx/ViewCrm_zxkhxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=sjs%></td>
			<td><%=ywy%></td>
			<td><%=zjzbjsj%></td>
			<td><%=dzbjze%></td>
			<td><%=jlfdjsj%></td>
			<td><%=lrsj%></td>
			<td><%=yjzxsj%></td>
			<td><%=zxztmc%></td>
			<td><%=dwmc%></td>
			<td><%=fgsmc%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();

	
%>
	</table>

</body>
</html>

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