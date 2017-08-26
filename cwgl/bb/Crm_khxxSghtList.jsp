<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%@ include file="/getlogin.jsp" %>

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

	String lxfs=null;
	String khbh=null;
	String hth=null;

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}

	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs+"%')";
	}

	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY/MM/DD'))";
	}


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

%>

<table border="1" width="360%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">序号</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="6%">电话</td>
	<td  width="7%">房屋地址</td>

	<td  width="3%">结帐</td>

	<td  width="3%">签约日期</td>
	<td  width="6%">工期</td>
	<td  width="3%">合同价</td>
	<td  width="3%">预算价</td>

	<td  width="3%">一期款应交日期</td>
	<td  width="2%">一期款应交金额</td>
	<td  width="3%">二期款应交日期</td>
	<td  width="2%">二期款应交金额</td>
	<td  width="3%">三期款应交日期</td>
	<td  width="2%">三期款应交金额</td>

	<td  width="2%">设计师</td>
	<td  width="2%">监理</td>
	<td  width="2%">施工队</td>

	<td  width="2%">委托金</td>
	<td  width="3%">委托金日期</td>

	<td  width="3%">一期款实交日期</td>
	<td  width="2%">一期款实交金额</td>
	<td  width="3%">二期款实交日期</td>
	<td  width="2%">二期款实交金额</td>
	<td  width="3%">三期款实交日期</td>
	<td  width="2%">三期款实交金额</td>

	<td  width="3%">累计收款</td>

	<td  width="3%">结算款</td>
	<td  width="3%">结算优惠</td>
	<td  width="3%">开票情况</td>
	<td  width="3%">开票金额</td>
	<td  width="3%">档案上交</td>
	<td  width="3%">竣工验收日期</td>
	<td  width="3%">效果图</td>
	<td  width="8%">备注</td>
</tr>

