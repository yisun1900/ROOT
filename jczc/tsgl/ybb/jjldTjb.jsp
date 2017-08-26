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
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsjl.dwbh in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_tsjl.dwbh='"+dwbh+"'";
	}


%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>投诉报修解决力度统计 <BR>
  (受理时间：<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table width="100%" border="0" style='FONT-SIZE: 14px'>
  <tr> 
    <td> 
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="20%">部门</td>
          <td  width="30%">解决力度</td>
          <td  width="15%">数量</td>
          <td  width="35%">百分比 </td>
        </tr>
        <%
int all=0;
String tslxbm=null;

int[] mark={3,1,2,4};//设置显示风格参数
//0:空;1：合并列，无小计；2：数值列，需小计、总计；3：合并列，有小计；4：不合并列；5：列名在小计中显示
		
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
	conn=cf.getConnection();

	//获取投诉总数
	ls_sql="SELECT tslxbm,count(*)";
	ls_sql+=" FROM crm_tsjl,crm_tsbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by tslxbm";
	ls_sql+=" order by tslxbm";
//	out.println(ls_sql);

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tslxbm=rs.getString("tslxbm");
		all=rs.getInt(2);

	
		ls_sql="SELECT tslxmc,jsxmc,sum(sl),'<img src=\"/images/ColuGif.gif\" width='||sum(sl)*200/"+all+"||' height=14>&nbsp;'||ROUND(sum(sl)/"+all+"*100,2)||'%' as tx";
		ls_sql+=" from ";
		ls_sql+=" ( ";

		//已解决
		ls_sql+=" SELECT tslxmc,dm_jsxbm.jsxbm,jsxmc,count(*) sl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_jsxbm,dm_tslxbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.jsxbm=dm_jsxbm.jsxbm and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_tsbm.tslxbm,tslxmc,dm_jsxbm.jsxbm,jsxmc";
		
		//未结案
		ls_sql+=" union";

		ls_sql+=" SELECT tslxmc,'00' as jsxbm,'未结案' as jsxmc,count(*) sl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jsxbm is null";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_tsbm.tslxbm,tslxmc";

		ls_sql+=" union";

		ls_sql+=" SELECT tslxmc,dm_jsxbm.jsxbm,jsxmc,0 sl";
		ls_sql+=" FROM dm_jsxbm,dm_tslxbm ";
		ls_sql+=" where dm_tslxbm.tslxbm='"+tslxbm+"'";
		
		ls_sql+=" ) ";

		ls_sql+=" group by tslxmc,jsxbm,jsxmc";
		ls_sql+=" order by jsxbm";

//		out.println(ls_sql);

		so.addData(ls_sql);
	}
	ps.close();
	rs.close();

	//输出数据
	so.outData(out,mark);

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("sql: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
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
      <div align="center"><BR>
        投诉报修解决力度统计 </div>
<%

		ls_sql="SELECT jsxmc,count(*) sl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_jsxbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.jsxbm=dm_jsxbm.jsxbm ";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by jsxmc";
		//未结案
		ls_sql+=" union";

		ls_sql+=" SELECT '未结案' as jsxmc,count(*) al";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jsxbm is null";
		ls_sql+=wheresql;

		ls_sql+=" order by sl desc";
		
		so.outRatioColuG(out,ls_sql);
%>
   </td>
  </tr>
  <tr>
    <td>
	<CENTER >
	  <BR><B>投诉报修客户满意度统计 <BR>
	  (受理时间：<%=sjfw%>--<%=sjfw2%>)</B>
	</CENTER>
      <table border="1" width="100%" cellspacing="0" cellpadding="1"  style='FONT-SIZE: 14px'>
        <tr bgcolor="#CCCCCC"  align="center"> 
          <td  width="20%">部门</td>
          <td  width="30%">是否满意</td>
          <td  width="15%">数量</td>
          <td  width="35%">百分比 </td>
        </tr>
<%
so.clearData();
		
try {
	conn=cf.getConnection();

	//获取投诉总数
	ls_sql="SELECT tslxbm,count(*)";
	ls_sql+=" FROM crm_tsjl,crm_tsbm ";
	ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=wheresql;
	ls_sql+=" group by tslxbm";
	ls_sql+=" order by tslxbm";

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		tslxbm=rs.getString("tslxbm");
		all=rs.getInt(2);
		
		ls_sql="SELECT tslxmc,zzjgmc,sum(sl),'<img src=\"/images/ColuGif.gif\" width='||sum(sl)*200/"+all+"||' height=14>&nbsp;'||ROUND(sum(sl)/"+all+"*100,2)||'%' as tx";
		ls_sql+=" from ";
		ls_sql+=" ( ";

		
		ls_sql+=" SELECT tslxmc,dm_zzjgbm.zzjgbm,zzjgmc,count(*) sl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_zzjgbm,dm_tslxbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_tsbm.tslxbm,tslxmc,dm_zzjgbm.zzjgbm,zzjgmc";
		
		//未结案
		ls_sql+=" union";

		ls_sql+=" SELECT tslxmc,'00' as zzjgbm,'未结案' as zzjgmc,count(*) sl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_tslxbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.tslxbm=dm_tslxbm.tslxbm and crm_tsbm.tslxbm='"+tslxbm+"'";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and jsxbm is null";
		ls_sql+=wheresql;
		ls_sql+=" group by crm_tsbm.tslxbm,tslxmc";

		ls_sql+=" union";

		ls_sql+=" SELECT tslxmc,dm_zzjgbm.zzjgbm,zzjgmc,0 sl";
		ls_sql+=" FROM dm_zzjgbm,dm_tslxbm ";
		ls_sql+=" where dm_tslxbm.tslxbm='"+tslxbm+"'";
		
		ls_sql+=" ) ";

		ls_sql+=" group by tslxmc,zzjgbm,zzjgmc";
		ls_sql+=" order by zzjgbm";

//		out.println(ls_sql);

		so.addData(ls_sql);
	}
	ps.close();
	rs.close();

	//输出数据
	so.outData(out,mark);
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
      <div align="center"><BR>
        投诉报修客户满意度统计 </div>
<%

		ls_sql="SELECT zzjgmc,count(*) sl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm,dm_zzjgbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm ";
		ls_sql+=" and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by zzjgmc";
		//未结案
		ls_sql+=" union";

		ls_sql+=" SELECT '未结案' as zzjgmc,count(*) sl";
		ls_sql+=" FROM crm_tsjl,crm_tsbm ";
		ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh and crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=" and zzjgbm is null";
		ls_sql+=wheresql;

		ls_sql+=" order by sl desc";

//		out.println(ls_sql);
		
		so.outRatioColuG(out,ls_sql);
%>
	</td>
  </tr>
</table>
</body>
</html>
