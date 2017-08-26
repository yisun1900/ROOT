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
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

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
		if (!(lrsj.equals("")))	wheresql+="  and (cmp_khpjb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	String lrsj2=null;
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals("")))	wheresql+="  and (cmp_khpjb.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	int xmsl=0;
	ls_sql=" select count(*)";
	ls_sql+=" from cmp_pjxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int xskd=0;
	xskd=130+90+xmsl*105;


%>


<body bgcolor="#FFFFFF">
  
<div align="center">满意度统计（<%=lrsj%> 至 <%=lrsj2%>）</div>
  <table width="<%=xskd%>px" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr align="center" bgcolor="#FFFFFF">
      <td width="130px" rowspan="2">时间</td>
      <td width="90px" rowspan="2">实收数量</td>
    <%
	String xmflbm=null;
	String xmfl=null;

	ls_sql=" select xmfl,xmflbm";
	ls_sql+=" from cmp_xmflbm";
	ls_sql+=" order by xmflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflbm"));
		xmfl=cf.fillNull(rs.getString("xmfl"));


		int colsl=0;
		ls_sql=" select count(*)";
		ls_sql+=" from cmp_pjxmbm";
		ls_sql+=" where xmflbm='"+xmflbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			colsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();


		%>
		  <td colspan="<%=colsl%>"><%=xmfl%></td>
		<%
	}
	rs.close();
	ps.close();

%>
    </tr>

    <tr align="center" bgcolor="#FFFFFF">
    <%
	String pjxmbm=null;
	String pjxm=null;
	ls_sql=" select pjxmbm,pjxm";
	ls_sql+=" from cmp_pjxmbm";
	ls_sql+=" order by xmflbm,pjxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		pjxmbm=cf.fillNull(rs.getString("pjxmbm"));
		pjxm=cf.fillNull(rs.getString("pjxm"));

		%>
		  <td  width="105px"><%=pjxm%></td>
		<%
	}
	rs.close();
	ps.close();

%>
    </tr>



<%

	//定义数组长度
	int khsl=0;
	ls_sql=" select count(distinct cmp_khpjb.khbh)";
	ls_sql+=" from cmp_khpjb,crm_khxx";
	ls_sql+=" where cmp_khpjb.khbh=crm_khxx.khbh ";
	ls_sql+=wheresql;
	ls_sql+=" order by TO_CHAR(cmp_khpjb.lrsj,'YYYY'),TO_CHAR(cmp_khpjb.lrsj,'MM')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khsl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String[][] getData=new String[khsl*xmsl][3];
	





	int[] zsl=new int[xmsl+1];


	String nian=null;
	String yue=null;
	String bgcolor="#FFFFFF";
	int row=0;

	int dataxh=0;

	ls_sql=" select TO_CHAR(cmp_khpjb.lrsj,'YYYY') nian,TO_CHAR(cmp_khpjb.lrsj,'MM') yue";
	ls_sql+=" from cmp_khpjb,crm_khxx";
	ls_sql+=" where cmp_khpjb.khbh=crm_khxx.khbh ";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(cmp_khpjb.lrsj,'YYYY'),TO_CHAR(cmp_khpjb.lrsj,'MM')";
	ls_sql+=" order by TO_CHAR(cmp_khpjb.lrsj,'YYYY'),TO_CHAR(cmp_khpjb.lrsj,'MM')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		nian=cf.fillNull(rs.getString("nian"));
		yue=cf.fillNull(rs.getString("yue"));

		row++;

		if (row%2==0)
		{
			bgcolor="#FFFFFF";
		}
		else {
			bgcolor="#E8E8FF";
		}


		//实收数量
		int sssl=0;//实收数量
		ls_sql=" select count(distinct cmp_khpjb.khbh) sl";
		ls_sql+=" from cmp_khpjb,crm_khxx";
		ls_sql+=" where cmp_khpjb.khbh=crm_khxx.khbh ";
		ls_sql+=" and TO_CHAR(cmp_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(cmp_khpjb.lrsj,'MM')='"+yue+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sssl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		zsl[0]+=sssl;

%>
    <tr align="center" bgcolor="<%=bgcolor%>">
      <td><%=nian%>年<%=yue%>月</td>
      <td><A HREF="ViewAllMydmx.jsp?wheresql=<%=wheresql%>&nian=<%=nian%>&yue=<%=yue%>" target="_blank"><%=sssl%></A></td>
<%
		int col=1;
		
		int sl=0;
		//取项目满意数量
		ls_sql="select xmflbm,pjxmbm,pjxm,sum(sl)";
		ls_sql+=" from ( ";

		ls_sql+=" select xmflbm,pjxmbm,pjxm,count(distinct cmp_khpjb.khbh) sl";
		ls_sql+=" from cmp_khpjb,crm_khxx";
		ls_sql+=" where cmp_khpjb.khbh=crm_khxx.khbh ";
		ls_sql+=" and cmp_khpjb.pjjgbm='1'";//1：满意；2：一般；3：不满意
		ls_sql+=" and TO_CHAR(cmp_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(cmp_khpjb.lrsj,'MM')='"+yue+"'";
		ls_sql+=wheresql;
		ls_sql+=" group by xmflbm,pjxmbm,pjxm";

		ls_sql+=" UNION ALL ";

		ls_sql+=" select xmflbm,pjxmbm,pjxm,0 sl";
		ls_sql+=" from cmp_pjxmbm";
		ls_sql+=" ) ";

		ls_sql+=" group by xmflbm,pjxmbm,pjxm";
		ls_sql+=" order by xmflbm,pjxmbm";
//		out.println(ls_sql);

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			pjxmbm=rs1.getString(2);
			pjxm=rs1.getString(3);
			sl=rs1.getInt(4);

			//列小计
			zsl[col]+=sl;
			col++;

			//满意率
			double bl=0;
			if (sssl==0)
			{
				bl=0;
			}
			else{
				bl=sl*100.0/sssl;
			}

			//图形数据
			getData[dataxh][0]=pjxm;
			getData[dataxh][1]=nian+"年"+yue+"月";
			getData[dataxh][2]=""+bl;
			dataxh++;
			
			
			%>
			  <td><A HREF="ViewMydmx.jsp?wheresql=<%=wheresql%>&nian=<%=nian%>&yue=<%=yue%>&pjxmbm=<%=pjxmbm%>" target="_blank"><%=cf.formatDouble(bl)%>%</A></td>
			<%

		}
		rs1.close();
		ps1.close();


		%>
			</tr>
		<%


	}
	rs.close();
	ps.close();
	
%> 
    <tr align="center" bgcolor="#FFFFFF">
      <td><B>合  计</B></td>
      <td><B><%=zsl[0]%></B></td>
	<%
	for (int i=1;i<xmsl+1 ;i++ )
	{
		//满意率
		double bl=0;
		if (zsl[0]==0)
		{
			bl=0;
		}
		else{
			bl=zsl[i]*100.0/zsl[0];
		}

		out.println("<td><B>"+cf.formatDouble(bl)+"%</B></td>");
	}


	%>

	</tr>
  </table>


<%
ybl.common.YBLChart  yblc=new ybl.common.YBLChart();
String jpgFileName=null;
String[][] inData=new String[dataxh][3];

for (int i=0;i<dataxh ;i++ )
{
//	out.println(getData[i][0]);
//	out.println(getData[i][1]);
//	out.println(getData[i][2]);
	inData[i]=getData[i];
}

jpgFileName =yblc.line(inData,"客户满意度分析","月份","满意度百分比",745,400,request,session);
%>
<img src="<%=jpgFileName%>" border=0 >

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

