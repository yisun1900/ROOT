<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");

	String wheresql="";

	String wheresql1="";


	if (!(fgs.equals("")))
	{
		if (!(dwbh.equals("")))
		{
		wheresql+=" and  crm_khxx.fgsbh='"+fgs+"'";
		wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		wheresql1+=" and ssfgs='"+fgs+"'";
		}else{
			wheresql+=" and  crm_khxx.fgsbh='"+fgs+"'";
			wheresql1+=" and  ssfgs='"+fgs+"'";
		}
	}

	

	String[] rddqbms=request.getParameterValues("rddqbm");
	if (rddqbms!=null)
	{
		wheresql+=cf.arrayToSQL(rddqbms,"crm_khxx.rddqbm");
	}
	String[] hxwzbms=request.getParameterValues("hxwzbm");
	if (hxwzbms!=null)
	{
		wheresql+=cf.arrayToSQL(hxwzbms,"crm_khxx.hxwzbm");
	}
	String[] cqbms=request.getParameterValues("cqbm");
	if (cqbms!=null)
	{
		wheresql+=cf.arrayToSQL(cqbms,"crm_khxx.cqbm");
	}
	String[] ysrbm=request.getParameterValues("ysrbm");
	if (ysrbm!=null)
	{
		wheresql+=cf.arrayToSQL(ysrbm,"crm_khxx.ysrbm");
	}
	String[] nlqjbm=request.getParameterValues("nlqjbm");
	if (nlqjbm!=null)
	{
		wheresql+=cf.arrayToSQL(nlqjbm,"crm_khxx.nlqjbm");
	}
	String[] zybm=request.getParameterValues("zybm");
	if (zybm!=null)
	{
		wheresql+=cf.arrayToSQL(zybm,"crm_khxx.zybm");
	}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

String fgsbh=null;
String fgsmc=null;

String cqbm=null;
String cqmc=null;
String deflbm=null;
String deflmc=null;
int dedy=0;
int dexy=0;

double bfb=0;

int allqys=0;
int allqye=0;
int allfwmj=0;
int allpjqye=0;
int allpmjj=0;

int qys=0;
double qye=0;
double fwmj=0;
int pjde=0;
int pmjj=0;

int xjqys=0;
int xjqye=0;
int xjfwmj=0;
int xjpjqye=0;
int xjpmjj=0;

try {
	conn=cf.getConnection();

%>
	<CENTER >
	  <B>大小单统计<BR>
	  (签约时间：<%=sjfw%>--<%=sjfw2%>)</B> 
	</CENTER>
	<table border="1" width="130%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
	<tr bgcolor="#CCCCCC"  align="center">
	  <td  width="10%" >分公司</td>
  <td  width="9%" >单额分类</td>
  <td  width="7%" >平米均价</td>
  <td  width="7%" >总签单数</td>
  <td  width="7%" >签约数</td>
  <td  width="7%" >签约数比重</td>

  <td  width="13%" >签约数比重柱状图</td>

  <td  width="10%" >总签约额</td>
  <td  width="9%" >签约额</td>
  <td  width="8%" >签约额比重</td>
  <td  width="13%" >签约额比重柱状图</td>

</tr>

<%
	//获取最大数
	int fgsqys=0;
	double fgsqye=0;
	double fgsfwmj=0;
	int fgspjde=0;
	int fgspmjj=0;

	int sl=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM kp_deflbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	int hh=0;
	String bgcolor="#E8E8FF";

	ls_sql=" SELECT crm_khxx.fgsbh,dwmc,count(*) qys,sum(qye) qye,sum(fwmj) fwmj";
	ls_sql+=" FROM crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.fgsbh=sq_dwxx.dwbh(+)";
	ls_sql+="  and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.fgsbh,dwmc";
	ls_sql+=" order by crm_khxx.fgsbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("dwmc");
		fgsqys=rs.getInt("qys");
		fgsqye=rs.getDouble("qye");
		fgsfwmj=rs.getDouble("fwmj");

		hh++;
		if (hh%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (fgsqys==0)
		{
			fgspjde=0;
		}
		else{
			fgspjde=(int)(fgsqye/fgsqys);
		}

		if (fgsfwmj==0)
		{
			fgspmjj=0;
		}
		else{
			fgspmjj=(int)(fgsqye/fgsfwmj);
		}

		int row=0;
		
		ls_sql="SELECT deflbm,deflmc,dedy,dexy";
		ls_sql+=" FROM kp_deflbm";
		ls_sql+=" order by deflbm ";
		
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		while (rs2.next())
		{
			deflbm=rs2.getString("deflbm");
			deflmc=rs2.getString("deflmc");
			dedy=rs2.getInt("dedy");
			dexy=rs2.getInt("dexy");

			row++;

			ls_sql=" SELECT count(*) qys,sum(qye) qye,sum(fwmj) fwmj";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.qye>="+dedy+" and crm_khxx.qye<"+dexy;
			ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
			
			ls_sql+=wheresql;

			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				qys=rs1.getInt("qys");
				qye=rs1.getDouble("qye");
				fwmj=rs1.getDouble("fwmj");

				if (qys==0)
				{
					pjde=0;
				}
				else{
					pjde=(int)(qye/qys);
				}

				if (fwmj==0)
				{
					pmjj=0;
				}
				else{
					pmjj=(int)(qye/fwmj);
				}

				double qysbl=0;
				double qyebl=0;
				if (fgsqys==0)
				{
					qysbl=0;
				}
				else{
					qysbl=qys*100.0/fgsqys;
				}
				if (fgsqye==0)
				{
					qyebl=0;
				}
				else{
					qyebl=qye*100.0/fgsqye;
				}

				if (row==1)
				{
					%>
					<tr align="center" bgcolor="<%=bgcolor%>" >
						<td rowspan="<%=sl%>"><%=fgsmc%></td>
						<td><%=deflmc%></td>
						<td align="right"><%=cf.formatDouble(pmjj)%></td>
						<td rowspan="<%=sl%>"><%=cf.formatDouble(fgsqys)%></td>
						<td align="right"><%=cf.formatDouble(qys)%></td>
						<td ><%=cf.formatDouble(qysbl)%>%</td>
						<td align="left"><img src="/images/ColuGif.gif" width="<%=qysbl*3%>" height="14"></td>
						<td rowspan="<%=sl%>"  align="right"><%=cf.formatDouble((long)fgsqye)%></td>
						<td  align="right"><%=cf.formatDouble((long)qye)%></td>
						<td ><%=cf.formatDouble(qyebl)%>%</td>
						<td align="left"><img src="/images/ColuGif.gif" width="<%=qyebl*3%>" height="14"></td>
					</tr>
					<%	
				}
				else{
					%>
					<tr align="center" bgcolor="<%=bgcolor%>" >
						<td ><%=deflmc%></td>
						<td align="right"><%=cf.formatDouble(pmjj)%></td>
						<td align="right"><%=cf.formatDouble(qys)%></td>
						<td ><%=cf.formatDouble(qysbl)%>%</td>
						<td align="left"><img src="/images/ColuGif.gif" width="<%=qysbl*3%>" height="14"></td>
						<td  align="right"><%=cf.formatDouble((long)qye)%></td>
						<td ><%=cf.formatDouble(qyebl)%>%</td>
						<td align="left"><img src="/images/ColuGif.gif" width="<%=qyebl*3%>" height="14"></td>
					</tr>
					<%	
				}

			}
			rs1.close();
			ps1.close();
		}
		rs2.close();
		ps2.close();

	}
	rs.close();
	ps.close();



		
		
	

%>

	
</table>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + ls_sql);
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


</body>
</html>