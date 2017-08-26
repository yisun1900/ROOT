<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String jc_jjxcmmx_ddbh=null;
	String jc_jjdd_khbh=null;
	String jc_jjdd_clgw=null;
	String jc_jjdd_ztjjgw=null;
	String jc_jjdd_xmzy=null;
	String jc_jjdd_jjsjs=null;
	String jc_jjdd_qhtsj=null;
	String jc_jjdd_pdgc=null;
	String jc_jjdd_xcmgc=null;
	String jc_jjdd_clzt=null;
	String jc_jjxcmmx_xcmmc=null;
	String jc_jjxcmmx_azwz=null;
	String jc_jjxcmmx_bklxxh=null;
	String jc_jjxcmmx_bkys=null;
	String jc_jjxcmmx_mbcl1=null;
	String jc_jjxcmmx_mbcl2=null;
	String jc_jjdd_lrsj=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+crm_khxx_khxm+"%')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+crm_khxx_fwdz+"%')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+crm_khxx_lxfs+"%')";
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
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_sgd=request.getParameter("crm_khxx_sgd");
	if (crm_khxx_sgd!=null)
	{
		crm_khxx_sgd=cf.GB2Uni(crm_khxx_sgd);
		if (!(crm_khxx_sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+crm_khxx_sgd+"')";
	}
	crm_khxx_zjxm=request.getParameter("crm_khxx_zjxm");
	if (crm_khxx_zjxm!=null)
	{
		crm_khxx_zjxm=cf.GB2Uni(crm_khxx_zjxm);
		if (!(crm_khxx_zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+crm_khxx_zjxm+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	jc_jjxcmmx_ddbh=request.getParameter("jc_jjxcmmx_ddbh");
	if (jc_jjxcmmx_ddbh!=null)
	{
		jc_jjxcmmx_ddbh=cf.GB2Uni(jc_jjxcmmx_ddbh);
		if (!(jc_jjxcmmx_ddbh.equals("")))	wheresql+=" and  (jc_jjxcmmx.ddbh='"+jc_jjxcmmx_ddbh+"')";
	}
	jc_jjdd_khbh=request.getParameter("jc_jjdd_khbh");
	if (jc_jjdd_khbh!=null)
	{
		jc_jjdd_khbh=cf.GB2Uni(jc_jjdd_khbh);
		if (!(jc_jjdd_khbh.equals("")))	wheresql+=" and  (jc_jjdd.khbh='"+jc_jjdd_khbh+"')";
	}
	jc_jjdd_clgw=request.getParameter("jc_jjdd_clgw");
	if (jc_jjdd_clgw!=null)
	{
		jc_jjdd_clgw=cf.GB2Uni(jc_jjdd_clgw);
		if (!(jc_jjdd_clgw.equals("")))	wheresql+=" and  (jc_jjdd.clgw='"+jc_jjdd_clgw+"')";
	}
	jc_jjdd_ztjjgw=request.getParameter("jc_jjdd_ztjjgw");
	if (jc_jjdd_ztjjgw!=null)
	{
		jc_jjdd_ztjjgw=cf.GB2Uni(jc_jjdd_ztjjgw);
		if (!(jc_jjdd_ztjjgw.equals("")))	wheresql+=" and  (jc_jjdd.ztjjgw='"+jc_jjdd_ztjjgw+"')";
	}
	jc_jjdd_xmzy=request.getParameter("jc_jjdd_xmzy");
	if (jc_jjdd_xmzy!=null)
	{
		jc_jjdd_xmzy=cf.GB2Uni(jc_jjdd_xmzy);
		if (!(jc_jjdd_xmzy.equals("")))	wheresql+=" and  (jc_jjdd.xmzy='"+jc_jjdd_xmzy+"')";
	}
	jc_jjdd_jjsjs=request.getParameter("jc_jjdd_jjsjs");
	if (jc_jjdd_jjsjs!=null)
	{
		jc_jjdd_jjsjs=cf.GB2Uni(jc_jjdd_jjsjs);
		if (!(jc_jjdd_jjsjs.equals("")))	wheresql+=" and  (jc_jjdd.jjsjs='"+jc_jjdd_jjsjs+"')";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj>=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_qhtsj=request.getParameter("jc_jjdd_qhtsj2");
	if (jc_jjdd_qhtsj!=null)
	{
		jc_jjdd_qhtsj=jc_jjdd_qhtsj.trim();
		if (!(jc_jjdd_qhtsj.equals("")))	wheresql+="  and (jc_jjdd.qhtsj<=TO_DATE('"+jc_jjdd_qhtsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_pdgc=request.getParameter("jc_jjdd_pdgc");
	if (jc_jjdd_pdgc!=null)
	{
		jc_jjdd_pdgc=cf.GB2Uni(jc_jjdd_pdgc);
		if (!(jc_jjdd_pdgc.equals("")))	wheresql+=" and  (jc_jjdd.pdgc='"+jc_jjdd_pdgc+"')";
	}
	jc_jjdd_xcmgc=request.getParameter("jc_jjdd_xcmgc");
	if (jc_jjdd_xcmgc!=null)
	{
		jc_jjdd_xcmgc=cf.GB2Uni(jc_jjdd_xcmgc);
		if (!(jc_jjdd_xcmgc.equals("")))	wheresql+=" and  (jc_jjdd.xcmgc='"+jc_jjdd_xcmgc+"')";
	}
	jc_jjdd_clzt=request.getParameter("jc_jjdd_clzt");
	if (jc_jjdd_clzt!=null)
	{
		jc_jjdd_clzt=cf.GB2Uni(jc_jjdd_clzt);
		if (!(jc_jjdd_clzt.equals("")))	wheresql+=" and  (jc_jjdd.clzt='"+jc_jjdd_clzt+"')";
	}
	jc_jjxcmmx_xcmmc=request.getParameter("jc_jjxcmmx_xcmmc");
	if (jc_jjxcmmx_xcmmc!=null)
	{
		jc_jjxcmmx_xcmmc=cf.GB2Uni(jc_jjxcmmx_xcmmc);
		if (!(jc_jjxcmmx_xcmmc.equals("")))	wheresql+=" and  (jc_jjxcmmx.xcmmc='"+jc_jjxcmmx_xcmmc+"')";
	}
	jc_jjxcmmx_azwz=request.getParameter("jc_jjxcmmx_azwz");
	if (jc_jjxcmmx_azwz!=null)
	{
		jc_jjxcmmx_azwz=cf.GB2Uni(jc_jjxcmmx_azwz);
		if (!(jc_jjxcmmx_azwz.equals("")))	wheresql+=" and  (jc_jjxcmmx.azwz='"+jc_jjxcmmx_azwz+"')";
	}
	jc_jjxcmmx_bklxxh=request.getParameter("jc_jjxcmmx_bklxxh");
	if (jc_jjxcmmx_bklxxh!=null)
	{
		jc_jjxcmmx_bklxxh=cf.GB2Uni(jc_jjxcmmx_bklxxh);
		if (!(jc_jjxcmmx_bklxxh.equals("")))	wheresql+=" and  (jc_jjxcmmx.bklxxh='"+jc_jjxcmmx_bklxxh+"')";
	}
	jc_jjxcmmx_bkys=request.getParameter("jc_jjxcmmx_bkys");
	if (jc_jjxcmmx_bkys!=null)
	{
		jc_jjxcmmx_bkys=cf.GB2Uni(jc_jjxcmmx_bkys);
		if (!(jc_jjxcmmx_bkys.equals("")))	wheresql+=" and  (jc_jjxcmmx.bkys='"+jc_jjxcmmx_bkys+"')";
	}
	jc_jjxcmmx_mbcl1=request.getParameter("jc_jjxcmmx_mbcl1");
	if (jc_jjxcmmx_mbcl1!=null)
	{
		jc_jjxcmmx_mbcl1=cf.GB2Uni(jc_jjxcmmx_mbcl1);
		if (!(jc_jjxcmmx_mbcl1.equals("")))	wheresql+=" and  (jc_jjxcmmx.mbcl1='"+jc_jjxcmmx_mbcl1+"')";
	}
	jc_jjxcmmx_mbcl2=request.getParameter("jc_jjxcmmx_mbcl2");
	if (jc_jjxcmmx_mbcl2!=null)
	{
		jc_jjxcmmx_mbcl2=cf.GB2Uni(jc_jjxcmmx_mbcl2);
		if (!(jc_jjxcmmx_mbcl2.equals("")))	wheresql+=" and  (jc_jjxcmmx.mbcl2='"+jc_jjxcmmx_mbcl2+"')";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj>=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}
	jc_jjdd_lrsj=request.getParameter("jc_jjdd_lrsj2");
	if (jc_jjdd_lrsj!=null)
	{
		jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
		if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
	}

%>

<%
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

int khs=0;
int dds=0;
int htsl=0;
int zjhsl=0;

double zj=0;
double zjhzj=0;

try {
	conn=cf.getConnection();

	ls_sql=" select count(distinct jc_jjdd.khbh),count(distinct jc_jjxcmmx.ddbh),sum(jc_jjxcmmx.sl),sum(jc_jjxcmmx.zjhsl),sum(jc_jjxcmmx.zj),sum(jc_jjxcmmx.zjhzj)";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjxcmmx,sq_dwxx,sq_gysxx a,sq_gysxx b ";
    ls_sql+=" where jc_jjxcmmx.ddbh=jc_jjdd.ddbh and jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and jc_jjdd.pdgc=a.gysbh(+) and jc_jjdd.xcmgc=b.gysbh(+)  ";
	ls_sql+=wheresql;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khs=rs.getInt(1);
		dds=rs.getInt(2);
		htsl=rs.getInt(3);
		zjhsl=rs.getInt(4);
		zj=rs.getDouble(5);
		zjhzj=rs.getDouble(6);
	}
	rs.close();
	ps.close();

	if (zj==0)
	{
		out.println("无订单");
		return;
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>



<%
	String tj1=cf.GB2Uni(request.getParameter("tj1"));
	String tj2=cf.GB2Uni(request.getParameter("tj2"));
	String tj3=cf.GB2Uni(request.getParameter("tj3"));
	String tj4=cf.GB2Uni(request.getParameter("tj4"));
	String tj5=cf.GB2Uni(request.getParameter("tj5"));
	String tj6=cf.GB2Uni(request.getParameter("tj6"));
	String tj1name=cf.GB2Uni(request.getParameter("tj1name"));
	String tj2name=cf.GB2Uni(request.getParameter("tj2name"));
	String tj3name=cf.GB2Uni(request.getParameter("tj3name"));
	String tj4name=cf.GB2Uni(request.getParameter("tj4name"));
	String tj5name=cf.GB2Uni(request.getParameter("tj5name"));
	String tj6name=cf.GB2Uni(request.getParameter("tj6name"));

	String groupsql="";
	String selectgroupsql="";
	int groupsl=0;
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			groupsql+=","+tj1;
			selectgroupsql+=","+tj1;
			groupsl++;
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			groupsql+=","+tj2;
			selectgroupsql+=","+tj2;
			groupsl++;
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			groupsql+=","+tj3;
			selectgroupsql+=","+tj3;
			groupsl++;
		}
	}
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			groupsql+=","+tj4;
			selectgroupsql+=","+tj4;
			groupsl++;
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			groupsql+=","+tj5;
			selectgroupsql+=","+tj5;
			groupsl++;
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			groupsql+=","+tj6;
			selectgroupsql+=","+tj6;
			groupsl++;
		}
	}
	if (groupsl==0)
	{
		out.println("请选择统计列");
		return;
	}
	else{
		groupsql=" group by "+groupsql.substring(1);
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct jc_jjdd.khbh),count(distinct jc_jjxcmmx.ddbh),sum(jc_jjxcmmx.sl),sum(jc_jjxcmmx.zjhsl),sum(jc_jjxcmmx.zj),sum(jc_jjxcmmx.zjhzj),'<img src=\"/images/ColuGif.gif\" width=\"'||ROUND(sum(jc_jjxcmmx.zjhzj)*100/"+zjhzj+",2)||'\" height=\"14\">'||ROUND(sum(jc_jjxcmmx.zjhzj)*100/"+zjhzj+",2)||'%'";
	}
%>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
<%
	if (!tj1name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj1name+"</td>");
	}
	if (!tj2name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj2name+"</td>");
	}
	if (!tj3name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj3name+"</td>");
	}
	if (!tj4name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj4name+"</td>");
	}
	if (!tj5name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj5name+"</td>");
	}
	if (!tj6name.equals(""))
	{
		out.println("<td  width=\"10%\">"+tj6name+"</td>");
	}

