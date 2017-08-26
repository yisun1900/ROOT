<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=request.getParameter("khbh");
String lsbjmc=cf.GB2Uni(request.getParameter("lsbjmc"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int count=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT count(*)";
	ls_sql+=" FROM bj_mbbjmc ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>0)
	{
		out.println("<BR>错误，该临时报价名称已存在");
		return;
	}

	conn.setAutoCommit(false);

	ls_sql="delete from bj_mbbjxmmx ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_mbglxmb ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_mbfjxx ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_mbgclmx ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_mbsfxmmx ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_mbglfxb ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_mbkhgcxmxj ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_mbkhzcxmxj ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_mbkhzcxm ";
	ls_sql+=" where khbh='"+khbh+"' and mbmc='"+lsbjmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbbjmc (mbmc,khbh,bjjb)";
	ls_sql+=" select '"+lsbjmc+"',khbh,bjjb";
	ls_sql+=" from crm_zxkhxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbbjxmmx(mbmc,xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj,tcnxmbz)";
	ls_sql+=" select        '"+lsbjmc+"',xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,zqdj,zk,dj,sgdbj,sfyxdz,zdzk,gycl,flmcgg,bz,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,xmpx,glxmbh,lrr,lrsj,tcnxmbz";
	ls_sql+=" from bj_bjxmmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbglxmb (mbmc,khbh,xmbh,glxmbh)";
	ls_sql+=" select '"+lsbjmc+"',khbh,xmbh,glxmbh ";
	ls_sql+=" from bj_khglxmb ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbfjxx (mbmc,khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao,bz,fjzcxq ) ";
	ls_sql+=" select '"+lsbjmc+"',khbh,jgwzbm,fjmj,fjg,zdyxmmj,zdybzmj,oldjgwzbm,xuhao,bz,fjzcxq ";
	ls_sql+=" from bj_fjxx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbgclmx (mbmc,khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh )";
	ls_sql+=" select '"+lsbjmc+"',khbh,dqbm,xmbh,jgwzbm,sl,bz,fjnxh ";
	ls_sql+=" from bj_gclmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into bj_mbsfxmmx (mbmc,khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,sfje,bz,sfssjf,cbjbfb,sgcbjbfb,gcjcbjbfb )";
	ls_sql+=" select '"+lsbjmc+"',khbh,sfxmbm,sfxmmc,sflx,sfxmlx,sfcysgdjs,sfbxx,sfjrqye,jrsjbz,jrglfbz,sfkdz,zdzk,sfbfb,dj,jldw,sl,zqsfje,dxzkl,sfje,bz,sfssjf,NVL(cbjbfb,0),NVL(sgcbjbfb,0),NVL(gcjcbjbfb,0) ";
	ls_sql+=" from bj_sfxmmx ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();


	ls_sql="insert into bj_mbglfxb (mbmc,khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx )";
	ls_sql+=" select        '"+lsbjmc+"',khbh,glbxh,dqbm,bjjb,xmbh,glflbm,glfxclbm,glfxclmc,jldwbm,xhl,dj,jqsfl,bsfl,tvocsfl,wlllbz,lx ";
	ls_sql+=" from bj_khglfxb ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbkhgcxmxj (mbmc,khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz)";
	ls_sql+=" select '"+lsbjmc+"',khbh,xmbh,bzsl,sfxzsl,ccbfjj,sjsl,xjjsl,tcnxmbz";
	ls_sql+=" from bj_khgcxmxj ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbkhzcxmxj (mbmc,khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,ccbfjj,sfyqxtpp,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm)";
	ls_sql+=" select '"+lsbjmc+"',khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,sfxzsl,bzsl,ccbfjj,sfyqxtpp,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm";
	ls_sql+=" from bj_khzcxmxj ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="insert into      bj_mbkhzcxm (mbmc,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,dj,jsj,jjje,sh,sfcscp,xuhao,bz,sl,ptcpsm,bjjbbm)";
	ls_sql+=" select '"+lsbjmc+"',khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,dj,jsj,NVL(jjje,0),sh,sfcscp,xuhao,bz,sl,ptcpsm,bjjbbm";
	ls_sql+=" from bj_khzcxm ";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
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
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
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