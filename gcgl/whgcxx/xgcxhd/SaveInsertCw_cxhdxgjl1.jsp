<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String xgjlh=request.getParameter("xgjlh");
String khbh=request.getParameter("khbh");
String khxm=cf.GB2Uni(request.getParameter("khxm"));
String fgsbh=request.getParameter("fgsbh");

String xgqcxhd=cf.GB2Uni(request.getParameter("xgqcxhd"));
String xgqcxhdbmxq=cf.GB2Uni(request.getParameter("xgqcxhdbmxq"));
String xgqcxhdbmzh=cf.GB2Uni(request.getParameter("xgqcxhdbmzh"));

String xghcxhd=cf.GB2Uni(request.getParameter("xghcxhd"));
String xghcxhdbmxq=cf.GB2Uni(request.getParameter("xghcxhdbmxq"));
String xghcxhdbmzh=cf.GB2Uni(request.getParameter("xghcxhdbmzh"));

String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
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
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	
	conn.setAutoCommit(false);

	ls_sql ="insert into cw_cxhdxgjl (xgjlh,khbh,khxm,fgsbh,xgqcxhd,xgqcxhdbmxq,xgqcxhdbmzh,xghcxhd,xghcxhdbmxq,xghcxhdbmzh,lrr,lrsj,lrbm,bz) ";
	ls_sql+=" values(?,?,?,?,?,?,?,?,?,?   ,?,SYSDATE,?,? )";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,xgjlh);
	ps.setString(2,khbh);
	ps.setString(3,khxm);
	ps.setString(4,fgsbh);
	ps.setString(5,xgqcxhd);
	ps.setString(6,xgqcxhdbmxq);
	ps.setString(7,xgqcxhdbmzh);
	ps.setString(8,xghcxhd);
	ps.setString(9,xghcxhdbmxq);
	ps.setString(10,xghcxhdbmzh);

	ps.setString(11,lrr);
	ps.setString(12,lrbm);
	ps.setString(13,bz);

	ps.executeUpdate();
	ps.close();


	ls_sql=" update crm_khxx set cxhdbm=?,cxhdbmxq=?,cxhdbmzh=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghcxhd);
	ps.setString(2,xghcxhdbmxq);
	ps.setString(3,xghcxhdbmzh);
	ps.executeUpdate();
	ps.close();

	ls_sql=" update cw_qmjzmx set cxhdbm=?,cxhdbmxq=?,cxhdbmzh=? ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps=conn.prepareStatement(ls_sql);
	ps.setString(1,xghcxhd);
	ps.setString(2,xghcxhdbmxq);
	ps.setString(3,xghcxhdbmzh);
	ps.executeUpdate();
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
	out.print("<BR>存盘失败,发生意外: " + e);
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