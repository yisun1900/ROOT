<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
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
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>设计师投诉统计
  <BR>(<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="5%">名次</td>
          <td  width="15%">店面</td>
          <td  width="10%">设计师</td>
          <td  width="10%">签单数</td>
          <td  width="20%">工程签约额</td>
          <td  width="10%">投诉数</td>
          <td  width="30%">投诉排名</td>
        </tr>
<%
int all=0;//获取最大值

String qydm=null;
String dwmc=null;
String sjs=null;

int alltssl=0;
int allqdsl=0;
double allqye=0;
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();


	//获取最大值
	ls_sql="select NVL(max(count(*)),0)";
	ls_sql+=" from crm_tsjl,crm_khxx,crm_tsbm";
	ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm='2201'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by sjs";

	all=Integer.parseInt(cf.executeQuery(ls_sql));
	if (all==0)
	{
		return;
	}


	int pm=0;
	int oldpm=0;
	int tssl=0;
	int qdsl=0;
	double qye=0;

//tslxbm=27 设计师投诉 

	ls_sql =" select crm_khxx.dwbh,dwmc,sjs,count(*) tssl";
	ls_sql+=" from crm_tsjl,crm_khxx,sq_dwxx,crm_tsbm";
	ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm='2201'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.dwbh,dwmc,sjs";
	ls_sql+=" order by tssl desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		qydm=rs.getString("dwbh");
		dwmc=rs.getString("dwmc");
		sjs=rs.getString("sjs");
		tssl=rs.getInt("tssl");


		alltssl+=tssl;


		//签单数
		ls_sql="select count(*),sum(qye)";
		ls_sql+=" from crm_khxx";
		ls_sql+=" where crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+qydm+"'";
		ls_sql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			qdsl=rs1.getInt(1);
			qye=rs1.getDouble(2);

			allqdsl+=qdsl;
			allqye+=qye;
		}
		ps1.close();
		rs1.close();


		if (oldpm!=tssl)
		{
			pm++;
			oldpm=tssl;
		}

		if (pm%2==0)
		{
			out.println("        <tr align=\"center\" bgcolor=\"#E8E8FF\">\r\n");
		}
		else{
			out.println("        <tr align=\"center\">\r\n");
		}

%>
          <td><%=pm%></td>
          <td><%=dwmc%></td>
          <td><%=sjs%></td>
          <td><%=qdsl%></td>
          <td><%=qye%></td>
          <td><%=tssl%></td>
          <td align="left"><A HREF="Crm_tsjlSjsList.jsp?dwbh=<%=qydm%>&sjs=<%=sjs%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>" target='_blank'><img src="/images/ColuGif.gif" width="<%=tssl*150/all%>" height="14">&nbsp;<%=tssl%></A></td>
        </tr>
<%

	}
	ps.close();
	rs.close();


%>
        <tr align="center" >
          <td>合计</td>
          <td>&nbsp;</td>
          <td align="center"><%=allqdsl%></td>
          <td align="center"><%=allqye%></td>
          <td align="center"><%=alltssl%></td>
          <td align="left">&nbsp;</td>
        </tr>
<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql: " + ls_sql);
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
