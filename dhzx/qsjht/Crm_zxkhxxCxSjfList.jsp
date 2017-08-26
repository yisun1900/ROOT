<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询实收设计费</font></B>
</CENTER>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">序号</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="6%">店面</td>
	<td  width="3%">设计师</td>
	<td  width="3%">客户经理</td>
	<td  width="3%">业务员</td>
	<td  width="4%">咨询状态</td>
	<td  width="5%">设计合同金额</td>
	<td  width="5%">实收设计费</td>
	<td  width="5%">欠设计费</td>


	<td  width="4%">交款记录号</td>
	<td  width="4%">交款时间</td>
	<td  width="5%">交款金额</td>
	<td  width="5%">交款方式</td>
	<td  width="5%">转换款项</td>
	<td  width="4%">审核时间</td>


	<td  width="5%">设计合同号</td>
	<td  width="4%">签设计合同时间</td>
	<td  width="4%">平米数</td>
	<td  width="64%">单价</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	
	
	String ygbh=(String)session.getAttribute("ygbh");
	String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

	String wheresql="";

	
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";
	String zxdm=null;
	zxdm=request.getParameter("zxdm");
	if (zxdm!=null)
	{
		zxdm=cf.GB2Uni(zxdm);
		if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";
	}
	
	String zxzt=null;
	zxzt=request.getParameter("zxzt");
	if (zxzt!=null)
	{
		zxzt=cf.GB2Uni(zxzt);
		if (!(zxzt.equals("")))	wheresql+=" and  (crm_zxkhxx.zxzt='"+zxzt+"')";
	}
	String jzbz=null;
	jzbz=request.getParameter("jzbz");
	if (jzbz!=null)
	{
		if (!(jzbz.equals("")))	wheresql+=" and  (crm_zxkhxx.jzbz='"+jzbz+"')";
	}
	
	
	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	}
	String xb=null;
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (crm_zxkhxx.xb='"+xb+"')";
	}

	
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	}
	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";
	}
	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	}
	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	}
	
	
	String khjl=null;
	khjl=request.getParameter("khjl");
	if (khjl!=null)
	{
		khjl=cf.GB2Uni(khjl);
		if (!(khjl.equals("")))	wheresql+=" and  (crm_zxkhxx.khjl='"+khjl+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	String ywy=null;
	ywy=request.getParameter("ywy");
	if (ywy!=null)
	{
		ywy=cf.GB2Uni(ywy);
		if (!(ywy.equals("")))	wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}
	

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_sjhtxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_sjhtxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	String qsjhtsj=null;
	qsjhtsj=request.getParameter("qsjhtsj");
	if (qsjhtsj!=null)
	{
		qsjhtsj=qsjhtsj.trim();
		if (!(qsjhtsj.equals("")))	wheresql+="  and (crm_zxkhxx.qsjhtsj>=TO_DATE('"+qsjhtsj+"','YYYY/MM/DD'))";
	}
	qsjhtsj=request.getParameter("qsjhtsj2");
	if (qsjhtsj!=null)
	{
		qsjhtsj=qsjhtsj.trim();
		if (!(qsjhtsj.equals("")))	wheresql+="  and (crm_zxkhxx.qsjhtsj<=TO_DATE('"+qsjhtsj+"','YYYY/MM/DD'))";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_zxkhxx.hth='"+hth+"')";
	}
	
	String jkbz=null;
	jkbz=request.getParameter("jkbz");
	if (jkbz!=null)
	{
		jkbz=cf.GB2Uni(jkbz);
		if (jkbz.equals("1"))//未交款
		{
			wheresql+=" and crm_zxkhxx.sjf < crm_zxkhxx.sjhtje";
		}
		else if (jkbz.equals("2"))//交款
		{
			wheresql+=" and crm_zxkhxx.sjf >= crm_zxkhxx.sjhtje";
		}
		else if (jkbz.equals("3"))//退款
		{
			wheresql+=" and crm_zxkhxx.sjfbz='T'";
		}
	}

	String shsj=null;
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (cw_khfkjl.fkje>0 and cw_khfkjl.fklxbm='53' and cw_khfkjl.sjsj>=TO_DATE('"+shsj+"','YYYY-MM-DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (cw_khfkjl.fkje>0 and cw_khfkjl.fklxbm='53' and cw_khfkjl.sjsj<=TO_DATE('"+shsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String tksj=null;
	tksj=request.getParameter("tksj");
	if (tksj!=null)
	{
		tksj=tksj.trim();
		if (!(tksj.equals("")))	wheresql+="  and (cw_khfkjl.fkje<0 and cw_khfkjl.fklxbm='53' and cw_khfkjl.sksj>=TO_DATE('"+tksj+"','YYYY-MM-DD'))";
	}
	tksj=request.getParameter("tksj2");
	if (tksj!=null)
	{
		tksj=tksj.trim();
		if (!(tksj.equals("")))	wheresql+="  and (cw_khfkjl.fkje<0 and cw_khfkjl.fklxbm='53' and cw_khfkjl.sksj<=TO_DATE('"+tksj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String tkshsj=null;
	tkshsj=request.getParameter("tkshsj");
	if (tkshsj!=null)
	{
		tkshsj=tkshsj.trim();
		if (!(tkshsj.equals("")))	wheresql+="  and (cw_khfkjl.fkje<0 and cw_khfkjl.fklxbm='53' and cw_khfkjl.sjsj>=TO_DATE('"+tkshsj+"','YYYY-MM-DD'))";
	}
	tkshsj=request.getParameter("tkshsj2");
	if (tkshsj!=null)
	{
		tkshsj=tkshsj.trim();
		if (!(tkshsj.equals("")))	wheresql+="  and (cw_khfkjl.fkje<0 and cw_khfkjl.fklxbm='53' and cw_khfkjl.sjsj<=TO_DATE('"+tkshsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}




Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	String bgcolor="";
	String getkhbh=null;

	int row=0;

	double sjf_xj=0;
	double sjhtje_xj=0;
	double fkje_xj=0;
	double fkje_tk_xj=0;

	ls_sql="SELECT distinct crm_zxkhxx.khbh,crm_zxkhxx.qsjhtsj,crm_zxkhxx.khjl,crm_zxkhxx.sjs,crm_zxkhxx.ywy,crm_zxkhxx.zxdm ";
	ls_sql+=" FROM crm_zxkhxx,crm_sjhtxx,cw_khfkjl ";
    ls_sql+=" where crm_zxkhxx.qsjhtbz!='N'";
	ls_sql+=" and crm_zxkhxx.khbh=crm_sjhtxx.khbh(+)";
	ls_sql+=" and crm_zxkhxx.khbh=cw_khfkjl.khbh(+)";
	ls_sql+=" and cw_khfkjl.fklxbm(+)='53' ";//53：设计费
	ls_sql+=" and cw_khfkjl.scbz='N'";//N：未删除；Y：已删除
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
    ls_sql+=ordersql;

//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getkhbh=cf.fillNull(rs.getString("khbh"));

		row++;

		if (row>1000)
		{
			out.println("提醒！数量超过1000条，后面的数据不再显示");
			break;
		}

		String getkhxm=null;
		String getfwdz=null;
		String getdwmc=null;
		String getsjs=null;
		String getkhjl=null;
		String getywy=null;
		String getzxzt=null;
		String sjfbz="";
		double sjf=0;
		ls_sql="SELECT sjfbz,khxm,fwdz,sjs,sjf,khjl,ywy,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','店面退回客户','3','已签约','4','公司签单失败','5','重新分配店面') as zxzt,sq_dwxx.dwmc";
		ls_sql+=" FROM crm_zxkhxx,sq_dwxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+)";
		ls_sql+=" and crm_zxkhxx.khbh='"+getkhbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sjfbz=cf.fillNull(rs1.getString("sjfbz"));
			getkhxm=cf.fillNull(rs1.getString("khxm"));
			getfwdz=cf.fillHtml(rs1.getString("fwdz"));
			getdwmc=cf.fillHtml(rs1.getString("dwmc"));
			getsjs=cf.fillHtml(rs1.getString("sjs"));
			sjf=rs1.getDouble("sjf");
			getkhjl=cf.fillHtml(rs1.getString("khjl"));
			getywy=cf.fillHtml(rs1.getString("ywy"));
			getzxzt=cf.fillHtml(rs1.getString("zxzt"));
		}
		rs1.close();
		ps1.close();

		sjf_xj+=sjf;


		String getsjhth=null;
		String getqsjhtsj=null;
		double sjhtje=0;
		double pms=0;
		double dj=0;
		ls_sql="SELECT sjhth,qsjhtsj,sjhtje,pms,dj";
		ls_sql+=" FROM crm_sjhtxx ";
		ls_sql+=" where khbh='"+getkhbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			getsjhth=cf.fillNull(rs1.getString("sjhth"));
			getqsjhtsj=cf.fillHtml(rs1.getDate("qsjhtsj"));
			sjhtje=rs1.getDouble("sjhtje");
			pms=rs1.getDouble("pms");
			dj=rs1.getDouble("dj");
		}
		rs1.close();
		ps1.close();

		sjhtje_xj+=sjhtje;


		int count=0;
		ls_sql="SELECT count(*)";
		ls_sql+=" FROM cw_khfkjl,cw_zffsbm,cw_fklxbm";
		ls_sql+=" where cw_khfkjl.zffs=cw_zffsbm.zffsbm(+)";
		ls_sql+=" and cw_khfkjl.zckx=cw_fklxbm.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.khbh='"+getkhbh+"'";
		ls_sql+=" and cw_khfkjl.fklxbm='53' ";//53：设计费
		ls_sql+=" and cw_khfkjl.scbz='N'";//N：未删除；Y：已删除
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		
		
		int jsq=0;
		
		String fkxh="&nbsp;";
		String sksj="&nbsp;";
		String sjsj="&nbsp;";
		double fkje=0;
		String zffsmc="&nbsp;";
		String fklxmc="&nbsp;";
		ls_sql="SELECT fkxh,fkje,sksj,sjsj,zffsmc,fklxmc";
		ls_sql+=" FROM cw_khfkjl,cw_zffsbm,cw_fklxbm";
		ls_sql+=" where cw_khfkjl.zffs=cw_zffsbm.zffsbm(+)";
		ls_sql+=" and cw_khfkjl.zckx=cw_fklxbm.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.khbh='"+getkhbh+"'";
		ls_sql+=" and cw_khfkjl.fklxbm='53' ";//53：设计费
		ls_sql+=" and cw_khfkjl.scbz='N'";//N：未删除；Y：已删除
		ls_sql+=" order by fkxh"; 
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			fkxh=cf.fillNull(rs1.getString("fkxh"));
			fkje=rs1.getDouble("fkje");
			sksj=cf.fillNull(rs1.getDate("sksj"));
			sjsj=cf.fillHtml(rs1.getDate("sjsj"));
			zffsmc=cf.fillNull(rs1.getString("zffsmc"));
			fklxmc=cf.fillHtml(rs1.getString("fklxmc"));

			fkje_xj+=fkje;

			jsq++;

			if (row%2==0)
			{
				bgcolor="#FFFFFF";
			}
			else {
				bgcolor="#E8E8FF";
			}

			if (jsq==1)
			{
				%>
				<tr bgcolor="<%=bgcolor%>"  align="center">
					<td rowspan="<%=count%>"><%=row%></td>
					<td rowspan="<%=count%>"><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=getkhbh%>" target="_blank"><%=getkhbh%></A></td>
					<td rowspan="<%=count%>"><%=getkhxm%></td>
					<td rowspan="<%=count%>"><%=getfwdz%></td>
					<td rowspan="<%=count%>"><%=getdwmc%></td>
					<td rowspan="<%=count%>"><%=getsjs%></td>

					<td rowspan="<%=count%>"><%=getkhjl%></td>
					<td rowspan="<%=count%>"><%=getywy%></td>
					<td rowspan="<%=count%>"><%=getzxzt%></td>

					<td rowspan="<%=count%>"><%=sjhtje%></td>
					<td rowspan="<%=count%>"><%=sjf%></td>
					<td rowspan="<%=count%>"><%=cf.round(sjhtje-sjf,2)%></td>

					<td><A HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=fkxh%>" target="_blank"><%=fkxh%></A></td>
					<td><%=sksj%></td>
					<td><%=fkje%></td>
					<td><%=zffsmc%></td>
					<td><%=fklxmc%></td>
					<td><%=sjsj%></td>

					<td rowspan="<%=count%>"><%=getsjhth%></td>
					<td rowspan="<%=count%>"><%=getqsjhtsj%></td>
					<td rowspan="<%=count%>"><%=pms%></td>
					<td rowspan="<%=count%>"><%=dj%></td>
				</tr>
				<%
			}
			else{
				%>
				<tr bgcolor="<%=bgcolor%>"  align="center">
					<td><A HREF="/cwgl/qyecx/ViewCw_khfkjl.jsp?fkxh=<%=fkxh%>" target="_blank"><%=fkxh%></A></td>
					<td><%=sksj%></td>
					<td><%=fkje%></td>
					<td><%=zffsmc%></td>
					<td><%=fklxmc%></td>
					<td><%=sjsj%></td>
				</tr>
				<%
			}

		}
		rs1.close();
		ps1.close();
	}
	rs.close();
	ps.close();

	%>
	<tr bgcolor="#FFFFFF"  align="center">
		<td colspan="3">合计</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>

		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>

		<td><%=sjhtje_xj%></td>
		<td><%=sjf_xj%></td>
		<td><%=cf.round(sjhtje_xj-sjf_xj,2)%></td>

		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td><%=cf.formatDouble(fkje_xj)%></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>


		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
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
</table>
</body>
</html>