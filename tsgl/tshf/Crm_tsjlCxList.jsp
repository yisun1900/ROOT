<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 16px'>
<%
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

	String ls_sql=null;
	String wheresql="";
	String lxsql="";
	String crm_tsjl_tsjlh=null;
	String crm_tsjl_slfsbm=null;
	String hth=null;
	String crm_tsjl_khbh=null;
	String crm_tsjl_khxm=null;
	String crm_tsjl_fwdz=null;
	String crm_tsjl_lxfs=null;
	String crm_tsjl_sjs=null;
	String crm_tsjl_sgd=null;
	String crm_tsjl_zjy=null;
	String crm_tsjl_jgrq=null;
	String crm_tsjl_sfxhf=null;
	String crm_tsjl_hfsj=null;
	String crm_tsjl_slsj=null;
	String crm_tsjl_slr=null;
	String crm_tsjl_clzt=null;
	String crm_tsjl_yqjjsj=null;

	String lx=null;
	lx=request.getParameter("lx");
	if (lx!=null)
	{
		if (!(lx.equals("")))	lxsql=" and  (crm_tsjl.lx='"+lx+"')";
	}


	String lswhere="";
	crm_tsjl_sfxhf=request.getParameter("crm_tsjl_sfxhf");
	if (crm_tsjl_sfxhf!=null)
	{
		crm_tsjl_sfxhf=cf.GB2Uni(crm_tsjl_sfxhf);
		if (!(crm_tsjl_sfxhf.equals("")))	lswhere+=" and  (crm_tsjl.sfxhf='"+crm_tsjl_sfxhf+"')";
	}
	crm_tsjl_hfsj=request.getParameter("crm_tsjl_hfsj");
	if (crm_tsjl_hfsj!=null)
	{
		crm_tsjl_hfsj=crm_tsjl_hfsj.trim();
		if (!(crm_tsjl_hfsj.equals("")))	lswhere+="  and (crm_tsjl.hfsj>=TO_DATE('"+crm_tsjl_hfsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_hfsj=request.getParameter("crm_tsjl_hfsj2");
	if (crm_tsjl_hfsj!=null)
	{
		crm_tsjl_hfsj=crm_tsjl_hfsj.trim();
		if (!(crm_tsjl_hfsj.equals("")))	lswhere+="  and (crm_tsjl.hfsj<=TO_DATE('"+crm_tsjl_hfsj+"','YYYY/MM/DD'))";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))
	{
		wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))
	{
		wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}


	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj");
	if (crm_tsjl_yqjjsj!=null)
	{
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj>=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}
	String zrbmclzt=null;
	zrbmclzt=request.getParameter("zrbmclzt");
	if (zrbmclzt!=null)
	{
		if (!(zrbmclzt.equals("")))	wheresql+=" and  (crm_tsjl.zrbmclzt='"+zrbmclzt+"')";
	}
	String yzcdbm=null;
	yzcdbm=request.getParameter("yzcdbm");
	if (yzcdbm!=null)
	{
		if (!(yzcdbm.equals("")))	wheresql+=" and  (crm_tsjl.yzcdbm='"+yzcdbm+"')";
	}

	crm_tsjl_yqjjsj=request.getParameter("crm_tsjl_yqjjsj2");
	if (crm_tsjl_yqjjsj!=null)
	{
		if (!(crm_tsjl_yqjjsj.equals("")))	wheresql+="  and (crm_tsjl.yqjjsj<=TO_DATE('"+crm_tsjl_yqjjsj+"','YYYY/MM/DD'))";
	}

	crm_tsjl_tsjlh=request.getParameter("crm_tsjl_tsjlh");
	if (crm_tsjl_tsjlh!=null)
	{
		crm_tsjl_tsjlh=crm_tsjl_tsjlh.trim();
		if (!(crm_tsjl_tsjlh.equals("")))	wheresql+=" and (crm_tsjl.tsjlh="+crm_tsjl_tsjlh+") ";
	}
	crm_tsjl_slfsbm=request.getParameter("crm_tsjl_slfsbm");
	if (crm_tsjl_slfsbm!=null)
	{
		crm_tsjl_slfsbm=cf.GB2Uni(crm_tsjl_slfsbm);
		if (!(crm_tsjl_slfsbm.equals("")))	wheresql+=" and  (crm_tsjl.slfsbm='"+crm_tsjl_slfsbm+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	crm_tsjl_khbh=request.getParameter("crm_tsjl_khbh");
	if (crm_tsjl_khbh!=null)
	{
		crm_tsjl_khbh=cf.GB2Uni(crm_tsjl_khbh);
		if (!(crm_tsjl_khbh.equals("")))	wheresql+=" and  (crm_tsjl.khbh='"+crm_tsjl_khbh+"')";
	}
	crm_tsjl_khxm=request.getParameter("crm_tsjl_khxm");
	if (crm_tsjl_khxm!=null)
	{
		crm_tsjl_khxm=cf.GB2Uni(crm_tsjl_khxm);
		if (!(crm_tsjl_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_tsjl_khxm+"')";
	}
	crm_tsjl_fwdz=request.getParameter("crm_tsjl_fwdz");
	if (crm_tsjl_fwdz!=null)
	{
		crm_tsjl_fwdz=cf.GB2Uni(crm_tsjl_fwdz);
		if (!(crm_tsjl_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_tsjl_fwdz+"%')";
	}
	crm_tsjl_lxfs=request.getParameter("crm_tsjl_lxfs");
	if (crm_tsjl_lxfs!=null)
	{
		crm_tsjl_lxfs=cf.GB2Uni(crm_tsjl_lxfs);
		if (!(crm_tsjl_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_tsjl_lxfs+"%')";
	}
	crm_tsjl_sjs=request.getParameter("crm_tsjl_sjs");
	if (crm_tsjl_sjs!=null)
	{
		crm_tsjl_sjs=cf.GB2Uni(crm_tsjl_sjs);
		if (!(crm_tsjl_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_tsjl_sjs+"')";
	}
	crm_tsjl_sgd=request.getParameter("crm_tsjl_sgd");
	if (crm_tsjl_sgd!=null)
	{
		crm_tsjl_sgd=cf.GB2Uni(crm_tsjl_sgd);
		if (!(crm_tsjl_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_tsjl_sgd+"')";
	}
	crm_tsjl_zjy=request.getParameter("crm_tsjl_zjy");
	if (crm_tsjl_zjy!=null)
	{
		crm_tsjl_zjy=cf.GB2Uni(crm_tsjl_zjy);
		if (!(crm_tsjl_zjy.equals("")))	wheresql+=" and  (crm_khxx.zjy='"+crm_tsjl_zjy+"')";
	}
	crm_tsjl_jgrq=request.getParameter("crm_tsjl_jgrq");
	if (crm_tsjl_jgrq!=null)
	{
		crm_tsjl_jgrq=crm_tsjl_jgrq.trim();
		if (!(crm_tsjl_jgrq.equals("")))	wheresql+="  and (crm_khxx.jgrq=TO_DATE('"+crm_tsjl_jgrq+"','YYYY/MM/DD'))";
	}



	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slsj=request.getParameter("crm_tsjl_slsj2");
	if (crm_tsjl_slsj!=null)
	{
		crm_tsjl_slsj=crm_tsjl_slsj.trim();
		if (!(crm_tsjl_slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+crm_tsjl_slsj+"','YYYY/MM/DD'))";
	}
	crm_tsjl_slr=request.getParameter("crm_tsjl_slr");
	if (crm_tsjl_slr!=null)
	{
		crm_tsjl_slr=cf.GB2Uni(crm_tsjl_slr);
		if (!(crm_tsjl_slr.equals("")))	wheresql+=" and  (crm_tsjl.slr='"+crm_tsjl_slr+"')";
	}
	crm_tsjl_clzt=request.getParameter("crm_tsjl_clzt");
	if (crm_tsjl_clzt!=null)
	{
		crm_tsjl_clzt=cf.GB2Uni(crm_tsjl_clzt);
		if (!(crm_tsjl_clzt.equals("")))	wheresql+=" and  (crm_tsjl.clzt='"+crm_tsjl_clzt+"')";
	}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;

try {
	conn=cf.getConnection();

%> 
<font color="#0000FF"><b>问题已解决客户－－可以回访准备结案</b></font> 
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="6%">投诉序号</td>
	<td  width="5%">类型</td>
	<td  width="5%">受理</td>
	<td  width="6%">需回访时间</td>
	<td  width="30%">投诉报修内容</td>
	<td  width="6%">最新回访时间</td>
	<td  width="5%">回访人</td>
	<td  width="6%">客服受理时间</td>
	<td  width="6%">结案</td>
</tr>

<%
	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String sjs=null;
	String zjxm=null;
	String sgd=null;

	String tsjlh=null;
	String hfsj=null;
	String zxhfsj=null;
	String hfr=null;
	String slfsmc=null;
	String tsxlmc=null;
	String tsyymc=null;
	String tsnr=null;
	String clqk=null;
	String yqjjsj=null;
	String slsj=null;
	String dwmc=null;
	String jazt=null;
	String clzt=null;
	String clsj=null;
	String hfjgmc=null;
	String lxmc=null;

	String bgcolor=null;

	int count=0;

	int row=0;

	String khbhstr="";
	
	ls_sql=" SELECT distinct crm_tsjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,sgdmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,sq_sgd";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=lxsql;
    ls_sql+=" and (crm_khxx.hfdjbz in('0','1') or (crm_khxx.hfdjbz in('2','3') and  crm_khxx.jhjdsj<=SYSDATE)) ";//0：未冻结；1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结
	ls_sql+=" and crm_tsjl.clzt not in('0','3','9')";//0：未受理；1：已受理；4：已接收；5：已出现场；6：已出方案；7：方案审核通过；2：在处理；3：结案；9:不立案
	ls_sql+=" and crm_tsjl.zrbmclzt='3'";
	//1：未处理；2：在处理；3：已解决
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjxm=rs.getString("zjxm");
		sgd=rs.getString("sgdmc");

		khbhstr+=",'"+khbh+"'";

		//获取重复行数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_tsjl";
		ls_sql+=" where crm_tsjl.khbh='"+khbh+"'";
		ls_sql+=" and crm_tsjl.clzt in('1','2')";//：未受理；1：已受理；2：在处理；3：结案；9:不立案
		ls_sql+=lxsql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		row++;

		ls_sql=" SELECT crm_tsjl.tsjlh,DECODE(crm_tsjl.lx,'1','投诉','2','报修') lxmc,tsnr,crm_tsjl.hfsj,slfsmc,crm_tsjl.yqjjsj,crm_tsjl.zxhfsj,crm_tsjl.hfr,crm_tsjl.slsj,DECODE(crm_tsjl.clzt,'0','未受理',1,'已受理',2,'在处理',3,'结案','9','不立案') jazt ";
		ls_sql+=" FROM crm_tsjl,dm_slfsbm";
		ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm ";
		ls_sql+=" and crm_tsjl.khbh='"+khbh+"'";
		ls_sql+=" and crm_tsjl.clzt in('1','2')";//：未受理；1：已受理；2：在处理；3：结案；9:不立案
		ls_sql+=lxsql;
		ls_sql+=" order by crm_tsjl.hfsj,crm_tsjl.tsjlh";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery(ls_sql);
		if (rs2.next())
		{
			tsjlh=rs2.getString("tsjlh");
			tsnr=cf.fillHtml(rs2.getString("tsnr"));
			hfsj=cf.fillHtml(rs2.getDate("hfsj"));
			zxhfsj=cf.fillHtml(rs2.getDate("zxhfsj"));
			hfr=rs2.getString("hfr");
			lxmc=rs2.getString("lxmc");
			slfsmc=rs2.getString("slfsmc");
			yqjjsj=cf.fillHtml(rs2.getDate("yqjjsj"));
			slsj=cf.fillHtml(rs2.getDate("slsj"));
			jazt=rs2.getString("jazt");

			//获取最新回访人

			if (row%2==0)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}


			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td rowspan="<%=count%>"><A target='_blank' HREF="InsertCrm_tshfjl.jsp?khbh=<%=khbh%>&lx=<%=lx%>"><%=row%>:回访</A></td>
				<td rowspan="<%=count%>" ><A target='_blank' HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>"><%=khxm%></A></td>
				<td rowspan="<%=count%>"><%=fwdz%></td>
				<td>
					<A target='_blank' HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>"><%=tsjlh%></A>
				</td>
				<td><%=lxmc%></td>
				<td><%=slfsmc%></td>
				<td><%=hfsj%></td>
				<td align="left"><%=tsnr%></td>
				<td><%=zxhfsj%></td>
				<td><%=cf.fillHtml(hfr)%></td>
				<td><%=slsj%></td>
				<td><%=jazt%></td>

			</tr>
			<%	
		}

		while (rs2.next())
		{
			tsjlh=rs2.getString("tsjlh");
			tsnr=cf.fillHtml(rs2.getString("tsnr"));
			hfsj=cf.fillHtml(rs2.getDate("hfsj"));
			zxhfsj=cf.fillHtml(rs2.getDate("zxhfsj"));
			hfr=rs2.getString("hfr");
			lxmc=rs2.getString("lxmc");
			slfsmc=rs2.getString("slfsmc");
			yqjjsj=cf.fillHtml(rs2.getDate("yqjjsj"));
			slsj=cf.fillHtml(rs2.getDate("slsj"));
			jazt=rs2.getString("jazt");

			//获取最新回访人

			if (row%2==0)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}


			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td>
					<A target='_blank' HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>"><%=tsjlh%></A>
				</td>
				<td><%=lxmc%></td>
				<td><%=slfsmc%></td>
				<td><%=hfsj%></td>
				<td align="left"><%=tsnr%></td>
				<td><%=zxhfsj%></td>
				<td><%=cf.fillHtml(hfr)%></td>
				<td><%=slsj%></td>
				<td><%=jazt%></td>

			</tr>
			<%	
		}
		rs2.close();
		ps2.close();
	
	}
	rs.close();
	ps.close();

	if (!khbhstr.equals(""))
	{
		khbhstr=" and crm_tsjl.khbh not in ("+khbhstr.substring(1)+")";
	}
%>

</table>
<P> <font color="#FF0000"><b>问题未解决客户 </b></font>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="6%">投诉序号</td>
	<td  width="5%">类型</td>
	<td  width="5%">受理</td>
	<td  width="6%">需回访时间</td>
	<td  width="30%">投诉报修内容</td>
	<td  width="6%">最新回访时间</td>
	<td  width="5%">回访人</td>
	<td  width="6%">客服受理时间</td>
	<td  width="6%">结案</td>
</tr>

<%

	ls_sql=" SELECT distinct crm_tsjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.zjxm,sgdmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,sq_sgd";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql+lswhere;
    ls_sql+=lxsql;
	ls_sql+= khbhstr;
    ls_sql+=" and (crm_khxx.hfdjbz in('0','1') or (crm_khxx.hfdjbz in('2','3') and  crm_khxx.jhjdsj<=SYSDATE)) ";//0：未冻结；1：工程回访冻结；2：投诉报修回访冻结；3：全部冻结
	ls_sql+=" and crm_tsjl.clzt in('1','2')";//：未受理；1：已受理；2：在处理；3：结案；9:不立案
	ls_sql+=" and crm_tsjl.zrbmclzt!='3'";
	//1：未处理；2：在处理；3：已解决

	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		khbh=rs.getString("khbh");
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		sjs=rs.getString("sjs");
		zjxm=rs.getString("zjxm");
		sgd=rs.getString("sgdmc");

		//获取重复行数量
		ls_sql=" SELECT count(*)";
		ls_sql+=" FROM crm_tsjl";
		ls_sql+=" where crm_tsjl.khbh='"+khbh+"'";
		ls_sql+=" and crm_tsjl.clzt in('1','2')";//：未受理；1：已受理；2：在处理；3：结案；9:不立案
		ls_sql+=lxsql;
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery(ls_sql);
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		row++;

		ls_sql=" SELECT crm_tsjl.tsjlh,DECODE(crm_tsjl.lx,'1','投诉','2','报修') lxmc,tsnr,crm_tsjl.hfsj,slfsmc,crm_tsjl.yqjjsj,crm_tsjl.zxhfsj,crm_tsjl.hfr,crm_tsjl.slsj,DECODE(crm_tsjl.clzt,'0','非客服登记',1,'受理',2,'在处理',3,'结案','9','不立案') jazt ";
		ls_sql+=" FROM crm_tsjl,dm_slfsbm";
		ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm ";
		ls_sql+=" and crm_tsjl.khbh='"+khbh+"'";
		ls_sql+=" and crm_tsjl.clzt in('1','2')";//：未受理；1：已受理；2：在处理；3：结案；9:不立案
		ls_sql+=lxsql;
		ls_sql+=" order by crm_tsjl.hfsj,crm_tsjl.tsjlh";
		ps2= conn.prepareStatement(ls_sql);
		rs2 =ps2.executeQuery();
		if (rs2.next())
		{
			tsjlh=rs2.getString("tsjlh");
			tsnr=cf.fillHtml(rs2.getString("tsnr"));
			hfsj=cf.fillHtml(rs2.getDate("hfsj"));
			zxhfsj=cf.fillHtml(rs2.getDate("zxhfsj"));
			hfr=rs2.getString("hfr");
			lxmc=rs2.getString("lxmc");
			slfsmc=rs2.getString("slfsmc");
			yqjjsj=cf.fillHtml(rs2.getDate("yqjjsj"));
			slsj=cf.fillHtml(rs2.getDate("slsj"));
			jazt=rs2.getString("jazt");

			if (row%2==0)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td rowspan="<%=count%>"><A target='_blank' HREF="InsertCrm_tshfjl.jsp?khbh=<%=khbh%>&lx=<%=lx%>"><%=row%>:回访</A></td>
				<td rowspan="<%=count%>" ><A target='_blank' HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=khbh%>"><%=khxm%></A></td>
				<td rowspan="<%=count%>"><%=fwdz%></td>
				<td>
					<A target='_blank' HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>"><%=tsjlh%></A>
				</td>
				<td><%=lxmc%></td>
				<td><%=slfsmc%></td>
				<td><%=hfsj%></td>
				<td align="left"><%=tsnr%></td>
				<td><%=zxhfsj%></td>
				<td><%=cf.fillHtml(hfr)%></td>
				<td><%=slsj%></td>
				<td><%=jazt%></td>
			</tr>
			<%	
		}

		while (rs2.next())
		{
			tsjlh=rs2.getString("tsjlh");
			tsnr=cf.fillHtml(rs2.getString("tsnr"));
			hfsj=cf.fillHtml(rs2.getDate("hfsj"));
			zxhfsj=cf.fillHtml(rs2.getDate("zxhfsj"));
			hfr=rs2.getString("hfr");
			lxmc=rs2.getString("lxmc");
			slfsmc=rs2.getString("slfsmc");
			yqjjsj=cf.fillHtml(rs2.getDate("yqjjsj"));
			slsj=cf.fillHtml(rs2.getDate("slsj"));
			jazt=rs2.getString("jazt");

			if (row%2==0)
			{
				bgcolor="#E8E8FF";
			}
			else{
				bgcolor="#FFFFFF";
			}

			%>
			<tr bgcolor="<%=bgcolor%>"  align="center">
				<td>
					<A target='_blank' HREF="/tsgl/cx/ViewCrm_tsjl.jsp?tsjlh=<%=tsjlh%>"><%=tsjlh%></A>
				</td>
				<td><%=lxmc%></td>
				<td><%=slfsmc%></td>
				<td><%=hfsj%></td>
				<td align="left"><%=tsnr%></td>
				<td><%=zxhfsj%></td>
				<td><%=cf.fillHtml(hfr)%></td>
				<td><%=slsj%></td>
				<td><%=jazt%></td>
			</tr>
			<%	
		}
		rs2.close();
		ps2.close();
	
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("发生意外: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (rs2!= null) rs2.close(); 
		if (ps2!= null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</table>
</body>
</html>