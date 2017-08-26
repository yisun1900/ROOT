<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrbm=(String)session.getAttribute("dwbh");


String ls=null;
String htqrbz=cf.GB2Uni(request.getParameter("htqrbz"));
String htqrr=cf.GB2Uni(request.getParameter("htqrr"));
java.sql.Date htqrsj=null;
ls=request.getParameter("htqrsj");
try{
	if (!(ls.equals("")))  htqrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量htqrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[交款确认时间]类型转换发生意外:"+e);
	return;
}

String ddbh=request.getParameter("ddbh");
String fkfs=request.getParameter("fkfs");
String[] fkxh=request.getParameterValues("fkxh");
double sfkje=0;
ls=request.getParameter("sfkje");
try{
	if (!(ls.equals("")))  sfkje=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sfkje不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[预付款转出额]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khbh=null;
String clzt=null;
double htze=0;
double wdzje=0;

try {
	conn=cf.getConnection();

	ls_sql="select khbh,clzt,htze,wdzje";
	ls_sql+=" from  jc_jjdd";
	ls_sql+=" where  ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=rs.getString("khbh").trim();
		clzt=rs.getString("clzt");
		htze=rs.getDouble("htze");
		wdzje=rs.getDouble("wdzje");
	}
	rs.close();
	ps.close();
	if (!clzt.equals("13"))
	{
		out.println("！错误，处理状态不正确");
		return;
	}

	String fgsbh=null;
	String dwbh=null;
	String sjsbh=null;
	String sjs=null;
	ls_sql="select fgsbh,dwbh,sjsbh,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	rs.close();
	ps.close();

	//检查金额是否足够＋＋＋＋＋＋＋＋＋＋＋＋开始	
	double yfk=0;
	String zckx=null;
	if (fkfs.equals("1"))
	{
	}
	else if (fkfs.equals("2"))//橱柜预付款
	{
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='64' and scbz='N'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yfk=rs.getDouble(1);//已收转出款
		}
		rs.close();
		ps.close();

		if (yfk<sfkje)
		{
			out.println("错误！[橱柜预付款]金额不足，不能小于[预付款转出额]，已交预付款＝"+yfk);
			return;
		}

		zckx="64";
	}
	else if (fkfs.equals("3"))//主材预付款
	{
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='62' and scbz='N'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yfk=rs.getDouble(1);//已收转出款
		}
		rs.close();
		ps.close();

		if (yfk<sfkje)
		{
			out.println("错误！[主材预付款]金额不足，不能小于[预付款转出额]，已交预付款＝"+yfk);
			return;
		}

		zckx="62";
	}
	else if (fkfs.equals("4"))//家具预付款
	{
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='65' and scbz='N'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yfk=rs.getDouble(1);//已收转出款
		}
		rs.close();
		ps.close();

		if (yfk<sfkje)
		{
			out.println("错误！[家具预付款]金额不足，不能小于[预付款转出额]，已交预付款＝"+yfk);
			return;
		}

		zckx="65";
	}
	else if (fkfs.equals("5"))//木门预付款
	{
		ls_sql="select sum(fkje)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"' and fklxbm='63' and scbz='N'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			yfk=rs.getDouble(1);//已收转出款
		}
		rs.close();
		ps.close();

		if (yfk<sfkje)
		{
			out.println("错误！[木门预付款]金额不足，不能小于[预付款转出额]，已交预付款＝"+yfk);
			return;
		}

		zckx="63";
	}

	//检查金额是否足够----------------------结束	

	//本次付款金额
	double bcfkje=sfkje;


	conn.setAutoCommit(false);

	ls_sql="update jc_jjdd set htqrsj=?,htqrr=?,htqrbz=?,fkfs=?,clzt='15'";
	ls_sql+=" where  ddbh='"+ddbh+"' and clzt='13'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,htqrsj);
	ps.setString(2,htqrr);
	ps.setString(3,htqrbz);
	ps.setString(4,fkfs);
	ps.executeUpdate();
	ps.close();

	if (fkfs.equals("1"))//1：已交橱柜款；2：橱柜预付款；3：主材预付款；4：家具预付款；5：木门预付款；9：未付款
	{
		for (int i=0;i<fkxh.length ;i++ )
		{
			ls_sql="update cw_khfkjl set ddbh=?";
			ls_sql+=" where  fkxh='"+fkxh[i]+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setString(1,ddbh);
			ps.executeUpdate();
			ps.close();
		}
	}
	else if (fkfs.equals("2") || fkfs.equals("3") || fkfs.equals("4") || fkfs.equals("5"))
	{
		//插入付款记录 
		String newfkxh=null;
		int count=0;
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		String fklxbm="24";//24：家具

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw,scbz,gysbh,sjs,sjsbh,dwbh,fgsbh,zcgysbh,czlx,zrkdcpz,zckdcpz,skdd,sjr,sjsj,gljlbz,ddbh ) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,'N',?,?,?,?,?,?,'1','0','0','1',?,?,'N',?) ";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,fklxbm); 
		ps.setDouble(5,bcfkje);
		ps.setString(6,"");
		ps.setString(7,htqrr);
		ps.setDate(8,htqrsj);
		ps.setString(9,lrbm);
		ps.setString(10,htqrr);

		ps.setDate(11,htqrsj);
		ps.setString(12,"家具交款确认自动转入");
		ps.setString(13,"31");//31:转换
		ps.setString(14,zckx);
		ps.setString(15,lrbm);
		ps.setString(16,"");
		ps.setString(17,sjs);
		ps.setString(18,sjsbh);
		ps.setString(19,dwbh);
		ps.setString(20,fgsbh);
		ps.setString(21,"");
		ps.setString(22,htqrr);
		ps.setDate(23,htqrsj);
		ps.setString(24,ddbh);
		ps.executeUpdate();
		ps.close();

	

		//转换付款方式，生成关联记录
		int glxh=0;//关联序号

		//获取关联序号
		ls_sql="select NVL(max(glxh),0)";
		ls_sql+=" from  cw_glfkjl";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			glxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		glxh++;

		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
		ps.executeUpdate();
		ps.close();

		ls_sql="update cw_khfkjl set glxh=?";
		ls_sql+=" where fkxh='"+newfkxh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.executeUpdate();
		ps.close();

		
		//插入关联付款记录 
		ls_sql="select NVL(max(substr(fkxh,8,3)),0)";
		ls_sql+=" from  cw_khfkjl";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();

		newfkxh=khbh+cf.addZero(count+1,3);

		//fkxh=newfkxh
		//增加glxh
		//增加gljlbz
		//增加gysbh=zcgysbh
		//fklxbm=zckx
		//fkje=-1*fkje
		//zckx=fklxbm
		//zcgysbh=""
		//fkcs=""
		//yfkbl=""
		//yfkje=""
		//sfkbl=""

		ls_sql="insert into cw_khfkjl ( khbh,fkxh,sjbh,fklxbm,fkje,jkr,skr,sksj,skdw,lrr   ,lrsj,bz,zffs,zckx,lrdw,scbz,gysbh,sjs,sjsbh,dwbh   ,fgsbh,zcgysbh,czlx,zrkdcpz,zckdcpz,skdd,sjr,sjsj,glxh,gljlbz,ddbh) ";
		ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?  ,?,?,?,?,?,'N',?,?,?,?   ,?,?,'1','0','0','1',?,?,?,'Y',?) ";//1：财务收款；2：非财务代收款
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.setString(2,newfkxh);
		ps.setString(3,"");
		ps.setString(4,zckx);
		ps.setDouble(5,-1*bcfkje);
		ps.setString(6,"");
		ps.setString(7,htqrr);
		ps.setDate(8,htqrsj);
		ps.setString(9,lrbm);
		ps.setString(10,htqrr);

		ps.setDate(11,htqrsj);
		ps.setString(12,"家具交款确认自动转出");
		ps.setString(13,"31");
		ps.setString(14,fklxbm);
		ps.setString(15,lrbm);
		ps.setString(16,"");
		ps.setString(17,sjs);
		ps.setString(18,sjsbh);
		ps.setString(19,dwbh);

		ps.setString(20,fgsbh);
		ps.setString(21,"");
		ps.setString(22,htqrr);
		ps.setDate(23,htqrsj);
		ps.setInt(24,glxh);
		ps.setString(25,ddbh);
		ps.executeUpdate();
		ps.close();

		//插入关联记录 
		ls_sql="insert into cw_glfkjl ( glxh,fkxh ) ";
		ls_sql+=" values ( ?,?) ";
		ps= conn.prepareStatement(ls_sql);
		ps.setInt(1,glxh);
		ps.setString(2,newfkxh);
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