<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");

String bjbbh=cf.GB2Uni(request.getParameter("bjbbh"));
String bjjbbm = request.getParameter("bjjbbm");
String dqbm = request.getParameter("dqbm");

String[] xmdlbm =request.getParameterValues("xmdlbm");
String[] xmxlbm =request.getParameterValues("xmxlbm");
String[] xmflbm =request.getParameterValues("xmflbm");
String[] xmbh =request.getParameterValues("xmbh");
String[] xmmc =request.getParameterValues("xmmc");
String[] sfbxx =request.getParameterValues("sfbxx");
String[] smbm =request.getParameterValues("smbm");
String[] jldwbm =request.getParameterValues("jldwbm");
String[] cbenj =request.getParameterValues("cbenj");
String[] sgcbj =request.getParameterValues("sgcbj");
String[] bj =request.getParameterValues("bj");
String[] clbj =request.getParameterValues("clbj");
String[] rgbj =request.getParameterValues("rgbj");
String[] jxbj =request.getParameterValues("jxbj");
String[] sgdbj =request.getParameterValues("sgdbj");
String[] sfyxdz =request.getParameterValues("sfyxdz");
String[] zdzk =request.getParameterValues("zdzk");
String[] gycl =request.getParameterValues("gycl");
String[] flmcgg =request.getParameterValues("flmcgg");
String[] bz =request.getParameterValues("bz");
String[] glxmbh =request.getParameterValues("glxmbh");
String[] xh =request.getParameterValues("xh");
String[] sfxycl =request.getParameterValues("sfxycl");
String[] sfxyyjd =request.getParameterValues("sfxyyjd");

String[] zcf =request.getParameterValues("zcf");
String[] shf =request.getParameterValues("shf");
String[] ysf =request.getParameterValues("ysf");
String[] qtf =request.getParameterValues("qtf");


//////////////////////////////////////////////////////  

