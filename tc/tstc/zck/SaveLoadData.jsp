<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String dqbm = request.getParameter("dqbm");
String[] bjjbbm = request.getParameterValues("bjjbbm");

//String[] cpbm =request.getParameterValues("cpbm");
String[] nbbm =request.getParameterValues("nbbm");
String[] cldl =request.getParameterValues("cldl");
String[] clxl =request.getParameterValues("clxl");
String[] cpmc =request.getParameterValues("cpmc");
String[] xh =request.getParameterValues("xh");
String[] gg =request.getParameterValues("gg");
String[] ppmc =request.getParameterValues("ppmc");
String[] gysmc =request.getParameterValues("gysmc");
String[] jldw =request.getParameterValues("jldw");
String[] xdjldw =request.getParameterValues("xdjldw");
String[] xdb =request.getParameterValues("xdb");
String[] sh =request.getParameterValues("sh");
String[] sfxclxs =request.getParameterValues("sfxclxs");
String[] jsj =request.getParameterValues("jsj");
String[] khxsdj =request.getParameterValues("khxsdj");
String[] sjj1 =request.getParameterValues("sjj1");
String[] sjj2 =request.getParameterValues("sjj2");
String[] sjj3 =request.getParameterValues("sjj3");
String[] sjj4 =request.getParameterValues("sjj4");
String[] sjj5 =request.getParameterValues("sjj5");
String[] sgddj =request.getParameterValues("sgddj");
String[] lx =request.getParameterValues("lx");
String[] cxxmbm =request.getParameterValues("cxxmbm");
String[] lbxmbm =request.getParameterValues("lbxmbm");
String[] sfyx =request.getParameterValues("sfyx");
String[] yxkssj =request.getParameterValues("yxkssj");
String[] yxjzsj =request.getParameterValues("yxjzsj");
String[] xuhao =request.getParameterValues("xuhao");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接

	int count=0;
	sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
	sql+=" from  tc_zck";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	for (int i=0;i<cpmc.length ;i++ )
	{
		count++;

		String cpbm=null;
		cpbm="TC"+cf.addZero(count,11);

		sql="insert into tc_zck ( cpbm,dqbm,bjjbbm,nbbm,cldl,clxl,cpmc,xh,gg    ";
		sql+=" ,ppmc,gysmc,jldw,xdjldw,xdb,sh,sfxclxs,jsj,khxsdj,sjj1,sjj2,sjj3,sjj4,sjj5,sgddj,xuhao,lrr,lrsj,lx,lbxmbm,cxxmbm,sfyx,yxkssj,yxjzsj ) ";
		sql+=" values('"+cpbm+"','"+dqbm+"','"+bjjbbm[i]+"','"+nbbm[i]+"','"+cf.GB2Uni(cldl[i])+"','"+cf.GB2Uni(clxl[i])+"','"+cf.GB2Uni(cpmc[i])+"','"+cf.GB2Uni(xh[i])+"','"+cf.GB2Uni(gg[i])+"'";
		sql+=" ,'"+cf.GB2Uni(ppmc[i])+"','"+cf.GB2Uni(gysmc[i])+"','"+cf.GB2Uni(jldw[i])+"','"+cf.GB2Uni(xdjldw[i])+"','"+xdb[i]+"','"+sh[i]+"','"+sfxclxs[i]+"','"+jsj[i]+"','"+khxsdj[i]+"','"+sjj1[i]+"','"+sjj2[i]+"','"+sjj3[i]+"','"+sjj4[i]+"','"+sjj5[i]+"','"+sgddj[i]+"','"+xuhao[i]+"'";
		sql+=" ,'"+yhmc+"',SYSDATE,'"+lx[i]+"','"+lbxmbm[i]+"','"+cxxmbm[i]+"','"+sfyx[i]+"',TO_DATE('"+yxkssj[i]+"','YYYY-MM-DD'),TO_DATE('"+yxjzsj[i]+"','YYYY-MM-DD'))";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();


		sql="delete from tc_zcsjj ";
		sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		if (!sjj1[i].equals("0"))
		{
			sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
			sql+=" values (?,?,?) ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,cpbm);
			ps.setString(2,"A");
			ps.setString(3,sjj1[i]);
			ps.executeUpdate();
			ps.close();
		}

		if (!sjj2[i].equals("0"))
		{
			sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
			sql+=" values (?,?,?) ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,cpbm);
			ps.setString(2,"B");
			ps.setString(3,sjj2[i]);
			ps.executeUpdate();
			ps.close();
		}

		if (!sjj3[i].equals("0"))
		{
			sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
			sql+=" values (?,?,?) ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,cpbm);
			ps.setString(2,"C");
			ps.setString(3,sjj3[i]);
			ps.executeUpdate();
			ps.close();
		}

		if (!sjj4[i].equals("0"))
		{
			sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
			sql+=" values (?,?,?) ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,cpbm);
			ps.setString(2,"D");
			ps.setString(3,sjj4[i]);
			ps.executeUpdate();
			ps.close();
		}

		if (!sjj5[i].equals("0"))
		{
			sql="insert into tc_zcsjj ( cpbm,bjjbbm,sjj) ";
			sql+=" values (?,?,?) ";
			ps= conn.prepareStatement(sql);
			ps.setString(1,cpbm);
			ps.setString(2,"E");
			ps.setString(3,sjj5[i]);
			ps.executeUpdate();
			ps.close();
		}
		
	
	}


	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("保存成功");
		window.close();
	//-->
	</SCRIPT>
	<%
 }
 catch(Exception e){
	conn.rollback();
	out.print("存盘失败,发生意外: " + e);
	out.print("<BR>sql=" + sql);
 }
 finally{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
