<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ls=null;


String khbh=null;
String jgwzbm=null;
String cpbm=null;
khbh=cf.GB2Uni(request.getParameter("khbh"));
jgwzbm=cf.GB2Uni(request.getParameter("jgwzbm"));
cpbm=cf.GB2Uni(request.getParameter("cpbm"));
double sl=0;
String ptcpsm=null;
String bjjbbm=null;
ls=request.getParameter("sl");
try{
	if (!(ls.equals("")))  sl=Double.parseDouble(ls.trim());
}
catch (java.lang.NullPointerException nulle){
	out.println("<BR>变量[sl]不存在");
	return;
}
catch (Exception e){
	out.println("<BR>[数量]类型转换发生意外:"+e);
	return;
}
ptcpsm=cf.GB2Uni(request.getParameter("ptcpsm"));
bjjbbm=cf.GB2Uni(request.getParameter("bjjbbm"));

String tccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	String getzxzt=null;//0：未分配店面；1: 分配店面；2: 店面退回客户；3：已签约；4：公司签单失败；5：重新分配店面
	ls_sql="SELECT zxzt";
	ls_sql+=" FROM crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		getzxzt=rs.getString("zxzt");
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

	String sfxzsl="";//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	double bzsl=0;//标准数量
	double sjjmsl=0;//实际减免数量
	String tcsjflbm="";
	double ghzj=0;//更换折价
	double khzdsl=0;//可换最大数量
	ls_sql="select sfxzsl,bzsl,sjjmsl,tcsjflbm,ghzj,khzdsl";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflbm"));
		bzsl=rs.getDouble("bzsl");
		sjjmsl=rs.getDouble("sjjmsl");
		ghzj=rs.getDouble("ghzj");
		khzdsl=rs.getDouble("khzdsl");
	}
	rs.close();
	ps.close();

	bzsl=khzdsl;

	if (sjjmsl>0)
	{
		out.println("已被减免，不能再录入");
		return;
	}


	double tczcsl=0;//套餐外实际数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx in('1')";//1：套餐内；2：套餐外收费；3：大店
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tczcsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if (tczcsl>0)
	{
		out.println("错误！已选择套餐主材，不能再选择大店主材");
		return;
	}

	double tcnsjsl=0;//套餐内数量
	ls_sql="select sum(sl)";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	//1：套餐内；2：套餐外；3：升级大店；4：大店外
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		tcnsjsl=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	//是否要求相同品牌
	int sfyqxtpp=0;
	ls_sql="select count(*)";
	ls_sql+=" FROM bj_khzcxmxj";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tcsjflbm='"+tcsjflbm+"' and sfyqxtpp='Y'";//Y：是；N：否
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyqxtpp=rs.getInt(1);
	}
	rs.close();
	ps.close();

	double dj=0;
	double jsj=0;
	double jsbl=0;
	String sfycx="";
	String cxkssj="";
	String cxjssj="";
	double cxj=0;
	double cxjsj=0;
	double cxjsbl=0;
	String sfxclxs="";
	double xdb=0;
	double sh=0;

	ls_sql=" select dj,jsj,jsbl,sfycx,cxkssj,cxjssj,cxj,cxjsj,cxjsbl,sfxclxs,xdb,sh";
	ls_sql+=" from bj_tcwzck";
	ls_sql+=" where cpbm='"+cpbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dj=rs.getDouble("dj");
		jsj=rs.getDouble("jsj");
		jsbl=rs.getDouble("jsbl");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjssj=cf.fillNull(rs.getDate("cxjssj"));
		cxj=rs.getDouble("cxj");
		cxjsj=rs.getDouble("cxjsj");
		cxjsbl=rs.getDouble("cxjsbl");
		sfxclxs=cf.fillNull(rs.getString("sfxclxs"));
		xdb=rs.getDouble("xdb");
		sh=rs.getDouble("sh");
	}
	rs.close();
	ps.close();

	if (sfycx.equals("Y"))//Y：有促销；N：无促销
	{
		if (cxkssj.compareTo(cf.today())<=0 && cxjssj.compareTo(cf.today())>=0)
		{
			dj=cxj;
			jsj=cxjsj;
			jsbl=cxjsbl;
		}
		else{
			sfycx="N";
		}
	}


	double xdsl=0;
	if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
	{
		if (sl<0)
		{
			xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
		}
		else{
			xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
		}
	}
	else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
	{
		if (sl<0)
		{
			xdsl=java.lang.Math.ceil(sl*xdb*(100+sh)/100);
		}
		else{
			xdsl=java.lang.Math.floor(sl*xdb*(100+sh)/100);
		}
	}
	else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
	{
		xdsl=cf.round(sl*xdb*(100+sh)/100,0);
	}
	else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
	{
		xdsl=cf.round(sl*xdb*(100+sh)/100,2);
	}
	
	long sxh=0;
	ls_sql="select NVL(max(sxh),0)";
	ls_sql+=" from  bj_khzcxm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxh=rs.getLong(1);
	}
	rs.close();
	ps.close();


	conn.setAutoCommit(false);


	if (sfxzsl.equals("1"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		if (tcnsjsl>=bzsl)//超出标准数量限制，全部按套餐外收费
		{
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,? ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setDouble(4,dj-ghzj);
			ps.setDouble(5,dj);
			ps.setDouble(6,dj);
			ps.setDouble(7,jsj);
			ps.setDouble(8,jsbl);
			ps.setString(9,"4");//主材类型  1：套餐内；2：套餐外；3：升级大店；4：大店外
			ps.setDouble(10,sl);
			ps.setDouble(11,xdsl);
			ps.setString(12,ptcpsm);
			ps.setString(13,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//补差价不能小于0
			ls_sql=" update bj_khzcxm set tcndj=0";
			ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();
			

			%>
			<SCRIPT language=javascript >
			<!--
				alert("提醒！数量超过限制，需额外收费，收费数量:<%=sl%>");
			//-->
			</SCRIPT>
			<%
		}
		else if ((tcnsjsl+sl)<=bzsl)//未超出标准数量限制
		{
			//未超出标准数量限制，全部按套餐内补差价
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,?            ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setDouble(4,dj-ghzj);
			ps.setDouble(5,dj);
			ps.setDouble(6,dj-ghzj);
			ps.setDouble(7,jsj);
			ps.setDouble(8,jsbl);
			ps.setString(9,"3");//主材类型  1：套餐内；2：套餐外；3：升级大店；4：大店外
			ps.setDouble(10,sl);
			ps.setDouble(11,xdsl);
			ps.setString(12,ptcpsm);
			ps.setString(13,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//补差价不能小于0
			ls_sql=" update bj_khzcxm set tcndj=0,dj=0";
			ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

		}
		else//部分超出标准数量限制
		{
			if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				if ((bzsl-tcnsjsl)<0)
				{
					xdsl=java.lang.Math.floor((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.ceil((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				if ((bzsl-tcnsjsl)<0)
				{
					xdsl=java.lang.Math.ceil((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.floor((bzsl-tcnsjsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				xdsl=cf.round((bzsl-tcnsjsl)*xdb*(100+sh)/100,0);
			}
			else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				xdsl=cf.round((bzsl-tcnsjsl)*xdb*(100+sh)/100,2);
			}
			//部分超出标准数量限制，(bzsl-tcnsjsl)部分按套餐内补差价
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,?            ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setDouble(4,dj-ghzj);
			ps.setDouble(5,dj);
			ps.setDouble(6,dj-ghzj);
			ps.setDouble(7,jsj);
			ps.setDouble(8,jsbl);
			ps.setString(9,"3");//主材类型  1：套餐内；2：套餐外；3：升级大店；4：大店外
			ps.setDouble(10,bzsl-tcnsjsl);
			ps.setDouble(11,xdsl);
			ps.setString(12,ptcpsm);
			ps.setString(13,bjjbbm);
			ps.executeUpdate();
			ps.close();


			//补差价不能小于0
			ls_sql=" update bj_khzcxm set tcndj=0,dj=0";
			ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			if (sfxclxs.equals("1"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				if (((tcnsjsl+sl)-bzsl)<0)
				{
					xdsl=java.lang.Math.floor(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.ceil(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("2"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				if (((tcnsjsl+sl)-bzsl)<0)
				{
					xdsl=java.lang.Math.ceil(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
				else{
					xdsl=java.lang.Math.floor(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100);
				}
			}
			else if (sfxclxs.equals("3"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				xdsl=cf.round(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100,0);
			}
			else if (sfxclxs.equals("4"))//1：向上取整；2：向下取整；3：4舍5入；4：不处理
			{
				xdsl=cf.round(((tcnsjsl+sl)-bzsl)*xdb*(100+sh)/100,2);
			}

			//部分超出标准数量限制，(tcnsjsl+sl)-bzsl部分按套餐外收费
			ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
			ls_sql+=" select                ?+2,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,? ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
			ls_sql+=" from bj_tcwzck";
			ls_sql+=" where cpbm='"+cpbm+"'";
			ps= conn.prepareStatement(ls_sql);
			ps.setLong(1,sxh);
			ps.setString(2,khbh);
			ps.setString(3,jgwzbm);
			ps.setDouble(4,dj-ghzj);
			ps.setDouble(5,dj);
			ps.setDouble(6,dj);
			ps.setDouble(7,jsj);
			ps.setDouble(8,jsbl);
			ps.setString(9,"4");//主材类型  1：套餐内；2：套餐外；3：升级大店；4：大店外
			ps.setDouble(10,(tcnsjsl+sl)-bzsl);
			ps.setDouble(11,xdsl);
			ps.setString(12,ptcpsm);
			ps.setString(13,bjjbbm);
			ps.executeUpdate();
			ps.close();

			//补差价不能小于0
			ls_sql=" update bj_khzcxm set tcndj=0";
			ls_sql+=" where sxh='"+(sxh+2)+"' and tcndj<0";
			ps= conn.prepareStatement(ls_sql);
			ps.executeUpdate();
			ps.close();

			%>
			<SCRIPT language=javascript >
			<!--
				alert("提醒！数量超过限制，部分需收费，收费数量:<%=((tcnsjsl+sl)-bzsl)%>");
			//-->
			</SCRIPT>
			<%
		}
	}
	else if (sfxzsl.equals("2"))//是否限制数量  1:超量需加价；2：不可超量；3：无数量限制
	{
		//全部按套餐内补差价
		ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
		ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,?            ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,khbh);
		ps.setString(3,jgwzbm);
		ps.setDouble(4,dj-ghzj);
		ps.setDouble(5,dj);
		ps.setDouble(6,dj-ghzj);
		ps.setDouble(7,jsj);
		ps.setDouble(8,jsbl);
		ps.setString(9,"3");//主材类型  1：套餐内；2：套餐外；3：升级大店；4：大店外
		ps.setDouble(10,sl);
		ps.setDouble(11,xdsl);
		ps.setString(12,ptcpsm);
		ps.setString(13,bjjbbm);
		ps.executeUpdate();
		ps.close();

		//补差价不能小于0
		ls_sql=" update bj_khzcxm set tcndj=0,dj=0";
		ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}
	else{
		//全部按套餐内补差价
		ls_sql=" insert into bj_khzcxm (sxh,khbh,jgwzbm,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,tcndj        ,tccldj,dj           ,jsfs,jsj,jsbl,ddcljjfs,sh,sfcscp,bz,sfkgdj,zclx,sl,xdsl,ptcpsm,bjjbbm) ";
		ls_sql+=" select                ?+1,?   ,?     ,cpbm,tccpdlbm,tccplbbm,cpmc,ppmc,gysmc,xh,gg,jldw,xdjldw,xdb,sfxclxs,sfyx,yxkssj,yxjzsj,?            ,?     ,?            ,jsfs,?  ,?   ,jjfs    ,sh,'N'   ,bz,sfkgdj,?   ,? ,?   ,?     ,?  ";
		ls_sql+=" from bj_tcwzck";
		ls_sql+=" where cpbm='"+cpbm+"'";
		ps= conn.prepareStatement(ls_sql);
		ps.setLong(1,sxh);
		ps.setString(2,khbh);
		ps.setString(3,jgwzbm);
		ps.setDouble(4,dj-ghzj);
		ps.setDouble(5,dj);
		ps.setDouble(6,dj-ghzj);
		ps.setDouble(7,jsj);
		ps.setDouble(8,jsbl);
		ps.setString(9,"3");//主材类型  1：套餐内；2：套餐外；3：升级大店；4：大店外
		ps.setDouble(10,sl);
		ps.setDouble(11,xdsl);
		ps.setString(12,ptcpsm);
		ps.setString(13,bjjbbm);
		ps.executeUpdate();
		ps.close();

		//补差价不能小于0
		ls_sql=" update bj_khzcxm set tcndj=0,dj=0";
		ls_sql+=" where sxh='"+(sxh+1)+"' and tcndj<0";
		ps= conn.prepareStatement(ls_sql);
		ps.executeUpdate();
		ps.close();
	}





	//检查：要求相同品牌＋＋＋＋＋＋＋＋＋＋＋＋开始
	if (sfyqxtpp>0)//升级分类:要求相同品牌
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
			out.println("错误！[升级分类]中要求同一品牌，实际选了["+ppsl+"]个品牌");
			return;
		}
	}
	//检查：要求相同品牌＝＝＝＝＝＝＝＝＝＝＝＝结束


	//客户主材小计汇总：＋＋＋＋＋＋＋＋＋＋＋＋开始
	double sjsl=0;//实际数量
	double sjjshsl=0;//实际加损耗数量
	ls_sql="select sum(sl),sum(ROUND(sl*(100+sh)/100,2))";
	ls_sql+=" FROM bj_khzcxm";
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";
	//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
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
			out.println("错误！不可超量，实际数量["+sjsl+"]不能超过标准数量["+bzsl+"]");
			return;
		}
	}

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
	ls_sql+=" where khbh='"+khbh+"' and jgwzbm='"+jgwzbm+"' and tccplbbm='"+tccplbbm+"'";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();
	//客户主材小计汇总：＝＝＝＝＝＝＝＝＝＝＝＝结束

	
	//检查：小类数量限制：＋＋＋＋＋＋＋＋＋＋＋＋开始
	double tcslxz=0;//套餐数量限制
	String clxlmc="";
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
	ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
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
			ls_sql+=" where khbh='"+khbh+"' and tccplbbm='"+tccplbbm+"' and zclx='3'";//1：套餐内；2：套餐外；3：顶配套餐内；4：顶配套餐外
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
	
	
	conn.commit();

	%>
	<SCRIPT language=javascript >
	<!--
		window.location="InsertBj_khzcxmTcw.jsp?khbh=<%=khbh%>&jgwzbm=<%=jgwzbm%>&tccplbbm=<%=tccplbbm%>";
	//-->
	</SCRIPT>
	<%
}
catch (Exception e) {
	conn.rollback();
	out.print("<BR>存盘失败,发生意外: " + e);
	out.print("<BR>SQL=" + ls_sql);

	%>
	<SCRIPT language=javascript >
	<!--
		alert("！！！存盘失败，请重新选择");
		window.close();
	//-->
	</SCRIPT>
	<%

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