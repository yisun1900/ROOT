<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject  pageObj=new ybl.common.PageObject();


	String ls_sql=null;
	String sjfw=null;
	String sjfw2=null;
	sjfw=request.getParameter("lrsj");
	sjfw2=request.getParameter("lrsj2");

	String wheresql="";
	String wheresql2="";
	String wheresql3="";
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsjl.ssfgs='"+fgs+"')";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_tsjl.slbm='"+dwbh+"'";
		if (!(dwbh.equals("")))	wheresql2+=" and  crm_tsjl.slbm='"+dwbh+"'";
	}
	String clzt=request.getParameter("clzt");
	if (clzt.equals("2"))
	{
		wheresql3+=" and  crm_tsjl.clzt!='3'";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	}
	else if (clzt.equals("3"))
	{
		wheresql3+=" and  crm_tsjl.clzt='3'";//0：未受理；1：已受理；2：在处理；3：结案；9:不立案
	}
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER ><B>客户投诉报修回访记录(<%=sjfw%>--<%=sjfw2%>)</B> </CENTER>
<BR>
<%
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
int all=0;
int sl=0;

String hfjgbm=null;
String xsstr="";

try {
	conn=cf.getConnection();
	
	//共回访客户
	ls_sql="select dm_hfjgbm.hfjgmc,count(crm_tshfjl.hfjlh)";
	ls_sql+=" from  crm_tshfjl,crm_tswthfmx,crm_tsjl,dm_hfjgbm";
    ls_sql+=" where crm_tshfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD')";
	ls_sql+=" and crm_tshfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and crm_tswthfmx.hfjgbm=dm_hfjgbm.hfjgbm ";
	ls_sql+=" and crm_tswthfmx.hfjlh=crm_tshfjl.hfjlh";
	ls_sql+=" and crm_tswthfmx.tsjlh=crm_tsjl.tsjlh";
    ls_sql+=wheresql;
	ls_sql+=wheresql3;
	ls_sql+=" group by dm_hfjgbm.hfjgmc";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		hfjgbm=rs.getString(1);
		sl=rs.getInt(2);

		all+=sl;

		xsstr+="&nbsp;&nbsp;&nbsp;"+hfjgbm+"："+sl+"个";
	}
	ps.close();
	rs.close();

	xsstr="涉及责任部门："+all+"个"+xsstr;

	ls_sql="select count(distinct crm_tshfjl.hfjlh)";
	ls_sql+=" from  crm_tshfjl,crm_tswthfmx,crm_tsjl,dm_hfjgbm";
    ls_sql+=" where crm_tshfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD')";
	ls_sql+=" and crm_tshfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and crm_tswthfmx.hfjgbm=dm_hfjgbm.hfjgbm ";
	ls_sql+=" and crm_tswthfmx.hfjlh=crm_tshfjl.hfjlh";
	ls_sql+=" and crm_tswthfmx.tsjlh=crm_tsjl.tsjlh";
    ls_sql+=wheresql;
	ls_sql+=wheresql3;
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	ps.close();
	rs.close();
	xsstr="共回访："+sl+"次&nbsp;&nbsp;&nbsp;"+xsstr;

	out.println(xsstr);
 // out.println(ls_sql);

%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">序号</td>
	<td  width="4%">姓名</td>
	<td  width="22%">客户回访情况</td>
	<td  width="10%">回访中出现的新问题</td>
	<td  width="22%">投诉报修内容</td>
	<td  width="5%">责任部门</td>
	<td  width="27%">投诉报修处理情况</td>
	<td  width="6%">回访结果</td>
