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

	xskd=130+90+xmsl*105;


%>


<body bgcolor="#FFFFFF">
  
<div align="center">满意度统计（<%=lrsj%> 至 <%=lrsj2%>）</div>
  <table width="<%=xskd%>px" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr align="center" bgcolor="#FFFFFF">
      <td width="130px">&nbsp;</td>
      <td width="90px">实收数量</td>
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

		%>
		  <td  width="105px"><%=spjry%>满意度</td>
		<%
	}
	rs.close();
	ps.close();

%>
    </tr>



<%

	int dot=0;
	ls_sql=" select count(*)";
	ls_sql+=" from crm_khpjb,crm_khxx";
	ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_khpjb.xmflbm='07'";
	ls_sql+=wheresql;
	ls_sql+=" order by TO_CHAR(crm_khpjb.lrsj,'YYYY'),TO_CHAR(crm_khpjb.lrsj,'MM')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dot=rs.getInt(1);
	}
	rs.close();
	ps.close();

	String[][] getData=new String[dot*xmsl][3];
	


	String pjxmbm=null;
	String pjxm=null;
	int sl=0;
	int sssl=0;//实收数量
	int jjgwsssl=0;//家居顾问实收数量

	int[] zsl=new int[xmsl+2];
	double bl=0;


	String nian=null;
	String yue=null;
	String bgcolor="#FFFFFF";
	int row=0;
	int dotxh=0;

	ls_sql=" select TO_CHAR(crm_khpjb.lrsj,'YYYY') nian,TO_CHAR(crm_khpjb.lrsj,'MM') yue";
	ls_sql+=" from crm_khpjb,crm_khxx";
	ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
	ls_sql+=" and crm_khpjb.xmflbm='07'";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(crm_khpjb.lrsj,'YYYY'),TO_CHAR(crm_khpjb.lrsj,'MM')";
	ls_sql+=" order by TO_CHAR(crm_khpjb.lrsj,'YYYY'),TO_CHAR(crm_khpjb.lrsj,'MM')";
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
		sssl=0;
		ls_sql=" select count(distinct crm_khpjb.khbh) sl";
		ls_sql+=" from crm_khpjb,crm_khxx";
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
		ls_sql+=" and TO_CHAR(crm_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(crm_khpjb.lrsj,'MM')='"+yue+"'";
		ls_sql+=" and crm_khpjb.xmflbm='07'";
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

		//家居顾问实收数量
		jjgwsssl=0;
		ls_sql=" select count(distinct crm_khpjb.khbh) sl";
		ls_sql+=" from crm_khpjb,crm_khxx";
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
		ls_sql+=" and TO_CHAR(crm_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(crm_khpjb.lrsj,'MM')='"+yue+"'";
		ls_sql+=" and crm_khpjb.xmflbm='07' and crm_khpjb.spjrybm='09'";
		ls_sql+=" and crm_khpjb.pjxmbm!='090709' ";//090709:无;
		ls_sql+=wheresql;
//		out.println(ls_sql);
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			jjgwsssl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		zsl[1]+=jjgwsssl;
%>
    <tr align="center" bgcolor="<%=bgcolor%>">
      <td><%=nian%>年<%=yue%>月</td>
      <td><A HREF="ViewAllMydmx.jsp?wheresql=<%=wheresql%>&nian=<%=nian%>&yue=<%=yue%>" target="_blank"><%=sssl%></A></td>
<%
		int col=2;
		ls_sql="select spjrybm,spjry,sum(sl)";
		ls_sql+=" from ( ";

		ls_sql+=" select spjrybm,spjry,count(distinct crm_khpjb.khbh) sl";
		ls_sql+=" from crm_khpjb,crm_khxx";
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khpjb.xmflbm='07' and crm_khpjb.pjjgbm='1'";//1：同意；2：不同意；9：空
		ls_sql+=" and crm_khpjb.pjxmbm in('010701','010703','030701','030703','050701','050703','070701','070703','090701','090703')";//010701:非常满意;010703:满意;
		ls_sql+=" and TO_CHAR(crm_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(crm_khpjb.lrsj,'MM')='"+yue+"'";
		ls_sql+=" and crm_khpjb.spjrybm!='09'";
		ls_sql+=wheresql;
		ls_sql+=" group by spjrybm,spjry";

		ls_sql+=" UNION ALL ";

		ls_sql+=" select spjrybm,spjry,0 sl";
		ls_sql+=" from crm_spjrybm";
		ls_sql+=" where spjrybm!='09'";

		ls_sql+=" ) ";

		ls_sql+=" group by spjrybm,spjry";
		ls_sql+=" order by spjrybm";
