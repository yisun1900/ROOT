<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String lx=request.getParameter("lx");
String tcbm=request.getParameter("tcbm");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String sfwc="";
	ls_sql="select sfwc";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khzctcmch";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！已选择");
		return;
	}

	if (!lx.equals("1"))
	{
		count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_khzctcmch";
		ls_sql+=" where zjxxh='"+zjxxh+"' and lx='"+lx+"' and zjlx!='3'";//1：原套餐；3：删除套餐；4：新增套餐
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count>0)
		{
			out.println("错误！只能选择一个");
			return;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="delete from bj_khzctcmch ";
    ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_khzctcmxh ";
    ls_sql+=" where khbh='"+khbh+"' and tcbm='"+tcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_khzctcmch (zjxxh,khbh      ,tcbm,tcmc,yj,tcj,bz,lx,zjlx)";
	ls_sql+=" select            '"+zjxxh+"','"+khbh+"',tcbm,tcmc,yj,tcj,bz,lx,'4'";//1：原套餐；3：删除套餐；4：新增套餐
	ls_sql+=" FROM bj_zctcmc  ";
    ls_sql+=" where tcbm='"+tcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	String cpmc=null;
	ls_sql="SELECT distinct cpmc";
	ls_sql+=" FROM bj_zctcmx";
    ls_sql+=" where tcbm='"+tcbm+"'";
    ls_sql+=" order by cpmc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		cpmc=rs.getString("cpmc");


		int cpsl=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM bj_zctcmx";
		ls_sql+=" where tcbm='"+tcbm+"' and cpmc='"+cpmc+"'";
		ls_sql+=" order by cpmc";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			cpsl=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (cpsl==1)//只有一条不用选择
		{
			ls_sql="insert into bj_khzctcmxh (zjxxh,khbh      ,cpmc,cpsl,cpbm,tcbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,lrr       ,lrsj   ,bz,lx,sfbpx)";
			ls_sql+=" select            '"+zjxxh+"','"+khbh+"',cpmc,1   ,cpbm,tcbm,xh,gg,ppmc,gysmc,jldw,ydj,tcdj,sjzj,jsj,sl,'"+yhmc+"',SYSDATE,bz,'"+lx+"','Y'";//1：家具套餐；2：健康计划
			ls_sql+=" FROM bj_zctcmx  ";
			ls_sql+=" where tcbm='"+tcbm+"' and cpmc='"+cpmc+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else{//多条需要选择
			ls_sql="insert into bj_khzctcmxh (zjxxh,khbh      ,cpmc      ,cpsl    ,tcbm    ,sl,lrr       ,lrsj   ,lx,sfbpx)";
			ls_sql+="            values('"+zjxxh+"','"+khbh+"','"+cpmc+"',"+cpsl+","+tcbm+",0 ,'"+yhmc+"',SYSDATE,'"+lx+"','Y')";//1：家具套餐；2：健康计划
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}

	}
	rs.close();
	ps.close();

	//全部只有一项，检查价格
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_khzctcmxh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"' and cpsl!=1";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count==0)
	{
		double tcj=0;
		ls_sql="SELECT tcj";
		ls_sql+=" FROM bj_khzctcmch";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcj=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		double tcmxj=0;
		ls_sql="SELECT sum(ROUND(tcdj*sl,2))";
		ls_sql+=" FROM bj_khzctcmxh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and tcbm='"+tcbm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tcmxj=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		if (tcj!=tcmxj)
		{
			conn.rollback();
			out.println("错误！套餐总价["+tcj+"]不等于明细之和["+tcmxj+"]");
			return;
		}
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
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
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