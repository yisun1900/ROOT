<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>客户评价汇总表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

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


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
PreparedStatement ps3=null;
ResultSet rs3=null;
PreparedStatement ps4=null;
ResultSet rs4=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	int xmsl=0;
	int xskd=0;
	ls_sql=" select count(*)";
	ls_sql+=" from crm_spjrybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	xskd=390+90+xmsl*3*105;


%>


<body bgcolor="#FFFFFF">
  
<div align="center">单额满意度统计（<%=lrsj%> 至 <%=lrsj2%>）</div>
  <table width="<%=xskd%>px" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr align="center"  bgcolor="#FFFFFF">
      <td width="260px"  rowspan="3">分公司</td>
      <td width="260px"  rowspan="3">产值</td>
      <td width="130px"  rowspan="3">实收数量</td>
    <%
	String spjrybm=null;
	String spjry=null;

	ls_sql=" select spjrybm,spjry";
	ls_sql+=" from crm_spjrybm";
	ls_sql+=" order by spjrybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));

		int sl=0;
		ls_sql=" select count(*)";
		ls_sql+=" from crm_pjxmbm";
		ls_sql+=" where xmflbm='07' and spjrybm='"+spjrybm+"'";//07:考核结果
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		%>
		  <td colspan="<%=sl*2%>"><%=spjry%></td>
		<%
	}
	rs.close();
	ps.close();
%>
    </tr>
    <tr align="center"  bgcolor="#FFFFFF">
<%

	String pjxmbm=null;
	String pjxm=null;

	ls_sql=" select spjrybm,spjry";
	ls_sql+=" from crm_spjrybm";
	ls_sql+=" order by spjrybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));


		ls_sql=" select pjxmbm,pjxm";
		ls_sql+=" from crm_pjxmbm";
		ls_sql+=" where xmflbm='07' and spjrybm='"+spjrybm+"'";//07:考核结果
		ls_sql+=" order by pjxmbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			pjxmbm=cf.fillNull(rs1.getString("pjxmbm"));
			pjxm=cf.fillNull(rs1.getString("pjxm"));

			%>
			  <td colspan="2"><%=pjxm%></td>
			<%
		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();
	

%>
    </tr>
    <tr align="center"  bgcolor="#FFFFFF">
<%
	ls_sql=" select spjrybm,spjry";
	ls_sql+=" from crm_spjrybm";
	ls_sql+=" order by spjrybm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		spjrybm=cf.fillNull(rs.getString("spjrybm"));
		spjry=cf.fillNull(rs.getString("spjry"));


		ls_sql=" select pjxmbm,pjxm";
		ls_sql+=" from crm_pjxmbm";
		ls_sql+=" where xmflbm='07' and spjrybm='"+spjrybm+"'";//07:考核结果
		ls_sql+=" order by pjxmbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			pjxmbm=cf.fillNull(rs1.getString("pjxmbm"));
			pjxm=cf.fillNull(rs1.getString("pjxm"));

			%>
			  <td  width="105px">份数</td>
			  <td  width="105px">比例</td>
			<%
		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

%>
    </tr>
