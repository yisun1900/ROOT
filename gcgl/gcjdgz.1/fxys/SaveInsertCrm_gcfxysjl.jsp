<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String ysjlh=null;
String khbh=null;
String ysxmflbm=null;
String gcysxmbm=null;
java.sql.Date yssj=null;
String ysr=null;
String sfkhbrqz=null;
String dqzysq=null;
String lrr=null;
java.sql.Date lrsj=null;
String lrbm=null;
String bz=null;
ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
khbh=cf.GB2Uni(request.getParameter("khbh"));
ysxmflbm=cf.GB2Uni(request.getParameter("ysxmflbm"));
gcysxmbm=cf.GB2Uni(request.getParameter("gcysxmbm"));
ls=request.getParameter("yssj");
try{
	if (!(ls.equals("")))  yssj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[yssj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收时间]类型转换发生意外:"+e);
	return;
}
ysr=cf.GB2Uni(request.getParameter("ysr"));
sfkhbrqz=cf.GB2Uni(request.getParameter("sfkhbrqz"));
dqzysq=cf.GB2Uni(request.getParameter("dqzysq"));
lrr=cf.GB2Uni(request.getParameter("lrr"));
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[lrsj]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
lrbm=cf.GB2Uni(request.getParameter("lrbm"));
bz=cf.GB2Uni(request.getParameter("bz"));
String ysjg=cf.GB2Uni(request.getParameter("ysjg"));
String sffszg=cf.GB2Uni(request.getParameter("sffszg"));
String yssm=cf.GB2Uni(request.getParameter("yssm"));

