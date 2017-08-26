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
double allwjjtssl=0;
double allyjjtssl=0;
double allwjjbxsl=0;
double allyjjbxsl=0;
double temp2=0;
double dltssl=0;
double temp1=0;
String bgcolor="#E8E8FF";

try {
	conn=cf.getConnection();

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td> 
      <div align="center"><b>解决客户投诉力度统计</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="10%"> 
            <div align="center"><b>类别</b></div>
          </td>
          <td width="15%"> 
            <div align="center"><b>投诉数量</b></div>
          </td>
		  <td width="20%"> 
            <div align="center"><b>已解决完毕数量</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>所占比率</b></div>
          </td>
        </tr>
        <%
	//家居投诉总数
	

	ls_sql="SELECT crm_tsbm.tsxlbm,tsxlmc,count(distinct crm_tsjl.tsjlh) tssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsjl.lx='1' and crm_tsbm.tslxbm='23'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_tsbm.tsxlbm,tsxlmc";
	ls_sql+=" order by tssl desc";
	//out.print(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	while (rs1.next())
	{
		double wjjtssl=0;
		double yjjtssl=0;
		double temp=0;

		tslxbm=rs1.getString("tsxlbm");
		tslxmc=rs1.getString("tsxlmc");
		dltssl=rs1.getInt("tssl");


		
		//已解决的投诉
		ls_sql="SELECT count(crm_tsjl.tsjlh) tssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1' and crm_tsbm.clzt='3'";//已结案的记录
		ls_sql+="  and crm_tsbm.tsxlbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			yjjtssl=(rs.getInt("tssl")+0.0);
		}
		ps.close();
		rs.close();

		ls_sql="SELECT count(crm_tsjl.tsjlh) tssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='1' and crm_tsbm.clzt!='3'";//未结案的记录
		ls_sql+="  and crm_tsbm.tsxlbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wjjtssl=(rs.getInt("tssl")+0.0);
		}
		ps.close();
		rs.close();
		allwjjtssl+=(wjjtssl+yjjtssl);
		allyjjtssl+=yjjtssl;
		if((wjjtssl+yjjtssl)>0)
		{
			temp=yjjtssl/(wjjtssl+yjjtssl);
		}
		else
		{
			temp=0;
		}

		if((allwjjtssl+allyjjtssl)>0)
		{
			temp1=allyjjtssl/(allwjjtssl+allyjjtssl);
		}
		else
		{
			temp1=0;
		}
%>	
 <tr height="30"> 
          <td width="10%"> 
            <div align="center"><%=tslxmc%></div>
          </td>
          <td width="20%"> 
            <div align="center"><%=(wjjtssl+yjjtssl)%></b></div>
          </td>
		  <td width="20%"> 
            <div align="center"><%=yjjtssl%></b></div>
          </td>
          <td width="50%"> 
            <div align="center"></b></div><img src="/images/ColuGif.gif" width="<%=temp*100%>" height=20><%=cf.formatDouble(temp*100)%>%
          </td>
        </tr>
<%
	}
	rs1.close();
	ps1.close();

%> 
 <tr height="30"> 
          <td width="20%"> 
            <div align="center">总计</div>
          </td>
          <td width="15%"> 
            <div align="center"><%=allwjjtssl%></b></div>
          </td>
		  <td width="20%"> 
            <div align="center"><%=allyjjtssl%></b></div>
          </td>
          <td width="50%"> 
            <div ></b><img src="/images/ColuGif.gif" width="<%=temp1*100%>" height=20><%=cf.formatDouble(temp1*100)%>%&nbsp;</div>
          </td>
        </tr>
      </table>

<br>

	  <table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr>
    <td> 
      <div align="center"><b>解决客户报修力度统计</b> <b>(<%=sjfw%>--<%=sjfw2%>)</b></div>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr height="30"> 
          <td width="10%"> 
            <div align="center"><b>类别</b></div>
          </td>
          <td width="15%"> 
            <div align="center"><b>报修数量</b></div>
          </td>
		  <td width="20%"> 
            <div align="center"><b>已解决完毕数量</b></div>
          </td>
          <td width="50%"> 
            <div align="center"><b>所占比率</b></div>
          </td>
        </tr>
        <%
	//家居投诉总数
	

	ls_sql="SELECT crm_tsbm.tsxlbm,tsxlmc,count(distinct crm_tsjl.tsjlh) tssl";
	ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tsxlbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsjl.lx='2' and crm_tsbm.tslxbm='12'";
	ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_tsbm.tsxlbm,tsxlmc";
	ls_sql+=" order by tssl desc";
	//out.print(ls_sql);
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery(ls_sql);
	//out.print(ls_sql);
	while (rs1.next())
	{
		double yjjbxsl=0;
		double wjjbxsl=0;
		double temp=0;

		tslxbm=rs1.getString("tsxlbm");
		tslxmc=rs1.getString("tsxlmc");
		dltssl=rs1.getInt("tssl");


		
		//已解决的投诉
		ls_sql="SELECT count(crm_tsjl.tsjlh) tssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2' and crm_tsbm.clzt='3' and crm_tsbm.tslxbm='12'";//已结案的家居投诉记录
		ls_sql+="  and crm_tsbm.tsxlbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			yjjbxsl=(rs.getInt("tssl")+0.0);
		}
		ps.close();
		rs.close();

		ls_sql="SELECT count(crm_tsjl.tsjlh) tssl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.lx='2' and crm_tsbm.clzt!='3' and crm_tsbm.tslxbm='12'";//未结案的家居投诉记录
		ls_sql+="  and crm_tsbm.tsxlbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			wjjbxsl=(rs.getInt("tssl")+0.0);
		}
		ps.close();
		rs.close();
		allwjjbxsl+=(wjjbxsl+yjjbxsl);
		allyjjbxsl+=yjjbxsl;
		if((wjjbxsl+yjjbxsl)>0)
		{
			temp=yjjbxsl/(wjjbxsl+yjjbxsl);
		}
		else
		{
			temp=0;
		}

		if((allwjjtssl+allyjjtssl)>0)
		{
			temp2=allyjjtssl/(allwjjtssl+allyjjtssl);
		}
		else
		{
			temp2=0;
		}
%>	
 <tr height="30"> 
          <td width="10%"> 
            <div align="center"><%=tslxmc%></div>
          </td>
          <td width="20%"> 
            <div align="center"><%=(wjjbxsl+yjjbxsl)%></b></div>
          </td>
		  <td width="20%"> 
            <div align="center"><%=yjjbxsl%></b></div>
          </td>
          <td width="50%"> 
            <div align="center"></b></div><img src="/images/ColuGif.gif" width="<%=temp*100%>" height=20><%=cf.formatDouble(temp*100)%>%
          </td>
        </tr>
<%
	}
	rs1.close();
	ps1.close();

%> 
 <tr height="30"> 
          <td width="20%"> 
            <div align="center">总计</div>
          </td>
          <td width="15%"> 
            <div align="center"><%=allwjjbxsl%></b></div>
          </td>
		  <td width="20%"> 
            <div align="center"><%=allyjjbxsl%></b></div>
          </td>
          <td width="50%"> 
            <div ></b><img src="/images/ColuGif.gif" width="<%=temp2*100%>" height=20><%=cf.formatDouble(temp2*100)%>%&nbsp;</div>
          </td>
        </tr>
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

