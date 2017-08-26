<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String kczbbl=null;
String jjyy=null;
java.sql.Date hfsj=null;
String hfr=null;
kczbbl=cf.GB2Uni(request.getParameter("kczbbl"));
jjyy=cf.GB2Uni(request.getParameter("jjyy"));
ls=request.getParameter("hfsj");
try{
	if (!(ls.equals("")))  hfsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量hfsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
hfr=cf.GB2Uni(request.getParameter("hfr"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String deflbm=null;
	String shzzb=null;
	String hfjl=null;
	double qye=0;
	ls_sql=" select deflbm,shzzb,hfjl,qye";
	ls_sql+=" from pd_pdjl ";
	ls_sql+=" where  khbh='"+khbh+"' and sgd='"+sgd+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		deflbm=cf.fillNull(rs.getString("deflbm"));
		shzzb=cf.fillNull(rs.getString("shzzb"));
		hfjl=cf.fillNull(rs.getString("hfjl"));
		qye=rs.getDouble("qye");
	}
	else{
		out.println("错误！不存在的派单记录");
		return;
	}
	rs.close();
	ps.close();

	if (!hfjl.equals("0"))//0：未拒单；3：拒单
	{
		out.println("错误！已拒单");
		return;
	}

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

	double kcpde=0;//扣除派单额

	if (shzzb.equals("Y"))//Y：占指标；N：不占指标
	{
		if (kczbbl.equals("0"))//0：不扣指标；1：扣除单倍派单额；2：扣除2倍派单额；3：扣除3倍派单额
		{
			kcpde=-1*qye;
		}
		else if (kczbbl.equals("1"))
		{
			kcpde=0;
		}
		else if (kczbbl.equals("2"))
		{
			kcpde=qye;
		}
		else if (kczbbl.equals("3"))
		{
			kcpde=qye*2;
		}
	}
	else{
		if (kczbbl.equals("0"))//0：不扣指标；1：扣除单倍派单额；2：扣除2倍派单额；3：扣除3倍派单额
		{
			kcpde=0;
		}
		else if (kczbbl.equals("1"))
		{
			kcpde=qye;
		}
		else if (kczbbl.equals("2"))
		{
			kcpde=qye*2;
		}
		else if (kczbbl.equals("3"))
		{
			kcpde=qye*3;
		}
	}

	conn.setAutoCommit(false);

	ls_sql="update pd_pdjl set hfjl='3',kczbbl=?,kcpde=?,jjyy=?,dwbh=?,hfr=?,hfsj=?,sfhs='N'";//0：派单；3：拒单；
	ls_sql+=" where  khbh='"+khbh+"' and sgd='"+sgd+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,kczbbl);
	ps.setDouble(2,kcpde);
	ps.setString(3,jjyy);
	ps.setString(4,dwbh);
	ps.setString(5,hfr);
	ps.setDate(6,hfsj);
	ps.executeUpdate();
	ps.close();

	if (deflbm.equals("1"))//1：大单
	{
		//已接大单数
		ls_sql="update kp_pdkpmx set yjddje=yjddje+("+kcpde+"/10000.0),syddje=syddje-("+kcpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("2"))//2：中单
	{
		ls_sql="update kp_pdkpmx set yjzdje=yjzdje+("+kcpde+"/10000.0),syzdje=syzdje-("+kcpde+"/10000.0)";
		ls_sql+=" where kpjlh='"+kpjlh+"' and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("3"))//3：小单
	{
		ls_sql="update kp_pdkpmx set yjxdje=yjxdje+("+kcpde+"/10000.0),syxdje=syxdje-("+kcpde+"/10000.0)";
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

	ls_sql="update crm_khxx set pdsj=null,pdr=null,sgd=null,sgbz=null,pdsm=null,pdclzt='7'";//1：申请派单；2：人工派单；5：电子派单；6：特权派单；7：拒单；8：换施工队；4：不许修改派单
	ls_sql+=" where khbh='"+khbh+"' and pdclzt='5' ";
	ps= conn.prepareStatement(ls_sql);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("错误！存盘失败");
		return;
	}
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
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>