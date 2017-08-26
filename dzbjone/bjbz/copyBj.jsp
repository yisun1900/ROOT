<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*,java.sql.*,java.text.*"%>
<%@ include file="/getlogin.jsp" %>


<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhmc=(String)session.getAttribute("yhmc");


String dqbm1 = request.getParameter("dqbm1");
String[] dqbm2 = request.getParameterValues("dqbm2");


String sql = null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
try {
	conn=cf.getConnection();    //得到连接


	conn.setAutoCommit(false);

	for (int i=0;i<dqbm2.length ;i++ )
	{
		if (dqbm1.equals(dqbm2[i]))
		{
			conn.rollback();
			out.println("错误！[复制地区]与[被复制地区]不能一致");
			return;
		}

		sql ="insert into bj_jzbjb (bjbbh,dqbm,bjjbbm,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,sfbxx,glxmbh,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,flmcgg,xh,lrr,lrsj,bz) ";
		sql+=" select      bjbbh,'"+dqbm2[i]+"',bjjbbm,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,sfbxx,glxmbh,sfxycl,sfxyyjd,clcb,rgcb,jxcb,cbenj,clbj,rgbj,jxbj,zcf,shf,ysf,qtf,bj,sgdbj,sgcbj,sfyxdz,zdzk,gycl,flmcgg,xh,'"+yhmc+"',SYSDATE,bz ";
		sql+=" from bj_jzbjb ";
		sql+=" where dqbm='"+dqbm1+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();

		sql ="insert into bj_glxmb (bjbbh,dqbm,bjjbbm,xmbh,glxmbh)";
		sql+=" select     bjbbh,'"+dqbm2[i]+"',bjjbbm,xmbh,glxmbh ";
		sql+=" from bj_glxmb ";
		sql+=" where dqbm='"+dqbm1+"'";
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
		sql+=" select   "+newglbxh+"+rownum,bjbbh,'"+dqbm2[i]+"',bjjbbm,xmbh,glfxclbm,glfxclmc,glflbm,dj,jldwbm,xhl,jqsfl,bsfl,tvocsfl,lx,wlllbz,'"+yhmc+"',SYSDATE,bz ";
		sql+=" from bj_jzglfxb ";
		sql+=" where dqbm='"+dqbm1+"'";
		ps= conn.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
	}
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		alert("复制成功");
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
		if (rs!= null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){}
 }
%>              