<%


	String getkhbh=null;
	String getkhxm=null;
	String getfwdz=null;
	String getlxfs=null;
	String gethth=null;
	String sjs=null;
	String zjxm=null;
	String sgdmc=null;
	String getqyrq=null;
	String kgrq=null;
	String jgrq=null;
	String sjkgrq=null;
	String sjjgrq=null;

	double wdzgce=0;
	double qye=0;
	String gcjdmc=null;
	String bz=null;
	String yqksj=null;
	String zqksj=null;
	String sqksj=null;
	String fgsbh=null;

	double allwdzgce=0;
	double allqye=0;

	int row=0;
	ls_sql="SELECT crm_khxx.fgsbh,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,crm_khxx.sjs,crm_khxx.zjxm,sgdmc";
	ls_sql+=" ,crm_khxx.qyrq,crm_khxx.kgrq,crm_khxx.jgrq,sjkgrq,yqksj,zqksj,sqksj,sjjgrq,crm_khxx.wdzgce,crm_khxx.qye,gcjdmc  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,dm_gcjdbm,sq_sgd  ";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.qyrq ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		getkhbh=cf.fillNull(rs.getString("khbh"));
		getkhxm=cf.fillNull(rs.getString("khxm"));
		getfwdz=cf.fillNull(rs.getString("fwdz"));
		getlxfs=cf.fillHtml(rs.getString("lxfs"));
		gethth=cf.fillHtml(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgdmc=cf.fillHtml(rs.getString("sgdmc"));

		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		yqksj=cf.fillHtml(rs.getDate("yqksj"));
		zqksj=cf.fillHtml(rs.getDate("zqksj"));
		sqksj=cf.fillHtml(rs.getDate("sqksj"));
		sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");
		gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));

		row++;

		allwdzgce+=wdzgce;
		allqye+=qye;

		double sjhtje=0;
		String qsjhtsj="&nbsp;";
		ls_sql="select qsjhtsj,sjhtje ";
		ls_sql+=" from crm_zxkhxx ";
		ls_sql+=" where  khbh='"+getkhbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			qsjhtsj=cf.fillHtml(rs1.getDate("qsjhtsj"));
			sjhtje=rs1.getDouble("sjhtje");
		}
		rs1.close();
		ps1.close();

		double yqkyjbl=0;
		ls_sql="select bqfkbl ";
		ls_sql+=" from  cw_fkcsbl";
		ls_sql+=" where  fgsbh='"+fgsbh+"' and fkcs=1";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			yqkyjbl=rs1.getDouble("bqfkbl");//本期收款比率
		}
		rs1.close();
		ps1.close();

		double zqkyjbl=0;
		ls_sql="select bqfkbl ";
		ls_sql+=" from  cw_fkcsbl";
		ls_sql+=" where  fgsbh='"+fgsbh+"' and fkcs=2";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			zqkyjbl=rs1.getDouble("bqfkbl");//本期收款比率
		}
		rs1.close();
		ps1.close();

		double sqkyjbl=0;
		ls_sql="select bqfkbl ";
		ls_sql+=" from  cw_fkcsbl";
		ls_sql+=" where  fgsbh='"+fgsbh+"' and fkcs=3";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sqkyjbl=rs1.getDouble("bqfkbl");//本期收款比率
		}
		rs1.close();
		ps1.close();

		double yqkyjje=cf.round(qye*yqkyjbl/100,2);
		double zqkyjje=cf.round(qye*zqkyjbl/100,2);
		double sqkyjje=cf.round(qye*sqkyjbl/100,2);
	
		
		
		//一期款实交日期
		String sksj1="&nbsp;";
		ls_sql="select sksj ";
		ls_sql+=" from cw_khfkjl ";
		ls_sql+=" where khbh='"+getkhbh+"' and fklxbm='11' and scbz='N' and fkcs=1";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sksj1=cf.fillNull(rs1.getDate("sksj"));
		}
		rs1.close();
		ps1.close();

		//一期款实交金额
		double fkje1=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from cw_khfkjl ";
		ls_sql+=" where khbh='"+getkhbh+"' and fklxbm='11' and scbz='N' and fkcs=1";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fkje1=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//二期款实交日期
		String sksj2="&nbsp;";
		ls_sql="select sksj ";
		ls_sql+=" from cw_khfkjl ";
		ls_sql+=" where khbh='"+getkhbh+"' and fklxbm='11' and scbz='N' and fkcs=2";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sksj2=cf.fillNull(rs1.getDate("sksj"));
		}
		rs1.close();
		ps1.close();

		//二期款实交金额
		double fkje2=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from cw_khfkjl ";
		ls_sql+=" where khbh='"+getkhbh+"' and fklxbm='11' and scbz='N' and fkcs=2";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fkje2=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//三期款实交日期
		String sksj3="&nbsp;";
		ls_sql="select sksj ";
		ls_sql+=" from cw_khfkjl ";
		ls_sql+=" where khbh='"+getkhbh+"' and fklxbm='11' and scbz='N' and fkcs=3";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sksj3=cf.fillNull(rs1.getDate("sksj"));
		}
		rs1.close();
		ps1.close();

		//三期款实交金额
		double fkje3=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from cw_khfkjl ";
		ls_sql+=" where khbh='"+getkhbh+"' and fklxbm='11' and scbz='N' and fkcs=3";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			fkje3=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		//累计收款
		double ljsk=0;
		ls_sql="select sum(fkje) ";
		ls_sql+=" from cw_khfkjl ";
		ls_sql+=" where khbh='"+getkhbh+"' and fklxbm='11' and scbz='N' and fkcs in(1,2,3)";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			ljsk=rs1.getDouble(1);
		}
		rs1.close();
		ps1.close();

		String wtjrq="&nbsp;";
		double wtj=0;
		String jsrq="&nbsp;";
		double jsk=0;
		String jsyh="&nbsp;";
		String kpqk="&nbsp;";
		double kpje=0;
		String dasjsj="&nbsp;";
		String xgtsj="&nbsp;";
		ls_sql="select wtjrq,wtj,jsrq,jsk,jsyh,DECODE(kpqk,'1','开票','2','未开票') kpqk,kpje,dasjsj,xgtsj";
		ls_sql+=" from cw_gdsgjsd ";
		ls_sql+=" where khbh='"+getkhbh+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			wtjrq=cf.fillNull(rs1.getDate("wtjrq"));
			wtj=rs1.getDouble("wtj");
			jsrq=cf.fillNull(rs1.getDate("jsrq"));
			jsk=rs1.getDouble("jsk");
			jsyh=cf.fillNull(rs1.getString("jsyh"));
			kpqk=cf.fillNull(rs1.getString("kpqk"));
			kpje=rs1.getDouble("kpje");
			dasjsj=cf.fillNull(rs1.getDate("dasjsj"));
			xgtsj=cf.fillNull(rs1.getDate("xgtsj"));
		}
		rs1.close();
		ps1.close();

		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=row%></td>
			<td><%=gethth%></td>
			<td><A HREF="/khxx/ViewCrm_khxx.jsp?khbh=<%=getkhbh%>" target="_blank"><%=getkhxm%></A></td>
			<td><%=getlxfs%></td>
			<td><%=getfwdz%></td>
			<td><%=jsrq%></td>
			<td><%=qyrq%></td>
			<td><%=kgrq%>--<%=jgrq%></td>

			<td><%=qye%></td>
			<td><%=wdzgce%></td>
			<td><%=yqksj%></td>
			<td><%=yqkyjje%></td>
			<td><%=zqksj%></td>
			<td><%=zqkyjje%></td>
			<td><%=sqksj%></td>
			<td><%=sqkyjje%></td>
			<td><%=sjs%></td>
			<td><%=zjxm%></td>
			<td><%=sgdmc%></td>
			<td><%=wtj%></td>
			<td><%=wtjrq%></td>

			<td><%=sksj1%></td>
			<td><%=fkje1%></td>
			<td><%=sksj2%></td>
			<td><%=fkje2%></td>
			<td><%=sksj3%></td>
			<td><%=fkje3%></td>
			<td><%=ljsk%></td>

			<td><%=jsk%></td>
			<td><%=jsyh%></td>
			<td><%=kpqk%></td>
			<td><%=kpje%></td>
			<td><%=dasjsj%></td>
			<td><%=sjjgrq%></td>
			<td><%=xgtsj%></td>
			<td>&nbsp;</td>
		</tr>
		<%
	
	
	}
	rs.close();
	ps.close();



}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (rs2 != null) rs2.close(); 
		if (ps2 != null) ps2.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

</table>