<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;


try {
	conn=cf.getConnection();

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 设计师提交飞单；3：已签约；4：飞单；5：飞单审核未通过
	String bjbbh=null;
	String ssfgs=null;
	String hxbm=null;
	String bjjb=null;
	ls_sql="SELECT zxzt,bjbbh,ssfgs,hxbm,bjjb";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		hxbm=rs.getString("hxbm");
		bjjb=rs.getString("bjjb");
	}
	rs.close();
	ps.close();


	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (getzxzt.equals("3"))
	{
		int czbzsq=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_czbjsqjl";
		ls_sql+=" where khbh='"+khbh+"' and wcbz='1'";//1：未完成；2：完成；3：业绩结转
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			czbzsq=rs.getInt(1);
		}
		rs.close();
		ps.close();

		if (czbzsq==0)
		{
			out.println("错误！客户已签单，不能再修改报价");
			return;
		}
	}
	else if (getzxzt.equals("2") || getzxzt.equals("4"))
	{
		out.println("错误！客户签单失败，不能再修改报价");
		return;
	}

	String dqbm=null;
	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);

	//客户主材项目小计
	ls_sql="delete from bj_khzcxmxj";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	if (lx.equals("1"))//1：非套餐；2：套餐
	{
	}
	else//套餐，需要取：套餐标准主材项目、套餐标准工程项目
	{
		//增加客户主材项目小计，来源：套餐标准主材项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始
		ls_sql="insert into bj_khzcxmxj (khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,bzsl,sfxzsl,ccbfjj,sjsl,sjjshsl,xjjsl,khbjjbbm,bjjbbm,sfyqxtpp) "; 
		ls_sql+=" select ?,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,bzsl,sfxzsl,ccbfjj,0,0,0,bjjbbm,bjjbbm,sfyqxtpp";
		ls_sql+=" from bj_tcbzzcxm";
		ls_sql+=" where bj_tcbzzcxm.dqbm='"+dqbm+"' and bj_tcbzzcxm.bjjbbm='"+bjjb+"' and bj_tcbzzcxm.bjbbh='"+bjbbh+"'";
		ls_sql+=" and bj_tcbzzcxm.hxbm='"+hxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			count=rs.getInt(1);
		}
		rs.close();
		ps.close();
		if (count==0)
		{
			conn.rollback();
			out.println("错误！【套餐标准主材项目】未初始化");
			return;
		}
		//增加客户主材项目小计，来源：套餐标准主材项目＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝结束



		String jgwzbm=null;
		String cpbm=null;
		String tccplbbm=null;
		String clxlmc=null;
		ls_sql="select jgwzbm,cpbm,tccplbbm,clxlmc";
		ls_sql+=" from  bj_khzcxm,jxc_clxlbm";
		ls_sql+=" where bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm and bj_khzcxm.khbh='"+khbh+"'";
		ls_sql+=" order by jgwzbm,cpbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			jgwzbm=rs1.getString("jgwzbm");
			cpbm=rs1.getString("cpbm");
			tccplbbm=rs1.getString("tccplbbm");//套餐产品类别编码
			clxlmc=rs1.getString("clxlmc");
				
			String sfxzsl="";//是否限制数量
			double bzsl=0;//标准数量
			String tcsjflbm="";
			ls_sql="select sfxzsl,bzsl,tcsjflbm";
			ls_sql+=" FROM bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
				tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
				bzsl=rs.getDouble("bzsl");
			}
			rs.close();
			ps.close();

			String sfyqxtpp="";//是否要求相同品牌
			ls_sql="select sfyqxtpp";
			ls_sql+=" FROM bj_khzcxmxj";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
			}
			rs.close();
			ps.close();
				
			if (sfyqxtpp.equals("Y"))//是否要求相同品牌 :Y：是；N：否
			{
				int ppsl=0;
				ls_sql="select count(distinct ppmc)";
				ls_sql+=" FROM bj_khzcxm";
				ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"'";
				ps= conn.prepareStatement(ls_sql);
				rs =ps.executeQuery();
				if (rs.next())
				{
					ppsl=rs.getInt(1);
				}
				rs.close();
				ps.close();

				if (ppsl>1)
				{
					conn.rollback();
					out.println("错误！此类别只能选择同一品牌主材");
					return;
				}
			}

			double sjsl=0;
			double sjjshsl=0;
			double xjjsl=0;
			ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
			ls_sql+=" FROM bj_khzcxm";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjsl=rs.getDouble(1);
				sjjshsl=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			if (sfxzsl.equals("1"))//是否限制数量  1：可增项；2：不可增项；3：不控制
			{
				if (sjsl>bzsl)
				{
					xjjsl=sjsl-bzsl;
				}
			}
			else if (sfxzsl.equals("2"))//是否限制数量  1：可增项；2：不可增项；3：不控制
			{
				if (sjsl>bzsl)
				{
					conn.rollback();
					out.println("错误！不可增项，实际数量["+sjsl+"]不能超过标准数量["+bzsl+"]:"+jgwzbm+"、"+clxlmc);
					return;
				}
			}


			ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl+",xjjsl="+xjjsl;
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			double tcslxz=0;//套餐数量限制
			clxlmc="";
			String getsfxzsl="";//是否限制数量  1：不限制；2：不能超量；3：可超量需加价
			ls_sql="select tcslxz,clxlmc,sfxzsl";
			ls_sql+=" FROM jxc_clxlbm";
			ls_sql+=" where clxlbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				tcslxz=rs.getDouble("tcslxz");
				clxlmc=cf.fillNull(rs.getString("clxlmc"));
				getsfxzsl=cf.fillNull(rs.getString("sfxzsl"));
			}
			rs.close();
			ps.close();

			double xlsjsl=0;
			double xlsjjshsl=0;
			ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
			ls_sql+=" FROM bj_khzcxm";
			ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				xlsjsl=rs.getDouble(1);
				xlsjjshsl=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			if (getsfxzsl.equals("2"))//1：不限制；2：不能超量；3：可超量需加价
			{
				if (xlsjsl>tcslxz)
				{
					conn.rollback();
					out.println("错误！类别【"+clxlmc+"】限制总数量，总数量["+xlsjsl+"]不能超过限制数量["+tcslxz+"]");
					return;
				}
			}

		}
		rs1.close();
		ps1.close();
	
	}

	//初始化
	dzbj.Dzbj dzbj=new dzbj.Dzbj();

	//更新报价折扣
	dzbj.updateBjZkl(conn,khbh,"yz");
	//更新其它收费项目，调整收费百分比
	dzbj.updateSfxm(conn,khbh,"yz");
	//获取电子报价金额
	double dzbjze=dzbj.getAllBjje(conn,khbh,"yz");


	//修改：电子报价总额
	ls_sql="update crm_zxkhxx set dzbjze=?";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.setDouble(1,dzbjze);
	ps.executeUpdate();
	ps.close();

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
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	conn.setAutoCommit(true);
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

