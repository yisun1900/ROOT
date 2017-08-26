<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

	String wheresql="";
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khpjb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	String lrsj2=null;
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals("")))	wheresql+="  and (crm_khpjb.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}

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

	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
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
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}



	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户评价表（录入时间：<%=lrsj%> 至 <%=lrsj2%>）</font></B>
</CENTER>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	int xmsl=0;
	int xskd=0;
	ls_sql=" select count(*)";
	ls_sql+=" from crm_pjxmbm";
	ls_sql+=" where xmflbm='07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xskd=560+xmsl*60;
	
	

%>

  <table width="<%=xskd%>px" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr align="center" bgcolor="#FFFFFF">
	<td rowspan="2" width="40px">序号</td>
	<td rowspan="2" width="80px">合同号</td>
	<td rowspan="2" width="90px">姓名</td>
	<td rowspan="2" width="170px">店面</td>
	<td rowspan="2" width="60px">设计师</td>
	<td rowspan="2" width="60px">工程担当</td>
	<td rowspan="2" width="60px">施工队</td>
    <%
	String spjrybm=null;
	String spjry=null;
	int sl=0;

	ls_sql=" select spjrybm,spjry,count(*)";
	ls_sql+=" from crm_pjxmbm";
	ls_sql+=" where xmflbm='07'";
	ls_sql+=" group by spjrybm,spjry";
	ls_sql+=" order by spjrybm,spjry";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));
		sl=rs.getInt(3);

		%>
		  <td colspan="<%=sl%>"><%=spjry%></td>
		<%
	}
	rs.close();
	ps.close();

%>
    </tr>

    <tr align="center" bgcolor="#FFFFFF">
    <%
	String pjxm=null;

	ls_sql=" select pjxm";
	ls_sql+=" from crm_pjxmbm";
	ls_sql+=" where xmflbm='07'";
	ls_sql+=" order by spjrybm,spjry,pjxmbm,pjxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		pjxm=rs.getString("pjxm");

%>
      <td  width="60px"><%=pjxm%></td>
<%
	}
	rs.close();
	ps.close();
%>
    </tr>

<%
	String 	getkhbh=null;
	String 	gethth=null;
	String 	getkhxm=null;
	String 	getsjs=null;
	String 	getzjxm=null;
	String 	getdwmc=null;
	String 	getsgdmc=null;

	String bgcolor="#FFFFFF";
	int row=0;

	ls_sql="SELECT distinct crm_khxx.khbh,crm_khxx.hth,crm_khxx.khxm,dwmc,crm_khxx.sjs,crm_khxx.zjxm,sgdmc";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,crm_khpjb ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_khxx.khbh=crm_khpjb.khbh";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.khxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getkhbh=cf.fillNull(rs.getString("khbh"));
		gethth=cf.fillHtml(rs.getString("hth"));
		getkhxm=cf.fillHtml(rs.getString("khxm"));
		getdwmc=cf.fillHtml(rs.getString("dwmc"));
		getsjs=cf.fillHtml(rs.getString("sjs"));
		getzjxm=cf.fillHtml(rs.getString("zjxm"));
		getsgdmc=cf.fillHtml(rs.getString("sgdmc"));

		row++;

		if (row%2==0)
		{
			bgcolor="#FFFFFF";
		}
		else {
			bgcolor="#E8E8FF";
		}


		%>
		<tr align="center" bgcolor="<%=bgcolor%>">
		  <td><%=row%></td>
		  <td><%=gethth%></td>
		  <td><%=getkhxm%></td>
		  <td><%=getdwmc%></td>
		  <td><%=getsjs%></td>
		  <td><%=getzjxm%></td>
		  <td><%=getsgdmc%></td>
		<%
		
			String 	getpjxmbm=null;
			ls_sql=" select pjxmbm";
			ls_sql+=" from crm_pjxmbm";
			ls_sql+=" where xmflbm='07'";
			ls_sql+=" order by spjrybm,spjry,pjxmbm,pjxm";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				getpjxmbm=rs2.getString("pjxmbm");

				String getpjjgbm="&nbsp;";
				ls_sql=" select DECODE(pjjgbm,'1','√','2','×','9','空') pjjgbm";
				ls_sql+=" from crm_khpjb";
				ls_sql+=" where crm_khpjb.khbh='"+getkhbh+"' and crm_khpjb.pjxmbm='"+getpjxmbm+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					getpjjgbm=rs1.getString("pjjgbm");
				}
				rs1.close();
				ps1.close();

				%>
				  <td><%=getpjjgbm%></td>
				<%
			}
			rs2.close();
			ps2.close();
		%>
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
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
