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

	conn.setAutoCommit(false);

	String khbh=null;
	String oldsgd=null;
	String oldsgbz=null;
	String oldpdclzt=null;
	String newsgd=null;
	String deflbm=null;
	double qye=0;
	double oldkzbbfb=0;
	double newkzbbfb=0;
	double oldjrpde=0;
	double newjrpde=0;
	ls_sql="select khbh,oldsgd,oldsgbz,oldpdclzt,newsgd,deflbm,qye,oldkzbbfb,newkzbbfb,oldjrpde,newjrpde";
	ls_sql+=" from  pd_hsgdjl ";
	ls_sql+=" where  "+chooseitem;
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		khbh=rs1.getString("khbh");
		oldsgd=rs1.getString("oldsgd");
		oldsgbz=rs1.getString("oldsgbz");
		oldpdclzt=rs1.getString("oldpdclzt");
		newsgd=rs1.getString("newsgd");
		deflbm=rs1.getString("deflbm");
		qye=rs1.getDouble("qye");
		oldkzbbfb=rs1.getDouble("oldkzbbfb");
		newkzbbfb=rs1.getDouble("newkzbbfb");
		oldjrpde=rs1.getDouble("oldjrpde");
		newjrpde=rs1.getDouble("newjrpde");

		String fgsbh=null;
		ls_sql="select fgsbh,sgd";
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
		String kpjlh=null;
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

	
		ls_sql="delete from pd_hsgdjl ";
		ls_sql+=" where khbh='"+khbh+"' and newsgd='"+newsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update crm_khxx set sgd=?,sgbz=?,pdclzt=?";//8：换施工队
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,oldsgd);
		ps.setString(2,oldsgbz);
		ps.setString(3,oldpdclzt);
		ps.executeUpdate();
		ps.close();
	
		if (oldpdclzt.equals("5") || oldpdclzt.equals("6"))//5：电子派单；6：特权派单；8：换施工队
		{
			ls_sql="update pd_pdjl set hfjl='0'";//0：派单；3：拒单；5：换施工队
			ls_sql+=" where  khbh='"+khbh+"' and sgd='"+oldsgd+"' ";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}


		//修改派单指标＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

		//修改：原施工队
		if (deflbm.equals("1"))//1：大单
		{
			//已接大单数
			ls_sql="update kp_pdkpmx set yjddje=yjddje-("+oldjrpde+"/10000.0),syddje=syddje+("+oldjrpde+"/10000.0)";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+oldsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("2"))//2：中单
		{
			ls_sql="update kp_pdkpmx set yjzdje=yjzdje-("+oldjrpde+"/10000.0),syzdje=syzdje+("+oldjrpde+"/10000.0)";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+oldsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("3"))//3：小单
		{
			ls_sql="update kp_pdkpmx set yjxdje=yjxdje-("+oldjrpde+"/10000.0),syxdje=syxdje+("+oldjrpde+"/10000.0)";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+oldsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
				
		ls_sql="update kp_pdkpmx set yjdze=yjddje+yjzdje+yjxdje,sydze=syddje+syzdje+syxdje";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+oldsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//修改：新施工队
		if (deflbm.equals("1"))//1：大单
		{
			//已接大单数
			ls_sql="update kp_pdkpmx set yjddje=yjddje-("+newjrpde+"/10000.0),syddje=syddje+("+newjrpde+"/10000.0)";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+newsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("2"))//2：中单
		{
			ls_sql="update kp_pdkpmx set yjzdje=yjzdje-("+newjrpde+"/10000.0),syzdje=syzdje+("+newjrpde+"/10000.0)";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+newsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("3"))//3：小单
		{
			ls_sql="update kp_pdkpmx set yjxdje=yjxdje-("+newjrpde+"/10000.0),syxdje=syxdje+("+newjrpde+"/10000.0)";
			ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+newsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}

				
		ls_sql="update kp_pdkpmx set yjdze=yjddje+yjzdje+yjxdje,sydze=syddje+syzdje+syxdje";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+newsgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//修改派单指标＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝完成
	}
	rs1.close();
	ps1.close();


	conn.commit();


	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除：换施工队成功！");
	window.close();
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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