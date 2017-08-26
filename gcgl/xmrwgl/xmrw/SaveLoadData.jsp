<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String lrr=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh = request.getParameter("khbh");
String jjrksg = request.getParameter("jjrksg");

String[] rwxhStr =request.getParameterValues("rwxh");
String[] rwbm =request.getParameterValues("rwbm");
String[] rwmc =request.getParameterValues("rwmc");
String[] jhkssjStr =request.getParameterValues("jhkssj");
String[] jhjssjStr =request.getParameterValues("jhjssj");
String[] jhgzrStr =request.getParameterValues("jhgzr");

//////////////////////////////////////////////////////  

String ls_sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	ls_sql=" update crm_khxx set jjrksg='"+jjrksg+"'";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	for (int i=0;i<rwbm.length ;i++ )
	{
		java.sql.Date jhkssj=null;
		try{
			jhkssj=java.sql.Date.valueOf(jhkssjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>行号["+(i+1)+"]错误，[计划开始时间]不是日期类型:"+jhkssjStr[i]);
			return;
		}
		java.sql.Date jhjssj=null;
		try{
			jhjssj=java.sql.Date.valueOf(jhjssjStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>行号["+(i+1)+"]错误，[计划结束时间]不是日期类型:"+jhjssjStr[i]);
			return;
		}
		int jhgzr=0;
		try{
			jhgzr=Integer.parseInt(jhgzrStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>行号["+(i+1)+"]错误，[计划工日]不是数字类型:"+jhgzrStr[i]);
			return;
		}
		int rwxh=0;
		try{
			rwxh=Integer.parseInt(rwxhStr[i].trim());
		}
		catch (Exception e){
			conn.rollback();
			out.println("<BR>行号["+(i+1)+"]错误，[任务序号]不是数字类型:"+rwxhStr[i]);
			return;
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  crm_xmrwgl";
		ls_sql+=" where  khbh='"+khbh+"' and rwbm='"+rwbm[i]+"'";
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
			ls_sql =" insert into crm_xmrwgl (khbh,rwxh,rwbm,rwmc,rwflbm,zdjkrw,xgytg,gytgts,sjcpxx,sjcpfl,bjjbbm,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,sfxtx,sfyxhxgq,sfyxfc,sfxys,ysxm,sfwlcb,zyrwbm,gznr,jdbz,lrr,lrsj,lrbm,sfxrw,sfzdyrw   ,csjhkssj,csjhjssj,csjhgzr,jhkssj,jhjssj,jhgzr )  ";
			ls_sql+=" select                  ?   ,?   ,rwbm,rwmc,rwflbm,zdjkrw,xgytg,gytgts,sjcpxx,sjcpfl,bjjbbm,bjlb,sqtxnr,sqtxts,shtxnr,shtxts,'N'  ,sfyxhxgq,sfyxfc,sfxys,ysxm,sfwlcb,zyrwbm,gznr,bz  ,?,SYSDATE,?,'N','N'   ,?,?,?,?,?,?";
			ls_sql+=" from dm_bzrwbm ";
			ls_sql+=" where rwbm='"+rwbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.setInt(2,rwxh);
			ps.setString(3,lrr);
			ps.setString(4,lrbm);
			ps.setDate(5,jhkssj);
			ps.setDate(6,jhjssj);
			ps.setInt(7,jhgzr);
			ps.setDate(8,jhkssj);
			ps.setDate(9,jhjssj);
			ps.setInt(10,jhgzr);
			ps.executeUpdate();
			ps.close();

			ls_sql =" delete from crm_xmrwljgx ";
			ls_sql+=" where  khbh='"+khbh+"' and rwbm='"+rwbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql =" insert into crm_xmrwljgx (khbh,rwbm,qzrwbm)  ";
			ls_sql+=" select                       ?,rwbm,qzrwbm ";
			ls_sql+=" from dm_bzrwljgx ";
			ls_sql+=" where rwbm='"+rwbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql =" delete from crm_xmrwcpfl ";
			ls_sql+=" where  khbh='"+khbh+"' and rwbm='"+rwbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql =" insert into crm_xmrwcpfl (khbh,rwbm,cpflbm)  ";
			ls_sql+=" select                      ?,rwbm,cpflbm ";
			ls_sql+=" from dm_bzrwcpfl ";
			ls_sql+=" where rwbm='"+rwbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();

			ls_sql =" delete from crm_xmrwysxm ";
			ls_sql+=" where  khbh='"+khbh+"' and rwbm='"+rwbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql =" insert into crm_xmrwysxm (khbh,rwbm,gcysxmbm)  ";
			ls_sql+=" select                      ?,rwbm,gcysxmbm ";
			ls_sql+=" from dm_bzrwysxm ";
			ls_sql+=" where rwbm='"+rwbm[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,khbh);
			ps.executeUpdate();
			ps.close();
		}
		else{
			ls_sql=" update crm_xmrwgl set jhkssj=?,jhjssj=?,jhgzr=?,rwxh=?";
			ls_sql+=" where rwbm='"+rwbm[i]+"' and khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setDate(1,jhkssj);
			ps.setDate(2,jhjssj);
			ps.setInt(3,jhgzr);
			ps.setInt(4,rwxh);
			ps.executeUpdate();
			ps.close();
		}
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + ls_sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