</tr>
<%
	String tsjlh=null;
	String khxm=null;
	String tsnr=null;
	String slr=null;
	String slsj=null;
	String tslxmc=null;
	int mark=0;
	int row1=0;
	int row2=0;
	String col="#FFFFFF";

	//客户回访情况
	String hfjlh=null;
	String khhfqk=null;
	String cxxwt=null;
	String hfjgmc=null;
	String hfsj=null;
	String hfr=null;

	ls_sql="SELECT distinct crm_tshfjl.hfjlh,khxm,crm_tshfjl.hfr,crm_tshfjl.hfsj,crm_tshfjl.khhfqk,crm_tshfjl.cxxwt";
	ls_sql+=" FROM crm_tshfjl,crm_tsjl,crm_tsjlhfmx,crm_khxx  ";
    ls_sql+=" where crm_tshfjl.hfsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD')";
    ls_sql+=" and crm_tshfjl.hfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') ";
	ls_sql+=" and crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and crm_tsjl.tsjlh=crm_tsjlhfmx.tsjlh";
	ls_sql+=" and crm_tshfjl.khbh=crm_khxx.khbh" ;
	ls_sql+=wheresql3;
	ls_sql+=wheresql;
    ls_sql+=" order by crm_tshfjl.hfsj";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		row1++;
		hfjlh=rs.getString("hfjlh");
		khxm=rs.getString("khxm");
		hfr=rs.getString("hfr");
		hfsj=rs.getString("hfsj").substring(0,10);
		khhfqk=rs.getString("khhfqk");
		cxxwt=cf.fillHtml(rs.getString("cxxwt"));

		int sl1=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM crm_tswthfmx,crm_tsjl,crm_tsbm,sq_dwxx,dm_hfjgbm ";
		ls_sql+=" where crm_tswthfmx.tsjlh=crm_tsbm.tsjlh(+) and crm_tswthfmx.tsyybm=crm_tsbm.tsyybm(+)";
		ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh(+) and crm_tswthfmx.hfjgbm=dm_hfjgbm.hfjgbm";
		ls_sql+=" and crm_tswthfmx.hfjlh='"+hfjlh+"' and crm_tswthfmx.tsjlh=crm_tsjl.tsjlh";
        ls_sql+=wheresql3;
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			sl1=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		if (sl1==0)
		{
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_tsjlhfmx,crm_tsjl";
			ls_sql+=" where crm_tsjlhfmx.hfjlh='"+hfjlh+"' and crm_tsjlhfmx.tsjlh=crm_tsjl.tsjlh";
			ls_sql+=wheresql3;
	//		out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sl1=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();
		}

		//取投诉内容
		ls_sql="SELECT crm_tsjlhfmx.tsjlh,tsnr,slr,slsj";
		ls_sql+=" FROM crm_tsjl,crm_tsjlhfmx  ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsjlhfmx.tsjlh ";
		ls_sql+=" and crm_tsjlhfmx.hfjlh='"+hfjlh+"'";
        ls_sql+=wheresql3;
		ls_sql+=" order by slsj";
