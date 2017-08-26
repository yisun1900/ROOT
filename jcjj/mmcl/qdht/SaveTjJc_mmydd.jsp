<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String tjfw=cf.GB2Uni(request.getParameter("tjfw"));
double zkl=0;
ls=request.getParameter("zkl");
try{
	if (!(ls.equals("")))  zkl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zkl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[价格折扣]类型转换发生意外:"+e);
	return;
}


String yddbh=request.getParameter("yddbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String clzt=null;

try {
	conn=cf.getConnection();

	String fgsbh=null;
	double fwf=0;
	ls_sql="select clzt,fgsbh,fwf";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		clzt=rs.getString("clzt");
		fgsbh=rs.getString("fgsbh");
		fwf=rs.getDouble("fwf");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("04"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	//获取保留小数参数＋＋＋＋＋＋＋＋＋＋＋开始
	int jcddblxs=-100;//集成订单保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	int jcddmxblxs=-100;//集成订单明细保留小数  2：2位小数；1：1位小数；0：保留个位；-1：保留十位；-2：保留百位；-3：保留千位
	ls_sql =" select NVL(jcddblxs,-100),NVL(jcddmxblxs,-100)";
	ls_sql+=" from sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		jcddblxs=rs.getInt(1);
		jcddmxblxs=rs.getInt(2);
	}
	rs.close();
	ps.close();

	if (jcddblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单保留小数位数』，请联系管理员");
		return;
	}

	if (jcddmxblxs==-100)
	{
		out.println("<BR>错误，没有设置『集成订单明细保留小数』，请联系管理员");
		return;
	}
	//获取保留小数参数＝＝＝＝＝＝＝＝＝＝＝＝＝结束

	conn.setAutoCommit(false);

	if (tjfw.equals("mm"))
	{
		ls_sql="update jc_mmdgdmx set dj=ROUND(bzdj*"+zkl+"/10,"+jcddmxblxs+")";
		ls_sql+=" where  yddbh='"+yddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (tjfw.equals("wj"))
	{
		ls_sql="update jc_wjjddmx set dj=ROUND(bzdj*"+zkl+"/10,"+jcddmxblxs+")";
		ls_sql+=" where  yddbh='"+yddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (tjfw.equals("bl"))
	{
		ls_sql="update jc_blddmx set dj=ROUND(bzdj*"+zkl+"/10,"+jcddmxblxs+")";
		ls_sql+=" where  yddbh='"+yddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else if (tjfw.equals("all"))
	{
		ls_sql="update jc_mmdgdmx set dj=ROUND(bzdj*"+zkl+"/10,"+jcddmxblxs+")";
		ls_sql+=" where  yddbh='"+yddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_wjjddmx set dj=ROUND(bzdj*"+zkl+"/10,"+jcddmxblxs+")";
		ls_sql+=" where  yddbh='"+yddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="update jc_blddmx set dj=ROUND(bzdj*"+zkl+"/10,"+jcddmxblxs+")";
		ls_sql+=" where  yddbh='"+yddbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	double zqmmhtje=0;
	double mmhtje=0;
	double zqzjhmmje=0;
	double zjhmmje=0;

	double zqwjhtje=0;
	double wjhtje=0;
	double zqzjhwjje=0;
	double zjhwjje=0;

	double zqblhtje=0;
	double blhtje=0;
	double zqzjhblje=0;
	double zjhblje=0;

	double wdzje=0;
	double htje=0;
	double zqzjhze=0;
	double zjhze=0;

	ls_sql="select sum(bzdj*sl),sum(dj*sl),sum(bzdj*zjhsl),sum(dj*zjhsl)";
	ls_sql+=" from  jc_mmdgdmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqmmhtje=rs.getDouble(1);
		mmhtje=rs.getDouble(2);
		zqzjhmmje=rs.getDouble(3);
		zjhmmje=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(bzdj*sl),sum(dj*sl),sum(bzdj*zjhsl),sum(dj*zjhsl)";
	ls_sql+=" from  jc_wjjddmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqwjhtje=rs.getDouble(1);
		wjhtje=rs.getDouble(2);
		zqzjhwjje=rs.getDouble(3);
		zjhwjje=rs.getDouble(4);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(bzdj*sl),sum(dj*sl),sum(bzdj*zjhsl),sum(dj*zjhsl)";
	ls_sql+=" from  jc_blddmx";
	ls_sql+=" where  yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zqblhtje=rs.getDouble(1);
		blhtje=rs.getDouble(2);
		zqzjhblje=rs.getDouble(3);
		zjhblje=rs.getDouble(4);
	}
	rs.close();
	ps.close();


	wdzje=zqmmhtje+zqwjhtje+zqblhtje+fwf;
	htje=mmhtje+wjhtje+blhtje+fwf;
	zqzjhze=zqzjhmmje+zqzjhwjje+zqzjhblje+fwf;
	zjhze=zjhmmje+zjhwjje+zjhblje+fwf;


	ls_sql="update jc_mmydd set ";
	ls_sql+="  zqmmhtje=? ,mmhtje=ROUND(?,"+jcddblxs+")   ,zqzjhmmje=? ,zjhmmje=ROUND(?,"+jcddblxs+") ";
	ls_sql+=" ,zqwjhtje=? ,wjhtje=ROUND(?,"+jcddblxs+")   ,zqzjhwjje=? ,zjhwjje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" ,zqblhtje=? ,blhtje=ROUND(?,"+jcddblxs+")   ,zqzjhblje=? ,zjhblje=ROUND(?,"+jcddblxs+") ";
	ls_sql+=" ,wdzje=?    ,htje=ROUND(?,"+jcddblxs+")     ,zqzjhze=?   ,zjhze=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where  yddbh='"+yddbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,zqmmhtje);
	ps.setDouble(2,mmhtje);
	ps.setDouble(3,zqzjhmmje);
	ps.setDouble(4,zjhmmje);

	ps.setDouble(5,zqwjhtje);
	ps.setDouble(6,wjhtje);
	ps.setDouble(7,zqzjhwjje);
	ps.setDouble(8,zjhwjje);

	ps.setDouble(9,zqblhtje);
	ps.setDouble(10,blhtje);
	ps.setDouble(11,zqzjhblje);
	ps.setDouble(12,zjhblje);

	ps.setDouble(13,wdzje);
	ps.setDouble(14,htje);
	ps.setDouble(15,zqzjhze);
	ps.setDouble(16,zjhze);
	ps.executeUpdate();
	ps.close();
	
	//集成订单
	ls_sql="update jc_jcdd set zqje=?,zhje=ROUND(?,"+jcddblxs+")";
	ls_sql+=" where gjz='"+yddbh+"' and lx='1' and czlx='1'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,wdzje);
	ps.setDouble(2,htje);
	ps.executeUpdate();
	ps.close();

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("修改成功！");
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