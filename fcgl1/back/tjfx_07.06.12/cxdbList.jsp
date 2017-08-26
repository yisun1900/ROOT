<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<center><DIV><b>销存对比</b></DIV></center>&nbsp;<br>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2" align="center">
	<tr bgcolor="CCCCCC"> 
		<td width="3%"> 
		<div align="center"><B>序号</b></div>
		</td>
		<td width="8%"> 
		<div align="center"><B>材料名称</b></div>
		</td>
		<td width="8%"> 
		<div align="center"><B>材料规格</b></div>
		</td>
		<td width="8%"> 
		<div align="center"><B>分公司</b></div>
		</td>
		<td width="8%"> 
		<div align="center"><B>入库数量</b></div>
		</td>
		<td width="8%"> 
		<div align="center"><B>出库数量</b></div>
		</td>
		<td width="30%"> 
		<div align="center"><B>图形显示</b></div>
		</td>
	</tr>
<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String sql=null;
String jldwmc=null;
String clgg=null;
double sumrk=0;
double sumck=0;
double kcsl=0;
double maxrksl=0;	//最大入库量
double lsrksl=0;
double txkcsl=0;
double txkcsl2=0;
int i=0;
String clbm=null;
String clmc=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
String wheresql="";
String dwmc=null;

String ssfgs=null;
String wherecldlbm=null;
String whereclbm=null;
String whereclgg=null;
String lrjsfs=null;
String lrbfb=null;
String cldj=null;
String jldwbm=null;
String qybfb=null;
String whereck="";
String whererk="";
String ckrq=null;
String tjsj=null;
String dwbh=null;
tjsj=request.getParameter("tjsj");
if (tjsj!=null)
{
	tjsj=tjsj.trim();
	if (!(tjsj.equals("")))
		{
		whererk+=" and  (cl_rkd.rksj>=to_date('"+tjsj+"','YYYY-MM-DD')) ";
		whereck+=" and  (cl_ckd.shqrsj>=to_date('"+tjsj+"','YYYY-MM-DD')) ";
		}
}
tjsj=request.getParameter("tjsj2");
if (tjsj!=null)
{
	tjsj=tjsj.trim();
	if (!(tjsj.equals("")))
		{
		whererk+=" and  (cl_rkd.rksj<=to_date('"+tjsj+"','YYYY-MM-DD')) ";
		whereck+=" and  (cl_ckd.shqrsj<=to_date('"+tjsj+"','YYYY-MM-DD')) ";
		}
}
ssfgs=request.getParameter("fgs");
if (ssfgs!=null)
{
	ssfgs=ssfgs.trim();
	if (!(ssfgs.equals("")))
		{
		whererk+=" and  (cl_rkd.dwbh='"+ssfgs+"') ";
		whereck+=" and  (cl_ckd.dwbh='"+ssfgs+"') ";
		}
}
wherecldlbm=request.getParameter("cldlbm");
if (wherecldlbm!=null)
{
	wherecldlbm=wherecldlbm.trim();
	if (!(wherecldlbm.equals("")))	wheresql+=" and  (cl_clbm.cldlbm='"+wherecldlbm+"') ";
}
whereclbm=request.getParameter("clbm");
if (whereclbm!=null)
{
	whereclbm=whereclbm.trim();
	if (!(whereclbm.equals("")))	wheresql+=" and  (cl_clbm.clbm='"+whereclbm+"') ";
}
qybfb=request.getParameter("qybfb");
if (qybfb!=null)
{
	qybfb=qybfb.trim();
	if (!(qybfb.equals("")))	wheresql+=" and  (cl_clbm.qybfb>="+qybfb+") ";
}
qybfb=request.getParameter("qybfb2");
if (qybfb!=null)
{
	qybfb=qybfb.trim();
	if (!(qybfb.equals("")))	wheresql+=" and  (cl_clbm.qybfb<="+qybfb+") ";
}
cldj=request.getParameter("cldj");
if (cldj!=null)
{
	cldj=cldj.trim();
	if (!(cldj.equals("")))	wheresql+=" and  (cl_clbm.cldj>="+cldj+") ";
}
cldj=request.getParameter("cldj2");
if (cldj!=null)
{
	cldj=cldj.trim();
	if (!(cldj.equals("")))	wheresql+=" and  (cl_clbm.cldj<="+cldj+") ";
}
jldwbm=request.getParameter("jldwbm");
if (jldwbm!=null)
{
	jldwbm=cf.GB2Uni(jldwbm);
	if (!(jldwbm.equals("")))	wheresql+=" and  (cl_clbm.jldwbm='"+jldwbm+"')";
}
whereclgg=request.getParameter("clgg");
if (whereclgg!=null)
{
	whereclgg=cf.GB2Uni(whereclgg);
	if (!(whereclgg.equals("")))	wheresql+=" and  (cl_clbm.clgg='"+whereclgg+"')";
}
lrjsfs=request.getParameter("lrjsfs");
if (lrjsfs!=null)
{
	lrjsfs=cf.GB2Uni(lrjsfs);
	if (!(lrjsfs.equals("")))	wheresql+=" and  (cl_clbm.lrjsfs='"+lrjsfs+"')";
}
lrbfb=request.getParameter("lrbfb");
if (lrbfb!=null)
{
	lrbfb=lrbfb.trim();
	if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb>="+lrbfb+") ";
}
lrbfb=request.getParameter("lrbfb2");
if (lrbfb!=null)
{
	lrbfb=lrbfb.trim();
	if (!(lrbfb.equals("")))	wheresql+=" and  (cl_clbm.lrbfb<="+lrbfb+") ";
}
//out.print(ssfgs+nian+yue);
try {
	conn=cf.getConnection();
/***************************************************************\
|		计算初最大入库数量											|
\***************************************************************/
ls_sql="select cl_rkmx.clbm,dwmc,nvl(sum(rksl),0) sl ";
ls_sql+=" from cl_rkmx,cl_rkd,jdm_jldwbm,cl_clbm,sq_dwxx  ";
ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph and cl_rkmx.clbm=cl_clbm.clbm and cl_clbm.jldwbm=jdm_jldwbm.jldwbm(+) ";
ls_sql+=" and cl_rkd.dwbh=sq_dwxx.dwbh and rkzt='2' ";
ls_sql+=wheresql;
ls_sql+=whererk;
ls_sql+=" group by cl_rkmx.clbm,dwmc ";
ls_sql+=" order by cl_rkmx.clbm,dwmc ";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery(ls_sql);
while (rs.next())
	{
		lsrksl=rs.getDouble("sl");
		if (maxrksl<lsrksl){maxrksl=lsrksl;}
	}
rs.close();
ps.close();
/***************************************************************\
|		显示库存数据												|
\***************************************************************/
ls_sql=" select cl_rkmx.clbm,cl_rkmx.clmc,cl_rkmx.clgg,jldwmc,nvl(sum(rksl),0) sl,dwmc,cl_rkd.dwbh ";
ls_sql+=" from cl_clbm,cl_rkmx,cl_rkd,jdm_jldwbm,sq_dwxx  ";
ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph and cl_clbm.clbm=cl_rkmx.clbm(+) and cl_clbm.jldwbm=jdm_jldwbm.jldwbm(+) ";
ls_sql+=" and cl_rkd.dwbh=sq_dwxx.dwbh and rkzt='2' ";
ls_sql+=wheresql;
ls_sql+=whererk;
ls_sql+=" group by cl_rkmx.clbm,cl_rkmx.clmc,cl_rkmx.clgg,jldwmc,dwmc,cl_rkd.dwbh ";
ls_sql+=" order by cl_rkmx.clbm,dwmc,cl_rkmx.clmc,cl_rkmx.clgg ";
ps= conn.prepareStatement(ls_sql);
rs =ps.executeQuery(ls_sql);
out.print(ls_sql);
while (rs.next())
	{
		i++;
		sumrk=rs.getDouble("sl");
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sql="select cl_ckmx.clbm,cl_ckmx.clmc,cl_ckmx.clgg,jldwmc,nvl(sum(cksl),0) sl,dwmc,cl_ckd.dwbh ";
		sql+=" from cl_ckmx,cl_ckd,jdm_jldwbm,cl_clbm,sq_dwxx  ";
		sql+=" where cl_ckd.ckph=cl_ckmx.ckph and cl_ckmx.clbm=cl_clbm.clbm and cl_clbm.jldwbm=jdm_jldwbm.jldwbm(+)  and cl_ckd.dwbh=sq_dwxx.dwbh ";
		sql+=" and cl_ckmx.clbm='"+clbm+"' and cl_ckd.dwbh='"+dwbh+"' ";
		sql+=" and ckzt='3' ";
		sql+=wheresql;
		sql+=whereck;
		sql+=" group by cl_ckmx.clbm,cl_ckmx.clmc,cl_ckmx.clgg,jldwmc,dwmc,cl_ckd.dwbh ";
		ps1= conn.prepareStatement(sql);
		rs1 =ps1.executeQuery(sql);
		if (rs1.next())
			{
				sumck=rs1.getDouble("sl");
			}
		rs1.close();
		ps1.close();
		txkcsl=sumrk/maxrksl*200;
		txkcsl2=sumck/maxrksl*200;
		%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
			<div align="center"><%=i%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=clmc%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=clgg%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=dwmc%>&nbsp;</div>
		</td>
		<td> 
			<div align="center"><%=sumrk%>&nbsp;<%=jldwmc%></div>
		</td>
		<td> 
			<div align="center"><a href="ckmxList.jsp?clbm=<%=clbm%>&dwbh=<%=dwbh%>" target="_back"><%=sumck%>&nbsp;<%=jldwmc%></a></div>
		</td>
		<td> 
			<div align="left"><img title="<%=clmc%> : <%=sumrk%>&nbsp;<%=jldwmc%>" width="<%=txkcsl%>" height="8" src="/images/ColuGif.gif"></div>
			<img title="<%=clmc%> : <%=sumck%>&nbsp;<%=jldwmc%>" width="<%=txkcsl2%>" height="8" src="/images/ColuGif2.gif"></div>
		</td>
	</tr>
					<%
			}
			rs.close();
			ps.close();
//			out.println(sql+"<br>");
}
catch (Exception e) {
	out.println(ls_sql+"<br>");
	out.println(sql+"<br>");
	out.print("Exception: " + e);
	return;
}
finally 
{
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
</table>