<%

	String fgsbh=null;
	String fgsmc=null;
	ls_sql=" select dwbh,dwmc";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwlx='F0' and cxbz='N'";
	if (!(fgs.equals("")))
	{
		ls_sql+=" and dwbh='"+fgs+"'";
	}
	ls_sql+=" order by dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("dwbh"));
		fgsmc=cf.fillNull(rs.getString("dwmc"));

		int jwsl=0;
		ls_sql=" select count(*)";
		ls_sql+=" from dm_zxjwbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jwsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


		String zxjwbm=null;
		String zxjwmc=null;
		ls_sql=" select zxjwbm,zxjwmc";
		ls_sql+=" from dm_zxjwbm";
		ls_sql+=" order by zxjwbm desc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			zxjwbm=cf.fillNull(rs1.getString("zxjwbm"));
			zxjwmc=cf.fillNull(rs1.getString("zxjwmc"));
		
			int zsl=0;
			ls_sql=" select count(distinct crm_khpjb.khbh)";
			ls_sql+=" from crm_khpjb,crm_khxx";
			ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
			ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zxjwbm='"+zxjwbm+"'";
			ls_sql+=" and crm_khpjb.xmflbm='07' ";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			if (rs2.next())
			{
				zsl=rs2.getInt(1);
			}
			rs2.close();
			ps2.close();

			if (jwsl!=0)//第一行
			{
				%>
				<tr align="center"  bgcolor="#FFFFFF">
				<td rowspan="<%=jwsl%>"><%=fgsmc%></td>
				<td><%=zxjwmc%></td>
				<td><%=zsl%></td>
				<%

				jwsl=0;
			}
			else
			{
				%>
				<tr align="center"  bgcolor="#FFFFFF">
				<td><%=zxjwmc%></td>
				<td><%=zsl%></td>
				<%
			}

			ls_sql=" select spjrybm,spjry";
			ls_sql+=" from crm_spjrybm";
			ls_sql+=" order by spjrybm";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery();
			while (rs2.next())
			{
				spjrybm=cf.fillNull(rs2.getString("spjrybm"));
				spjry=cf.fillNull(rs2.getString("spjry"));

				ls_sql=" select pjxmbm,pjxm";
				ls_sql+=" from crm_pjxmbm";
				ls_sql+=" where xmflbm='07' and spjrybm='"+spjrybm+"'";//07:考核结果
				ls_sql+=" order by pjxmbm";
				ps3= conn.prepareStatement(ls_sql);
				rs3 =ps3.executeQuery();
				while (rs3.next())
				{
					pjxmbm=cf.fillNull(rs3.getString("pjxmbm"));
					pjxm=cf.fillNull(rs3.getString("pjxm"));

					int sl=0;
					ls_sql=" select count(distinct crm_khpjb.khbh)";
					ls_sql+=" from crm_khpjb,crm_khxx";
					ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
					ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"' and crm_khxx.zxjwbm='"+zxjwbm+"'";
					ls_sql+=" and crm_khpjb.xmflbm='07' ";
					ls_sql+=" and crm_khpjb.spjrybm='"+spjrybm+"' and crm_khpjb.pjxmbm='"+pjxmbm+"' ";
					ls_sql+=wheresql;
					ps4= conn.prepareStatement(ls_sql);
					rs4 =ps4.executeQuery();
					if (rs4.next())
					{
						sl=rs4.getInt(1);
					}
					rs4.close();
					ps4.close();

					double bl=0;
					String blStr="";
					if (zsl==0)
					{
						bl=100;
						blStr="-";
					}
					else{
						bl=cf.round(sl*100/zsl,1);
						blStr=bl+"%";
					}


					%>
					<td><%=sl%></td>
					<td><%=blStr%></td>
					<%
				}
				rs3.close();
				ps3.close();
			}
			rs2.close();
			ps2.close();

			%>
			</tr>
			<%

		}
		rs1.close();
		ps1.close();

		//分公司小计
		int fgszsl=0;
		ls_sql=" select count(distinct crm_khpjb.khbh)";
		ls_sql+=" from crm_khpjb,crm_khxx";
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khpjb.xmflbm='07' ";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fgszsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		%>
		<tr align="center"  bgcolor="#FFFFFF">
		<td colspan="2">【<%=fgsmc%>】小计</td>
		<td><%=fgszsl%></td>
		<%

		ls_sql=" select spjrybm,spjry";
		ls_sql+=" from crm_spjrybm";
		ls_sql+=" order by spjrybm";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			spjrybm=cf.fillNull(rs2.getString("spjrybm"));
			spjry=cf.fillNull(rs2.getString("spjry"));

			ls_sql=" select pjxmbm,pjxm";
			ls_sql+=" from crm_pjxmbm";
			ls_sql+=" where xmflbm='07' and spjrybm='"+spjrybm+"'";//07:考核结果
			ls_sql+=" order by pjxmbm";
			ps3= conn.prepareStatement(ls_sql);
			rs3 =ps3.executeQuery();
			while (rs3.next())
			{
				pjxmbm=cf.fillNull(rs3.getString("pjxmbm"));
				pjxm=cf.fillNull(rs3.getString("pjxm"));

				int fgssl=0;
				ls_sql=" select count(distinct crm_khpjb.khbh)";
				ls_sql+=" from crm_khpjb,crm_khxx";
				ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
				ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
				ls_sql+=" and crm_khpjb.xmflbm='07' ";
				ls_sql+=" and crm_khpjb.spjrybm='"+spjrybm+"' and crm_khpjb.pjxmbm='"+pjxmbm+"' ";
				ls_sql+=wheresql;
				ps4= conn.prepareStatement(ls_sql);
				rs4 =ps4.executeQuery();
				if (rs4.next())
				{
					fgssl=rs4.getInt(1);
				}
				rs4.close();
				ps4.close();

				double fgsbl=0;
				String blStr="";
				if (fgszsl==0)
				{
					fgsbl=100;
					blStr="-";
				}
				else{
					fgsbl=cf.round(fgssl*100/fgszsl,1);
					blStr=fgsbl+"%";
				}

				%>
				<td><%=fgssl%></td>
				<td><%=blStr%></td>
				<%
			}
			rs3.close();
			ps3.close();
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


