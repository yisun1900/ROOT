<%@ page contentType="text/html;charset=gb2312" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");


String dqbm=request.getParameter("dqbm");
String bjjbbm=request.getParameter("bjjbbm");
String oldbjbbh=cf.GB2Uni(request.getParameter("oldbjbbh"));
String newbjbbh=cf.GB2Uni(request.getParameter("newbjbbh"));
String gcbj=request.getParameter("gcbj");
String tcjg=request.getParameter("tcjg");
String tcsj=request.getParameter("tcsj");
String tcbzgc=request.getParameter("tcbzgc");
String tcbzzc=request.getParameter("tcbzzc");
String tczcbj=request.getParameter("tczcbj");


String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	if (!gcbj.equals("null"))
	{
		sql ="insert into bj_jzbjb (bjbbh,dqbm,bjjbbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clbj,rgbj,jxbj,bj,cbenj,sgdbj,gycl,sfbxx,glxmbh,xh,lrr,lrsj,bz,flmcgg,sfxycl,sfxyyjd,jxcb,rgcb,clcb) ";
		sql+=" select      '"+newbjbbh+"',dqbm,bjjbbm,xmbh,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,clbj,rgbj,jxbj,bj,cbenj,sgdbj,gycl,sfbxx,glxmbh,xh,lrr,lrsj,bz,flmcgg,sfxycl,sfxyyjd,jxcb,rgcb,clcb";
		sql+=" from bj_jzbjb ";
		sql+=" where dqbm='"+dqbm+"' and bjbbh='"+oldbjbbh+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		sql ="insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh)";
		sql+=" select     '"+newbjbbh+"',dqbm,bjjbbm,xmbh,glxmbh ";
		sql+=" from bj_glxmb ";
		sql+=" where dqbm='"+dqbm+"' and bjbbh='"+oldbjbbh+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		int newglbxh=0;
		sql="select NVL(max(TO_NUMBER(glbxh)),0)";
		sql+=" from  bj_jzglfxb";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			newglbxh=rs.getInt(1);
		}
		rs.close();
		ps.close();

		sql ="insert into bj_jzglfxb (glbxh,bjbbh,dqbm          ,bjjbbm,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,lrr,lrsj,bz)";
		sql+=" select   "+newglbxh+"+rownum,'"+newbjbbh+"',dqbm,bjjbbm,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,'"+yhmc+"',SYSDATE,bz ";
		sql+=" from bj_jzglfxb ";
		sql+=" where dqbm='"+dqbm+"' and bjbbh='"+oldbjbbh+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tcjg.equals("null"))
	{
		sql ="insert into bj_tcjgb (bjbbh,dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj)";
		sql+=" select      '"+newbjbbh+"',dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj";
		sql+=" from bj_tcjgb ";
		sql+=" where dqbm='"+dqbm+"' and bjbbh='"+oldbjbbh+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tcsj.equals("null"))
	{
		sql ="insert into bj_tcsjcjb (bjbbh,dqbm,tcsjflbm,bjjbbm,bjjbbm1,jldw,sjcj)";
		sql+=" select        '"+newbjbbh+"',dqbm,tcsjflbm,bjjbbm,bjjbbm1,jldw,sjcj";
		sql+=" from bj_tcsjcjb ";
		sql+=" where dqbm='"+dqbm+"' and bjbbh='"+oldbjbbh+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tcbzgc.equals("null"))
	{
		sql ="insert into bj_tcbzgcxm (bjbbh,dqbm,bjjbbm,hxbm,xmbh,bzsl,sfxzsl,ccbfjj,lrr,lrsj) ";
		sql+=" select         '"+newbjbbh+"',dqbm,bjjbbm,hxbm,xmbh,bzsl,sfxzsl,ccbfjj,lrr,lrsj";
		sql+=" from bj_tcbzgcxm ";
		sql+=" where dqbm='"+dqbm+"' and bjbbh='"+oldbjbbh+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tcbzzc.equals("null"))
	{
		sql ="insert into bj_tcbzzcxm (bjbbh,dqbm,bjjbbm,hxbm,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,ccbfjj,sfyqxtpp,lrr,lrsj) ";
		sql+=" select         '"+newbjbbh+"',dqbm,bjjbbm,hxbm,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,ccbfjj,sfyqxtpp,lrr,lrsj";
		sql+=" from bj_tcbzzcxm ";
		sql+=" where dqbm='"+dqbm+"' and bjbbh='"+oldbjbbh+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}

	if (!tczcbj.equals("null"))
	{
		int count=0;
		sql="select NVL(max(SUBSTR(cpbm,3,11)),0)";
		sql+=" from  bj_tczcbj";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();


		String getcpbm=null;

		sql="select cpbm";
		sql+=" from bj_tczcbj ";
		sql+=" where dqbm='"+dqbm+"' and bjbbh='"+oldbjbbh+"'";
		ps= conn.prepareStatement(sql);
		rs =ps.executeQuery();
		while (rs.next())
		{
			getcpbm=cf.fillNull(rs.getString("cpbm"));

			count++;
			String cpbm=null;
			cpbm="TC"+cf.addZero(count,11);

			sql ="insert into bj_tczcbj (cpbm,bjbbh,dqbm,bjjbbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sfxclxs,dj,jsj,jjje,sh,sfcscp,xuhao,lrr,lrsj,bz)";
			sql+=" select       '"+cpbm+"','"+newbjbbh+"',dqbm,bjjbbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,xh,gg,ppmc,gysmc,jldw,xdjldw,xdb,sfxclxs,dj,jsj,jjje,sh,sfcscp,xuhao,lrr,lrsj,bz";
			sql+=" from bj_tczcbj ";
			sql+=" where cpbm='"+getcpbm+"'";
			ps1= conn.prepareStatement(sql);
			ps1.executeUpdate();
			ps1.close();
		}
		rs.close();
		ps.close();
	}
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("复制成功");
//		window.close();
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
		if (rs!= null) rs.close(); 
		if (ps != null) ps.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
