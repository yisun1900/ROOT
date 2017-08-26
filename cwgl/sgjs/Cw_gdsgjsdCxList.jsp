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
String cw_gdsgjsd_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_lxfs=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String cw_gdsgjsd_lrr=null;
String cw_gdsgjsd_lrsj=null;
String cw_gdsgjsd_lrbm=null;

String fgs=null;
fgs=request.getParameter("fgs");
if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

String dwbh=null;
dwbh=request.getParameter("dwbh");
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
}

cw_gdsgjsd_khbh=request.getParameter("cw_gdsgjsd_khbh");
if (cw_gdsgjsd_khbh!=null)
{
	cw_gdsgjsd_khbh=cf.GB2Uni(cw_gdsgjsd_khbh);
	if (!(cw_gdsgjsd_khbh.equals("")))	wheresql+=" and  (cw_gdsgjsd.khbh='"+cw_gdsgjsd_khbh+"')";
}
crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
if (crm_khxx_khxm!=null)
{
	crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
	if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
}
crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
if (crm_khxx_fwdz!=null)
{
	crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
	if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
}
crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
if (crm_khxx_lxfs!=null)
{
	crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
	if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
}
crm_khxx_hth=request.getParameter("crm_khxx_hth");
if (crm_khxx_hth!=null)
{
	crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
	if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
}
crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
if (crm_khxx_sjs!=null)
{
	crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
	if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
}
cw_gdsgjsd_lrr=request.getParameter("cw_gdsgjsd_lrr");
if (cw_gdsgjsd_lrr!=null)
{
	cw_gdsgjsd_lrr=cf.GB2Uni(cw_gdsgjsd_lrr);
	if (!(cw_gdsgjsd_lrr.equals("")))	wheresql+=" and  (cw_gdsgjsd.lrr='"+cw_gdsgjsd_lrr+"')";
}
cw_gdsgjsd_lrsj=request.getParameter("cw_gdsgjsd_lrsj");
if (cw_gdsgjsd_lrsj!=null)
{
	cw_gdsgjsd_lrsj=cw_gdsgjsd_lrsj.trim();
	if (!(cw_gdsgjsd_lrsj.equals("")))	wheresql+="  and (cw_gdsgjsd.lrsj>=TO_DATE('"+cw_gdsgjsd_lrsj+"','YYYY/MM/DD'))";
}
cw_gdsgjsd_lrsj=request.getParameter("cw_gdsgjsd_lrsj2");
if (cw_gdsgjsd_lrsj!=null)
{
	cw_gdsgjsd_lrsj=cw_gdsgjsd_lrsj.trim();
	if (!(cw_gdsgjsd_lrsj.equals("")))	wheresql+="  and (cw_gdsgjsd.lrsj<=TO_DATE('"+cw_gdsgjsd_lrsj+"','YYYY/MM/DD'))";
}
cw_gdsgjsd_lrbm=request.getParameter("cw_gdsgjsd_lrbm");
if (cw_gdsgjsd_lrbm!=null)
{
	cw_gdsgjsd_lrbm=cf.GB2Uni(cw_gdsgjsd_lrbm);
	if (!(cw_gdsgjsd_lrbm.equals("")))	wheresql+=" and  (cw_gdsgjsd.lrbm='"+cw_gdsgjsd_lrbm+"')";
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

<table border="1" width="<%=(23*80+250+170+150+400)%>" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="80px">合同号</td>
	<td  width="80px">客户姓名</td>
	<td  width="250px">房屋地址</td>
	<td  width="170px">电话</td>
	<td  width="80px">设计师</td>
	<td  width="80px">工程预算款</td>
	<td  width="80px">委托金</td>
	<td  width="80px">委托金日期</td>
	<td  width="80px">实收款</td>
	<td  width="80px">结算款</td>
	<td  width="80px">结算日期</td>
	<td  width="80px">木工费用</td>
	<td  width="80px">木工日期</td>
	<td  width="80px">水电工费用</td>
	<td  width="80px">水电工日期</td>
	<td  width="80px">泥水工费用</td>
	<td  width="80px">泥水工日期</td>
	<td  width="80px">油漆工费用</td>
	<td  width="80px">油漆工日期</td>
<%
	String fymc=null;
	int col=0;
	ls_sql="select fymc ";
	ls_sql+=" from cw_gdfybm";
	ls_sql+=" order by xh ";
	ps1= conn.prepareStatement(ls_sql);
	rs1 =ps1.executeQuery();
	while (rs1.next())
	{
		fymc=cf.fillNull(rs1.getString("fymc"));
		col++;
		%>
		  <td width="80px" ><%=fymc%>
		  </td>
		<%
	}
	rs1.close();
	ps1.close();
%>

	<td  width="80px">支出费用总额</td>
	<td  width="80px">余额</td>
	<td  width="80px">毛利率</td>
	<td  width="80px">状态</td>
	<td  width="80px">录入人</td>
	<td  width="80px">录入时间</td>
	<td  width="150px">录入部门</td>
	<td  width="400px">备注</td>
</tr>

<%


	String khbh=null;
	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String hth=null;
	String sjs=null;
	double wdzje=0;
	double wtj=0;
	String wtjrq=null;
	double ssk=0;
	double jsk=0;
	String jsrq=null;
	double mgfy=0;
	String mgrq=null;
	double sdgfy=0;
	String sdgrq=null;
	double nsgfy=0;
	String nsgrq=null;
	double yqgfy=0;
	String yqgrq=null;
	double fyze=0;
	double ye=0;
	double mll=0;
	String lrr=null;
	String lrsj=null;
	String lrbm=null;
	String bz=null;
	String gcjdmc=null;

	double allwdzje=0;
	double allwtj=0;
	double allssk=0;
	double alljsk=0;
	double allmgfy=0;
	double allsdgfy=0;
	double allnsgfy=0;
	double allyqgfy=0;
	double allfyze=0;
	double allye=0;

	double[] allfy=new double[col];


	ls_sql="SELECT cw_gdsgjsd.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,crm_khxx.sjs";
	ls_sql+=" ,cw_gdsgjsd.wdzje,cw_gdsgjsd.wtj,cw_gdsgjsd.wtjrq,cw_gdsgjsd.ssk,cw_gdsgjsd.jsk,cw_gdsgjsd.jsrq,cw_gdsgjsd.mgfy";
	ls_sql+=" ,cw_gdsgjsd.mgrq,cw_gdsgjsd.sdgfy,cw_gdsgjsd.sdgrq,cw_gdsgjsd.nsgfy,cw_gdsgjsd.nsgrq,cw_gdsgjsd.yqgfy,cw_gdsgjsd.yqgrq";
	ls_sql+=" ,cw_gdsgjsd.fyze,cw_gdsgjsd.ye,cw_gdsgjsd.mll,cw_gdsgjsd.lrr,cw_gdsgjsd.lrsj,dwmc,cw_gdsgjsd.bz,gcjdmc  ";
	ls_sql+=" FROM crm_khxx,cw_gdsgjsd,sq_dwxx,dm_gcjdbm  ";
	ls_sql+=" where cw_gdsgjsd.khbh=crm_khxx.khbh and cw_gdsgjsd.lrbm=sq_dwxx.dwbh and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" order by cw_gdsgjsd.lrsj desc";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));

		wdzje=rs.getDouble("wdzje");
		wtj=rs.getDouble("wtj");
		wtjrq=cf.fillHtml(rs.getDate("wtjrq"));
		ssk=rs.getDouble("ssk");
		jsk=rs.getDouble("jsk");
		jsrq=cf.fillHtml(rs.getDate("jsrq"));
		mgfy=rs.getDouble("mgfy");

		mgrq=cf.fillHtml(rs.getDate("mgrq"));
		sdgfy=rs.getDouble("sdgfy");
		sdgrq=cf.fillHtml(rs.getDate("sdgrq"));
		nsgfy=rs.getDouble("nsgfy");
		nsgrq=cf.fillHtml(rs.getDate("nsgrq"));
		yqgfy=rs.getDouble("yqgfy");
		yqgrq=cf.fillHtml(rs.getDate("yqgrq"));

		fyze=rs.getDouble("fyze");
		ye=rs.getDouble("ye");
		mll=rs.getDouble("mll");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
		bz=cf.fillHtml(rs.getString("bz"));
		gcjdmc=cf.fillHtml(rs.getString("gcjdmc"));

		allwdzje+=wdzje;
		allwtj+=wtj;
		allssk+=ssk;
		alljsk+=jsk;
		allmgfy+=mgfy;
		allsdgfy+=sdgfy;
		allnsgfy+=nsgfy;
		allyqgfy+=yqgfy;
		allfyze+=fyze;
		allye+=ye;

		%>
		<tr bgcolor="#FFFFF"  align="center">
			<td><%=hth%></td>
			<td><A HREF="ViewCw_gdsgjsd.jsp?khbh=<%=khbh%>" target="_blank"><%=khxm%></A></td>
			<td><%=fwdz%></td>
			<td><%=lxfs%></td>
			<td><%=sjs%></td>
			<td><%=wdzje%></td>
			<td><%=wtj%></td>
			<td><%=wtjrq%></td>
			<td><%=ssk%></td>
			<td><%=jsk%></td>
			<td><%=jsrq%></td>
			<td><%=mgfy%></td>
			<td><%=mgrq%></td>
			<td><%=sdgfy%></td>
			<td><%=sdgrq%></td>
			<td><%=nsgfy%></td>
			<td><%=nsgrq%></td>
			<td><%=yqgfy%></td>
			<td><%=yqgrq%></td>
		<%
	
			String fybm=null;
			int i=0;
			ls_sql="select fybm ";
			ls_sql+=" from cw_gdfybm";
			ls_sql+=" order by xh ";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			while (rs1.next())
			{
				fybm=cf.fillNull(rs1.getString("fybm"));

				double fyje=0;
				ls_sql="select fyje ";
				ls_sql+=" from cw_gdfymx ";
				ls_sql+=" where  cw_gdfymx.fybm='"+fybm+"' and cw_gdfymx.khbh='"+khbh+"' ";
				ps2= conn.prepareStatement(ls_sql);
				rs2 =ps2.executeQuery();
				if (rs2.next())
				{
					fyje=rs2.getDouble("fyje");
				}
				rs2.close();
				ps2.close();

				allfy[i]+=fyje;
				i++;

				%>
				  <td><%=fyje%></td>
				<%

			}
			rs1.close();
			ps1.close();

		%>
			<td><%=fyze%></td>
			<td><%=ye%></td>
			<td><%=mll%>%</td>
			<td><%=gcjdmc%></td>
			<td><%=lrr%></td>
			<td><%=lrsj%></td>
			<td><%=lrbm%></td>
			<td><%=bz%></td>
		</tr>
		<%
	
	
	}
	rs.close();
	ps.close();

%>


		<tr bgcolor="#FFFFF"  align="center">
			<td>合计</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(allwdzje)%></td>
			<td><%=cf.formatDouble(allwtj)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(allssk)%></td>
			<td><%=cf.formatDouble(alljsk)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(allmgfy)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(allsdgfy)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(allnsgfy)%></td>
			<td>&nbsp;</td>
			<td><%=cf.formatDouble(allyqgfy)%></td>
			<td>&nbsp;</td>
		<%
			for (int i=0;i<allfy.length ;i++ )
			{
				%>
				  <td><%=cf.formatDouble(allfy[i])%></td>
				<%
			}

			if (allssk!=0)
			{
				mll=allye*100/allssk;
			}
			else{
				mll=0;
			}


		%>
			<td><%=cf.formatDouble(allfyze)%></td>
			<td><%=cf.formatDouble(allye)%></td>
			<td><%=cf.formatDouble(mll)%>%</td>
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