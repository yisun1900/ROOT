<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String lx=request.getParameter("lx");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String jjrksg="1";
	ls_sql="select jjrksg";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jjrksg=cf.fillNull(rs.getString(1));
	}
	rs.close();
	ps.close();

	if (jjrksg.equals(""))
	{
		jjrksg="1";//1：节、假日不可施工；2：节日不可施工； 9：不限制
	}



	conn.setAutoCommit(false);
	String rwbm=null;
	String rwmc=null;
	java.sql.Date jhkssj=null;
	java.sql.Date jhjssj=null;
	int jhgzr=0;

	ls_sql="select rwbm,rwmc,jhkssj,jhjssj,jhgzr ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));

		jhkssj=rs.getDate("jhkssj");
		jhjssj=rs.getDate("jhjssj");
		jhgzr=rs.getInt("jhgzr");


		if (lx.equals("1"))//根据[开始时间/结束时间]生成[工日]
		{
			int len=0;
			ls_sql="select count(*)";
			ls_sql+=" from  dm_gzrl";
			ls_sql+=" where rq>=? and rq<=?";
			if (jjrksg.equals("1"))//1：节、假日不可施工
			{
				ls_sql+=" and jjrbz='N'";
			}
			else if (jjrksg.equals("2"))//2：节日不可施工
			{
				ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
			}
			ls_sql+=" order by rq";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setDate(1,jhkssj);
			ps1.setDate(2,jhjssj);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				len=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			ls_sql=" update crm_xmrwgl set jhgzr="+len;
			ls_sql+=" where  khbh='"+khbh+"' and rwbm='"+rwbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else if (lx.equals("2"))//根据[工日/结束时间]生成[开始时间]
		{
			String rq=null;

			ls_sql="select rq";
			ls_sql+=" from (";
			ls_sql+=" select rq";
			ls_sql+=" from  dm_gzrl";
			ls_sql+=" where rq>=?";
			if (jjrksg.equals("1"))//1：节、假日不可施工
			{
				ls_sql+=" and jjrbz='N'";
			}
			else if (jjrksg.equals("2"))//2：节日不可施工
			{
				ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
			}
			ls_sql+=" order by rq";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+jhgzr;
			ls_sql+=" order by rq desc";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setDate(1,jhjssj);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				rq=cf.fillNull(rs1.getDate(1));
			}
			rs1.close();
			ps1.close();

			ls_sql=" update crm_xmrwgl set jhkssj=TO_DATE('"+rq+"','YYYY-MM-DD')";
			ls_sql+=" where  khbh='"+khbh+"' and rwbm='"+rwbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}
		else if (lx.equals("3"))//根据[工日/开始时间]生成[结束时间]
		{
			String rq=null;

			ls_sql="select rq";
			ls_sql+=" from (";
			ls_sql+=" select rq";
			ls_sql+=" from  dm_gzrl";
			ls_sql+=" where rq>=?";
			if (jjrksg.equals("1"))//1：节、假日不可施工
			{
				ls_sql+=" and jjrbz='N'";
			}
			else if (jjrksg.equals("2"))//2：节日不可施工
			{
				ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
			}
			ls_sql+=" order by rq";
			ls_sql+=" )";
			ls_sql+=" where rownum<="+jhgzr;
			ls_sql+=" order by rq desc";
			ps1= conn.prepareStatement(ls_sql);
			ps1.setDate(1,jhkssj);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				rq=cf.fillNull(rs1.getDate(1));
			}
			rs1.close();
			ps1.close();

			ls_sql=" update crm_xmrwgl set jhjssj=TO_DATE('"+rq+"','YYYY-MM-DD')";
			ls_sql+=" where  khbh='"+khbh+"' and rwbm='"+rwbm+"'";
			ps1= conn.prepareStatement(ls_sql);
			ps1.executeUpdate();
			ps1.close();
		}

	}
	rs.close();
	ps.close();
	
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
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

