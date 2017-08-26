<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] jsjlh = request.getParameterValues("jsjlh");
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	String jsjd=null;
	String spjl=null;
	String khxm=null;


	conn.setAutoCommit(false);

	for (int i=0;i<jsjlh.length ;i++ )
	{
		String khbh=null;
		String sgd=null;
		double oldkzb=0;
		ls_sql="select khbh,sgd,kzb";
		ls_sql+=" from  cw_sgdwgjsjlKB";
		ls_sql+=" where jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			khbh=rs.getString("khbh");
			sgd=rs.getString("sgd");
			oldkzb=rs.getDouble("kzb");
		}
		else{
			conn.rollback();
			out.println("错误！结算记录号["+jsjlh[i]+"]不存在");
			return;
		}
		rs.close();
		ps.close();

		String gdjsjd=null;
		ls_sql="select gdjsjd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		}
		rs.close();
		ps.close();

		if (!gdjsjd.equals("8"))//8:完工结算
		{
			conn.rollback();
			out.println("错误！结算进度不正确");
			return;
		}



		ls_sql="update sq_sgd set zbj=zbj-?";
		ls_sql+=" where sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,oldkzb);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update crm_khxx set gdjsjd='7',gdjsjlh=null";//7:交齐完工结算资料
		ls_sql+=" where  khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_gdjkjl set gdjsjd='0',gdjsjlh=null";
		ls_sql+=" where khbh='"+khbh+"' and gdjsjd='1' and gdjsjlh='"+jsjlh[i]+"' and scbz='N'";//0：未结算；1：已结算
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_kqtkjl set jsbz='N',jsjlh=null";
		ls_sql+=" where sgd='"+sgd+"' and jsbz='Y' and jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cl_ckd set jsbz='N',jsjlh=null";
		ls_sql+=" where cl_ckd.khbh='"+khbh+"' and cl_ckd.jsbz='Y' and jsjlh='"+jsjlh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="delete from cw_sgdwgjsjlKB ";
		ls_sql+=" where  jsjlh='"+jsjlh[i]+"'";
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>