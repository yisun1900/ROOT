<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;

String jlbz=cf.GB2Uni(request.getParameter("jlbz"));
String sgd=cf.GB2Uni(request.getParameter("sgd"));
String sgbz=cf.GB2Uni(request.getParameter("sgbz"));
String pdr=cf.GB2Uni(request.getParameter("pdr"));
String pdsm=cf.GB2Uni(request.getParameter("pdsm"));
String zjxm=cf.GB2Uni(request.getParameter("zjxm"));
java.sql.Date pdsj=null;
ls=request.getParameter("pdsj");
try{
	if (!(ls.equals("")))  pdsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量pdsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[派单时间]类型转换发生意外:"+e);
	return;
}

String wherekhbh=cf.GB2Uni(request.getParameter("wherekhbh"));
String kpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String oldsgd=null;
	String oldjlbz=null;
	String deflbm=null;
	int depjz=0;
	int qye=0;
	ls_sql=" select sgd,jlbz,qye,deflbm,depjz";
	ls_sql+=" from  crm_khxx,kp_dxdbm";
	ls_sql+=" where crm_khxx.fgsbh=kp_dxdbm.fgsbh and khbh='"+wherekhbh+"'";
	ls_sql+=" and qye>=dedy and qye<dexy";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		oldsgd=rs.getString("sgd");
		oldjlbz=rs.getString("jlbz");
		qye=rs.getInt("qye");
		deflbm=rs.getString("deflbm");
		depjz=rs.getInt("depjz");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	ls_sql="delete from pd_pdjl ";
	ls_sql+=" where khbh='"+wherekhbh+"' and hfjl='0' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into pd_pdjl (khbh,sgd,sgbz,pdsj,pdr,hfjl,jlbz,zjxm) ";
	ls_sql+=" values (?,?,?,?,?,'0',?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,wherekhbh);
	ps.setString(2,sgd);
	ps.setString(3,sgbz);
	ps.setDate(4,pdsj);
	ps.setString(5,pdr);
	ps.setString(6,jlbz);
	ps.setString(7,zjxm);
	ps.executeUpdate();
	ps.close();

	String dlx="";


//0+正常派单&5+大单抵小单&6+小单抵大单&1+回单奖励&2+公司奖励&3+设计师指定派单&4+客户指定派单

	//施工队考评+++++++++++++++++++++
	if (oldsgd!=null)
	{
		if (deflbm.equals("1"))//1：大单
		{
			ls_sql="update kp_yzfsgdkpjg set yjddje=yjddje-"+qye+",syddje=syddje+"+qye;
			ls_sql+=" where kpjlh="+kpjlh;
			ls_sql+=" and sgd='"+oldsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		else if (deflbm.equals("2"))//2：中单
		{
			ls_sql="update kp_yzfsgdkpjg set yjzdje=yjzdje-"+qye+",syzdje=syzdje+"+qye;
			ls_sql+=" where kpjlh="+kpjlh;
			ls_sql+=" and sgd='"+oldsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		else if (deflbm.equals("3"))//3：小单
		{
			ls_sql="update kp_yzfsgdkpjg set yjxdje=yjxdje-"+qye+",syxdje=syxdje+"+qye;
			ls_sql+=" where kpjlh="+kpjlh;
			ls_sql+=" and sgd='"+oldsgd+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
	}

	
	if (deflbm.equals("1"))//1：大单
	{
		//已接大单数
		ls_sql="update kp_yzfsgdkpjg set yjddje=yjddje+"+qye+",syddje=syddje-"+qye;
		ls_sql+=" where kpjlh="+kpjlh;
		ls_sql+=" and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("2"))//2：中单
	{
		ls_sql="update kp_yzfsgdkpjg set yjzdje=yjzdje+"+qye+",syzdje=syzdje-"+qye;
		ls_sql+=" where kpjlh="+kpjlh;
		ls_sql+=" and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (deflbm.equals("3"))//3：小单
	{
		ls_sql="update kp_yzfsgdkpjg set yjxdje=yjxdje+"+qye+",syxdje=syxdje-"+qye;
		ls_sql+=" where kpjlh="+kpjlh;
		ls_sql+=" and sgd='"+sgd+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	//施工队考评-----------------------------
	

	ls_sql="update crm_khxx set pdsj=?,pdr=?,sgd=?,sgbz=?,pdsm=?,pdclzt='2',jlbz=?,zjxm=?,sgdkpjlh=?";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and pdclzt in('1','6','2') ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,pdsj);
	ps.setString(2,pdr);
	ps.setString(3,sgd);
	ps.setString(4,sgbz);
	ps.setString(5,pdsm);
	ps.setString(6,jlbz);
	ps.setString(7,zjxm);
	ps.setString(8,kpjlh);
	if (ps.executeUpdate()!=1)
	{
		conn.rollback();
		out.println("错误！存盘失败");
		return;
	}
	ps.close();



	conn.commit();

	int count=0;
	ls_sql="SELECT count(*)";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where zjxm='"+zjxm+"' and jyjdrq=(select jyjdrq from crm_khxx where khbh='"+wherekhbh+"')";
	ls_sql+=" and gcjdbm='1'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	ps.close();
	rs.close();

	String cfkhbh=null;
	String cfkhxm=null;
	String cffwdz=null;
	if (count>1)
	{
		out.println("<BR>派单成功！");
		out.println("<P>*****警告！质检["+zjxm+"]当天有["+count+"]个工地材料进场");
		ls_sql="SELECT khbh,khxm,fwdz";
		ls_sql+=" FROM crm_khxx ";
		ls_sql+=" where zjxm='"+zjxm+"' and jyjdrq=(select jyjdrq from crm_khxx where khbh='"+wherekhbh+"')";
		ls_sql+=" and gcjdbm='1'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			cfkhbh=rs.getString("khbh");
			cfkhxm=rs.getString("khxm");
			cffwdz=rs.getString("fwdz");

			out.println("<BR>客户编号："+cfkhbh+"，客户姓名："+cfkhxm+"，房屋地址："+cffwdz+"");
		}
		ps.close();
		rs.close();
	}
	else{
		%>
		<SCRIPT language=javascript >
		<!--
		alert("派单成功！");
		window.close();
		//-->
		</SCRIPT>
		<%
	}
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>