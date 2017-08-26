<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ls=null;
String dqbm=null;
String xmbh=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double cbenj=0;
double bj=0;
double sgcbj=0;
ls=request.getParameter("cbenj");
try{
	if (!(ls.equals("")))  cbenj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量cbenj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[成本价]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("bj");
try{
	if (!(ls.equals("")))  bj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量bj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[工程预算价]类型转换发生意外:"+e);
	return;
}

ls=request.getParameter("sgcbj");
try{
	if (!(ls.equals("")))  sgcbj=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量sgcbj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[施工成本价]类型转换发生意外:"+e);
	return;
}


double xh=0;
String gycl=null;
dqbm=cf.GB2Uni(request.getParameter("dqbm"));
xmbh=cf.GB2Uni(request.getParameter("xmbh"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));
xmmc=cf.GB2Uni(request.getParameter("xmmc"));
xmdlbm=cf.GB2Uni(request.getParameter("xmdlbm"));
xmxlbm=cf.GB2Uni(request.getParameter("xmxlbm"));
smbm=cf.GB2Uni(request.getParameter("smbm"));
jldwbm=cf.GB2Uni(request.getParameter("jldwbm"));


ls=request.getParameter("xh");
try{
	if (!(ls.equals("")))  xh=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[xh]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[排序序号]类型转换发生意外:"+e);
	return;
}
gycl=cf.GB2Uni(request.getParameter("gycl"));

String lrr=cf.GB2Uni(request.getParameter("lrr"));
java.sql.Date lrsj=null;
ls=request.getParameter("lrsj");
try{
	if (!(ls.equals("")))  lrsj=java.sql.Date.valueOf(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量lrsj不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[录入时间]类型转换发生意外:"+e);
	return;
}
String sfbxx=request.getParameter("sfbxx");
String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String glxmbh=cf.GB2Uni(request.getParameter("glxmbh"));
String flmcgg=cf.GB2Uni(request.getParameter("flmcgg"));
String bz=cf.GB2Uni(request.getParameter("bz"));
String sfxycl=cf.GB2Uni(request.getParameter("sfxycl"));
String sfxyyjd=cf.GB2Uni(request.getParameter("sfxyyjd"));

String xmflbm=cf.GB2Uni(request.getParameter("xmflbm"));
String sfyxdz=cf.GB2Uni(request.getParameter("sfyxdz"));
double zdzk=0;
ls=request.getParameter("zdzk");
try{
	if (!(ls.equals("")))  zdzk=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量zdzk不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[最低折扣]类型转换发生意外:"+e);
	return;
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();


	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  bj_jzbjb";
	ls_sql+=" where bjbbh='"+bjbbh+"'  and xmbh='"+xmbh+"'  and dqbm='"+dqbm+"'  and bjjbbm='"+bjjbbm+"'";
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
		out.println("错误！[项目编号]在该报价级别已存在");
		return;
	}

	glxmbh=cf.replace(glxmbh,"，",",");
	glxmbh=cf.replace(glxmbh," ","");

	conn.setAutoCommit(false);


	ls_sql="insert into bj_jzbjb ( dqbm,xmbh,bjjbbm,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clcb,rgcb    ,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj   ,sgdbj,gycl,sfbxx,bjbbh,glxmbh,flmcgg,sfxycl,sfxyyjd,xh,lrr   ,lrsj,bz,xmflbm,sfyxdz,zdzk,sgcbj) ";
	ls_sql+=" values ( ?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?,?,?,?,?   ,?,?,?,?,?,?) ";
	ps= conn.prepareStatement(ls_sql);
	ps.setString(1,dqbm);
	ps.setString(2,xmbh);
	ps.setString(3,bjjbbm);
	ps.setString(4,xmmc);
	ps.setString(5,xmdlbm);
	ps.setString(6,xmxlbm);
	ps.setString(7,smbm);
	ps.setString(8,jldwbm);
	ps.setDouble(9,0);
	ps.setDouble(10,0);

	ps.setDouble(11,0);
	ps.setDouble(12,cbenj);
	ps.setDouble(13,0);
	ps.setDouble(14,0);
	ps.setDouble(15,0);
	ps.setDouble(16,0);
	ps.setDouble(17,0);
	ps.setDouble(18,0);
	ps.setDouble(19,0);
	ps.setDouble(20,bj);

	ps.setDouble(21,0);
	ps.setString(22,gycl);
	ps.setString(23,sfbxx);
	ps.setString(24,bjbbh);
	ps.setString(25,glxmbh);
	ps.setString(26,flmcgg);
	ps.setString(27,sfxycl);
	ps.setString(28,sfxyyjd);
	ps.setDouble(29,xh);
	ps.setString(30,lrr);

	ps.setDate(31,lrsj);
	ps.setString(32,bz);
	ps.setString(33,xmflbm);
	ps.setString(34,sfyxdz);
	ps.setDouble(35,zdzk);
	ps.setDouble(36,sgcbj);
	ps.executeUpdate();
	ps.close();


	
	//增加新关联项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (!glxmbh.equals(""))//有关联项目
	{
		ls_sql=" delete from bj_glxmb " ;
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		String[] strArray=cf.tokenToArray(glxmbh,",");

		for (int j=0;j<strArray.length ;j++ )
		{
			ls_sql ="insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh )";
			ls_sql+=" values('"+bjbbh+"','"+dqbm+"','"+bjjbbm+"','"+xmbh+"','"+strArray[j]+"')";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			String lsGlxmbh=cf.replace(glxmbh,strArray[j],xmbh);

			ls_sql ="update bj_jzbjb set glxmbh='"+lsGlxmbh+"'";
			ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+strArray[j]+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			ls_sql=" delete from bj_glxmb " ;
			ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+strArray[j]+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			String[] lsstrArray=cf.tokenToArray(lsGlxmbh,",");
			for (int j1=0;j1<lsstrArray.length ;j1++ )
			{
				ls_sql=" delete from bj_glxmb " ;
				ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+strArray[j]+"' and glxmbh='"+lsstrArray[j1]+"' and bjjbbm='"+bjjbbm+"'";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();

				ls_sql ="insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh )";
				ls_sql+=" values('"+bjbbh+"','"+dqbm+"','"+bjjbbm+"','"+strArray[j]+"','"+lsstrArray[j1]+"')";
				ps= conn.prepareStatement(ls_sql);
				ps.executeUpdate();
				ps.close();
			}

		}

		//检查关联项目编号是否存在＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		String getglxmbh=null;
		ls_sql="SELECT glxmbh";
		ls_sql+=" FROM bj_glxmb";
		ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getglxmbh=rs.getString(1).trim();

			int glMark=0;
			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_jzbjb";
			ls_sql+=" where dqbm='"+dqbm+"' and xmbh='"+getglxmbh+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				glMark=rs1.getInt(1);
			}
			rs1.close();
			ps1.close();

			if (glMark<1)
			{
				conn.rollback();
				out.println("错误！关联项目编号【"+getglxmbh+"】不存在");
				return;
			}
		}
		rs.close();
		ps.close();
		//检查关联项目编号是否存在＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	}
	//增加新关联项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	conn.commit();

	//调整序号
	int pxxh=0;
	String getxmbh=null;
	ls_sql="SELECT xmbh";
	ls_sql+=" FROM bj_jzbjb";
	ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
	ls_sql+=" order by xh,xmbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getxmbh=rs.getString(1);

		pxxh++;

		ls_sql="update bj_jzbjb set xh="+pxxh;
		ls_sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+getxmbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

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
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>