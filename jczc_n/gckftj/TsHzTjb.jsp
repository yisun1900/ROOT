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

	String px=request.getParameter("px");

	String fgs=request.getParameter("fgs");
	String wheresql="";
	String wheresql1="";
	String wheresql2="";

	if (!(fgs.equals("")))
	{
		wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		wheresql1+=" and  (a.ssfgs='"+fgs+"')";
	}

	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql2+=" and  (crm_tsbm.dwbh in(select dwbh from sq_dwxx where dwlx in('A1','F1','F2') and ssdw='"+fgs+"'))";
	}


	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>投诉统计
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="5%">序号</td>
          <td  width="9%">分公司</td>
          <td  width="8%">总投诉次数</td>
          <td  width="7%"><font color="#FF0000">施工队<font></td>
          <td  width="7%"><font color="#FF0000">设计师<font></td>
          <td  width="7%"><font color="#FF0000">完整家具<font></td>
          <td  width="7%"><font color="#FF0000">监理<font></td>
          <td  width="7%"><font color="#FF0000">其他人员<font></td>
        </tr>
<%
//图表1
String fgsmc=null;	
String fgsbh=null;	
int row=0;
int qys=0;
double zqye=0;
int allqys=0;
double allzqye=0;
int tszs=0;
int alltszs=0;
int sgdtszs=0;//施工队投诉
int allsgdtszs=0;
int sjstszs=0;//设计师投诉
int allsjstszs=0;
int zctszs=0;//主材投诉
int allzctszs=0;
int jltszs=0;//监理投诉
int alljltszs=0;
int qttszs=0;//监理投诉
int allqttszs=0;
//图表2
int dlalltssl=0;
String tslxmc=null;
int dltssl=0;
int dlkhtssl=0;
double dlbfb=0;
String bgcolor="#E8E8FF";
//图表3
String tslxbm=null;
int xlalltssl=0;
int xlsl=0;
String tsxlmc=null;
int xltssl=0;
int xlkhtssl=0;
double xlbfb=0;
int row1=0;
//图表4
String tsxlbm=null;
int yysl=0;
int yyalltssl=0;
String tsyymc=null;
int yytssl=0;
int yykhtssl=0;
double yybfb=0;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;

try {
	conn=cf.getConnection();

	ls_sql=" SELECT dwmc fgs,a.dwbh fgsbh ";
	ls_sql+=" FROM sq_dwxx a";
	ls_sql+=" where  dwlx='F0' and cxbz='N'";
	ls_sql+=wheresql1;

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		fgsbh=rs.getString("fgsbh");
		fgsmc=rs.getString("fgs");
	
//投诉总数
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			tszs=rs1.getInt("tszs");
			alltszs+=tszs;//投诉总数
		}
		rs1.close();
		ps1.close();

//施工队投诉总数
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm='2101' and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			sgdtszs=rs1.getInt("tszs");
			allsgdtszs+=sgdtszs;//施工投诉总数
		}
		rs1.close();
		ps1.close();

//设计师投诉总数
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm='2201' and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			sjstszs=rs1.getInt("tszs");
			allsjstszs+=sjstszs;//设计投诉总数
		}
		rs1.close();
		ps1.close();


//完整家居投诉总数
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm in ('2301','2302','2303','2304','2305','2306','2307','2308','2309') and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			zctszs=rs1.getInt("tszs");
			allzctszs+=zctszs;//主材投诉总数
		}
		rs1.close();
		ps1.close();


//监理投诉总数
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm in ('2102','2103') and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			jltszs=rs1.getInt("tszs");
			alljltszs+=jltszs;//监理投诉总数
		}
		rs1.close();
		ps1.close();

//其他投诉总数
		ls_sql="select count(*) tszs";
		ls_sql+=" from crm_khxx,crm_tsjl,crm_tsbm,dm_tsxlbm";
		ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and  dm_tsxlbm.tsxlbm not in  ('2101','2201','2301','2302','2303','2304','2305','2306','2307','2308','2309','2102','2103') and crm_khxx.fgsbh='"+fgsbh+"' ";
		ls_sql+=" and slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS') and lx='1'";
//		out.print(ls_sql);
		ps1 = conn.prepareStatement(ls_sql);
		rs1 = ps1.executeQuery();
		if (rs1.next())
		{
			qttszs=rs1.getInt("tszs");
			allqttszs+=qttszs;//监理投诉总数
		}
		rs1.close();
		ps1.close();

		row++;
%>
        <tr align="center" >
          <td><%=row%></td>
          <td><%=fgsmc%></td>
          <td align="right"><%=tszs%></td>
          <td align="right"><%=sgdtszs%></td>
          <td align="right"><%=sjstszs%></td>
          <td align="right"><%=zctszs%></td>
          <td align="right"><%=jltszs%></td>
          <td align="right"><%=qttszs%></td>
        </tr>
<%
	}
	ps.close();
	rs.close();

