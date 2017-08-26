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

int dltssl=0;
int dlkhtssl=0;
int dlalltssl=0;
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

<%
	ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsbm.tslxbm ='23'";//23:家居投诉 12:集成家居报修
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dlalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

%>	
  <tr>
    <td> 
      <div align="center"><b>家具投诉统计</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="26%"> 
            <div align="center"><b>投诉品牌</b></div>
          </td>
          <td width="24%"> 
            <div align="center"><b>投诉次数（人数）</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>投诉次数百分比</b></div>
          </td>
        </tr>
        <%

	dlalltssl=0;
	ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tspp,crm_tsjl,sq_gysxx,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh and crm_tsjl.lx='1'";
	ls_sql+=" and sq_gysxx.gyslb='3'";//1：木门；2：橱柜；3：家具；4：主材
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dlalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	row=0;
	ls_sql="SELECT gysmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
	ls_sql+=" FROM crm_tspp,crm_tsjl,sq_gysxx,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and sq_gysxx.gyslb='3'";//1：木门；2：橱柜；3：家具；4：主材
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by gyslb,gysmc";
	ls_sql+=" order by gyslb ,tssl desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		gysmc=rs.getString("gysmc");
		dltssl=rs.getInt("tssl");
		dlkhtssl=rs.getInt("khtssl");

		dlbfb=dltssl*100.0/dlalltssl;

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
          <td align="center"><%=gysmc%></td>
          <td align="center"><%=dltssl%>（<%=dlkhtssl%>）</td>
          <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*4%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
        </tr>
        <%
	}
	ps.close();
	rs.close();
%> 
      </table>
	  <br>
  <div align="center"><b>家具投诉原因统计</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
  
    
        <tr height="30"> 
          <td width="15%"> 
            <div align="center"><b>投诉品牌</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>投诉原因</b></div>
          </td>
          <td width="15%"> 
            <div align="center"><b>投诉次数（人数）</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>投诉次数百分比</b></div>
          </td>
        </tr>
        <%

	row=0;
	ls_sql="SELECT crm_tspp.tspp,sq_gysxx.gysmc,count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tspp,crm_tsjl,sq_gysxx,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh and crm_tsjl.lx='1'";
	ls_sql+=" and sq_gysxx.gyslb='3'";//1：木门；2：橱柜；3：家具；4：主材
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=dwbhsql;
	ls_sql+=" group by crm_tspp.tspp,sq_gysxx.gysmc";
	ls_sql+=" order by alltssl desc";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	while (rs1.next())
	{
		tspp=rs1.getString("tspp");
		gysmc=rs1.getString("gysmc");
		dlalltssl=rs1.getInt("alltssl");

		xlsl=0;

		ls_sql="SELECT count(distinct crm_tspp.tsyybm) xlsl";
		ls_sql+=" FROM crm_tspp,crm_tsjl,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp='"+tspp+"' and crm_tsjl.lx='1'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlsl=rs.getInt("xlsl");
		}
		ps.close();
		rs.close();

		ls_sql="SELECT crm_tspp.tsyybm,'（<B>'||tsxlmc||'</B>）'||tsyymc tsyymc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct crm_tsjl.khbh) khtssl";
		ls_sql+=" FROM crm_tspp,crm_tsjl,dm_tsyybm,dm_tsxlbm,crm_khxx ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp='"+tspp+"' and crm_tsjl.lx='1'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and crm_tspp.tsyybm=dm_tsyybm.tsyybm";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=" and dm_tsyybm.tsxlbm=dm_tsxlbm.tsxlbm";//1：木门；2：橱柜；3：家具；4：主材
		ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
		ls_sql+=dwbhsql;
		ls_sql+=" group by tsxlmc,crm_tspp.tsyybm,tsyymc";
		ls_sql+=" order by tssl desc";
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

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
			  <td align="center" rowSpan="<%=xlsl%>"><%=gysmc%></td>
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>（<%=dlkhtssl%>）</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}

		while (rs.next())
		{
			tsyymc=rs.getString("tsyymc");
			dltssl=rs.getInt("tssl");
			dlkhtssl=rs.getInt("khtssl");

			dlbfb=dltssl*100.0/dlalltssl;

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
			  <td align="left"><%=tsyymc%></td>
			  <td align="center"><%=dltssl%>（<%=dlkhtssl%>）</td>
			  <td ><img src="/images/ColuGif.gif" width="<%=dlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
			</tr>
			<%
		}
		ps.close();
		rs.close();
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