%>
	<td  width="6%">客户数</td>
	<td  width="6%">订单数</td>
	<td  width="8%">合同数量</td>
	<td  width="8%">增减后数量</td>
	<td  width="8%">合同总价</td>
	<td  width="8%">增减后总价</td>
	<td  width="20%">金额所占比率</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjxcmmx,sq_dwxx,sq_gysxx a,sq_gysxx b ";
    ls_sql+=" where jc_jjxcmmx.ddbh=jc_jjdd.ddbh and jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh ";
	ls_sql+=" and jc_jjdd.pdgc=a.gysbh(+) and jc_jjdd.xcmgc=b.gysbh(+)  ";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

	pageObj.alignStr[groupsl+6]="align='left'";


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	if (tj1!=null)
	{
		if (!(tj1.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj1,"1");//列参数对象加入Hash表
		}
	}
	if (tj2!=null)
	{
		if (!(tj2.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj2,"1");//列参数对象加入Hash表
		}
	}
	if (tj3!=null)
	{
		if (!(tj3.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj3,"1");//列参数对象加入Hash表
		}
	}
	if (tj4!=null)
	{
		if (!(tj4.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj4,"1");//列参数对象加入Hash表
		}
	}
	if (tj5!=null)
	{
		if (!(tj5.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj5,"1");//列参数对象加入Hash表
		}
	}
	if (tj6!=null)
	{
		if (!(tj6.equals("")))
		{
			//设置显示合并列
			spanColHash.put(tj6,"1");//列参数对象加入Hash表
		}
	}
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 

<tr bgcolor="#FFFFFF" align='center'>
  <td colspan="<%=groupsl%>">小 计</td>
  <td ><%=khs%></td>
  <td ><%=dds%></td>
  <td ><%=htsl%></td>
  <td ><%=zjhsl%></td>
  <td ><%=zj%></td>
  <td ><%=zjhzj%></td>
  <td align='left'><img src="/images/ColuGif.gif" width="100" height="14"></td>
</tr>
</table>

</body>
</html>
