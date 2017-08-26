<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yhkl=null;
String kdlbz=null;
String yhmc=null;
String yhdlm=null;
String lxfs=null;
String fwdz=null;
 String zlsmqk=null;
 String oldyhdlm=null;


yhdlm=cf.GB2Uni(request.getParameter("yhdlm"));
yhmc=cf.GB2Uni(request.getParameter("yhmc"));
yhkl=cf.GB2Uni(request.getParameter("yhkl"));
kdlbz=cf.GB2Uni(request.getParameter("kdlbz"));
zlsmqk=cf.GB2Uni(request.getParameter("bz"));
lxfs=cf.GB2Uni(request.getParameter("dh"));
//out.print(yhdlm);
//out.print(yhkl);
String whereygbh=null;
whereygbh=request.getParameter("hth");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	int mark=0;
	ls_sql="select yhdlm from crm_khxx where hth='"+whereygbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		oldyhdlm=rs.getString("yhdlm");
	}
	rs.close();
	ps.close();
	
	//out.print(oldyhdlm);
	if(!(yhdlm.equals(oldyhdlm)))//判断该用户名是否已存在
	{

		ls_sql="select count(*) from crm_khxx where yhdlm='"+yhdlm+"'";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			mark=rs.getInt(1);
		}
		rs.close();
		ps.close();
			
		if(mark>0)
		{
			out.print("该用户名已存在！");
			return;
		}
	}

	ls_sql="update crm_khxx set kdlbz=?,yhkl=?,lxfs=?,bz=?,yhdlm=?";
	ls_sql+=" where  (hth='"+whereygbh+"')  ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kdlbz);
	ps.setString(2,yhkl);
	ps.setString(3,lxfs);
	ps.setString(4,zlsmqk);
	ps.setString(5,yhdlm);
    ps.executeUpdate();
	ps.close();
	
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>