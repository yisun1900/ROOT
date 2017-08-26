<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="so" scope="page" class="ybl.common.StatObject"/>
<%@ include file="/getlogin.jsp" %>

<%
//定义变量,获取参数
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String ls_sql=null;
String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String wheresql="";
String dwbhsql="";
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_tsbm.dwbh in(select dwbh from sq_dwxx where dwlx in('A1','F1','F2') and ssdw='"+fgs+"'))";
	if (!(fgs.equals("")))	dwbhsql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_tsbm.dwbh='"+dwbh+"'";
//	if (!(dwbh.equals("")))	dwbhsql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

String all=null;
String tslxbm=null;
String tslxmc=null;
String tsxlbm=null;
String tsxlmc=null;
String tsyymc=null;

String gysmc=null;
String tspp=null;

int[] mark={3,3,1,2,4};//设置显示风格参数
//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
int allsl=0;
int dltssl=0;
int dlkhtssl=0;
int jjalltssl=0;
double dlbfb=0;

int xltssl=0;
int xlkhtssl=0;
int xlalltssl=0;
double xlbfb=0;

int yytssl=0;
int yykhtssl=0;
int yyalltssl=0;
double yybfb=0;

int xlsl=0;
int yysl=0;
int row=0;
int row1=0;
int row2=0;
String bgcolor="#E8E8FF";

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td> 
      <div align="center"><b>投诉信息数量分析</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
		<td width="26%"> 
            <div align="center"><b>排名</b></div>
          </td>
          <td width="26%"> 
            <div align="center"><b>类别</b></div>
          </td>
          <td width="24%"> 
            <div align="center"><b>投诉数量</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>所占比率</b></div>
          </td>
        </tr>
        <%
	//家居投诉总数
	ls_sql="SELECT count(crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsbm.tslxbm ='23'";//23:家居投诉 12:集成家居报修
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	//out.print(ls_sql);
	ls_sql+=wheresql;
	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	row=0;
	ls_sql="SELECT tsxlmc,count(crm_tsjl.tsjlh) tssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsbm.tslxbm ='23'";//23:家居投诉 12:集成家居报修
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by tsxlmc";
	ls_sql+=" order by tssl desc";
	
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	//out.print(ls_sql);
	while (rs.next())
	{
		tslxmc=rs.getString("tsxlmc");
		dltssl=rs.getInt("tssl");
		dlbfb=dltssl*100.0/jjalltssl;
		allsl+=dltssl;
		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

        %> 
        <tr height="30" bgcolor="<%=bgcolor%>"> 
		<td width="26%" align="center"><%=row%></td>
          <td width="11%" align="center"><%=tslxmc%></td>
          <td width="24%" align="center"><%=dltssl%>（<%=jjalltssl%>）</td>
          <td width="50%"><img src="/images/ColuGif.gif" width="<%=dlbfb*3%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
        </tr>
        <%
	}
	ps.close();
	rs.close();