String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
PreparedStatement ps1=null;
ResultSet rs1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<xmbh.length ;i++ )
	{
		int count=0;
		sql=" select count(*)" ;
		sql+=" from bj_jzbjb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{         
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (count>1)
		{
			conn.rollback();
			out.println("错误！项目编号["+xmbh[i]+"]有多个");
			return;
		}
		else if (count==1)//首先删除
		{
			sql=" delete from bj_jzbjb " ;
			sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();
		}

		sql=" delete from bj_glxmb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
			
		String glxmbhStr=cf.GB2Uni(glxmbh[i]);
		glxmbhStr=cf.replace(glxmbhStr,"，",",");
		glxmbhStr=cf.replace(glxmbhStr," ","");

		sql ="insert into bj_jzbjb (bjbbh,dqbm,xmbh,bjjbbm,xmmc,xmdlbm,xmxlbm,xmflbm,smbm";
		sql+=" ,jldwbm,bj,gycl,lrr,lrsj,xh,sfbxx,glxmbh,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,sgdbj,sfyxdz,zdzk,flmcgg,bz,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,sgcbj)";
		sql+=" values('"+bjbbh+"','"+dqbm+"','"+xmbh[i]+"','"+bjjbbm+"','"+cf.GB2Uni(xmmc[i])+"','"+xmdlbm[i]+"','"+xmxlbm[i]+"','"+xmflbm[i]+"','"+smbm[i]+"'";
		sql+=" ,'"+jldwbm[i]+"',"+bj[i]+",'"+cf.GB2Uni(gycl[i])+"','"+yhmc+"',TRUNC(SYSDATE),'"+xh[i]+"','"+cf.GB2Uni(sfbxx[i])+"','"+glxmbhStr+"',"+clbj[i]+","+rgbj[i]+","+jxbj[i]+","+zcf[i]+","+shf[i]+","+ysf[i]+","+qtf[i]+","+sgdbj[i]+",'"+sfyxdz[i]+"',"+zdzk[i]+",'"+cf.GB2Uni(flmcgg[i])+"','"+cf.GB2Uni(bz[i])+"','"+cf.GB2Uni(sfxycl[i])+"','"+cf.GB2Uni(sfxyyjd[i])+"',"+cbenj[i]+",0,0,"+cbenj[i]+","+sgcbj[i]+")";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

	}

	for (int i=0;i<glxmbh.length ;i++ )
	{
		if (glxmbh[i].equals(""))
		{
			continue;
		}

		String getglxmbh=glxmbh[i];

		//增加新关联项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

		sql=" delete from bj_glxmb " ;
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		String[] strArray=cf.tokenToArray(getglxmbh,",");


		for (int j=0;j<strArray.length ;j++ )
		{
			sql ="insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh )";
			sql+=" values('"+bjbbh+"','"+dqbm+"','"+bjjbbm+"','"+xmbh[i]+"','"+strArray[j]+"')";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			String ls="["+getglxmbh+"]";

			String lsGlxmbh=null;

			lsGlxmbh=cf.replace(ls,","+strArray[j]+",",","+xmbh[i]+",");

			lsGlxmbh=cf.replace(lsGlxmbh,"["+strArray[j]+",","["+xmbh[i]+",");

			lsGlxmbh=cf.replace(lsGlxmbh,","+strArray[j]+"]",","+xmbh[i]+"]");

			lsGlxmbh=cf.replace(lsGlxmbh,"["+strArray[j]+"]","["+xmbh[i]+"]");

			lsGlxmbh=lsGlxmbh.substring(1,lsGlxmbh.length()-1);


			sql ="update bj_jzbjb set glxmbh='"+lsGlxmbh+"'";
			sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+strArray[j]+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			sql=" delete from bj_glxmb " ;
			sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+strArray[j]+"' and bjjbbm='"+bjjbbm+"'";
			ps= conn.prepareStatement(sql);
			ps.executeUpdate();
			ps.close();

			String[] lsstrArray=cf.tokenToArray(lsGlxmbh,",");
			for (int j1=0;j1<lsstrArray.length ;j1++ )
			{
				sql=" delete from bj_glxmb " ;
				sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and xmbh='"+strArray[j]+"' and glxmbh='"+lsstrArray[j1]+"' and bjjbbm='"+bjjbbm+"'";
				ps= conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();

				sql ="insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh )";
				sql+=" values('"+bjbbh+"','"+dqbm+"','"+bjjbbm+"','"+strArray[j]+"','"+lsstrArray[j1]+"')";
				ps= conn.prepareStatement(sql);
				ps.executeUpdate();
				ps.close();
			}
		}
		//增加新关联项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束


		//检查关联项目编号是否存在＋＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		String lsglxmbh=null;
		sql="SELECT glxmbh";
		sql+=" FROM bj_glxmb";
		sql+=" where dqbm='"+dqbm+"' and xmbh='"+xmbh[i]+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			lsglxmbh=rs.getString(1).trim();

			int glMark=0;
			sql="SELECT count(*)";
			sql+=" FROM bj_jzbjb";
			sql+=" where dqbm='"+dqbm+"' and xmbh='"+lsglxmbh+"' and bjjbbm='"+bjjbbm+"' and bjbbh='"+bjbbh+"'" ;
			ps1= conn.prepareStatement(sql);
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
				out.println("错误！关联项目编号【"+lsglxmbh+"】不存在");
				return;
			}
		}
		rs.close();
		ps.close();
		//检查关联项目编号是否存在＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束
	}

	
	//调整序号
	int pxxh=0;
	String getxmbh=null;
	sql="SELECT xmbh";
	sql+=" FROM bj_jzbjb";
	sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
	sql+=" order by xh";
	ps= conn.prepareStatement(sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getxmbh=rs.getString(1);

		pxxh++;

		sql="update bj_jzbjb set xh="+pxxh;
		sql+=" where  bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"' and xmbh='"+getxmbh+"'";
		ps1= conn.prepareStatement(sql);
		ps1.executeUpdate();
		ps1.close();
	}
	rs.close();
	ps.close();

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
