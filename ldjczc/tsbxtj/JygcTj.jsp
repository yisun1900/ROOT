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

	String yhjs=(String)session.getAttribute("yhjs");
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权



	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	sjfw2=request.getParameter("sjfw2");

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String sjs=cf.GB2Uni(request.getParameter("sjs"));
	String sgd=request.getParameter("sgd");
	String zrbm=request.getParameter("zrbm");
	String zrr=cf.GB2Uni(request.getParameter("zrr"));
	String xxlybm=request.getParameter("xxlybm");
	String lrbm=request.getParameter("lrbm");
	String lrr=cf.GB2Uni(request.getParameter("lrr"));

	String wheresql="";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and crm_khxx.fgsbh='"+fgs+"'";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	if (sjs!=null)
	{
		if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";
	}
	if (sgd!=null)
	{
		if (!(sgd.equals("")))	wheresql+=" and  crm_khxx.sgd='"+sgd+"'";
	}
	if (zrbm!=null)
	{
		if (!(zrbm.equals("")))	wheresql+=" and  gdm_jcjlmx.dwbh='"+zrbm+"'";
	}
	if (zrr!=null)
	{
		if (!(zrr.equals("")))	wheresql+=" and  gdm_jcjlmx.yhmc='"+zrr+"'";
	}
	if (xxlybm!=null)
	{
		if (!(xxlybm.equals("")))	wheresql+=" and  gdm_gdjcjl.xxlybm='"+xxlybm+"'";
	}

	if (lrbm!=null)
	{
		if (!(lrbm.equals("")))	wheresql+=" and  gdm_gdjcjl.lrdw='"+lrbm+"'";
	}
	if (lrr!=null)
	{
		if (!(lrr.equals("")))	wheresql+=" and  gdm_gdjcjl.lrr='"+lrr+"'";
	}


	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}

//获取月份数组
String[] yue=cf.getMons(sjfw,sjfw2);;
int yuesl=Integer.parseInt(yue[0]);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>精益工程统计
  <BR>(受理时间：<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 12px'>

<tr bgcolor="#CCCCCC"  align="center">
  <td  width="4%">编号</td>
  <td  width="12%">违规项目</td>
  <%
	for (int i=1;i<yuesl*2+1 ;i=i+2 )
	{
		%>
		  <td  width="5%"><%=yue[i].substring(0,7)%></td>
		<%
	}

  %>

  </tr>


<%
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();



	String xmbm=null;
	String xmmc=null;
	ls_sql="select distinct xmdlbm,xmxlbm,xmbm,xmmc";
	ls_sql+=" FROM gdm_gdjcjl,gdm_jcjlmx,crm_khxx  ";
	ls_sql+=" where gdm_gdjcjl.jcjlh=gdm_jcjlmx.jcjlh";
	ls_sql+=" and gdm_gdjcjl.khbh=crm_khxx.khbh(+)";
	ls_sql+=wheresql;
	ls_sql+=" and gdm_gdjcjl.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and gdm_gdjcjl.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by xmdlbm,xmxlbm,xmbm ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		xmbm=rs1.getString("xmbm");
		xmmc=rs1.getString("xmmc");


		//本大类占比
		%>
		<tr bgcolor="#FFFFFF"  align="center" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
		  <td><%=xmbm%></td>
		  <td><%=xmmc%></td>
		<%

		for (int i=0;i<yuesl ;i++ )
		{
			String startDate=yue[i*2+1];
			String endDate  =yue[i*2+2];


			//全部数量
			int sl=0;
			int khsl=0;
			ls_sql="select count(*),count(distinct gdm_gdjcjl.khbh)";
			ls_sql+=" FROM gdm_gdjcjl,gdm_jcjlmx,crm_khxx  ";
			ls_sql+=" where gdm_gdjcjl.jcjlh=gdm_jcjlmx.jcjlh";
			ls_sql+=" and gdm_gdjcjl.khbh=crm_khxx.khbh(+)";
			ls_sql+=wheresql;
			ls_sql+=" and gdm_gdjcjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
			ls_sql+=" and gdm_gdjcjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sl=rs.getInt(1);
				khsl=rs.getInt(2);
			}
			rs.close();
			ps.close();

			//项目数量
			int xmsl=0;
			int xmkhsl=0;
			ls_sql="select count(*),count(distinct gdm_gdjcjl.khbh)";
			ls_sql+=" FROM gdm_gdjcjl,gdm_jcjlmx,crm_khxx  ";
			ls_sql+=" where gdm_gdjcjl.jcjlh=gdm_jcjlmx.jcjlh";
			ls_sql+=" and gdm_gdjcjl.khbh=crm_khxx.khbh(+)";
			ls_sql+=wheresql;
			ls_sql+=" and gdm_gdjcjl.lrsj>=TO_DATE('"+startDate+"','YYYY-MM-DD')";
			ls_sql+=" and gdm_gdjcjl.lrsj<=TO_DATE('"+endDate+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ls_sql+=" and gdm_jcjlmx.xmbm='"+xmbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xmsl=rs.getInt(1);
				xmkhsl=rs.getInt(2);
			}
			rs.close();
			ps.close();


			//大类占比
			double xmbl=0;
			double xmkhbl=0;

			if (sl!=0)
			{
				xmbl=cf.round(xmsl*100.0/sl,2);
			}
			else{
				xmbl=0;
			}

			if (khsl!=0)
			{
				xmkhbl=cf.round(xmkhsl*100.0/khsl,2);
			}
			else{
				xmkhbl=0;
			}


			if (xmbl==0)//不输出
			{
				%>
				  <td>-</td>
				<%
			}
			else{
				%>
				  <td><%=xmbl%>%</td>
				<%
			}
		}

		%>
		</tr>
		<%
	}
	ps1.close();
	rs1.close();



%> 
</table>

<%

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("存盘失败,发生意外: " + ls_sql);
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



</body>
</html>


<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 