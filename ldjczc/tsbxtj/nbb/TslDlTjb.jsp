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

	String tslxbm=request.getParameter("tslxbm");
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  dwbh='"+dwbh+"'";
	}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td> 
      <CENTER >
        <B>投诉率统计 <BR>
        (<%=sjfw%>--<%=sjfw2%>)</B> 
      </CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="13%">时间范围</td>
          <td  width="29%">本期签单数</td>
          <td  width="29%">投诉客户（人）</td>
          <td  width="29%">投诉率</td>
        </tr>
        <%
int all=0;
String nian=null;
String yue=null;
int qysl=0;
int allqysl=0;
int bxsl=0;
int bxkhsl=0;
int allbxsl=0;
int allbxkhsl=0;
int tssl=0;
int alltssl=0;
int tskhsl=0;
int alltskhsl=0;

double tsl=0;
double ztsl=0;
double bxl=0;
double zbxl=0;


int[] mark={3,1,2,4};//设置显示风格参数
//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;

String[][] xsdata=null; 
int yues=0;
int row=0;
int maxqysl=0;
int maxtskhsl=0;
double maxtsl=0;
int maxbxkhsl=0;
double maxbxl=0;

try {
	conn=cf.getConnection();

	ls_sql=" select (TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')-TO_DATE('"+sjfw+"','YYYY-MM-DD'))/25";
	ls_sql+=" from dm_tslxbm";
	ls_sql+=" where rownum<2";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yues=rs.getInt(1);
	}
	ps.close();
	rs.close();

	xsdata=new String[yues][4];

	row=0;
	maxqysl=0;
	maxtskhsl=0;
	maxtsl=0;
	ls_sql=" select TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM'),count(*)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2'";
	ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";

	ls_sql+=" order by TO_CHAR(qyrq,'YYYY'),TO_CHAR(qyrq,'MM')";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		nian=rs.getString(1);
		yue=rs.getString(2);
		qysl=rs.getInt(3);

		if (qysl>maxqysl)
		{
			maxqysl=qysl;
		}

		allqysl+=qysl;

		ls_sql="select count(distinct khbh)";
		ls_sql+=" from crm_tsjl,crm_tsbm";
		ls_sql+=" where crm_tsjl.lx='1'";//1：投诉；2：报修
		ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and TO_CHAR(slsj,'YYYY')='"+nian+"' and TO_CHAR(slsj,'MM')='"+yue+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			tskhsl=rs1.getInt(1);

			alltskhsl+=tskhsl;
		}
		ps1.close();
		rs1.close();

		if (tskhsl>maxtskhsl)
		{
			maxtskhsl=tskhsl;
		}

		if (qysl==0)
		{
			tsl=0;
		}
		else{
			tsl=tskhsl*1000/qysl/10.0;
		}

		if (tsl>maxtsl)
		{
			maxtsl=tsl;
		}

		xsdata[row][0]=nian+"年"+yue+"月";
		xsdata[row][1]=qysl+"";
		xsdata[row][2]=tskhsl+"";
		xsdata[row][3]=tsl+"";
		row++;

	}
	ps.close();
	rs.close();

	if (allqysl==0)
	{
		ztsl=0;
	}
	else{
		ztsl=alltskhsl*1000/allqysl/10.0;
	}

	for (int i=0;i<row ;i++ )
	{
		%> 
        <tr align="center"> 
          <td><%=xsdata[i][0]%></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][1])*150/maxqysl%>" height="14">&nbsp;<%=xsdata[i][1]%></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][2])*150/maxtskhsl%>" height="14">&nbsp;<%=xsdata[i][2]%></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=Double.parseDouble(xsdata[i][3])*150/maxtsl%>" height="14">&nbsp;<%=xsdata[i][3]%>%</td>
        </tr>
        <%
	}
%> 
        <tr align="center" > 
          <td>合计</td>
          <td><%=allqysl%></td>
          <td ><%=alltskhsl%></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=ztsl*150/maxtsl%>" height="14">&nbsp;<%=ztsl%>%</td>
        </tr>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
      </table>
    </td>
  </tr>
  <tr> 
    <td> 
      <CENTER >
        <B>每月报修率统计 <BR>
        (<%=sjfw%>--<%=sjfw2%>)</B> 
      </CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="13%">竣工时间</td>
          <td  width="29%">本期完工数</td>
          <td  width="29%">报修客户（人）</td>
          <td  width="29%">报修率</td>
        </tr>
        <%
