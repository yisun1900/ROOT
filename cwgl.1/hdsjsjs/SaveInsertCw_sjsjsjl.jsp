<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");
String lrr=(String)session.getAttribute("yhmc");

String jsjlh=cf.GB2Uni(request.getParameter("jsjlh"));
String fgsbh=request.getParameter("fgsbh");
String dwbh=request.getParameter("dwbh");
String sjsbh=request.getParameter("sjsbh");
String jsbz=cf.GB2Uni(request.getParameter("jsbz"));

//签单结算工地
String[] qdtckhbh=request.getParameterValues("qdtckhbh");
String[] qyestr=request.getParameterValues("qye");
String[] sjstcblstr=request.getParameterValues("sjstcbl");
String[] qdsyjsjestr=request.getParameterValues("qdsyjsje");
String[] qdtcbz=request.getParameterValues("qdtcbz");

//完工结算工地
String[] wgtckhbh=request.getParameterValues("wgtckhbh");
String[] khjsjestr=request.getParameterValues("khjsje");
String[] sjswgtcblstr=request.getParameterValues("sjswgtcbl");
String[] qdtcyjgzstr=request.getParameterValues("qdtcyjgz");
String[] wgtcjestr=request.getParameterValues("wgtcje");
String[] wgtcbz=request.getParameterValues("wgtcbz");

//设计客户第一次提成明细
String[] sjfsctckhbh=request.getParameterValues("sjfsctckhbh");
String[] sjfstr=request.getParameterValues("sjf");
String[] kyjfystr=request.getParameterValues("kyjfy");
String[] kxgtfystr=request.getParameterValues("kxgtfy");
String[] kqtfystr=request.getParameterValues("kqtfy");
String[] sjfsctcblstr=request.getParameterValues("sjfsctcbl");
String[] sjfsctcjestr=request.getParameterValues("sjfsctcje");
String[] sjfsctcbz=request.getParameterValues("sjfsctcbz");

//设计客户第二次提成明细
String[] sjfectckhbh=request.getParameterValues("sjfectckhbh");
String[] sssjfstr=request.getParameterValues("sssjf");
String[] eckyjfystr=request.getParameterValues("eckyjfy");
String[] eckxgtfystr=request.getParameterValues("eckxgtfy");
String[] eckqtfystr=request.getParameterValues("eckqtfy");
String[] sjfectcblstr=request.getParameterValues("sjfectcbl");
String[] sjfyjgzstr=request.getParameterValues("sjfyjgz");
String[] sjfectcjestr=request.getParameterValues("sjfectcje");
String[] sjfectcbz=request.getParameterValues("sjfectcbz");

//签单客户退单
String[] qdkhtdkhbh=request.getParameterValues("qdkhtdkhbh");
String[] qdkhtjskstr=request.getParameterValues("qdkhtjsk");
String[] qdkhtdbz=request.getParameterValues("qdkhtdbz");

//设计费退单
String[] sjkhtdkhbh=request.getParameterValues("sjkhtdkhbh");
String[] sjkhtjskstr=request.getParameterValues("sjkhtjsk");
String[] sjkhtdbz=request.getParameterValues("sjkhtdbz");

String ls=null;
double sjfksbl=0;
ls=request.getParameter("sjfksbl");
try{
	if (!(ls.equals("")))  sjfksbl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfksbl不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[设计费扣税比率]类型转换发生意外:"+e);
	return;
}

java.sql.Date sjfw=null;
java.sql.Date sjfw2=null;

