<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='java.sql.*,java.io.*,java.util.*,java.text.*' %>
<jsp:useBean id="cf" scope="request" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp"%>

<HTML><HEAD>
<TITLE>结转月末库存</TITLE>
<BODY bgColor=#ffffff>

<% //接收前面传过来的参数
String yhmc=(String)session.getAttribute("yhmc");

String wherejzrq=cf.GB2Uni(request.getParameter("jzrq"));
String dwbh=cf.GB2Uni(request.getParameter("fgs"));
String firstjzrq=wherejzrq.substring(0,7)+"-01";
String jzph=null;
String tem=null;
String tem2=null;
tem=wherejzrq.substring(0,4);
tem2=wherejzrq.substring(5,7);
jzph=dwbh+tem+tem2;

java.sql.Date jzrq=java.sql.Date.valueOf(wherejzrq);
if (jzrq.compareTo(cf.getDate())>0)
{
	out.println("失败！[结转日期]不能大于[系统日期]!");
	return;
}

//连接数据库
Connection conn=null;
PreparedStatement ps=null; 
ResultSet rs=null;
PreparedStatement ps1=null; 
ResultSet rs1=null;

String ls_sql=null;

String mackcrq=null;

java.sql.Date lastDay=null;

String clbm=null;
String clmc=null;
String clgg=null;
String jldwmc=null;
String cldlmc=null;
double fgsdj=0;
double cldj=0;
double byrksl=0;
double byrkje=0;
double bycksl=0;
double byckje=0;
double sumrksl=0;
double sumrkje=0;
double sumcksl=0;
double sumckje=0;
double kcsl=0;


long xh=0;
try {
	conn=cf.getConnection();

	java.sql.Date maxjzrq=null;
	int count=0;

	//查询当月最大日期
	ls_sql="select distinct last_day(TO_DATE('"+wherejzrq+"','yyyy-mm-dd')) from sq_cd ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next()){
		lastDay=rs.getDate(1);//从数据库中取出当前库存日期 
	} 
	rs.close();
	ps.close();

	if (!jzrq.equals(lastDay))
	{
		out.println("失败！日期["+wherejzrq+"]不是当月最后一天，不能结转！");
		return;
	}
//查询表cl_ydjz中[最大结转日期]与[输入日期]之间的月份差额，若无结转记录，则为-1
	ls_sql="select MONTHS_BETWEEN(NVL(max(jzrq), ADD_MONTHS(?,-1)),?),max(jzrq) ";
	ls_sql+="  from cl_ydjz where dwbh='"+dwbh+"'";  
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,jzrq);
	ps.setDate(2,jzrq);
	rs=ps.executeQuery();
	if (rs.next()){
		count=rs.getInt(1);//最大结转日期与输入结转日期的差额 
		maxjzrq=rs.getDate(2);//从数据库中取最大结转日期 
	} 
	rs.close();
	ps.close();


	if (jzrq.equals(maxjzrq))
	{
		out.println("失败！已结转！");
		return;
	}

	if (count>0)//最大日期大于输入的结转日期
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("失败！不能结转上月的记录！");
		window.close();
		//-->
		</SCRIPT>
		<%
		return;
	}
	else if (count<-1)//最大日期小于输入的结转日期
	{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("失败！您上月还没有结转，不能跨月结转！");
		window.close();
		//-->
		</SCRIPT>
		<%
		return;
	}

	//查询：上期结转日期、上期库存数量
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzrq=rs.getDate(1);
	} 
	rs.close();
	ps.close();

	String sqjzph=null;
	ls_sql="select jzph";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+dwbh+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();


	ls_sql="select count(*)";
	ls_sql+=" from cl_rkd  ";
	ls_sql+=" where cl_rkd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_rkd.rkzt='1' and rksj>? and rksj<=?";//注意起点不包括等于
	ps1= conn.prepareStatement(ls_sql);
	ps1.setDate(1,sqjzrq);
	ps1.setDate(2,jzrq);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		count=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	if (count>0)
	{
		out.println("失结转败！有入库单未提交，请提交或删除！");
		return;
	}

	ls_sql="select count(*)";
	ls_sql+=" from cl_ckd  ";
	ls_sql+=" where cl_ckd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_ckd.ckzt='1' and cksj>? and cksj<=?";//注意起点不包括等于
	ps1= conn.prepareStatement(ls_sql);
	ps1.setDate(1,sqjzrq);
	ps1.setDate(2,jzrq);
	rs1 =ps1.executeQuery();
	if (rs1.next())
	{
		count=rs1.getInt(1);
	}
	rs1.close();
	ps1.close();

	if (count>0)
	{
		out.println("失结转败！有出库单未提交，请提交或删除！");
		return;
	}

	conn.setAutoCommit(false);

	/*******************************************************\
	|		将结转结果写入数据库								|
	\*******************************************************/
	ls_sql="insert into cl_ydjz ( jzph,dwbh,sqjzrq,jzrq,jzr ) ";
	ls_sql+=" values ( ?,?,?,?,?) ";
	ps1= conn.prepareStatement(ls_sql);
	ps1.setString(1,jzph);
	ps1.setString(2,dwbh);
	ps1.setDate(3,sqjzrq);
	ps1.setDate(4,jzrq);
	ps1.setString(5,yhmc);
	ps1.executeUpdate();
	ps1.close();


	ls_sql="select cl_clbm.clbm,clmc,clgg,jldwmc,cldlmc ";
	ls_sql+=" from cl_clbm  ";
	ls_sql+=" order by  clbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clbm=rs.getString("clbm");
		clmc=rs.getString("clmc");
		clgg=rs.getString("clgg");
		jldwmc=rs.getString("jldwmc");
		cldlmc=rs.getString("cldlmc");

