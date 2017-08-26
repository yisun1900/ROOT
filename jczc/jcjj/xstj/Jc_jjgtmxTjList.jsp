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
	String crm_khxx_qye=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_sgd=null;
	String crm_khxx_zjxm=null;
	String crm_khxx_dwbh=null;
	String jc_jjdd_khbh=null;
	String jc_jjdd_clgw=null;
	String jc_jjdd_ztjjgw=null;
	String jc_jjdd_xmzy=null;
	String jc_jjdd_jjsjs=null;
	String jc_jjdd_qhtsj=null;
	String jc_jjdd_pdgc=null;
	String jc_jjdd_xcmgc=null;
	String jc_jjdd_lrsj=null;
	String jc_jjdd_khlx=null;
	String jc_jjgtmx_ddbh=null;
	String jc_jjgtmx_gtmc=null;
	String jc_jjgtmx_jjazwz=null;
	String jc_jjgtmx_guige=null;
	String jc_jjgtmx_jjlx=null;
	String jc_jjgtmx_bcpp=null;
	String jc_jjgtmx_bclx=null;
	String jc_jjgtmx_bcys=null;


	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	
	
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
	crm_khxx_qye=request.getParameter("crm_khxx_qye");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye>="+crm_khxx_qye+") ";
	}
	crm_khxx_qye=request.getParameter("crm_khxx_qye2");
	if (crm_khxx_qye!=null)
	{
		crm_khxx_qye=crm_khxx_qye.trim();
		if (!(crm_khxx_qye.equals("")))	wheresql+=" and  (crm_khxx.qye<="+crm_khxx_qye+") ";
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
	jc_jjdd_khlx=request.getParameter("jc_jjdd_khlx");
	if (jc_jjdd_khlx!=null)
	{
		jc_jjdd_khlx=cf.GB2Uni(jc_jjdd_khlx);
		if (!(jc_jjdd_khlx.equals("")))	wheresql+=" and  (jc_jjdd.khlx='"+jc_jjdd_khlx+"')";
	}
	jc_jjgtmx_ddbh=request.getParameter("jc_jjgtmx_ddbh");
	if (jc_jjgtmx_ddbh!=null)
	{
		jc_jjgtmx_ddbh=cf.GB2Uni(jc_jjgtmx_ddbh);
		if (!(jc_jjgtmx_ddbh.equals("")))	wheresql+=" and  (jc_jjgtmx.ddbh='"+jc_jjgtmx_ddbh+"')";
	}
	jc_jjgtmx_gtmc=request.getParameter("jc_jjgtmx_gtmc");
	if (jc_jjgtmx_gtmc!=null)
	{
		jc_jjgtmx_gtmc=cf.GB2Uni(jc_jjgtmx_gtmc);
		if (!(jc_jjgtmx_gtmc.equals("")))	wheresql+=" and  (jc_jjgtmx.gtmc='"+jc_jjgtmx_gtmc+"')";
	}
	jc_jjgtmx_jjazwz=request.getParameter("jc_jjgtmx_jjazwz");
	if (jc_jjgtmx_jjazwz!=null)
	{
		jc_jjgtmx_jjazwz=cf.GB2Uni(jc_jjgtmx_jjazwz);
		if (!(jc_jjgtmx_jjazwz.equals("")))	wheresql+=" and  (jc_jjgtmx.jjazwz='"+jc_jjgtmx_jjazwz+"')";
	}
	jc_jjgtmx_guige=request.getParameter("jc_jjgtmx_guige");
	if (jc_jjgtmx_guige!=null)
	{
		jc_jjgtmx_guige=cf.GB2Uni(jc_jjgtmx_guige);
		if (!(jc_jjgtmx_guige.equals("")))	wheresql+=" and  (jc_jjgtmx.guige='"+jc_jjgtmx_guige+"')";
	}
	jc_jjgtmx_jjlx=request.getParameter("jc_jjgtmx_jjlx");
	if (jc_jjgtmx_jjlx!=null)
	{
		jc_jjgtmx_jjlx=cf.GB2Uni(jc_jjgtmx_jjlx);
		if (!(jc_jjgtmx_jjlx.equals("")))	wheresql+=" and  (jc_jjgtmx.jjlx='"+jc_jjgtmx_jjlx+"')";
	}
	jc_jjgtmx_bcpp=request.getParameter("jc_jjgtmx_bcpp");
	if (jc_jjgtmx_bcpp!=null)
	{
		jc_jjgtmx_bcpp=cf.GB2Uni(jc_jjgtmx_bcpp);
		if (!(jc_jjgtmx_bcpp.equals("")))	wheresql+=" and  (jc_jjgtmx.bcpp='"+jc_jjgtmx_bcpp+"')";
	}
	jc_jjgtmx_bclx=request.getParameter("jc_jjgtmx_bclx");
	if (jc_jjgtmx_bclx!=null)
	{
		jc_jjgtmx_bclx=cf.GB2Uni(jc_jjgtmx_bclx);
		if (!(jc_jjgtmx_bclx.equals("")))	wheresql+=" and  (jc_jjgtmx.bclx='"+jc_jjgtmx_bclx+"')";
	}
	jc_jjgtmx_bcys=request.getParameter("jc_jjgtmx_bcys");
	if (jc_jjgtmx_bcys!=null)
	{
		jc_jjgtmx_bcys=cf.GB2Uni(jc_jjgtmx_bcys);
		if (!(jc_jjgtmx_bcys.equals("")))	wheresql+=" and  (jc_jjgtmx.bcys='"+jc_jjgtmx_bcys+"')";
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
double bcbfje=0;
double pjbfje=0;
double zj=0;

try {
	conn=cf.getConnection();

	ls_sql=" select count(distinct jc_jjdd.khbh),count(distinct jc_jjgtmx.ddbh),sum(jc_jjgtmx.sl),sum(jc_jjgtmx.zjhsl),sum(jc_jjgtmx.bcbfje*jc_jjgtmx.zjhsl),sum(jc_jjgtmx.pjbfje*jc_jjgtmx.zjhsl),sum(jc_jjgtmx.zj*jc_jjgtmx.zjhsl)";
	ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjgtmx,sq_dwxx,sq_gysxx a,sq_gysxx b ";
    ls_sql+=" where jc_jjgtmx.ddbh=jc_jjdd.ddbh and jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
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
		bcbfje=rs.getDouble(5);
		pjbfje=rs.getDouble(6);
		zj=rs.getDouble(7);
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
		selectgroupsql=" select "+selectgroupsql.substring(1)+",count(distinct jc_jjdd.khbh),count(distinct jc_jjgtmx.ddbh),sum(jc_jjgtmx.sl),sum(jc_jjgtmx.zjhsl),sum(jc_jjgtmx.bcbfje*jc_jjgtmx.zjhsl),sum(jc_jjgtmx.pjbfje*jc_jjgtmx.zjhsl),sum(jc_jjgtmx.zj*jc_jjgtmx.zjhsl),'<img src=\"/images/ColuGif.gif\" width=\"'||ROUND(sum(jc_jjgtmx.zj*jc_jjgtmx.zjhsl)*100/"+zj+",2)||'\" height=\"14\">'||ROUND(sum(jc_jjgtmx.zj*jc_jjgtmx.zjhsl)*100/"+zj+",2)||'%'";
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
	<td  width="8%">板材部分金额</td>
	<td  width="8%">配件部分金额</td>
	<td  width="8%">柜体总价</td>
	<td  width="20%">金额所占比率</td>
</tr>
<%

	ls_sql=selectgroupsql;
	ls_sql+=" FROM crm_khxx,jc_jjdd,jc_jjgtmx,sq_dwxx,sq_gysxx a,sq_gysxx b ";
    ls_sql+=" where jc_jjgtmx.ddbh=jc_jjdd.ddbh and jc_jjdd.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
	ls_sql+=" and jc_jjdd.pdgc=a.gysbh(+) and jc_jjdd.xcmgc=b.gysbh(+)  ";
	ls_sql+=wheresql;
	ls_sql+=groupsql;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);

	pageObj.alignStr[groupsl+7]="align='left'";


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
  <td ><%=bcbfje%></td>
  <td ><%=pjbfje%></td>
  <td ><%=zj%></td>
  <td align='left'><img src="/images/ColuGif.gif" width="100" height="14"></td>
</tr>
</table>

</body>
</html>
