<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String ddbh=request.getParameter("ddbh");
String[] cpbm=request.getParameterValues("cpbm");

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
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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
		out.println("<BR>错误，不能再进行修改！合同已完成");
		return;
	}

	String dqbm=null;
	ls_sql =" select dqbm ";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();

	int xh=0;
	ls_sql="select NVL(max(xh),0)";
	ls_sql+=" from  jc_zcddmx";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xh=rs.getInt(1);
	}
	rs.close();
	ps.close();
	xh++;

	conn.setAutoCommit(false);

	int count=0;
	for (int i=0;i<cpbm.length ;i++ )
	{
		ls_sql="select count(*)";
		ls_sql+=" from  jc_zcddmx";
		ls_sql+=" where ddbh='"+ddbh+"' and zcbm='"+cpbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>0)
		{
			out.println("<BR>提醒！该种主材【"+cpbm[i]+"】已被选择");
		}

		String getppmc=null;
		String getgysmc=null;
		ls_sql="select ppmc,gysmc ";
		ls_sql+=" FROM bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getppmc=cf.fillNull(rs.getString("ppmc"));
			getgysmc=cf.fillNull(rs.getString("gysmc"));
		}
		else{
			conn.rollback();
			out.println("错误！该种主材【"+cpbm[i]+"】不存在");
			return;
		}
		rs.close();
		ps.close();

		if (!getppmc.equals(ppbm) )
		{
			conn.rollback();
			out.println("主材【"+cpbm[i]+"】错误！[品牌]与订单不一致，订单品牌【"+ppbm+"】，价格表品牌【"+getppmc+"】");
			return;
		}

		/*if ( !getgysmc.equals(gys) )
		{
			conn.rollback();
			out.println("主材【"+cpbm[i]+"】错误！[供应商]与订单不一致，订单供应商【"+gys+"】，价格表供应商【"+getgysmc+"】");
			return;
		}*/


		double cxhdbl=0;
		String cxhdbz="N";


		ls_sql ="insert into jc_zcddmx (xh,ddbh,khbh,zcbm,zcmc,zcdlbm,zcxlbm,dwbh,gys  ,ppmc,zclbbm,xinghao,gg,zcysbm,jldwbm,lsj,yhj,bzcbj,bzjsbl,bzcxhdbl,sfycx,cxj,cxcbj,cxjsbl,lscxhdbl,cxkssj,cxjzsj,xzjg,zqdj,dpzk,dj,cbj,jsbl,sfbhpj,pjts,sl,zqje,je,ycf,qtfyje,zjhsl,zqzjhje,zjhje,zjhycf         ,zjhqtfy,cxhdje,zjhcxhdje,lx,cxhdbz,cxhdbl,lrr,lrsj,sxbz,fgsbh,qddm,jzsjs,sftjcp,cksl,ckje,sfzp,zsdj     ) ";
		ls_sql+=" select                ?  ,?  ,?   ,cpbm,cpmc,jxc_cldlbm.cldlmc,clxlmc,ppmc,gysmc,ppmc,''    ,xh     ,gg,''    ,xdjldw,0  ,dj ,jsj  ,0     ,0       ,'N'  ,0  ,0    ,0     ,0       ,''    ,''    ,'1' ,dj  ,10  ,dj,jsj,0   ,'N'   ,0   ,0,0,0,0,0,0,0,0,0                                        ,0,0,0                   ,'1',?,?,?           ,SYSDATE,'1',?,?,?,'N',0,0,'N',0   ";//xzjg 1:销售限价；2:促销价
		ls_sql+=" FROM bj_tcwzck,jxc_cldlbm,jxc_clxlbm";
		ls_sql+=" where cpbm='"+cpbm[i]+"'";
		ls_sql+=" and bj_tcwzck.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_tcwzck.tccplbbm=jxc_clxlbm.clxlbm(+)";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,(xh+i));
		ps.setString(2,ddbh);
		ps.setString(3,khbh);
		ps.setString(4,cxhdbz);
		ps.setDouble(5,cxhdbl);
		ps.setString(6,yhmc);
		ps.setString(7,fgsbh);
		ps.setString(8,qddm);
		ps.setString(9,jzsjs);
		ps.executeUpdate();
		ps.close();


	}




	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("存盘成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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