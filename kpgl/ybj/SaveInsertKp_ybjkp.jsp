<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String kpr=request.getParameter("kpr");
String qssj=request.getParameter("qssj");
String jzsj=request.getParameter("jzsj");

Connection conn  = null;
PreparedStatement ps=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	ls_sql="delete from kp_ybjkp  ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into kp_ybjkp ( sgd,ybjsl,cgcs,cgsbcs,cgcgcs,tsjjf,ybjpf,qssj,jzsj,kpr ) ";
	ls_sql+=" select dwbh,0,0,0,0,0,0,TO_DATE('"+qssj+"','YYYY-MM-DD'),TO_DATE('"+jzsj+"','YYYY-MM-DD'),? ";
	ls_sql+=" from sq_dwxx ";
	ls_sql+=" where dwlx in('3','8') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kpr);
	ps.executeUpdate();
	ps.close();

	//提供样板间数量
	ls_sql="update kp_ybjkp set ybjsl=(";
	ls_sql+=" select count(*)";
	ls_sql+=" from crm_khxx";
	ls_sql+=" where ybjbz='Y' and crm_khxx.sgd=kp_ybjkp.sgd";
	ls_sql+=" and ybjdjsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and ybjdjsj<=TO_DATE('"+jzsj+"','YYYY-MM-DD')";
	ls_sql+=" )";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//参观失败次数
	ls_sql="update kp_ybjkp set cgsbcs=(";
	ls_sql+=" select count(*)";
	ls_sql+=" from ybj_fpybj,crm_khxx";
	ls_sql+=" where ybj_fpybj.khbh=crm_khxx.khbh and crm_khxx.sgd=kp_ybjkp.sgd";
	ls_sql+=" and ((cgmyd='N' and hsjg='Y') or (cgmyd='Y' and hsjg='N') or (cgmyd='N' and hsjg is null))  ";
	ls_sql+=" and fpsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and fpsj<=TO_DATE('"+jzsj+"','YYYY-MM-DD')";
	ls_sql+=" )";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//参观成功次数
	ls_sql="update kp_ybjkp set cgcgcs=(";
	ls_sql+=" select count(*)";
	ls_sql+=" from ybj_fpybj,crm_khxx";
	ls_sql+=" where ybj_fpybj.khbh=crm_khxx.khbh and crm_khxx.sgd=kp_ybjkp.sgd";
	ls_sql+=" and ((cgmyd='Y' and hsjg='Y') or (cgmyd='N' and hsjg='N') or (cgmyd='Y' and hsjg is null))  ";
	ls_sql+=" and fpsj>=TO_DATE('"+qssj+"','YYYY-MM-DD')";
	ls_sql+=" and fpsj<=TO_DATE('"+jzsj+"','YYYY-MM-DD')";
	ls_sql+=" )";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="update kp_ybjkp set cgcs=cgsbcs+cgcgcs";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	out.println("存盘成功！");
}
catch (Exception e) {
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>