<%
//生成总计
int zgszsl=0;
ls_sql=" select count(distinct crm_khpjb.khbh)";
ls_sql+=" from crm_khpjb,crm_khxx";
ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
ls_sql+=" and crm_khpjb.xmflbm='07' ";
ls_sql+=wheresql;
ps1= conn.prepareStatement(ls_sql);
rs1 =ps1.executeQuery();
if (rs1.next())
{
	zgszsl=rs1.getInt(1);
}
rs1.close();
ps1.close();

%>

<tr align="center"  bgcolor="#FFFFFF">
<td colspan="2">总 计</td>
<td><%=zgszsl%></td>
<%

ls_sql=" select spjrybm,spjry";
ls_sql+=" from crm_spjrybm";
ls_sql+=" order by spjrybm";
ps2= conn.prepareStatement(ls_sql);
rs2 =ps2.executeQuery();
while (rs2.next())
{
	spjrybm=cf.fillNull(rs2.getString("spjrybm"));
	spjry=cf.fillNull(rs2.getString("spjry"));

	ls_sql=" select pjxmbm,pjxm";
	ls_sql+=" from crm_pjxmbm";
	ls_sql+=" where xmflbm='07' and spjrybm='"+spjrybm+"'";//07:考核结果
	ls_sql+=" order by pjxmbm";
	ps3= conn.prepareStatement(ls_sql);
	rs3 =ps3.executeQuery();
	while (rs3.next())
	{
		pjxmbm=cf.fillNull(rs3.getString("pjxmbm"));
		pjxm=cf.fillNull(rs3.getString("pjxm"));

		int zgssl=0;
		ls_sql=" select count(distinct crm_khpjb.khbh)";
		ls_sql+=" from crm_khpjb,crm_khxx";
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khpjb.xmflbm='07' ";
		ls_sql+=" and crm_khpjb.spjrybm='"+spjrybm+"' and crm_khpjb.pjxmbm='"+pjxmbm+"' ";
		ls_sql+=wheresql;
		ps4= conn.prepareStatement(ls_sql);
		rs4 =ps4.executeQuery();
		if (rs4.next())
		{
			zgssl=rs4.getInt(1);
		}
		rs4.close();
		ps4.close();

		double zgsbl=0;
		String blStr="";
		if (zgszsl==0)
		{
			zgsbl=100;
			blStr="-";
		}
		else{
			zgsbl=cf.round(zgssl*100/zgszsl,1);
			blStr=zgsbl+"%";
		}

		%>
		<td><%=zgssl%></td>
		<td><%=blStr%></td>
		<%
	}
	rs3.close();
	ps3.close();
}
rs2.close();
ps2.close();

%>
</tr>


</table>




</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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
		if (rs3 != null) rs3.close(); 
		if (ps3!= null) ps3.close(); 
		if (rs4 != null) rs4.close(); 
		if (ps4!= null) ps4.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

