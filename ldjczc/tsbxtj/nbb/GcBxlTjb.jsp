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
if (fgs!=null)
{
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
}
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
}

int all=0;
String nian=null;
String yue=null;
String tsxlbm=null;
String tsxlmc=null;
String tslxbm=null;
String tslxmc=null;

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
		

String[][] xsdata=null; 
int yues=0;
int row=0;
int maxqysl=0;
int maxtskhsl=0;
double maxtsl=0;
int maxbxkhsl=0;
double maxbxl=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
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

	xsdata=new String[yues][5];

	//获取完工数量
	maxqysl=0;
	row=0;
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

		xsdata[row][0]=nian;
		xsdata[row][1]=yue;
		xsdata[row][2]=String.valueOf(qysl);
		row++;
	}
	rs.close();
	ps.close();
	if (row==0)
	{
		out.println("无数据");
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
<%
	ls_sql=" select distinct crm_tsbm.tslxbm,tslxmc,crm_tsbm.tsxlbm,tsxlmc";
	ls_sql+=" from crm_tsjl,crm_tsbm,dm_tsxlbm,dm_tslxbm,crm_khxx ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsjl.lx='2'";//1：报修；2：报修
	ls_sql+=" and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsbm.tslxbm!='12'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
	ls_sql+=wheresql;
	ls_sql+=" order by tslxbm,tsxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tslxbm=rs.getString("tslxbm");
		tslxmc=rs.getString("tslxmc");
		tsxlbm=rs.getString("tsxlbm");
		tsxlmc=rs.getString("tsxlmc");
		%>
  <tr>
    <td> 
      <CENTER >
        <B>（<%=tslxmc%>：<%=tsxlmc%>）报修率统计(<%=sjfw%>--<%=sjfw2%>)</B> 
      </CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="13%">时间范围</td>
          <td  width="29%">本期完工数</td>
          <td  width="29%">报修客户（人）</td>
          <td  width="29%">报修 / 完工</td>
        </tr>

		<%
		maxtskhsl=0;
		maxtsl=0;
		alltskhsl=0;
		for (int i=0;i<row ;i++ )
		{
			ls_sql="select count(distinct crm_tsjl.khbh)";
			ls_sql+=" from crm_tsjl,crm_tsbm,crm_khxx";
			ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2'";//1：报修；2：报修
			ls_sql+=" and crm_tsbm.tsxlbm='"+tsxlbm+"'";
			ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and TO_CHAR(slsj,'YYYY')='"+xsdata[i][0]+"' and TO_CHAR(slsj,'MM')='"+xsdata[i][1]+"'";
			ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
			ls_sql+=wheresql;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery(ls_sql);
			if (rs1.next())
			{
				tskhsl=rs1.getInt(1);

				alltskhsl+=tskhsl;
			}
			else{
				tskhsl=0;
			}
			rs1.close();
			ps1.close();

			if (tskhsl>maxtskhsl)
			{
				maxtskhsl=tskhsl;
			}

			if (Integer.parseInt(xsdata[i][2])==0)
			{
				tsl=0;
			}
			else{
				tsl=tskhsl*1000/Integer.parseInt(xsdata[i][2])/10.0;
			}

			if (tsl>maxtsl)
			{
				maxtsl=tsl;
			}

			xsdata[i][3]=tskhsl+"";
			xsdata[i][4]=tsl+"";

		}


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
			  <td><%=xsdata[i][0]%>年<%=xsdata[i][1]%>月</td>
			  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][2])*150/maxqysl%>" height="14">&nbsp;<%=xsdata[i][2]%></td>
			  <td align="left"><img src="/images/ColuGif.gif" width="<%=Integer.parseInt(xsdata[i][3])*150/maxtskhsl%>" height="14">&nbsp;<%=xsdata[i][3]%></td>
			  <td align="left"><img src="/images/ColuGif.gif" width="<%=Double.parseDouble(xsdata[i][4])*150/maxtsl%>" height="14">&nbsp;<%=xsdata[i][4]%>%</td>
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
		  </table>
		</td>
	  </tr>
	  <%
	}
	rs.close();
	ps.close();

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
</body>
</html>