%>
        <tr align="center" >
          <td colspan='2'><font color=red><B>总计</B></font></td>
          <td align="right"><B><%=alltszs%></B></td>
          <td align="right"><B><%=allsgdtszs%></B></td>
          <td align="right"><B><%=allsjstszs%></B></td>
          <td align="right"><B><%=allzctszs%></B></td>
          <td align="right"><B><%=alljltszs%></B></td>
          <td align="right"><B><%=allqttszs%></B></td>
        </tr>
      </table>



<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td> 
      <div align="center"><b>投诉大类统计</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="26%"> 
            <div align="center"><b>投诉大类</b></div>
          </td>
          <td width="24%"> 
            <div align="center"><b>投诉次数（人数）</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>投诉次数百分比</b></div>
          </td>
        </tr>
        <%
	ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dlalltssl=rs.getInt("alltssl");
	}
	ps.close();
	rs.close();

	row=0;
	ls_sql="SELECT tslxmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct khbh) khtssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;
	ls_sql+=" group by tslxmc";
	ls_sql+=" order by tssl desc";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tslxmc=rs.getString("tslxmc");
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
          <td width="26%" align="center"><%=tslxmc%></td>
          <td width="24%" align="center"><%=dltssl%>（<%=dlkhtssl%>）</td>
          <td width="50%"><img src="/images/ColuGif.gif" width="<%=dlbfb*3%>" height=20>&nbsp;<%=cf.formatDouble(dlbfb)%>%</td>
        </tr>
        <%
	}
	ps.close();
	rs.close();
%> 
      </table>
    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>投诉小类统计(<%=sjfw%>--<%=sjfw2%>) </b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="25%"> 
            <div align="center"><b>投诉大类</b></div>
          </td>
          <td width="20%">
            <div align="center"><b>投诉小类</b></div>
          </td>
          <td width="20%"> 
            <div align="center"><b>投诉次数（人数）</b></div>
          </td>
          <td width="35%"> 
            <div align="center"><b>投诉次数百分比</b></div>
          </td>
        </tr>
<%
	row=0;
	ls_sql="SELECT crm_tsbm.tslxbm,tslxmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct khbh) khtssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;
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

		dlbfb=dltssl*100.0/dlalltssl;

		xlalltssl=0;

		row++;
		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		ls_sql="SELECT count(distinct crm_tsjl.tsjlh) alltssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm='"+tslxbm+"' and crm_tsjl.lx='1'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql2;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			xlalltssl=rs.getInt("alltssl");
		}
		ps.close();
		rs.close();

		xlsl=0;

		ls_sql="SELECT count(distinct crm_tsbm.tsxlbm) xlsl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm='"+tslxbm+"' and crm_tsjl.lx='1'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql2;
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
		ls_sql="SELECT tsxlmc,count(distinct crm_tsjl.tsjlh) tssl,count(distinct khbh) khtssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1'";
		ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql2;
		ls_sql+=" group by tsxlmc";
		ls_sql+=" order by tssl desc";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			tsxlmc=rs.getString("tsxlmc");
			xltssl=rs.getInt("tssl");
			xlkhtssl=rs.getInt("khtssl");

			xlbfb=xltssl*100.0/xlalltssl;
			row1++;
			
			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="center" rowSpan="<%=xlsl%>"><%=tslxmc%>（<%=dltssl%>次）</td>
			  <td align="center"><%=tsxlmc%></td>
			  <td align="center"><%=xltssl%>（<%=xlkhtssl%>）</td>
			  <td><img src="/images/ColuGif.gif" width="<%=xlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(xlbfb)%>%</td>
			</tr>
			<%
		}

		while (rs.next())
		{
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
			%> 
			<tr height="30" bgcolor="<%=bgcolor%>"> 
			  <td align="center"><%=tsxlmc%></td>
			  <td align="center"><%=xltssl%>（<%=xlkhtssl%>）</td>
			  <td><img src="/images/ColuGif.gif" width="<%=xlbfb*2%>" height=20>&nbsp;<%=cf.formatDouble(xlbfb)%>%</td>
			</tr>
			<%
		}
		ps.close();
		rs.close();

	}
	ps1.close();
	rs1.close();

%> 
      </table>
    </td>
  </tr>
  <tr>
    <td> 
      <div align="center"><b>投诉原因统计(<%=sjfw%>--<%=sjfw2%>)</b></div>
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
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsjl.lx='1'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql2;
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

		dlbfb=dltssl*100.0/dlalltssl;


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
		ls_sql+=wheresql2;
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
		ls_sql+=wheresql2;
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
			ls_sql+=wheresql2;
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
			ls_sql+=wheresql2;
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
			ls_sql+=wheresql2;
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
			ls_sql+=wheresql2;
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
			ls_sql+=wheresql2;
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
			ls_sql+=wheresql2;
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

    </td>
  </tr>

<%
}
catch (Exception e) {
	out.print("发生意外: " + e);
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
