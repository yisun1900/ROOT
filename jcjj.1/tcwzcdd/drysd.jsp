<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String drddbh=request.getParameter("drddbh");
String ddbh=request.getParameter("ddbh");


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String clzt=null;
	String khbh=null;
	String fgsbh=null;
	String qddm=null;
	String jzsjs=null;
	String ppbm=null;
	String gys=null;
	String ppmc=null;
	ls_sql =" select clzt,khbh,fgsbh,qddm,jzsjs,ppbm,gys,ppmc";
	ls_sql+=" from jc_zcdd";
	ls_sql+=" where ddbh='"+drddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		khbh=rs.getString("khbh");
		fgsbh=rs.getString("fgsbh");
		qddm=rs.getString("qddm");
		jzsjs=rs.getString("jzsjs");
		ppbm=rs.getString("ppbm");
		gys=rs.getString("gys");
		ppmc=rs.getString("ppmc");
	}
	rs.close();
	ps.close();

	if (!clzt.equals("07"))
	{
		out.println("<BR><font color=\"#FF0000\"><B>错误，不能再进行修改！合同已完成</B></font>");
		return;
	}

	String getppbm=null;
	String getgys=null;
	String getppmc=null;
	ls_sql="select ppbm,gys,ppmc";
	ls_sql+=" from  jc_zcysd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getppbm=cf.fillNull(rs.getString("ppbm"));
		getgys=cf.fillNull(rs.getString("gys"));
		getppmc=cf.fillNull(rs.getString("ppmc"));
	}
	rs.close();
	ps.close();

	if (!getppbm.equals(ppbm) || !getgys.equals(gys) || !getppmc.equals(ppmc))
	{
		out.println("<font color=\"#FF0000\"><B>错误！[子品牌、供应商、品牌]与订单不一致，订单（"+ppbm+","+gys+","+ppmc+"）；预算单（"+getppbm+","+getgys+","+getppmc+"）</B></font>");
		return;
	}


	long xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_zcddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xh=rs.getLong(1);
	}
	rs.close();
	ps.close();
	xh++;

	
	ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl  ,xzjg,zqdj,dpzk,dj,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,zjhcxhdje,lx,lrr,lrsj  ,sxbz,sxhtyy,fgsbh,qddm,jzsjs,bz,sftjcp)"; 
	ls_sql+=" select     "+xh+"+rownum,?,?,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys,ppmc,zclbbm,xinghao,gg  ,zcysbm,jldwbm,sfbhpj,pjts,lsj,yhj  ,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxkssj,cxjzsj,cxj,cxcbj,cxjsbl,lscxhdbl  ,xzjg,zqdj,dpzk,dj,cbj,jsbl,sl,zqje,je,ycf,qtfy,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf,zjhqtfy  ,zcpzwzbm,cxhdbz,cxhdbl,cxhdje,zjhcxhdje,lx,lrr,lrsj  ,sxbz,sxhtyy,fgsbh,?,?,bz,sftjcp "; 
	ls_sql+=" from  jc_zcysdmx";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ls_sql+=" and zcbm not in(select zcbm from jc_zcddmx where ddbh='"+drddbh+"') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,drddbh);
	ps.setString(2,khbh);
	ps.setString(3,qddm);
	ps.setString(4,jzsjs);
	ps.executeUpdate();
	ps.close();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("导入成功！");
	window.close();
	//-->
	</SCRIPT>
	<%



}
catch (Exception e) {
	out.print("Exception: " + e);
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