//		out.println(ls_sql);
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery(ls_sql);
		if (rs2.next())
		{
			row2++;
			tsnr=rs2.getString("tsnr");
			slr=rs2.getString("slr");
			slsj=rs2.getString("slsj").substring(0,10);
			tsjlh=rs2.getString("tsjlh");

			int sl2=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_tswthfmx,crm_tsbm,sq_dwxx,dm_hfjgbm ";
			ls_sql+=" where crm_tswthfmx.tsjlh=crm_tsbm.tsjlh(+) and crm_tswthfmx.tsyybm=crm_tsbm.tsyybm(+)";
			ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh and crm_tswthfmx.hfjgbm=dm_hfjgbm.hfjgbm";
			ls_sql+=" and crm_tswthfmx.hfjlh='"+hfjlh+"'";
			ls_sql+=" and crm_tswthfmx.tsjlh='"+tsjlh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sl2=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//处理情况
			String clqk="";
			String clsj="";
			String clr="";
			String lrsj="";
			String lrr="";
			String dwmc="&nbsp;";
			String clqkoutstr="&nbsp;";
			hfjgmc="&nbsp;";
			
			//取回访内容
			mark=0;
			ls_sql="SELECT crm_tsbm.clqk,dwmc,hfjgmc,crm_tsbm.clsj,crm_tsbm.clr,crm_tsbm.lrsj,crm_tsbm.lrr";
			ls_sql+=" FROM crm_tswthfmx,crm_tsbm,sq_dwxx,dm_hfjgbm ";
			ls_sql+=" where crm_tswthfmx.tsjlh=crm_tsbm.tsjlh(+) and crm_tswthfmx.tsyybm=crm_tsbm.tsyybm(+)";
			ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh and crm_tswthfmx.hfjgbm=dm_hfjgbm.hfjgbm";
			ls_sql+=" and crm_tswthfmx.hfjlh='"+hfjlh+"'";
			ls_sql+=" and crm_tswthfmx.tsjlh='"+tsjlh+"'";
//			out.println(ls_sql);
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				mark++;
				dwmc=cf.fillHtml(rs1.getString("dwmc"));
				hfjgmc=cf.fillHtml(rs1.getString("hfjgmc"));
				clqk=cf.fillHtml(rs1.getString("clqk"));
				clsj=cf.fillNull(rs1.getDate("clsj"));
				clr=cf.fillNull(rs1.getString("clr"));
				lrsj=cf.fillNull(rs1.getDate("lrsj"));
				lrr=cf.fillNull(rs1.getString("lrr"));
				if (clqk==null)
				{
					clqk="<font color=\"#CC0000\">未处理</font>";
				}
				else if (!clqk.equals("&nbsp;"))
				{
					clqk="（处理："+clsj+"，"+clr+"）：<U>"+clqk+"</U>";
				}

				if (row1%2==0)
				{
					col="#FFFFCC";
				}
				else{
					col="#FFFFFF";
				}
				%>
					
				<tr bgcolor="<%=col%>"  >
					<td align="center" rowspan="<%=sl1%>"><%=row1%></td>
					<td align="center" rowspan="<%=sl1%>"><%=khxm%></td>
					<td align="left" rowspan="<%=sl1%>"><%=hfr%>，<%=hfsj%>：<U><%=khhfqk%></U></td>
					<td align="left" rowspan="<%=sl1%>"><U><%=cxxwt%></U></td>
					<td align="left" valign="top" rowspan="<%=sl2%>"><%=slr%>，<%=slsj%>：<U><%=tsnr%></U></td>
					<td align="center"><%=dwmc%></td>
					<td align="left" valign="top"><%=clqk%></td>
					<td align="center"><%=hfjgmc%></td>
				</tr>
				<%
			}
			while (rs1.next())
			{
				mark++;
				dwmc=cf.fillHtml(rs1.getString("dwmc"));
				hfjgmc=cf.fillHtml(rs1.getString("hfjgmc"));
				clqk=cf.fillHtml(rs1.getString("clqk"));
				clsj=cf.fillNull(rs1.getDate("clsj"));
				clr=cf.fillNull(rs1.getString("clr"));
				lrsj=cf.fillNull(rs1.getDate("lrsj"));
				lrr=cf.fillNull(rs1.getString("lrr"));
				if (clqk==null)
				{
					clqk="<font color=\"#CC0000\">未处理</font>";
				}
				else if (!clqk.equals("&nbsp;"))
				{
					clqk="（处理："+clsj+"，"+clr+"）（录入："+lrsj+"，"+lrr+"）：<U>"+clqk+"</U>";
				}

				if (row1%2==0)
				{
					col="#FFFFCC";
				}
				else{
					col="#FFFFFF";
				}
				%>
					
				<tr bgcolor="<%=col%>"  >
					<td align="center"><%=dwmc%></td>
					<td align="left" valign="top"><%=clqk%></td>
					<td align="center"><%=hfjgmc%></td>
				</tr>
				<%
			}
			rs1.close();
			ps1.close();


			if (mark==0)
			{
				if (row1%2==0)
				{
					col="#FFFFCC";
				}
				else{
					col="#FFFFFF";
				}
				%>
					
				<tr bgcolor="<%=col%>"  >
					<td align="center" rowspan="<%=sl1%>"><%=row1%></td>
					<td align="center" rowspan="<%=sl1%>"><%=khxm%></td>
					<td align="left" rowspan="<%=sl1%>"><%=hfr%>，<%=hfsj%>：<U><%=khhfqk%></U></td>
					<td align="left" rowspan="<%=sl1%>"><U><%=cxxwt%></U></td>
					<td align="left" valign="top" ><%=slr%>，<%=slsj%>：<U><%=tsnr%></U></td>
					<td align="center"><%=dwmc%></td>
					<td align="left" valign="top"><%=clqk%></td>
					<td align="center"><%=hfjgmc%></td>
				</tr>
				<%
			}


		}
		while (rs2.next())
		{
			row2++;
			tsnr=rs2.getString("tsnr");
			slr=rs2.getString("slr");
			slsj=rs2.getString("slsj").substring(0,10);
			tsjlh=rs2.getString("tsjlh");

			int sl2=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM crm_tswthfmx,crm_tsbm,sq_dwxx,dm_hfjgbm ";
			ls_sql+=" where crm_tswthfmx.tsjlh=crm_tsbm.tsjlh(+) and crm_tswthfmx.tsyybm=crm_tsbm.tsyybm(+)";
			ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh and crm_tswthfmx.hfjgbm=dm_hfjgbm.hfjgbm";
			ls_sql+=" and crm_tswthfmx.hfjlh='"+hfjlh+"'";
			ls_sql+=" and crm_tswthfmx.tsjlh='"+tsjlh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				sl2=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			//处理情况
			String clqk="&nbsp;";
			String clsj=null;
			String clr=null;
			String lrsj=null;
			String lrr=null;
			String dwmc="&nbsp;";
			String clqkoutstr="&nbsp;";
			hfjgmc="&nbsp;";
			
			//取回访内容
			mark=0;
			ls_sql="SELECT crm_tsbm.clqk,dwmc,hfjgmc,crm_tsbm.clsj,crm_tsbm.clr,crm_tsbm.lrsj,crm_tsbm.lrr";
			ls_sql+=" FROM crm_tswthfmx,crm_tsbm,sq_dwxx,dm_hfjgbm ";
			ls_sql+=" where crm_tswthfmx.tsjlh=crm_tsbm.tsjlh(+) and crm_tswthfmx.tsyybm=crm_tsbm.tsyybm(+)";
			ls_sql+=" and crm_tsbm.dwbh=sq_dwxx.dwbh and crm_tswthfmx.hfjgbm=dm_hfjgbm.hfjgbm";
			ls_sql+=" and crm_tswthfmx.hfjlh='"+hfjlh+"'";
			ls_sql+=" and crm_tswthfmx.tsjlh='"+tsjlh+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				mark++;
				dwmc=cf.fillHtml(rs1.getString("dwmc"));
				hfjgmc=cf.fillHtml(rs1.getString("hfjgmc"));
				clqk=cf.fillHtml(rs1.getString("clqk"));
				clsj=cf.fillNull(rs1.getDate("clsj"));
				clr=cf.fillNull(rs1.getString("clr"));
				lrsj=cf.fillNull(rs1.getDate("lrsj"));
				lrr=cf.fillNull(rs1.getString("lrr"));
				if (clqk==null)
				{
					clqk="<font color=\"#CC0000\">未处理</font>";
				}
				else if (!clqk.equals("&nbsp;"))
				{
					clqk="（处理："+clsj+"，"+clr+"）（录入："+lrsj+"，"+lrr+"）：<U>"+clqk+"</U>";
				}


				if (row1%2==0)
				{
					col="#FFFFCC";
				}
				else{
					col="#FFFFFF";
				}
				%>
					
				<tr bgcolor="<%=col%>"  >
					<td align="left" valign="top" rowspan="<%=sl2%>"><%=slr%>，<%=slsj%>：<U><%=tsnr%></U></td>
					<td align="center"><%=dwmc%></td>
					<td align="left" valign="top"><%=clqk%></td>
					<td align="center"><%=hfjgmc%></td>
				</tr>
				<%
			}
			while (rs1.next())
			{
				mark++;
				dwmc=cf.fillHtml(rs1.getString("dwmc"));
				hfjgmc=cf.fillHtml(rs1.getString("hfjgmc"));
				clqk=cf.fillHtml(rs1.getString("clqk"));
				clsj=cf.fillNull(rs1.getDate("clsj"));
				clr=cf.fillNull(rs1.getString("clr"));
				lrsj=cf.fillNull(rs1.getDate("lrsj"));
				lrr=cf.fillNull(rs1.getString("lrr"));
				if (clqk==null)
				{
					clqk="<font color=\"#CC0000\">未处理</font>";
				}
				else if (!clqk.equals("&nbsp;"))
				{
					clqk="（处理："+clsj+"，"+clr+"）（录入："+lrsj+"，"+lrr+"）：<U>"+clqk+"</U>";
				}


				if (row1%2==0)
				{
					col="#FFFFCC";
				}
				else{
					col="#FFFFFF";
				}
				%>
					
				<tr bgcolor="<%=col%>"  >
					<td align="center"><%=dwmc%></td>
					<td align="left" valign="top"><%=clqk%></td>
					<td align="center"><%=hfjgmc%></td>
				</tr>
				<%
			}
			rs1.close();
			ps1.close();


			if (mark==0)
			{
				if (row1%2==0)
				{
					col="#FFFFCC";
				}
				else{
					col="#FFFFFF";
				}
				%>
					
				<tr bgcolor="<%=col%>"  >
					<td align="left" valign="top" ><%=slr%>，<%=slsj%>：<U><%=tsnr%></U></td>
					<td align="center"><%=dwmc%></td>
					<td align="left" valign="top"><U><%=clqk%></U></td>
					<td align="center"><%=hfjgmc%></td>
				</tr>
				<%
			}


		}
		ps2.close();
		rs2.close();
	}
	ps.close();
	rs.close();

%> 

</table>
</body>
</html>


<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