%> 
	<tr height="30" bgcolor="<%=bgcolor%>"> 
          <td width="26%" align="center">合计</td>
		  <td width="50%">&nbsp;</td>
          <td width="24%" align="center"><%=allsl%></td>
          <td width="11%">&nbsp;</td>
        </tr>
      </table>
	  <br>


 <div align="center"><b>投诉信息原因统计(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="18%"> 
            <div align="center"><b>投诉大类</b></div>
          </td>
          <td width="17%">
            <div align="center"><b>投诉小类</b></div>
          </td>
		  <td  width="20%">
            <div align="center"><b>投诉原因</b></div>
		  </td>
          <td width="15%"> 
            <div align="center"><b>投诉次数（人数）</b></div>
          </td>
          <td width="30%"> 
            <div align="center"><b>投诉次数百分比</b></div>
          </td>
        </tr>
<%
	row=0;
	ls_sql="SELECT crm_tsbm.tslxbm,tslxmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct khbh) khtssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='1' and dm_tslxbm.tslxbm='23'";
	//23:家居投诉 12:集成家居报修
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_tsbm.tslxbm,tslxmc";
	ls_sql+=" order by tssl desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tslxbm=rs1.getString("tslxbm");
		tslxmc=rs1.getString("tslxmc");
		dltssl=rs1.getInt("tssl");
		dlkhtssl=rs1.getInt("khtssl");

	//	dlbfb=dltssl*100.0/dlalltssl;


		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}


		xlsl=0;

		ls_sql="SELECT count(distinct crm_tsbm.tsyybm) xlsl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm='"+tslxbm+"' and crm_tsjl.lx='1'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlsl=rs.getInt("xlsl");
		}
		ps.close();
		rs.close();

		row1=0;
		bgcolor="#E8E8FF";
		//小类第一行
		ls_sql="SELECT crm_tsbm.tsxlbm,tsxlmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct khbh) khtssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_tsbm.tsxlbm,tsxlmc";
		ls_sql+=" order by tssl desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsxlbm=rs.getString("tsxlbm");
			tsxlmc=rs.getString("tsxlmc");
			xltssl=rs.getInt("tssl");
			xlkhtssl=rs.getInt("khtssl");

			xlbfb=xltssl*100.0/xlalltssl;
			row1++;
			
			if (row1%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			yysl=0;

			ls_sql="SELECT count(distinct crm_tsbm.tsyybm) yysl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				yysl=rs2.getInt("yysl");
			}
			ps2.close();
			rs2.close();

			yyalltssl=0;
			ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				yyalltssl=rs2.getInt("alltssl");
			}
			ps2.close();
			rs2.close();

			//原因第一行
			ls_sql="SELECT tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct khbh) khtssl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsyybm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.lx='1'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ls_sql+=" group by tsyymc";
			ls_sql+=" order by count(*) desc";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				tsyymc=rs2.getString("tsyymc");
				yytssl=rs2.getInt("tssl");
				yykhtssl=rs2.getInt("khtssl");

				yybfb=yytssl*100.0/yyalltssl;
				%> 
				<tr height="30" bgcolor="<%=bgcolor%>"> 
				  <td align="center" rowSpan="<%=xlsl%>"><%=tslxmc%>（<%=dltssl%>次）</td>
				  <td align="center" rowSpan="<%=yysl%>"><%=tsxlmc%>（<%=xltssl%>次）</td>
				  <td align="center"><%=tsyymc%></td>
				  <td align="center"><%=yytssl%>（<%=yykhtssl%>）</td>
				  <td><img src="/images/ColuGif.gif" width="<%=yybfb*2%>" height=20>&nbsp;<%=cf.formatDouble(yybfb)%>%</td>
				</tr>
				<%
			}

			//原因第n行
			while (rs2.next())
			{
				tsyymc=rs2.getString("tsyymc");
				yytssl=rs2.getInt("tssl");
				yykhtssl=rs2.getInt("khtssl");

				yybfb=yytssl*100.0/yyalltssl;
				%> 
				<tr height="30" bgcolor="<%=bgcolor%>"> 
				  <td align="center"><%=tsyymc%></td>
				  <td align="center"><%=yytssl%>（<%=yykhtssl%>）</td>
				  <td><img src="/images/ColuGif.gif" width="<%=yybfb*2%>" height=20>&nbsp;<%=cf.formatDouble(yybfb)%>%</td>
				</tr>
				<%
			}
			ps2.close();
			rs2.close();
		}

		//小类第n行
		while (rs.next())
		{
			tsxlbm=rs.getString("tsxlbm");
			tsxlmc=rs.getString("tsxlmc");
			xltssl=rs.getInt("tssl");
			xlkhtssl=rs.getInt("khtssl");

			xlbfb=xltssl*100.0/xlalltssl;
			row1++;
			
			if (row1%2==1)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			yysl=0;

			ls_sql="SELECT count(distinct crm_tsbm.tsyybm) yysl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				yysl=rs2.getInt("yysl");
			}
			ps2.close();
			rs2.close();

			yyalltssl=0;
			ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				yyalltssl=rs2.getInt("alltssl");
			}
			ps2.close();
			rs2.close();

			//原因第一行
			ls_sql="SELECT tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct khbh) khtssl";
			ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsyybm ";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsyybm=dm_tsyybm.tsyybm and crm_tsjl.lx='1'";
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"' and crm_tsbm.tslxbm='"+tslxbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=wheresql;
			ls_sql+=" group by tsyymc";
			ls_sql+=" order by count(*) desc";
			ps2= conn.prepareStatement(ls_sql);
			rs2 =ps2.executeQuery(ls_sql);
			if (rs2.next())
			{
				tsyymc=rs2.getString("tsyymc");
				yytssl=rs2.getInt("tssl");
				yykhtssl=rs2.getInt("khtssl");

				yybfb=yytssl*100.0/yyalltssl;
				%> 
				<tr height="30" bgcolor="<%=bgcolor%>"> 
				  <td align="center" rowSpan="<%=yysl%>"><%=tsxlmc%>（<%=xltssl%>次）</td>
				  <td align="center"><%=tsyymc%></td>
				  <td align="center"><%=yytssl%>（<%=yykhtssl%>）</td>
				  <td><img src="/images/ColuGif.gif" width="<%=yybfb*2%>" height=20>&nbsp;<%=cf.formatDouble(yybfb)%>%</td>
				</tr>
				<%
			}

			//原因第n行
			while (rs2.next())
			{
				tsyymc=rs2.getString("tsyymc");
				yytssl=rs2.getInt("tssl");
				yykhtssl=rs2.getInt("khtssl");

				yybfb=yytssl*100.0/yyalltssl;
				%> 
				<tr height="30" bgcolor="<%=bgcolor%>"> 
				  <td align="center"><%=tsyymc%></td>
				  <td align="center"><%=yytssl%>（<%=yykhtssl%>）</td>
				  <td><img src="/images/ColuGif.gif" width="<%=yybfb*2%>" height=20>&nbsp;<%=cf.formatDouble(yybfb)%>%</td>
				</tr>
				<%
			}
			rs2.close();
			ps2.close();
		}
		rs.close();
		ps.close();

	}
	rs1.close();
	ps1.close();

%> 
      </table>

<%
}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
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
</table>
</body>
</html>
