<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String xtrzip=request.getRemoteHost();

String newssfgs=cf.GB2Uni(request.getParameter("newssfgs"));
String oldssfgs=cf.GB2Uni(request.getParameter("oldssfgs"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String newdqbm=null;
	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+newssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		newdqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);


///////////////////////////////////////	


	//修改：客户报价项目明细
	ls_sql="update bj_bjxmmx set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：工程量明细
	ls_sql="update bj_gclmx set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：客户工料分析表
	ls_sql="update bj_khglfxb set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：临时报价--项目明细
	ls_sql="update bj_mbbjxmmx set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：临时报价--工料分析表
	ls_sql="update bj_mbglfxb set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：临时报价--工程量明细
	ls_sql="update bj_mbgclmx set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：客户报价项目明细
	ls_sql="update bj_bjxmmxq set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：工程量明细
	ls_sql="update bj_gclmxq set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：客户工料分析表
	ls_sql="update bj_khglfxbq set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：客户报价项目明细
	ls_sql="update bj_bjxmmxh set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：工程量明细
	ls_sql="update bj_gclmxh set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	//修改：客户工料分析表
	ls_sql="update bj_khglfxbh set dqbm=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newdqbm);
	ps.executeUpdate();
	ps.close();

	

	//修改：咨询客户信息表（crm_zxkhxx）
	ls_sql="update crm_zxkhxx set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();


	//修改：咨询客户服务记录（crm_zxkhfwjl）
	ls_sql="update crm_zxkhfwjl set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：店面接单记录（crm_dmjdjl）
	ls_sql="update crm_dmjdjl set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：设计师接单记录（crm_sjsjdjl）
	ls_sql="update crm_sjsjdjl set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：咨询回访记录（crm_zxhfjl）
	ls_sql="update crm_zxhfjl set ssfgs=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();


	//修改：客户信息表（crm_khxx）
	ls_sql="update crm_khxx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();




	//修改：客户付款记录（cw_khfkjl）
	ls_sql="update cw_khfkjl set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();





	//修改：集成订单（jc_jcdd）
	ls_sql="update jc_jcdd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：主材订单（jc_zcdd）
	ls_sql="update jc_zcdd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：主材订单明细（jc_zcddmx）
	ls_sql="update jc_zcddmx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：主材增减项（jc_zczjx）
	ls_sql="update jc_zczjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：主材增减项（jc_zczjx）
	ls_sql="update jc_zczjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：木门预订单（jc_mmydd）
	ls_sql="update jc_mmydd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：木门增减项（jc_mmzjx）
	ls_sql="update jc_mmzjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：家具订单（jc_jjdd）
	ls_sql="update jc_jjdd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：家具增减项（jc_jjzjx）
	ls_sql="update jc_jjzjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：橱柜订单（jc_cgdd）
	ls_sql="update jc_cgdd set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：橱柜增减项（jc_cgzjx）
	ls_sql="update jc_cgzjx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();

	//修改：橱柜增减项（jc_cgzjx）
	ls_sql="update cw_qmjzmx set fgsbh=?";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,newssfgs);
	ps.executeUpdate();
	ps.close();


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("更换分公司成功！");
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






