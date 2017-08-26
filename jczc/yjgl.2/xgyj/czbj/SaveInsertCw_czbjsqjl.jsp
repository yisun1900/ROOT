<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String bjjb=cf.GB2Uni(request.getParameter("bjjb"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String sqr=cf.GB2Uni(request.getParameter("sqr"));
String bz=cf.GB2Uni(request.getParameter("bz"));
java.sql.Date sqsj=null;
ls=request.getParameter("sqsj");
try{
	if (!(ls.equals("")))  sqsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sqsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[授权时间]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String zjxxh=null;

	ls_sql="select zjxxh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zjxxh=rs.getString(1);
	}
	else{
		out.println("错误！客户信息不存在");
		return;
	}
	rs.close();
	ps.close();

	if (zjxxh!=null)
	{
		out.println("错误！客户有过增减项不能重做报价");
		return;
	}

	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  cw_czbjsqjl";
	ls_sql+=" where  khbh='"+khbh+"' and wcbz='1'";
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
		out.println("错误！客户[重做报价]已被授权");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="insert into cw_czbjsqjl (khbh,sqsj,khxm,fgsbh,sqr,wcbz  ,gxqwdzgce,gxqzkl,gxqqye,gxqsuijin,gxqsuijinbfb,gxqsjf,gxqglf,gxqzqguanlif,gxqguanlif   ,gxhwdzgce,gxhzkl,gxhqye,gxhsuijin,gxhsuijinbfb,gxhsjf,gxhglf,gxhzqguanlif,gxhguanlif  ,bz,sfxyjjz)";
	ls_sql+=" select khbh,?,khxm,fgsbh,?,'1'  ,NVL(wdzgce,0),zkl,NVL(qye,0),NVL(suijin,0),suijinbfb,NVL(sjf,0),NVL(glf,0),NVL(zqguanlif,0),NVL(guanlif,0)   ,NVL(wdzgce,0),zkl,NVL(qye,0),NVL(suijin,0),suijinbfb,NVL(sjf,0),NVL(glf,0),NVL(zqguanlif,0),NVL(guanlif,0)  ,?,'Y'";
	ls_sql+=" from crm_khxx ";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqsj);
	ps.setString(2,sqr);
	ps.setString(3,bz);
	ps.executeUpdate();
	ps.close();

	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"yz");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");

	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?,sfzdzbj='Y',bjjb='"+bjjb+"'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

	//修改：电子报价总额
	ls_sql="update crm_khxx set bjjb='"+bjjb+"'";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("授权成功！");
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
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
