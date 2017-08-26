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

	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	String bjbbh=null;
	String ssfgs=null;
	String bjjb=null;
	String hxbm=null;
	ls_sql="SELECT zxzt,bjbbh,ssfgs,bjjb,hxbm";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
		bjbbh=rs.getString("bjbbh");
		ssfgs=rs.getString("ssfgs");
		bjjb=rs.getString("bjjb");
		hxbm=rs.getString("hxbm");
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

	//套餐，需要取：套餐标准主材项目、套餐标准工程项目
	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		//客户套餐价格表（bj_khtcjgb）
		ls_sql="delete from bj_khtcjgb "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khtcjgb (khbh,bjbbh,dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj)"; 
		ls_sql+=" select ?,bjbbh,dqbm,bjjbbm,hxbm,tcmc,fwmj,tcjg,pmzjdj,tlgbzjj";
		ls_sql+=" from bj_tcjgb";
		ls_sql+=" where bjbbh='"+bjbbh+"' and dqbm='"+dqbm+"' and bjjbbm='"+bjjb+"' and hxbm='"+hxbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		//客户材料小类数量限制
		ls_sql="delete from bj_khclxlxz "; 
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		ls_sql="insert into bj_khclxlxz (khbh,clxlbm,clxlmc,sfxzsl,tcslxz,ccbfjj,sfkjm,yxjmzdsl)"; 
		ls_sql+=" select ?,clxlbm,clxlmc,sfxzsl,tcslxz,ccbfjj,sfkjm,yxjmzdsl";
		ls_sql+=" from jxc_clxlbm";
		ls_sql+=" where sfxzsl!='1' OR sfkjm!='1'";//1：不限制；2：不能超量；3：可超量需加价 ;  1：不限制；2：限制
		ps= conn.prepareStatement(ls_sql);
		ps.setString(1,khbh);
		ps.executeUpdate();
		ps.close();

		//增加客户主材项目小计，来源：套餐标准主材项目＋＋＋＋＋＋＋＋＋＋＋＋＋＋开始

		ls_sql="insert into bj_khzcxmxj (khbh,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje,khbjjbbm,bjjbbm,sjsfycx,sjsfsl,sjcj,sjsfje)"; 
		ls_sql+=" select                 ?   ,jgwzbm,tccplbbm,tcsjflbm,sfbxx,sfyxsj,jldw,sfxzsl,bzsl,sfkjm,jmfl,jmjldw,yxjmzdsl,jmdj,sfkgh,khzdsl,ghzj,sfyqxtpp,0   ,0      ,0     ,0     ,bjjbbm  ,bjjbbm,'1'    ,0     ,0   ,0";//1：无促销；2：无数量限制促销；3：有数量限制促销
		ls_sql+=" from bj_tcbzzcxm";
		ls_sql+=" where bj_tcbzzcxm.dqbm='"+dqbm+"' and bj_tcbzzcxm.bjjbbm='"+bjjb+"'";
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


		//删除超范围主材＋＋＋＋＋＋＋＋＋＋＋＋开始
		//清除房间不存在主材
		ls_sql="delete from bj_khzcxm ";
		ls_sql+=" where khbh='"+khbh+"' and jgwzbm not in(select distinct jgwzbm from bj_khzcxmxj where khbh='"+khbh+"')";
		ls_sql+=" and zclx in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();

		//清除房间：类别不存在主材
		String jgwzbm=null;
		ls_sql="select distinct jgwzbm";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where  khbh='"+khbh+"'";
		ls_sql+=" order by jgwzbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			jgwzbm=rs1.getString("jgwzbm");

			ls_sql="delete from bj_khzcxm ";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"'";
			ls_sql+=" and tccplbbm not in(select distinct tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"')";
			ls_sql+=" and zclx in('1','2')";//1：套餐内；2：套餐外；3：升级大店；4：大店外
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
		}
		rs1.close();
		ps1.close();
		//删除超范围主材＝＝＝＝＝＝＝＝＝＝＝＝结束


		//检查：是否要求相同品牌＋＋＋＋＋＋＋＋＋＋＋＋开始
		String tcsjflbm="";
		String sfyqxtpp="";//是否要求相同品牌
		ls_sql="select distinct jgwzbm,tcsjflbm,sfyqxtpp";
		ls_sql+=" FROM bj_khzcxmxj";
		ls_sql+=" where khbh='"+khbh+"'";
		ls_sql+=" order by jgwzbm,tcsjflbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			jgwzbm=rs1.getString("jgwzbm");
			tcsjflbm=cf.fillNull(rs1.getString("tcsjflbm"));
			sfyqxtpp=cf.fillNull(rs1.getString("sfyqxtpp"));

				
			if (sfyqxtpp.equals("Y"))//是否要求相同品牌 :Y：是；N：否
			{
				int ppsl=0;
				ls_sql="select count(distinct ppmc)";
				ls_sql+=" FROM bj_khzcxm";
				ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm in (select tccplbbm from bj_khzcxmxj where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y')";
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
		}
		rs1.close();
		ps1.close();
		//检查：是否要求相同品牌＝＝＝＝＝＝＝＝＝＝＝＝结束


		//检查：小类数量汇总＋＋＋＋＋＋＋＋＋＋＋＋开始
		String tccplbbm=null;
		String clxlmc=null;
		String sfxzsl="";//是否限制数量
		double bzsl=0;//标准数量
		ls_sql="select jgwzbm,bj_khzcxmxj.tccplbbm,clxlmc,bj_khzcxmxj.sfxzsl,bj_khzcxmxj.bzsl";
		ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm";
		ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm and khbh='"+khbh+"'";
		ls_sql+=" order by jgwzbm,bj_khzcxmxj.tccplbbm";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			jgwzbm=rs1.getString("jgwzbm");
			tccplbbm=rs1.getString("tccplbbm");//套餐产品类别编码
			clxlmc=rs1.getString("clxlmc");

			sfxzsl=cf.fillNull(rs1.getString("sfxzsl"));
			bzsl=rs1.getDouble("bzsl");

				
			//房间小类超量检查：＋＋＋＋＋＋＋＋＋＋＋＋开始
			double sjsl=0;//实际数量
			double sjjshsl=0;//实际加损耗数量
			ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
			ls_sql+=" FROM bj_khzcxm";
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外；3：升级大店；4：大店外
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				sjsl=rs.getDouble(1);
				sjjshsl=rs.getDouble(2);
			}
			rs.close();
			ps.close();

			if (sfxzsl.equals("2"))//1:超量需加价;2:不可超量;3:无数量限制
			{
				if (sjsl>bzsl)
				{
					conn.rollback();
					out.println("错误！不可超量，["+jgwzbm+"]["+clxlmc+"]实际数量["+sjsl+"]不能超过标准数量["+bzsl+"]");
					return;
				}
			}
			//房间小类超量检查：＝＝＝＝＝＝＝＝＝＝＝＝结束

			//客户主材小计汇总：＋＋＋＋＋＋＋＋＋＋＋＋开始
			double sjsfsl=sjsl;//升级收费数量

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

			ls_sql="update bj_khzcxmxj set sjsl="+sjsl+",sjjshsl="+sjjshsl;
			ls_sql+=" ,sjsfsl="+sjsfsl+",sjsfje=sjcj*"+sjsfsl;
			ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			//客户主材小计汇总：＝＝＝＝＝＝＝＝＝＝＝＝结束

			//检查：小类数量限制：＋＋＋＋＋＋＋＋＋＋＋＋开始
			double tcslxz=0;//套餐数量限制
			clxlmc="";
			String getsfxzsl="";//是否限制数量  1：不限制；2：不能超量；3：可超量需加价
			ls_sql="select tcslxz,clxlmc,sfxzsl";
			ls_sql+=" FROM bj_khclxlxz";
			ls_sql+=" where khbh='"+khbh+"' and clxlbm='"+tccplbbm+"'";
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
			ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
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
					out.println("<P>类别【"+clxlmc+"】产品选择如下：");
					String getjgwzbm=null;
					String getcpmc=null;
					String getxh=null;
					double getsl=0;
					ls_sql="select jgwzbm,cpmc,xh,sl";
					ls_sql+=" FROM bj_khzcxm";
					ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='1'";//1：套餐内；2：套餐外收费；3：大店
					ps= conn.prepareStatement(ls_sql);
					rs =ps.executeQuery();
					while (rs.next())
					{
						getjgwzbm=rs.getString("jgwzbm");
						getcpmc=rs.getString("cpmc");
						getxh=rs.getString("xh");
						getsl=rs.getDouble("sl");

						out.println("<BR>位置:"+getjgwzbm+"、产品名称:"+getcpmc+"、型号:"+getxh+"、数量:"+getsl);
					}
					rs.close();
					ps.close();

					conn.rollback();
					out.println("<P>错误！类别【"+clxlmc+"】限制总数量，总数量["+xlsjsl+"]不能超过限制数量["+tcslxz+"]");
					return;
				}
			}
			//检查：小类数量限制：＝＝＝＝＝＝＝＝＝＝＝＝结束
	
		}
		rs1.close();
		ps1.close();
		//检查：小类数量汇总＝＝＝＝＝＝＝＝＝＝＝＝结束
	
	}


	//处理删除项工程量
	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where  khbh='"+khbh+"' and xmbh not in(select xmbh from bj_bjxmmx where khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	ls_sql="delete from bj_gclmx ";
	ls_sql+=" where  khbh='"+khbh+"' and jgwzbm not in(select jgwzbm from bj_fjxx where khbh='"+khbh+"')";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();

	//初始化
	dzbj.Tzk tzk=new dzbj.Tzk();
	//更新报价折扣
	tzk.updateBjZkl(conn,khbh,"yz");

	//更新其它收费项目，调整收费百分比
	dzbj.NewDzbj dzbj=new dzbj.NewDzbj();
	dzbj.updateSfxm(conn,khbh,"yz");

	//获取电子报价金额
	dzbj.Dzbjje dzbjje=new dzbj.Dzbjje();
	double dzbjze=dzbjje.getAllBjje(conn,khbh,"yz");


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
	alert("重置套餐标准主材项目成功！");
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

