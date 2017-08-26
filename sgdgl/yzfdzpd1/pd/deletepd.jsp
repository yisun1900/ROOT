<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String[] khbh = request.getParameterValues("khbh");
long xuhao=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();


	conn.setAutoCommit(false);

	String kpjlh=null;
	String deflbm=null;
	String shzzb=null;
	double qye=0;
	double jrpde=0;

	for (int i=0;i<khbh.length ;i++ )
	{
		String ssfgs=null;
		String sgd=null;
		String sgbz=null;
		ls_sql="select fgsbh,sgd,sgbz";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ssfgs=cf.fillNull(rs.getString("fgsbh"));
			sgd=cf.fillNull(rs.getString("sgd"));
			sgbz=cf.fillNull(rs.getString("sgbz"));
		}
		rs.close();
		ps.close();

		ls_sql="select xuhao,deflbm,shzzb,qye,jrpde";
		ls_sql+=" from  pd_pdjl";
		ls_sql+=" where khbh='"+khbh[i]+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xuhao=rs.getLong("xuhao");
			deflbm=cf.fillNull(rs.getString("deflbm"));
			shzzb=cf.fillNull(rs.getString("shzzb"));
			qye=rs.getDouble("qye");
			jrpde=rs.getDouble("jrpde");
		}
		else{
			conn.rollback();
			out.println("错误！不存在的派单记录："+khbh[i]);
			return;
		}
		rs.close();
		rs.close();

		int zygrsl=0;
		if (qye<=100000)
		{
			zygrsl=2;
		}
		else if (qye>100000 & qye<=200000)
		{
			zygrsl=3;
		}
		else if (qye>200000 & qye<=300000)
		{
			zygrsl=4;
		}
		else
		{
			zygrsl=5;
		}

		long maxxuhao=0;
		ls_sql="select max(xuhao)";
		ls_sql+=" from  pd_pdjl";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			maxxuhao=rs.getLong(1);
		}
		rs.close();
		ps.close();

		if (maxxuhao!=xuhao)
		{
			conn.rollback();
			out.println("错误！只能删除最新的派单记录："+maxxuhao);
			return;
		}

			
		ls_sql="delete from pd_pdjl ";
		ls_sql+=" where khbh='"+khbh[i]+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="update crm_khxx set pdsj=null,pdr=null,sgd=null,sgbz=null,pdsm=null,pdclzt='1',jlbz=null,pdbbh=null";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update sq_sgd set sgdpdjf=NVL(sgdpdjf,0)-1,mqzsgds=mqzsgds-1";
		ls_sql+=" where sgd ='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update sq_bzxx set bzpdjf=NVL(bzpdjf,0)-1,mqzsgds=mqzsgds-1,yygrsl=yygrsl-"+zygrsl+",kygrsl=kygrsl+"+zygrsl;
		ls_sql+=" where  bzmc ='"+sgbz+"' and sgd ='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
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