try {
	conn=cf.getConnection();

	allqysl=0;
	allbxsl=0;
	int ys=0;

	xsdata=new String[yues][4];

	row=0;
	maxqysl=0;
	maxbxkhsl=0;
	maxbxl=0;

	ls_sql=" select TO_CHAR(sjjgrq,'YYYY'),TO_CHAR(sjjgrq,'MM'),count(*)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where sjjgrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD') and zt='2' and gcjdbm='5'";
	ls_sql+=" and sjjgrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by TO_CHAR(sjjgrq,'YYYY'),TO_CHAR(sjjgrq,'MM')";

	ls_sql+=" order by TO_CHAR(sjjgrq,'YYYY'),TO_CHAR(sjjgrq,'MM')";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		nian=rs.getString(1);
		yue=rs.getString(2);
		qysl=rs.getInt(3);

		if (qysl>maxqysl)
		{
			maxqysl=qysl;
		}

		allqysl+=qysl;

		ls_sql="select count(distinct khbh)";
		ls_sql+=" from crm_tsjl,crm_tsbm";
		ls_sql+=" where crm_tsjl.lx='2'";//1：投诉；2：报修
		ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and TO_CHAR(slsj,'YYYY')='"+nian+"' and TO_CHAR(slsj,'MM')='"+yue+"'";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			bxkhsl=rs1.getInt(1);

			allbxkhsl+=bxkhsl;
		}
		ps1.close();
		rs1.close();

		if (bxkhsl>maxbxkhsl)
		{
			maxbxkhsl=bxkhsl;
		}


		if (qysl==0)
		{
			bxl=0;
		}
		else{
			bxl=bxkhsl*1000/qysl/10.0;
		}

		if (bxl>maxbxl)
		{
			maxbxl=bxl;
		}

		xsdata[row][0]=nian+"年"+yue+"月";
		xsdata[row][1]=qysl+"";
		xsdata[row][2]=bxkhsl+"";
		xsdata[row][3]=bxl+"";
		row++;

	}
	ps.close();
	rs.close();

	if (allqysl==0)
	{
		zbxl=0;
	}
	else{
		zbxl=allbxkhsl*1000/allqysl/10.0;
	}

	if (maxqysl==0)
	{
		maxqysl=1;
	}
	if (maxbxkhsl==0)
	{
		maxbxkhsl=1;
	}
	if (maxbxl==0)
	{
		maxbxl=1;
	}

	for (int i=0;i<row ;i++ )
	{
		%> 
        <tr align="center"> 
          <td><%=xsdata[i][0]%></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][1])*150/maxqysl%>" height="14">&nbsp;<%=xsdata[i][1]%></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][2])*150/maxbxkhsl%>" height="14">&nbsp;<%=xsdata[i][2]%></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=Double.parseDouble(xsdata[i][3])*150/maxbxl%>" height="14">&nbsp;<%=xsdata[i][3]%>%</td>
        </tr>
        <%
	}
%> 
        <tr align="center" > 
          <td>合计</td>
          <td><%=allqysl%></td>
          <td ><%=allbxkhsl%></td>
          <td align="left"><img src="/images/ColuGif.gif" width="<%=zbxl*150/maxbxl%>" height="14">&nbsp;<%=zbxl%>%</td>
        </tr>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
      </table>
    </td>
  </tr>

  <tr> 
    <td> 
<%
try {
	conn=cf.getConnection();

	int allwgs=0;
	allbxsl=0;
	int ys=0;
	int wgs=0; 

%>
      <CENTER >
        <B>完工后多长时间开始报修<BR>
        (<%=sjfw%>--<%=sjfw2%>)</B> 
      </CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="40%">报修竣工时间差</td>
          <td  width="60%">客户报修（起）</td>
        </tr>
<%	
	ls_sql="select ROUND((slsj-sjjgrq-15)/30),count(*)";
	ls_sql+=" from crm_tsjl,crm_khxx";
	ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.lx='2'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and sjjgrq is not null";
	ls_sql+=wheresql;
	ls_sql+=" group by ROUND((slsj-sjjgrq-15)/30)";

	ls_sql+=" order by ROUND((slsj-sjjgrq-15)/30)";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		ys=rs.getInt(1);
		bxsl=rs.getInt(2);

		allbxsl+=bxsl;


%> 
        <tr align="left"> 
          <td>完工后（<%=ys%>个月）报修</td>
          <td><img src="/images/ColuGif.gif" width="<%=bxsl%>" height="14">&nbsp;<%=bxsl%></td>
        </tr>
        <%

	}
	rs.close();
	ps.close();

%> 
        <tr align="center" > 
          <td>合计</td>
          <td ><%=allbxsl%></td>
        </tr>
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%> 
      </table>
    </td>
  </tr>


</table>
</body>
</html>
