<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;
String sjr=null;
java.sql.Date sjsj=null;
String bz=null;
sjr=cf.GB2Uni(request.getParameter("sjr"));
ls=request.getParameter("sjsj");
try{
	if (!(ls.equals("")))  sjsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sjsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[上缴时间]类型转换发生意外:"+e);
	return;
}
bz=cf.GB2Uni(request.getParameter("bz"));

double fkje=0;
ls=request.getParameter("fkje");
try{
	if (!(ls.equals("")))  fkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量fkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[收款金额]类型转换发生意外:"+e);
	return;
}
java.sql.Date shsj=null;
ls=request.getParameter("shsj");
try{
	if (!(ls.equals("")))  shsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量shsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[审核时间]类型转换发生意外:"+e);
	return;
}
String dsksjbz=cf.GB2Uni(request.getParameter("dsksjbz"));
String shyj=cf.GB2Uni(request.getParameter("shyj"));


String fkxh=cf.GB2Uni(request.getParameter("fkxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String khbh=null;
	String skdd=null;
	String getdsksjbz=null;
	String scbz=null;
	String fklxbm=null;
	String glxh=null;

	ls_sql="select khbh,skdd,dsksjbz,scbz,fklxbm,glxh";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=rs.getString("khbh");
		skdd=rs.getString("skdd");
		getdsksjbz=rs.getString("dsksjbz");
		scbz=rs.getString("scbz");
		fklxbm=rs.getString("fklxbm");
		glxh=rs.getString("glxh");
	}
	else{
		rs.close();
		ps.close();

		out.println("错误！不存在的收款序号");
		return;
	}
	rs.close();
	ps.close();

	if (scbz.equals("Y"))
	{
		out.println("错误！收款序号["+fkxh+"]已被删除");
		return;
	}

	if (skdd.equals("2"))//1：财务收款；2：非财务代收款
	{
		if (!getdsksjbz.equals("N"))//N:否；Y:是
		{
			out.println("错误！代收款已审核");
			return;
		}
	}
	else{
		out.println("错误！是否需审核不正确");
		return;
	}
	
	conn.setAutoCommit(false);


	ls_sql="update cw_khfkjl set sjr=?,sjsj=?,bz=?,fkje=?,shsj=SYSDATE,dsksjbz=?,shyj=?";
	ls_sql+=" where  (fkxh='"+fkxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,sjr);
	ps.setDate(2,sjsj);
	ps.setString(3,bz);
	ps.setDouble(4,fkje);
	ps.setString(5,dsksjbz);
	ps.setString(6,shyj);
	ps.executeUpdate();
	ps.close();

	if (glxh!=null)
	{
		ls_sql="update cw_khfkjl set sjr=?,sjsj=?,bz=?,fkje=?,shsj=SYSDATE,dsksjbz=?,shyj=?";
		ls_sql+=" where fkxh!='"+fkxh+"' and fkxh in(select fkxh from cw_glfkjl where glxh="+glxh+")";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjr);
		ps.setDate(2,sjsj);
		ps.setString(3,bz);
		ps.setDouble(4,-1*fkje);
		ps.setString(5,dsksjbz);
		ps.setString(6,shyj);
		ps.executeUpdate();
		ps.close();
	}

	//财务收款，所有情况都要重新计算
	if ( true)//11：家装款
	{
		//家装款更新+++++++++++++++++++++++++++++++++++++++开始
		double zjxssk=0;
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' and fkcs in(8)";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zjxssk=rs.getDouble(1);//增减项实收款
		}
		rs.close();
		ps.close();

		double getsfke=0;//
		java.sql.Date getjzkfksj=null;//家装最近收款时间
		java.sql.Date getjzkscsj=null;//首次付家装款时间
		String getjzkfkxh=null;//家装最近收款序号
		int getjzkfkcs=0;//家装收款期数
		ls_sql="select sum(fkje),max(sksj),min(sksj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getsfke=rs.getDouble(1);//已收工程款
			getjzkfksj=rs.getDate(2);
			getjzkscsj=rs.getDate(3);
			getjzkfkxh=rs.getString(4);
			getjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		//取财务收款情况
		double getcwsfke=0;//
		java.sql.Date getcwjzkfksj=null;//财务家装最近收款时间
		java.sql.Date getcwjzkscsj=null;//财务首次付家装款时间
		String getcwjzkfkxh=null;//财务家装最近收款序号
		int getcwjzkfkcs=0;//财务家装收款期数

		ls_sql="select sum(fkje),max(sjsj),min(sjsj),max(fkxh),max(fkcs)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='11' and scbz='N' ";
		ls_sql+=" and ( skdd='1' OR (skdd='2' and dsksjbz='Y') )";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			getcwsfke=rs.getDouble(1);//已收工程款
			getcwjzkfksj=rs.getDate(2);
			getcwjzkscsj=rs.getDate(3);
			getcwjzkfkxh=rs.getString(4);
			getcwjzkfkcs=rs.getInt(5);
		}
		rs.close();
		ps.close();


		ls_sql="update crm_khxx set sfke=?,jzkfkcs=?,jzkfkxh=?,jzkfksj=?,jzkscsj=?   ,cwsfke=?,cwjzkfkcs=?,cwjzkfkxh=?,cwjzkfksj=?,cwjzkscsj=?  ,zjxssk=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setDouble(1,getsfke);
		ps.setInt(2,getjzkfkcs);
		ps.setString(3,getjzkfkxh);
		ps.setDate(4,getjzkfksj);
		ps.setDate(5,getjzkscsj);

		ps.setDouble(6,getcwsfke);
		ps.setInt(7,getcwjzkfkcs);
		ps.setString(8,getcwjzkfkxh);
		ps.setDate(9,getcwjzkfksj);
		ps.setDate(10,getcwjzkscsj);

		ps.setDouble(11,zjxssk);
		ps.executeUpdate();
		ps.close();

		//家装款更新--------------------------------------------完成
	}

	if (true)//52：量房订金
	{
		double sfke=0;
		java.sql.Date jlfdjsj=null;
		String lfdjbz="N";
		ls_sql="select sum(fkje),min(sksj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//量房订金
			jlfdjsj=rs.getDate(2);//交量房订金时间
		}
		rs.close();
		ps.close();

		int tkjls=0;//退款记录数
		ls_sql="select count(*)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='52' and scbz='N'";
		ls_sql+=" and fkje<0 and zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tkjls=rs.getInt(1);//退款记录数
		}
		rs.close();
		ps.close();

		if (sfke>0)
		{
			lfdjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
		}
		else 
		{
			if (tkjls>0)
			{
				lfdjbz="T";
			}
			else{
				lfdjbz="N";
			}
		}

		ls_sql="update crm_zxkhxx set lfdjbz=?,lfdj=?,jlfdjsj=?";//设计费是否可转出
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,lfdjbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jlfdjsj);
		ps.executeUpdate();
		ps.close();
	}
	if (true)//51：促销活动订金
	{
		double sfke=0;
		java.sql.Date jhddjsj=null;
		String hddjbz="N";
		ls_sql="select sum(fkje),min(sksj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//活动订金
			jhddjsj=rs.getDate(2);//交活动订金时间
		}
		rs.close();
		ps.close();

		int tkjls=0;//退款记录数
		ls_sql="select count(*)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='51' and scbz='N'";
		ls_sql+=" and fkje<0 and zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tkjls=rs.getInt(1);//退款记录数
		}
		rs.close();
		ps.close();

		if (sfke>0)
		{
			hddjbz="Y";//N：未交订金；Y：已交订金；T：已退订金
		}
		else 
		{
			if (tkjls>0)
			{
				hddjbz="T";
			}
			else{
				hddjbz="N";
			}
		}

		ls_sql="update crm_zxkhxx set hddjbz=?,hddj=?,jhddjsj=?";//设计费是否可转出
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,hddjbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jhddjsj);
		ps.executeUpdate();
		ps.close();
	}
	if (true)//53：设计费
	{
		double sfke=0;
		java.sql.Date jsjfsj=null;
		String sjfbz="N";
		ls_sql="select sum(fkje),min(sksj)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfke=rs.getDouble(1);//设计费
			jsjfsj=rs.getDate(2);//交设计费时间
		}
		rs.close();
		ps.close();

		int tkjls=0;//退款记录数
		ls_sql="select count(*)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='53' and scbz='N'";
		ls_sql+=" and fkje<0 and zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			tkjls=rs.getInt(1);//退款记录数
		}
		rs.close();
		ps.close();

		if (sfke>0)
		{
			sjfbz="Y";//N：未交设计费；Y：已交设计费；T：退设计费
		}
		else 
		{
			if (tkjls>0)
			{
				sjfbz="T";
			}
			else{
				sjfbz="N";
			}
		}

		ls_sql="update crm_zxkhxx set sjfbz=?,sjf=?,jsjfsj=?";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,sjfbz);
		ps.setDouble(2,sfke);
		ps.setDate(3,jsjfsj);
		ps.executeUpdate();
		ps.close();
	}

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