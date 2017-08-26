<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String chooseitem = request.getParameter("chooseitem");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String kpjlh=null;
	String deflbm=null;
	String shzzb=null;
	String hfjl=null;
	double qye=0;
	String khbh=null;
	String sgd=null;
	String sgbz=null;
	String pdr=null;
	String pdsm=null;
	String jlbz=null;
	java.sql.Date pdsj=null;
	String kczbbl=null;
	double kcpde=0;

	conn.setAutoCommit(false);

	long xuhao=0;
	ls_sql=" select deflbm,shzzb,hfjl,qye,khbh,sgd,pdsj,pdr,sgbz,pdsm,jlbz,kczbbl,kcpde,xuhao";
	ls_sql+=" from pd_pdjl ";
	ls_sql+=" where  "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		deflbm=cf.fillNull(rs1.getString("deflbm"));
		shzzb=cf.fillNull(rs1.getString("shzzb"));
		hfjl=cf.fillNull(rs1.getString("hfjl"));
		qye=rs1.getDouble("qye");
		khbh=cf.fillNull(rs1.getString("khbh"));
		sgd=cf.fillNull(rs1.getString("sgd"));
		pdsj=rs1.getDate("pdsj");
		pdr=cf.fillNull(rs1.getString("pdr"));
		sgbz=cf.fillNull(rs1.getString("sgbz"));
		pdsm=cf.fillNull(rs1.getString("pdsm"));
		jlbz=cf.fillNull(rs1.getString("jlbz"));
		kczbbl=cf.fillNull(rs1.getString("kczbbl"));
		kcpde=rs1.getDouble("kcpde");
		xuhao=rs1.getLong("xuhao");

		String fgsbh=null;
		ls_sql="select fgsbh";
		ls_sql+=" from  crm_khxx";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			fgsbh=cf.fillNull(rs.getString("fgsbh"));
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

		long maxxuhao=0;
		ls_sql="select max(xuhao)";
		ls_sql+=" from  pd_pdjl";
		ls_sql+=" where  khbh='"+khbh+"'";
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

		if (!hfjl.equals("3"))//0：未拒单；3：拒单
		{
			conn.rollback();
			out.println("错误！未拒单:"+khbh);
			return;
		}

		ls_sql="update pd_pdjl set hfjl='0',kczbbl=null,kcpde=null,jjyy=null,dwbh=null,hfr=null,hfsj=null,sfhs=null";
		ls_sql+=" where  khbh='"+khbh+"' and sgd='"+sgd+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();


		if (deflbm.equals("1"))//1：大单
		{
			//已接大单数
			ls_sql="update kp_pdkpmx set yjddje=yjddje-("+kcpde+"/10000.0),syddje=syddje+("+kcpde+"/10000.0)";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("2"))//2：中单
		{
			ls_sql="update kp_pdkpmx set yjzdje=yjzdje-("+kcpde+"/10000.0),syzdje=syzdje+("+kcpde+"/10000.0)";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("3"))//3：小单
		{
			ls_sql="update kp_pdkpmx set yjxdje=yjxdje-("+kcpde+"/10000.0),syxdje=syxdje+("+kcpde+"/10000.0)";
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

		ls_sql="update crm_khxx set pdsj=?,pdr=?,sgd=?,sgbz=?,pdsm=?,pdclzt='5',jlbz=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,pdsj);
		ps.setString(2,pdr);
		ps.setString(3,sgd);
		ps.setString(4,sgbz);
		ps.setString(5,pdsm);
		ps.setString(6,jlbz);
		ps.executeUpdate();
		ps.close();
	}
	rs1.close();
	ps1.close();


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
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>