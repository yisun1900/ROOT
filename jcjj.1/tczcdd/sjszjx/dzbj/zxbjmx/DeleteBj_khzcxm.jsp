<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
String sxh=cf.GB2Uni(request.getParameter("sxh"));
String jgwzbm=cf.GB2Uni(cf.getParameter(request,"jgwzbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String sfwc="";
	String khbh="";
	ls_sql="select sfwc,khbh";
	ls_sql+=" from  crm_zjxdj";
	ls_sql+=" where zjxxh='"+zjxxh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfwc=rs.getString("sfwc");
		khbh=rs.getString("khbh");
	}
	rs.close();
	ps.close();

	if (sfwc.equals("Y"))//N：未完成；Y：完成
	{
		out.println("错误！增减项已完成，不能再修改");
		return;
	}

	String khbjjbbm=null;
	ls_sql="SELECT bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbjjbbm=rs.getString("bjjb");
	}
	rs.close();
	ps.close();

	String tccplbbm="";
	String zclx="";
	String ppmc=null;
	String bjjbbm="";
	ls_sql="select tccplbbm,zclx,ppmc,bjjbbm";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tccplbbm=rs.getString("tccplbbm");
		zclx=cf.fillNull(rs.getString("zclx"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
	}
	rs.close();
	ps.close();

	String sfxzsl="";
	double bzsl=0;
	ls_sql="select sfxzsl,bzsl";
	ls_sql+=" FROM bj_khzcxmxjh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		bzsl=rs.getDouble("bzsl");
	}
	rs.close();
	ps.close();

	conn.setAutoCommit(false);

	ls_sql=" delete from  bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and sxh="+sxh;
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//因为删除，有些需要收费主材改为不收费＋＋＋＋＋＋＋＋＋＋开始

	String getsxh="";
	double tcndj=0;
	double tccldj=0;
	double getsl=0;
	ls_sql="select sxh,sl,tcndj,tccldj";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
	//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getsxh=rs.getString("sxh");
		getsl=rs.getDouble("sl");
		tcndj=rs.getDouble("tcndj");
		tccldj=rs.getDouble("tccldj");

		//获取本小类不收费主材数量
		double sjsl=0;//实际数量
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where sxh!='"+getsxh+"' and zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjsl=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		if (sfxzsl.equals("1"))//1:超量需加价;2:不可超量;3:无数量限制
		{
			if ((sjsl+getsl)<=bzsl)//本小类不收费数量＋收费数量<标准数量，把收费转为套餐内不收费
			{
				ls_sql="update bj_khzcxmh set zclx='1',dj=tcndj";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl>=bzsl)//全部转为套餐外
			{
				ls_sql="update bj_khzcxmh set zclx='2',dj=tccldj";
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();
			}
			else if (sjsl<bzsl)//不收费数量<标准数量，(bzsl-sjsl)部分转为套餐内不收费
			{
				ls_sql="update bj_khzcxmh set zclx='2',dj=tccldj,sl="+(sjsl+getsl-bzsl);
				ls_sql+=" where zjxxh='"+zjxxh+"' and sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.executeUpdate();
				ps1.close();

				long newsxh=0;
				ls_sql="select NVL(max(sxh),0)";
				ls_sql+=" from  bj_khzcxmh";
				ls_sql+=" where zjxxh='"+zjxxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					newsxh=rs1.getLong(1);
				}
				rs1.close();
				ps1.close();

				ls_sql=" insert into bj_khzcxmh (sxh,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,dj   ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,ptcpsm,bjjbbm,lx,ywdhslbz) ";
				ls_sql+=" select                ?+1,zjxxh,khbh,jgwzbm,cpbm,sku,tccpdlbm,tccplbbm,tcsjflbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj,tccldj,tcndj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,?    ,? ,ptcpsm,bjjbbm,lx,'Y'";
				ls_sql+=" from bj_khzcxmh";
				ls_sql+=" where sxh='"+getsxh+"'";
				ps1= conn.prepareStatement(ls_sql);
				ps1.setLong(1,newsxh);
				ps1.setString(2,"1");//主材类型  1：套餐内；2：套餐外收费；3：大店
				ps1.setDouble(3,bzsl-sjsl);
				ps1.executeUpdate();
				ps1.close();
			}
		}
	}
	rs.close();
	ps.close();

	//因为删除，有些需要收费主材改为不收费＝＝＝＝＝＝＝＝＝＝结束

	//客户主材小计汇总：＋＋＋＋＋＋＋＋＋＋＋＋开始
	double sjsfsl=0;//升级收费数量
	double ppsjsfsl=0;//品牌升级收费数量
	if (!khbjjbbm.equals(bjjbbm))//升级
	{
		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
		ls_sql+=" and ppmc not in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_khppsjcjbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();

		ls_sql="select sum(sl)";
		ls_sql+=" FROM bj_khzcxmh";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
		ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
		ls_sql+=" and ppmc='"+ppmc+"'";
		ls_sql+=" and ppmc in ( ";
		ls_sql+=" select ppmc ";
		ls_sql+=" from bj_khppsjcjbh ";
		ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
		ls_sql+=" ) ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ppsjsfsl=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	}

	//客户品牌升级差价表（bj_khppsjcjb）
	ls_sql=" update bj_khppsjcjbh set sjsfsl=?,sjsfje=sjcj*?"; 
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and ppmc='"+ppmc+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,ppsjsfsl);
	ps.setDouble(2,ppsjsfsl);
	ps.executeUpdate();
	ps.close();


	double sjsl=0;//实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (sfxzsl.equals("2"))//1:超量需加价;2:不可超量;3:无数量限制
	{
		if (sjsl>bzsl)
		{
			conn.rollback();
			out.println("错误！不可超量，实际数量["+sjsl+"]不能超过标准数量["+bzsl+"]");
			return;
		}
	}


	double sjjshsl=0;//实际加损耗数量
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxmh";
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ls_sql+=" and bj_khzcxmh.ywdhslbz='Y'";//有无订货数量标志 Y：有数量；N：数量为0
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sjsl=rs.getDouble(1);
		sjjshsl=rs.getDouble(2);
	}
	rs.close();
	ps.close();

	ls_sql="update bj_khzcxmxjh set sjsl="+sjsl+",sjjshsl="+sjjshsl;
	ls_sql+=" ,sjsfsl="+sjsfsl+",sjsfje=sjcj*"+sjsfsl;
	ls_sql+=" where zjxxh='"+zjxxh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//客户主材小计汇总：＝＝＝＝＝＝＝＝＝＝＝＝结束

	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	window.close();
	//-->
	</SCRIPT>
	<%

}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
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