ls=request.getParameter("sjfw");
try{
	if (!(ls.equals("")))  sjfw=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfw不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[时间范围]类型转换发生意外:"+e);
	return;
}
ls=request.getParameter("sjfw2");
try{
	if (!(ls.equals("")))  sjfw2=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjfw2不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[时间范围]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	conn.setAutoCommit(false);

	//签单结算工地
	for (int i=0;i<qdtckhbh.length ;i++ )
	{
		if (qdtckhbh[i].equals(""))
		{
			continue;
		}

		double qye=0;
		double sjstcbl=0;
		double qdsyjsje=0;

		qye=Double.parseDouble(qyestr[i].trim());
		sjstcbl=Double.parseDouble(sjstcblstr[i].trim());
		qdsyjsje=Double.parseDouble(qdsyjsjestr[i].trim());

		if (sjstcbl<=0)
		{
			conn.rollback();
			out.println("客户编号【"+qdtckhbh[i]+"】错误！【提点】应大于0");
			return;
		}


		ls_sql=" insert into cw_sjsjsmx (jsjlh,khbh,lx,qye,qdtcbl,qdtcje,bz)";
		ls_sql+=" values(?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jsjlh);
		ps.setString(2,qdtckhbh[i]);
		ps.setString(3,"1");
		ps.setDouble(4,qye);
		ps.setDouble(5,sjstcbl);
		ps.setDouble(6,qdsyjsje);
		ps.setString(7,cf.GB2Uni(qdtcbz[i]));
		ps.executeUpdate();
		ps.close();

		ls_sql=" update crm_khxx set sjstcbl=?,qdsyjsje=?,sjsjsjlh=?,sjsjsbz='1'";
		ls_sql+=" where khbh='"+qdtckhbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sjstcbl);
		ps.setDouble(2,qdsyjsje);
		ps.setString(3,jsjlh);
		ps.executeUpdate();
		ps.close();
	}


	//完工结算工地
	for (int i=0;i<wgtckhbh.length ;i++ )
	{
		if (wgtckhbh[i].equals(""))
		{
			continue;
		}

		double khjsje=0;
		double sjswgtcbl=0;
		double qdtcyjgz=0;
		double wgtcje=0;

		khjsje=Double.parseDouble(khjsjestr[i].trim());
		sjswgtcbl=Double.parseDouble(sjswgtcblstr[i].trim());
		qdtcyjgz=Double.parseDouble(qdtcyjgzstr[i].trim());
		wgtcje=Double.parseDouble(wgtcjestr[i].trim());

		if (sjswgtcbl<=0)
		{
			conn.rollback();
			out.println("客户编号【"+wgtckhbh[i]+"】错误！【提点】应大于0");
			return;
		}


		ls_sql=" insert into cw_sjsjsmx (jsjlh,khbh,lx,khjsje,qdtcje,wgtcbl,wgtcje,bz)";
		ls_sql+=" values(?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jsjlh);
		ps.setString(2,wgtckhbh[i]);
		ps.setString(3,"2");
		ps.setDouble(4,khjsje);
		ps.setDouble(5,qdtcyjgz);
		ps.setDouble(6,sjswgtcbl);
		ps.setDouble(7,wgtcje);
		ps.setString(8,cf.GB2Uni(wgtcbz[i]));
		ps.executeUpdate();
		ps.close();

		ls_sql=" update crm_khxx set sjswgtcbl=?,wgtcje=?,wgjsjlh=?,sjsjsbz='2'";
		ls_sql+=" where khbh='"+wgtckhbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sjswgtcbl);
		ps.setDouble(2,wgtcje);
		ps.setString(3,jsjlh);
		ps.executeUpdate();
		ps.close();
	}
		
		

	//设计客户第一次提成明细
	for (int i=0;i<sjfsctckhbh.length ;i++ )
	{
		if (sjfsctckhbh[i].equals(""))
		{
			continue;
		}

		double sjf=0;
		double kyjfy=0;
		double kxgtfy=0;
		double kqtfy=0;
		double sjfsctcbl=0;
		double sjfsctcje=0;

		sjf=Double.parseDouble(sjfstr[i].trim());
		kyjfy=Double.parseDouble(kyjfystr[i].trim());
		kxgtfy=Double.parseDouble(kxgtfystr[i].trim());
		kqtfy=Double.parseDouble(kqtfystr[i].trim());

		sjfsctcbl=Double.parseDouble(sjfsctcblstr[i].trim());
		sjfsctcje=Double.parseDouble(sjfsctcjestr[i].trim());

		if (sjfsctcbl<=0)
		{
			conn.rollback();
			out.println("客户编号【"+sjfsctckhbh[i]+"】错误！【提点】应大于0");
			return;
		}


		ls_sql=" insert into cw_sjsjsmx (jsjlh,khbh,lx,qye,kyjfy,kxgtfy,kqtfy,qdtcbl,qdtcje,bz)";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jsjlh);
		ps.setString(2,sjfsctckhbh[i]);
		ps.setString(3,"3");
		ps.setDouble(4,sjf);
		ps.setDouble(5,kyjfy);
		ps.setDouble(6,kxgtfy);
		ps.setDouble(7,kqtfy);
		ps.setDouble(8,sjfsctcbl);
		ps.setDouble(9,sjfsctcje);
		ps.setString(10,cf.GB2Uni(sjfsctcbz[i]));
		ps.executeUpdate();
		ps.close();

		ls_sql=" update crm_khxx set sjfsctcbl=?,sjfsctcje=?,sjssjfjsbz='1'";
		ls_sql+=" where khbh='"+sjfsctckhbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sjfsctcbl);
		ps.setDouble(2,sjfsctcje);
		ps.executeUpdate();
		ps.close();
	}

	//设计客户第二次提成明细
	for (int i=0;i<sjfectckhbh.length ;i++ )
	{
		if (sjfectckhbh[i].equals(""))
		{
			continue;
		}

		double sssjf=0;
		double eckyjfy=0;
		double eckxgtfy=0;
		double eckqtfy=0;
		double sjfectcbl=0;
		double sjfyjgz=0;
		double sjfectcje=0;

		sssjf=Double.parseDouble(sssjfstr[i].trim());
		eckyjfy=Double.parseDouble(eckyjfystr[i].trim());
		eckxgtfy=Double.parseDouble(eckxgtfystr[i].trim());
		eckqtfy=Double.parseDouble(eckqtfystr[i].trim());
		sjfectcbl=Double.parseDouble(sjfectcblstr[i].trim());
		sjfyjgz=Double.parseDouble(sjfyjgzstr[i].trim());
		sjfectcje=Double.parseDouble(sjfectcjestr[i].trim());

		if (sjfectcbl<=0)
		{
			conn.rollback();
			out.println("客户编号【"+sjfectckhbh[i]+"】错误！【提点】应大于0");
			return;
		}


		ls_sql=" insert into cw_sjsjsmx (jsjlh,khbh,lx,khjsje,kyjfy,kxgtfy,kqtfy,qdtcje,wgtcbl,wgtcje  ,bz)";
		ls_sql+=" values(?,?,?,?,?,?,?,?,?,?  ,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jsjlh);
		ps.setString(2,sjfectckhbh[i]);
		ps.setString(3,"4");
		ps.setDouble(4,sssjf);
		ps.setDouble(5,eckyjfy);
		ps.setDouble(6,eckxgtfy);
		ps.setDouble(7,eckqtfy);
		ps.setDouble(8,sjfyjgz);
		ps.setDouble(9,sjfectcbl);
		ps.setDouble(10,sjfectcje);
		ps.setString(11,cf.GB2Uni(sjfectcbz[i]));
		ps.executeUpdate();
		ps.close();


		ls_sql=" update crm_khxx set sjfectcbl=?,sjfectcje=?,sjssjfjsbz='2'";
		ls_sql+=" where khbh='"+sjfectckhbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,sjfectcbl);
		ps.setDouble(2,sjfectcje);
		ps.executeUpdate();
		ps.close();
	}

	//签单客户退单
	for (int i=0;i<qdkhtdkhbh.length ;i++ )
	{
		if (qdkhtdkhbh[i].equals(""))
		{
			continue;
		}

		double qdkhtjsk=0;

		qdkhtjsk=Double.parseDouble(qdkhtjskstr[i].trim());

		ls_sql=" insert into cw_sjsjsmx (jsjlh,khbh,lx,wgtcje,bz)";
		ls_sql+=" values(?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jsjlh);
		ps.setString(2,qdkhtdkhbh[i]);
		ps.setString(3,"5");
		ps.setDouble(4,qdkhtjsk);
		ps.setString(5,cf.GB2Uni(qdkhtdbz[i]));
		ps.executeUpdate();
		ps.close();


		ls_sql=" update crm_khxx set sjsjsbz='3'";
		ls_sql+=" where khbh='"+qdkhtdkhbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
		
	//设计费退单
	for (int i=0;i<sjkhtdkhbh.length ;i++ )
	{
		if (sjkhtdkhbh[i].equals(""))
		{
			continue;
		}

		double sjkhtjsk=0;

		sjkhtjsk=Double.parseDouble(sjkhtjskstr[i].trim());

		ls_sql=" insert into cw_sjsjsmx (jsjlh,khbh,lx,wgtcje,bz)";
		ls_sql+=" values(?,?,?,?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,jsjlh);
		ps.setString(2,sjkhtdkhbh[i]);
		ps.setString(3,"6");
		ps.setDouble(4,sjkhtjsk);
		ps.setString(5,cf.GB2Uni(sjkhtdbz[i]));
		ps.executeUpdate();
		ps.close();


		ls_sql=" update crm_khxx set sjssjfjsbz='3'";
		ls_sql+=" where khbh='"+sjkhtdkhbh[i]+"' ";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}

	
	double qdtcze=0;
	ls_sql="select sum(qdtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='1' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qdtcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double wgtcze=0;
	ls_sql="select sum(wgtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='2' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wgtcze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double sjfsctcje=0;
	ls_sql="select sum(qdtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='3' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjfsctcje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double sjfectcje=0;
	ls_sql="select sum(wgtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='4' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjfectcje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double tdtcje=0;
	ls_sql="select sum(wgtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='5' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tdtcje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double sjftdtcje=0;
	ls_sql="select sum(wgtcje)";
	ls_sql+=" from  cw_sjsjsmx";
	ls_sql+=" where jsjlh='"+jsjlh+"' and lx='6' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjftdtcje=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double jsze=qdtcze+wgtcze+sjfsctcje+sjfectcje+tdtcje+sjftdtcje;

	ls_sql="insert into cw_sjsjsjl ( jsjlh,fgsbh,dwbh,sjsbh,sjfw,sjfw2,jsze,bz,lrr,lrbm ,lrsj,spbz ) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,TRUNC(SYSDATE),'2' ) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,jsjlh);
	ps.setString(2,fgsbh);
	ps.setString(3,dwbh);
	ps.setString(4,sjsbh);
	ps.setDate(5,sjfw);
	ps.setDate(6,sjfw2);
	ps.setDouble(7,jsze);
	ps.setString(8,jsbz);
	ps.setString(9,lrr);
	ps.setString(10,lrbm);

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
	out.print("存盘失败,发生意外: " + e);
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