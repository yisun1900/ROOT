<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String hfr=(String)session.getAttribute("yhdlm");
String dwbh=(String)session.getAttribute("dwbh");

String[] khbh=request.getParameterValues("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();
	conn.setAutoCommit(false);

	String oldsgd=null;
	String deflbm=null;
	int depjz=0;
	int qye=0;
	for (int i=0;i<khbh.length ;i++ )
	{
		ls_sql=" select sgd,qye,deflbm,depjz";
		ls_sql+=" from  crm_khxx,kp_deflbm";
		ls_sql+=" where khbh='"+khbh[i]+"'";//
		ls_sql+=" and qye>dedy and qye<dexy";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			oldsgd=rs.getString("sgd");
			qye=rs.getInt("qye");
			deflbm=rs.getString("deflbm");
			depjz=rs.getInt("depjz");
		}
		rs.close();
		ps.close();


		if (deflbm.equals("1"))//1：大单
		{
			//已接大单数
			ls_sql="update kp_sgdkpjg set yjdds=yjdds-"+qye+"/"+depjz+",yjddje=yjddje-"+qye;
			ls_sql+=" where kpjlh=(select kpjlh from kp_kpjl where zxbz='Y') ";
			ls_sql+=" and sgd='"+oldsgd+"'";
		}
		else if (deflbm.equals("2"))//2：中单
		{
			//已接大单数
			ls_sql="update kp_sgdkpjg set yjzds=yjzds-"+qye+"/"+depjz+",yjzdje=yjzdje-"+qye;
			ls_sql+=" where kpjlh=(select kpjlh from kp_kpjl where zxbz='Y') ";
			ls_sql+=" and sgd='"+oldsgd+"'";
		}
		else if (deflbm.equals("3"))//3：小单
		{
			//已接大单数
			ls_sql="update kp_sgdkpjg set yjxds=yjxds-"+qye+"/"+depjz+",yjxdje=yjxdje-"+qye;
			ls_sql+=" where kpjlh=(select kpjlh from kp_kpjl where zxbz='Y') ";
			ls_sql+=" and sgd='"+oldsgd+"'";
		}
//		out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		
		ls_sql="delete from pd_pdjl ";
		ls_sql+=" where khbh='"+khbh[i]+"' and hfjl='0' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set pdsj=null,pdr=null,sgd=null,sgbz=null,pdsm=null,pdclzt='1',jlbz=null,zjxm=null";
		ls_sql+=" where khbh='"+khbh[i]+"' and pdclzt='2' ";
		ps= conn.prepareStatement(ls_sql);
		if (ps.executeUpdate()!=1)
		{
			conn.rollback();
			out.println("错误！删除失败");
			return;
		}
		ps.close();
	}

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除派单成功！");
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