//		out.println(ls_sql);

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			spjrybm=rs1.getString(1);
			spjry=rs1.getString(2);
			sl=rs1.getInt(3);

			zsl[col]+=sl;
			col++;

			if (sssl==0)
			{
				bl=0;
			}
			else{
				bl=sl*100.0/sssl;
			}

			getData[dotxh][0]=spjry;
			getData[dotxh][1]=nian+"年"+yue+"月";
			getData[dotxh][2]=""+bl;
			dotxh++;
			
			
			%>
			  <td><A HREF="ViewMydmx.jsp?wheresql=<%=wheresql%>&nian=<%=nian%>&yue=<%=yue%>&spjrybm=<%=spjrybm%>" target="_blank"><%=cf.formatDouble(bl)%>%</A></td>
			<%

		}
		rs1.close();
		ps1.close();

		//家居顾问
		ls_sql="select spjrybm,spjry,sum(sl)";
		ls_sql+=" from ( ";

		ls_sql+=" select spjrybm,spjry,count(distinct crm_khpjb.khbh) sl";
		ls_sql+=" from crm_khpjb,crm_khxx";
		ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh ";
		ls_sql+=" and crm_khpjb.xmflbm='07' and crm_khpjb.pjjgbm='1'";//1：同意；2：不同意；9：空
		ls_sql+=" and crm_khpjb.pjxmbm in('010701','010703','030701','030703','050701','050703','070701','070703','090701','090703')";//010701:非常满意;010703:满意;
		ls_sql+=" and TO_CHAR(crm_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(crm_khpjb.lrsj,'MM')='"+yue+"'";
		ls_sql+=" and crm_khpjb.spjrybm='09'";
		ls_sql+=wheresql;
		ls_sql+=" group by spjrybm,spjry";

		ls_sql+=" UNION ALL ";

		ls_sql+=" select spjrybm,spjry,0 sl";
		ls_sql+=" from crm_spjrybm";
		ls_sql+=" where spjrybm='09'";

		ls_sql+=" ) ";

		ls_sql+=" group by spjrybm,spjry";
		ls_sql+=" order by spjrybm";
//		out.println(ls_sql);

		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			spjrybm=rs1.getString(1);
			spjry=rs1.getString(2);
			sl=rs1.getInt(3);

			zsl[col]+=sl;
			col++;

			if (jjgwsssl==0)
			{
				bl=0;
			}
			else{
				bl=sl*100.0/jjgwsssl;
			}

			getData[dotxh][0]=spjry;
			getData[dotxh][1]=nian+"年"+yue+"月";
			getData[dotxh][2]=""+bl;
			dotxh++;

			%>
			  <td><A HREF="ViewJjgwMydmx.jsp?wheresql=<%=wheresql%>&nian=<%=nian%>&yue=<%=yue%>&spjrybm=<%=spjrybm%>" target="_blank"><%=cf.formatDouble(bl)%>%</A></td>
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
	for (int i=2;i<xmsl+1 ;i++ )
	{
		if (zsl[0]==0)
		{
			bl=0;
		}
		else{
			bl=zsl[i]*100.0/zsl[0];
		}

		out.println("<td><B>"+cf.formatDouble(bl)+"%</B></td>");
	}

	if (zsl[1]==0)
	{
		bl=0;
	}
	else{
		bl=zsl[xmsl+1]*100.0/zsl[1];
	}

	out.println("<td><B>"+cf.formatDouble(bl)+"%</B></td>");

	%>

	</tr>
  </table>


<%
ybl.common.YBLChart  yblc=new ybl.common.YBLChart();
String jpgFileName=null;
String[][] inData=new String[dotxh][3];

for (int i=0;i<dotxh ;i++ )
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

