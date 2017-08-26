<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	//木门		
	ls_sql=" delete from jc_mmydmx ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	ls_sql=" delete from jc_mmccd ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	ls_sql=" delete from jc_mmdgdmx ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_wjjddmx ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_blddmx ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_mmzjx ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" delete from jc_mmzjxmx ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_blzjxmx ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_mmazfkd ";
	ls_sql+=" where  yddbh in(select yddbh from jc_mmydd where  khbh='"+khbh+"' and clzt in('00','01','02','03'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_mmydd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt in('00','01','02','03')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//橱柜
	ls_sql=" delete from jc_cgsjsgpjl ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_cgsjslxjl ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_cgazsjjl ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	
	
	ls_sql=" delete from jc_cgazjl ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_cgdtmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_cgzjxmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_cgzjx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



	ls_sql=" delete from jc_yfcgdtmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql=" delete from jc_yfjgyqsm ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_yfsjbf ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_yfdgsp ";
	ls_sql+=" where  ddbh in(select ddbh from jc_cgdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_cgdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//家具
	ls_sql=" delete from jc_jjyddmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_jjdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_jjgtmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_jjdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_gtbjmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_jjdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_gtpjmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_jjdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_jjxcmmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_jjdd where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql=" delete from jc_jjdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt in('00','01','03','05','07','09','11')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//主材
	ls_sql="delete from jc_zczjxmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_zcdd where  khbh='"+khbh+"' and clzt in('00','03','05'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_zczjx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_zcdd where  khbh='"+khbh+"' and clzt in('00','03','05'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_zcddmx ";
	ls_sql+=" where  ddbh in(select ddbh from jc_zcdd where  khbh='"+khbh+"' and clzt in('00','03','05'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from jc_zcdd ";
	ls_sql+=" where  ddbh in(select ddbh from jc_zcdd where  khbh='"+khbh+"' and clzt in('00','03','05'))";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	
	ls_sql=" delete from jc_zcdd ";
	ls_sql+=" where  khbh='"+khbh+"' and clzt in('00','03','05')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();




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
	out.print("存盘失败,发生意外: " + ls_sql);
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