<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String[] djjlh = request.getParameterValues("djjlh");
if (djjlh.length>1)
{
	out.println("错误！每次只能删除一条记录");
	return;
}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String gcjdbm=null;
	String sfszhf=null;
	String hfszjlh=null;
	String ygcjdbm=null;
	String ysfxhf=null;
	String yhflxbm=null;
	java.sql.Date yhfrq=null;
	ls_sql="select khbh,gcjdbm,sfszhf,hfszjlh,ygcjdbm,ysfxhf,yhfrq,yhflxbm";
	ls_sql+=" from  crm_gcjddjjl";
	ls_sql+=" where djjlh='"+djjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sfszhf=cf.fillNull(rs.getString("sfszhf"));
		hfszjlh=cf.fillNull(rs.getString("hfszjlh"));
		ygcjdbm=rs.getString("ygcjdbm");
		ysfxhf=rs.getString("ysfxhf");
		yhflxbm=rs.getString("yhflxbm");
		yhfrq=rs.getDate("yhfrq");
	}
	else{
		out.println("错误！不存在的登记记录号："+djjlh[0]);
		return;
	}
	rs.close();
	ps.close();
	
	String newgcjdbm=null;
	ls_sql="select gcjdbm ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		newgcjdbm=rs.getString("gcjdbm");
	}
	rs.close();
	ps.close();

	if (!newgcjdbm.equals(gcjdbm))
	{
		out.println("错误！[工程进度]已改变，不能再删除");
		return;
	}

	String getsfyhf="";//是否已回访 ,Y：回访；N：未回访
	String getzxszbz="";//最新设置标志  ,Y：是；N：否
	String yhfszjlh=null;
	ls_sql="SELECT sfyhf,zxszbz,yhfszjlh ";
	ls_sql+=" FROM crm_hfszjl ";
	ls_sql+=" where  hfszjlh='"+hfszjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getsfyhf=cf.fillNull(rs.getString("sfyhf"));
		getzxszbz=cf.fillNull(rs.getString("zxszbz"));
		yhfszjlh=cf.fillNull(rs.getString("yhfszjlh"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	//工程验收照片
	ls_sql="delete from  crm_gcyszp ";
	ls_sql+=" where ysjlh='"+djjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from  crm_gcjddjjl ";
	ls_sql+=" where djjlh='"+djjlh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="update crm_khxx set sjkgrq=null,gcjdbm=?,jhybgcrq=null,jhzqsj=null";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ygcjdbm);
	ps.executeUpdate();
	ps.close();

	if (sfszhf.equals("1") && getsfyhf.equals("N") && getzxszbz.equals("Y"))//自动设置回访
	{
		ls_sql="update crm_khxx set sfxhf=?,hflxbm=?,hfrq=? ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,ysfxhf);
		ps.setString(2,yhflxbm);
		ps.setDate(3,yhfrq);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from crm_hfszjl ";
		ls_sql+=" where  hfszjlh='"+hfszjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql=" update crm_hfszjl set zxszbz='Y'";	
		ls_sql+=" where hfszjlh='"+yhfszjlh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>