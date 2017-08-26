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
	String khbh=null;
	String hth=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
%>



<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String getkhbh=null;

try {
	conn=cf.getConnection();

//	String khbh=null;
//	String hth=null;
//	String khxm=null;
//	String fwdz=null;
//	String lxfs=null;
	String dwmc=null;
	String sgdmc=null;
//	String sjs=null;
//	String zjxm=null;
	String kgrq=null;
	String jgrq=null;
	String khjl=null;


	int row=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=" and crm_khxx.gcjdbm='5' ";
    ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		row=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (row==0)
	{
		out.println("没有符合条件的客户，请用模糊查询试一下");
		return;
	}
	else if (row==1)//只有一条，不需选择
	{
		ls_sql="SELECT khbh";
		ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd ";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and crm_khxx.gcjdbm='5' ";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getkhbh=cf.fillNull(rs.getString("khbh"));
		}
		rs.close();
		ps.close();

		//只有一条，不需选择
		response.sendRedirect("InsertCrm_tsjl.jsp?khbh="+getkhbh);
	}
	else{
		%>
		<CENTER >
		  <B><font size="3">报修登记－有多个符合条件客户，请选择</font></B>
		</CENTER>
		<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
		<tr bgcolor="#CCCCCC"  align="center">
			<td  width="4%">&nbsp;</td>
			<td  width="8%">合同号</td>
			<td  width="6%">姓名</td>
			<td  width="21%">房屋地址</td>
			<td  width="6%">施工队</td>
			<td  width="6%">质检员</td>
			<td  width="6%">客户经理</td>
			<td  width="6%">设计师</td>
			<td  width="15%">签约店面</td>
			<td  width="8%">合同开工</td>
			<td  width="8%">合同完工</td>
			<td  width="6%">客户编号</td>
		</tr>
		<%
		row=0;		
		ls_sql="SELECT khbh,hth,khxm,fwdz,sq_dwxx.dwmc,sgdmc,khjl,sjs,zjxm,kgrq,jgrq ";
		ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd ";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
		if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
		{
			ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
		}
		else
		{
			ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
		}
		ls_sql+=" and crm_khxx.gcjdbm='5' ";
		ls_sql+=wheresql;
		ls_sql+=" order by khxm";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			khbh=cf.fillNull(rs.getString("khbh"));
			hth=cf.fillHtml(rs.getString("hth"));
			khxm=cf.fillHtml(rs.getString("khxm"));
			fwdz=cf.fillHtml(rs.getString("fwdz"));
			dwmc=cf.fillHtml(rs.getString("dwmc"));
			sgdmc=cf.fillHtml(rs.getString("sgdmc"));
			khjl=cf.fillHtml(rs.getString("khjl"));
			sjs=cf.fillHtml(rs.getString("sjs"));
			zjxm=cf.fillHtml(rs.getString("zjxm"));
			kgrq=cf.fillHtml(rs.getDate("kgrq"));
			jgrq=cf.fillHtml(rs.getDate("jgrq"));

			row++;

			if (row>100)
			{
				out.println("数据太多超过100条被截掉，下面不再显示");
				return;
			}

			%>
			<tr bgcolor="#FFFFFF"  align="center">
				<td><A HREF="InsertCrm_tsjl.jsp?khbh=<%=khbh%>">录入</A></td>
				<td><%=hth%></td>
				<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
				<td><%=fwdz%></td>
				<td><%=sgdmc%></td>
				<td><%=zjxm%></td>
				<td><%=khjl%></td>
				<td><%=sjs%></td>
				<td><%=dwmc%></td>
				<td><%=kgrq%></td>
				<td><%=jgrq%></td>
				<td><%=khbh%></td>
			</tr>
			<%
		}
		rs.close();
		ps.close();

		%>
		</table>
		<%
	}

	
%>


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