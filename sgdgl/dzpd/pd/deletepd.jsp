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
		String fgsbh=null;
		String sgd=null;
		ls_sql="select fgsbh,sgd";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
			sgd=cf.fillNull(rs.getString("sgd"));
		}
		rs.close();
		ps.close();

		//注意：不能从派单记录（pd_pdjl）中取【考评记录号】，可能已到新的考评周期
		ls_sql="select kpjlh";
		ls_sql+=" from  kp_pdkpjl ";
		ls_sql+=" where  fgsbh='"+fgsbh+"' and zxbz='Y' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			kpjlh=rs.getString("kpjlh");
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


		if (deflbm.equals("1"))//1：大单
		{
			//已接大单数
			ls_sql="update kp_pdkpmx set yjddje=yjddje-"+jrpde+"/10000.0,syddje=syddje+"+jrpde+"/10000.0";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("2"))//2：中单
		{
			ls_sql="update kp_pdkpmx set yjzdje=yjzdje-"+jrpde+"/10000.0,syzdje=syzdje+"+jrpde+"/10000.0";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("3"))//3：小单
		{
			ls_sql="update kp_pdkpmx set yjxdje=yjxdje-"+jrpde+"/10000.0,syxdje=syxdje+"+jrpde+"/10000.0";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
			
		ls_sql="update kp_pdkpmx set yjdze=yjddje+yjzdje+yjxdje,sydze=syddje+syzdje+syxdje";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

			
		ls_sql="delete from pd_pdjl ";
		ls_sql+=" where khbh='"+khbh[i]+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
		
		ls_sql="delete from pd_pdyxjjl ";
		ls_sql+=" where khbh='"+khbh[i]+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set pdsj=null,pdr=null,sgd=null,sgbz=null,pdsm=null,pdclzt='1',jlbz=null";
		ls_sql+=" where khbh='"+khbh[i]+"'";
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