/***********************************************************\
|		查询：上期库存数量								|
\***********************************************************/
		double sqkcsl=0;
		ls_sql="select kcsl ";
		ls_sql+=" from cl_ydjzmx ";
		ls_sql+=" where jzph='"+sqjzph+"' and clbm='"+clbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqkcsl=rs1.getDouble("kcsl");
		}
		rs1.close();
		ps1.close();


/***********************************************************\
|		查询本月此材料的入库									|
\***********************************************************/
		ls_sql="select sum(rksl) byrksl";
		ls_sql+=" from cl_rkmx,cl_rkd  ";
		ls_sql+=" where cl_rkmx.rkph=cl_rkd.rkph and cl_rkmx.clbm='"+clbm+"' ";
		ls_sql+=" and cl_rkd.dwbh='"+dwbh+"' ";
		ls_sql+=" and cl_rkd.rkzt='2' and rksj>? and rksj<=?";//注意起点不包括等于
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,sqjzrq);
		ps1.setDate(2,jzrq);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			byrksl=rs1.getDouble("byrksl");
		}
		rs1.close();
		ps1.close();


/***********************************************************\
|		查询本月此材料的出库									|
\***********************************************************/
		ls_sql="select sum(cksl) bycksl ";
		ls_sql+=" from cl_ckmx,cl_ckd  ";
		ls_sql+=" where cl_ckmx.ckph=cl_ckd.ckph ";
		ls_sql+=" and cl_ckmx.clbm='"+clbm+"' and cl_ckmx.leixing='1' ";
		ls_sql+=" and cl_ckd.dwbh='"+dwbh+"' ";
		ls_sql+=" and cl_ckd.ckzt='2' and cksj>? and cksj<=?";//注意起点不包括等于
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,sqjzrq);
		ps1.setDate(2,jzrq);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			bycksl=rs1.getDouble("bycksl");
		}
		rs1.close();
		ps1.close();


		kcsl=sqkcsl+byrksl-bycksl;

		if (kcsl!=0)
		{
	/*******************************************************\
	|		将结转结果写入数据库								|
	\*******************************************************/
			ls_sql="insert into cl_ydjzmx ( jzph,clbm,clmc,clgg,cldlmc   ,jldwmc,sqkcsl,rksl,cksl,kcsl) ";
			ls_sql+=" values ( ?,?,?,?,?  ,?,?,?,?,? ) ";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setString(1,jzph);
			ps1.setString(2,clbm);
			ps1.setString(3,clmc);
			ps1.setString(4,clgg);
			ps1.setString(5,cldlmc);
			ps1.setString(6,jldwmc);
			ps1.setDouble(7,sqkcsl);
			ps1.setDouble(8,byrksl);
			ps1.setDouble(9,bycksl);
			ps1.setDouble(10,kcsl);
			ps1.executeUpdate();
			ps1.close();
		}

	}

	ls_sql="update cl_rkd set jzph='"+jzph+"'";
	ls_sql+=" where cl_rkd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_rkd.rkzt='2' and rksj>? and rksj<=?";//注意起点不包括等于
	ps1= conn.prepareStatement(ls_sql);
	ps1.setDate(1,sqjzrq);
	ps1.setDate(2,jzrq);
	ps1.executeUpdate();
	ps1.close();

	ls_sql="update cl_ckd set jzph='"+jzph+"'";
	ls_sql+=" where cl_ckd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_ckd.ckzt='2' and cksj>? and cksj<=?";//注意起点不包括等于
	ps1= conn.prepareStatement(ls_sql);
	ps1.setDate(1,sqjzrq);
	ps1.setDate(2,jzrq);
	ps1.executeUpdate();
	ps1.close();
	
	rs.close();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("结转成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch(Exception e){
	conn.rollback();
	out.print("数据库操作失败"+e);
	out.print("ls_sql="+ls_sql);
}
finally{
	try{
		conn.setAutoCommit(true);

		if (rs!= null) rs.close();  
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close();  
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn);  
	}
	catch (Exception e){ 
		out.println("关闭连接发生以外,Exception:"+e.getMessage()); 
	} 
}
%>  

</BODY>
</html>




