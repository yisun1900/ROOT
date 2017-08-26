<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String[] pxmxbh = request.getParameterValues("pxmxbh");
//String[] pxjhbh = request.getParameterValues("pxjhbh");
String mxwc=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	for(int i=0;i<pxmxbh.length;i++){
		long zpxrs=0;//计划总人数
		double zpxfy=0;//计划总费用
		long pxrs=0;//明细人数
		double pxfy=0;//明细费用
		String pxjhbh=null;
		long zrs=0;
		double zfy=0;

//取出要还原的数据
		ls_sql="select pxfy,pxrs,pxjhbh";
		ls_sql+=" from  rs_pxzjmx";
		ls_sql+=" where  pxmxbh='"+pxmxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			pxfy=rs.getDouble("pxfy");
			pxrs=rs.getLong("pxrs");
			pxjhbh=rs.getString("pxjhbh");
		}
		else{
			out.println("错误！这条记录不存在");
			return;
		}
		rs.close();
		ps.close();

		ls_sql="select sjpxfy,sjpxrs";
		ls_sql+=" from  rs_pxjhjg";
		ls_sql+=" where  pxjhbh='"+pxjhbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			zpxfy=rs.getDouble("sjpxfy");
			zpxrs=rs.getLong("sjpxrs");
		}
		else{
			out.println("错误！这条记录不存在");
			return;
		}
		rs.close();
		ps.close();
		
		zrs=zpxrs-pxrs;
		zfy=zpxfy-pxfy;

//还原培训计划
		conn.setAutoCommit(false);

		ls_sql="update rs_pxjhjg set sjpxfy=?,sjpxrs=? ";
		ls_sql+=" where pxjhbh='"+pxjhbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,zfy);
		ps.setLong(2,zrs);
		ps.executeUpdate();
		ps.close();

		ls_sql="update rs_pxjhmx set mxwc=? ";
		ls_sql+=" where  pxmxbh='"+pxmxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,mxwc);
		ps.executeUpdate();
		ps.close();


		ls_sql="delete from rs_pxzjmx where pxmxbh='"+pxmxbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		conn.commit();
	}
	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！请刷新列表显示删除后结果。");
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
