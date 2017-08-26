<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");
String ssfgs=(String)session.getAttribute("ssfgs");
%>

<%

String ls=null;
String ggmc=null;
String ggnr=null;
java.sql.Date fbsj=null;
String fbr=null;
String fbbm=null;
String fbfgs=null;
String lrr=null;
java.sql.Date lrsj=null;
ggmc=cf.GB2Uni(request.getParameter("ggmc"));
ggnr=cf.GB2Uni(request.getParameter("ggnr"));
ls=request.getParameter("fbsj");
try{
	if (!(ls.equals("")))  fbsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fbsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[发布时间]类型转换发生意外:"+e);
	return;
}
fbr=cf.GB2Uni(request.getParameter("fbr"));
fbfgs=cf.GB2Uni(request.getParameter("fbfgs"));
fbbm=cf.GB2Uni(request.getParameter("fbbm"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
//把ggfgs,ggbm,ggyhz改为数组
String[] yhdlm=request.getParameterValues("yhdlm");
String ggfw = request.getParameter("ggfw");
String[] ggfgs = request.getParameterValues("ggfgs");
String bmfgs = request.getParameter("bmfgs");
String[] ggbm = request.getParameterValues("ggbm");
String[] ggyhz = request.getParameterValues("ggyhz");

String ggbh=null;
ggbh=cf.GB2Uni(request.getParameter("ggbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
String ls_sql=null;
oracle.sql.CLOB   clob=null; 
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

//更新主表 基本信息

	ls_sql=" update xz_ggbgl set ggmc=?,ggnr=EMPTY_CLOB(),fbsj=?,fbr=?,fbbm=?,fbfgs=?,lrr=?,lrsj=?,ggfw=? ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ggmc);
	ps.setDate(2,fbsj);
	ps.setString(3,fbr);
	ps.setString(4,fbbm);
	ps.setString(5,fbfgs);
	ps.setString(6,lrr);
	ps.setDate(7,lrsj);
	ps.setString(8,ggfw);
	ps.executeUpdate();
	ps.close();

	ls_sql="select ggnr";
	ls_sql+=" from  xz_ggbgl ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("ggnr");
	}
	rs.close();
	ps.close();

	clob.putString(1,ggnr);

	ls_sql="update xz_ggbgl set ggnr=? ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setClob(1,clob);
	
	ps.executeUpdate();
	ps.close();
//删除xz_ggfgs里的原有信息
	ls_sql="delete from xz_ggfgs ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
//删除xz_ggbm里的原有信息
	ls_sql="delete from xz_ggbm ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
//删除xz_ggyhz里的原有信息
	ls_sql="delete from xz_ggyhz ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from xz_ggdx ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from xz_ggckjl ";
	ls_sql+=" where  (ggbh='"+ggbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	//1：公告集团所有员工；2：公告分公司；3：公告部门；4：公告用户组；5：公告具体员工

//公告分公司，往附表xz_ggfgs插入分公司信息
	if(ggfw.equals("2"))
	{	
		for(int i=0;i<ggfgs.length;i++)
		{
			ls_sql=" insert into xz_ggfgs ( ggbh,ggfgs ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ggbh);
			ps.setString(2,ggfgs[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

//公告部门，往附表xz_ggbm插入部门所属分公司和部门信息
	if(ggfw.equals("3"))
	{
		for(int i=0;i<ggbm.length;i++)
		{
			ls_sql=" insert into xz_ggbm ( ggbh,ggfgs,ggbm ) ";
			ls_sql+=" values ( ?,?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ggbh);
			ps.setString(2,bmfgs);
			ps.setString(3,ggbm[i]);
			ps.executeUpdate();
			ps.close();
		}
	}

//公告用户组，往附表xz_ggyhz插入用户组信息
	if(ggfw.equals("4"))
	{	
		for(int i=0;i<ggyhz.length;i++)
		{
			ls_sql=" insert into xz_ggyhz ( ggbh,ggyhz ) ";
			ls_sql+=" values ( ?,? ) ";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ggbh);
			ps.setString(2,ggyhz[i]);
			ps.executeUpdate();
			ps.close();
		}
	}
//向xz_ggdx插入公告对象 根据不同的公告范围进行有区别的插入操作 
	if (ggfw.equals("1"))//1：公告集团所有员工；2：公告分公司；3：公告部门；4：公告用户组；5：选择某个员工
	{
		ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
		ls_sql+=" select '"+ggbh+"',yhdlm,yhmc,ssfgs,dwbh";
		ls_sql+=" from sq_yhxx";
		ls_sql+=" where yhdlm is not null and sfzszg in('Y','N','C')";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
//根据选择分公司的数目进行多次插入
	else if (ggfw.equals("2"))
	{	
		for(int i=0;i<ggfgs.length;i++)
		{
			ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
			ls_sql+=" select '"+ggbh+"',yhdlm,yhmc,ssfgs,dwbh";
			ls_sql+=" from sq_yhxx";
			ls_sql+=" where yhdlm is not null and sfzszg in('Y','N') and ssfgs='"+ggfgs[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
//根据选择部门的数目进行多次插入
	else if (ggfw.equals("3"))
	{	for(int i=0;i<ggbm.length;i++)
		{
			ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
			ls_sql+=" select '"+ggbh+"',yhdlm,yhmc,ssfgs,dwbh";
			ls_sql+=" from sq_yhxx";
			ls_sql+=" where yhdlm is not null and sfzszg in('Y','N') and dwbh='"+ggbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}
//根据选择用户组的数目进行多次插入
	else if (ggfw.equals("4"))
	{
		if (yhjs.equals("A0") || yhjs.equals("A1"))//总部
		{	
			for(int i=0;i<ggyhz.length;i++)
			{
				ls_sql =" select sq_yhssz.yhdlm ";
				ls_sql+=" from sq_yhxx,sq_yhssz";
				ls_sql+=" where sq_yhxx.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
				ps=conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if(rs.next())//公司内部用户
				{
					ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
					ls_sql+=" select '"+ggbh+"',sq_yhxx.yhdlm,sq_yhxx.yhmc,sq_yhxx.ssfgs,sq_yhxx.dwbh";
					ls_sql+=" from sq_yhxx,sq_yhssz";
					ls_sql+=" where sq_yhxx.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
					ls_sql+=" and sq_yhxx.yhdlm is not null and sq_yhxx.sfzszg in('Y','N')";
					ls_sql+=" and sq_yhxx.yhdlm not in(select yhdlm from xz_ggdx where ggbh='"+ggbh+"')";
					//由于插入时使用到数组，碰到一个用户属于多个组就会发生主键冲突，所以加了后一个条件
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
				else//供应商
				{
					ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
					ls_sql+=" select '"+ggbh+"',sq_gysbm.yhdlm,sq_gysbm.gys,sq_gysbm.ssfgs,sq_gysbm.ssdw";
					ls_sql+=" from sq_gysbm,sq_yhssz";
					ls_sql+=" where sq_gysbm.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
					ls_sql+=" and sq_gysbm.yhdlm is not null";
					ls_sql+=" and sq_gysbm.yhdlm not in(select yhdlm from xz_ggdx where ggbh='"+ggbh+"')";
					//由于插入时使用到数组，碰到一个用户属于多个组就会发生主键冲突，所以加了后一个条件
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
				rs.close();
				ps.close();
			}
		}
		else//非总部
		{	
			for(int i=0;i<ggyhz.length;i++)
			{
				ls_sql =" select sq_yhssz.yhdlm ";
				ls_sql+=" from sq_yhxx,sq_yhssz";
				ls_sql+=" where sq_yhxx.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
				ps=conn.prepareStatement(ls_sql);
				rs=ps.executeQuery();
				if(rs.next())//公司内部用户
				{
					ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
					ls_sql+=" select '"+ggbh+"',sq_yhxx.yhdlm,sq_yhxx.yhmc,sq_yhxx.ssfgs,sq_yhxx.dwbh";
					ls_sql+=" from sq_yhxx,sq_yhssz";
					ls_sql+=" where sq_yhxx.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
					ls_sql+=" and sq_yhxx.yhdlm is not null and sq_yhxx.sfzszg in('Y','N') and sq_yhxx.ssfgs='"+ssfgs+"'";
					ls_sql+=" and sq_yhxx.yhdlm not in(select yhdlm from xz_ggdx where ggbh='"+ggbh+"')";
					//由于插入时使用到数组，碰到一个用户属于多个组就会发生主键冲突，所以加了后一个条件
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
				else//供应商
				{
					ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
					ls_sql+=" select '"+ggbh+"',sq_gysbm.yhdlm,sq_gysbm.gys,sq_gysbm.ssfgs,sq_gysbm.ssdw";
					ls_sql+=" from sq_gysbm,sq_yhssz";
					ls_sql+=" where sq_gysbm.yhdlm=sq_yhssz.yhdlm and sq_yhssz.yhzbh ='"+ggyhz[i]+"'";
					ls_sql+=" and sq_gysbm.yhdlm is not null and sq_gysbm.ssfgs='"+ssfgs+"'";
					ls_sql+=" and sq_gysbm.yhdlm not in(select yhdlm from xz_ggdx where ggbh='"+ggbh+"')";
					//由于插入时使用到数组，碰到一个用户属于多个组就会发生主键冲突，所以加了后一个条件
					ps1= conn.prepareStatement(ls_sql);
					ps1.executeUpdate();
					ps1.close();
				}
				rs.close();
				ps.close();
			}
		}
	}
	else if (ggfw.equals("5"))
	{
		if (yhdlm!=null)
		{
			for (int i=0;i<yhdlm.length ;i++ )
			{
				if (yhdlm[i].equals(""))
				{
					continue;
				}
				ls_sql="insert into xz_ggdx (ggbh,yhdlm,yhmc,ssfgs,dwbh)";
				ls_sql+=" select ?,?,yhmc,ssfgs,dwbh";
				ls_sql+=" from sq_yhxx";
				ls_sql+=" where yhdlm='"+yhdlm[i]+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.setString(1,ggbh);
				ps.setString(2,yhdlm[i]);
				ps.executeUpdate();
				ps.close();
			}
		}
	}
	//以上

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
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>