double ysdf=0;
ls=request.getParameter("ysdf");
try{
	if (!(ls.equals("")))  ysdf=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[ysdf]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[验收得分]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	//检查验收项目是否重复
	int count=0;
	ls_sql="SELECT count(*) ";
	ls_sql+=" FROM crm_gcfxysjl ";
	ls_sql+=" where  khbh='"+khbh+"' and gcysxmbm='"+gcysxmbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("错误！该项验收已录入");
		return;
	}

	//获取客户回访和工程进度信息
	String nowgcjdbm=null;
	java.sql.Date nowhfrq=null;
	String nowhflxbm=null;
	String nowsfxhf=null;
	String nowzqysxmbm=null;
	java.sql.Date nowszqsj=null;
	ls_sql="SELECT gcjdbm,hflxbm,sfxhf,hfrq,zqysxmbm,szqsj";
	ls_sql+=" FROM crm_khxx ";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		nowgcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		nowhflxbm=cf.fillNull(rs.getString("hflxbm"));
		nowsfxhf=cf.fillNull(rs.getString("sfxhf"));
		nowhfrq=rs.getDate("hfrq");
		nowzqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		nowszqsj=rs.getDate("szqsj");
	}
	else{
		out.println("错误！客户不存在");
		return;
	}
	rs.close();
	ps.close();

	String ysxmflmc=null;
	ls_sql="SELECT ysxmflmc";
	ls_sql+=" FROM dm_ysxmflbm ";
	ls_sql+=" where  ysxmflbm='"+ysxmflbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysxmflmc=cf.fillNull(rs.getString("ysxmflmc"));
	}
	rs.close();
	ps.close();

	//获取验收项目信息
	String gcysxmmc=null;
	String dygcjdbm="";
	String getsfxhf="";
	String gethflxbm="";
	ls_sql="SELECT gcysxmmc,dygcjdbm,sfhf,hflxbm";
	ls_sql+=" FROM dm_gcysxm ";
	ls_sql+=" where  gcysxmbm='"+gcysxmbm+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		dygcjdbm=cf.fillNull(rs.getString("dygcjdbm"));
		getsfxhf=cf.fillNull(rs.getString("sfhf"));
		gethflxbm=cf.fillNull(rs.getString("hflxbm"));
	}
	rs.close();
	ps.close();

	//检查是否能设置工程进度
	if (dygcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
	{
		if (nowgcjdbm.equals("2") || nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
		{
			out.println("错误！客户已开工，不能设置成未开工");
			return;
		}
	}
	else if (dygcjdbm.equals("2"))
	{
		if (nowgcjdbm.equals("3") || nowgcjdbm.equals("4") || nowgcjdbm.equals("5") || nowgcjdbm.equals("6"))
		{
			out.println("错误！客户已经开工，不能重新设置");
			return;
		}
	}
	else if (dygcjdbm.equals("6"))
	{
		if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
		{
			out.println("错误！客户已完工，设置错误！");
			return;
		}
	}
	else if (dygcjdbm.equals("3"))
	{
		if (nowgcjdbm.equals("4") || nowgcjdbm.equals("5"))
		{
			out.println("错误！客户已完工，设置错误！");
			return;
		}
	}
	else if (dygcjdbm.equals("4"))
	{
		if (nowgcjdbm.equals("5"))
		{
			out.println("错误！客户已完结，设置错误！");
			return;
		}
	}

	conn.setAutoCommit(false);

	//设置工程进度＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始	
	if (dygcjdbm.equals("1"))//1：未开工；2：已开工；3：中期验收；4：完工；5：客户完结；6：隐蔽工程完成
	{
		ls_sql="update crm_khxx set gcjdbm=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,dygcjdbm);
		ps.executeUpdate();
		ps.close();
	}
	else if (dygcjdbm.equals("2"))
	{
		ls_sql="update crm_khxx set sjkgrq=?,gcjdbm=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yssj);
		ps.setString(2,dygcjdbm);
		ps.executeUpdate();
		ps.close();
	}
	else if (dygcjdbm.equals("6"))
	{
		ls_sql="update crm_khxx set sybgcrq=?,gcjdbm=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yssj);
		ps.setString(2,dygcjdbm);
		ps.executeUpdate();
		ps.close();
	}
	else if (dygcjdbm.equals("3"))
	{
		ls_sql="update crm_khxx set szqsj=?,gcjdbm=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yssj);
		ps.setString(2,dygcjdbm);
		ps.executeUpdate();
		ps.close();
	}
	else if (dygcjdbm.equals("4"))
	{
		ls_sql="update crm_khxx set sjjgrq=?,gcjdbm=?";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDate(1,yssj);
		ps.setString(2,dygcjdbm);
		ps.executeUpdate();
		ps.close();
	}
	//设置工程进度＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束	


	//设置回访＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始	
	String hfszjlh=null;
	if (getsfxhf.equals("Y"))//自动设置回访
	{
		ls_sql="update crm_khxx set sfxhf='Y',hflxbm=?,hfrq=?+1 ";
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,gethflxbm);
		ps.setDate(2,yssj);
		ps.executeUpdate();
		ps.close();

		//插入：回访设置记录＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		String yhfszjlh=null;
		ls_sql="select hfszjlh";
		ls_sql+=" from  crm_hfszjl";
		ls_sql+=" where khbh='"+khbh+"' and zxszbz='Y'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yhfszjlh=rs.getString("hfszjlh");
		}
		rs.close();
		ps.close();

		ls_sql=" update crm_hfszjl set zxszbz='N'";	
		ls_sql+=" where  khbh='"+khbh+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		count=0;
		ls_sql="select NVL(max(substr(hfszjlh,8,3)),0)";
		ls_sql+=" from  crm_hfszjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		hfszjlh=khbh+cf.addZero(count+1,3);

		String hfszyy=ysjlh+":工程分项验收";
		ls_sql=" insert into crm_hfszjl (hfszjlh,khbh,hflxbm,hfsj,hfszr,hfszsj,hfszyy,lx,hfzcgjz,sfyhf,zxszbz,yhfszjlh) ";	
		ls_sql+=" values ( ?,?,?,?+1,?,SYSDATE,?,'5',?,'N','Y',?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hfszjlh);
		ps.setString(2,khbh);
		ps.setString(3,gethflxbm);
		ps.setDate(4,yssj);
		ps.setString(5,lrr);
		ps.setString(6,hfszyy);
		ps.setString(7,ysjlh);
		ps.setString(8,yhfszjlh);
		ps.executeUpdate();
		ps.close();
		//插入：回访设置记录＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	}
	//设置回访＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束	


	ls_sql="insert into crm_gcfxysjl ( ysjlh,khbh,ysxmflbm,ysxmflmc,gcysxmbm,gcysxmmc,yssj,ysr,ysjg,sffszg   ,yssm,sfkhbrqz,dqzysq,zpsl,sfszhf,hfszjlh,gcjdbm,ygcjdbm,ysfxhf,yhfrq   ,yhflxbm,ygcysxmbm,yyssj,lrr,lrsj,lrbm,bz,ysdf ) ";
	ls_sql+=" values (?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,ysjlh);
	ps.setString(2,khbh);
	ps.setString(3,ysxmflbm);
	ps.setString(4,ysxmflmc);
	ps.setString(5,gcysxmbm);
	ps.setString(6,gcysxmmc);
	ps.setDate(7,yssj);
	ps.setString(8,ysr);
	ps.setString(9,ysjg);
	ps.setString(10,sffszg);

	ps.setString(11,yssm);
	ps.setString(12,sfkhbrqz);
	ps.setString(13,dqzysq);
	ps.setInt(14,0);
	ps.setString(15,getsfxhf);
	ps.setString(16,hfszjlh);
	ps.setString(17,dygcjdbm);
	ps.setString(18,nowgcjdbm);
	ps.setString(19,nowsfxhf);
	ps.setDate(20,nowhfrq);

	ps.setString(21,nowhflxbm);
	ps.setString(22,nowzqysxmbm);
	ps.setDate(23,nowszqsj);
	ps.setString(24,lrr);
	ps.setDate(25,lrsj);
	ps.setString(26,lrbm);
	ps.setString(27,bz);
	ps.setDouble(28,ysdf);
	
	ps.executeUpdate();
	ps.close();

	//设置最新验收项目
	ls_sql="update crm_khxx set szqsj=?,zqysxmbm=?";
	ls_sql+=" where  khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,yssj);
	ps.setString(2,gcysxmbm);
	ps.executeUpdate();
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>