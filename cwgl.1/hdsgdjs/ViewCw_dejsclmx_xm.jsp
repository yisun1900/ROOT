<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");
	String wlbm=request.getParameter("wlbm");

	ls_sql="SELECT wlbm,glflmc,DECODE(wlllbz,'Y','需要','N','否') wlllbz,DECODE(lx,'1','物流有对应材料','2','无对应材料') lx,glmc,pp,xhgg,cljldwmc,TO_CHAR(bzdj),TO_CHAR(dj),ylclyl,slclyl,xbclk  ";
	ls_sql+=" FROM cw_dejsclmx,bdm_cljldwbm,bdm_glflbm  ";
    ls_sql+=" where cw_dejsclmx.khbh='"+khbh+"' and cw_dejsclmx.wlbm='"+wlbm+"'";
    ls_sql+=" and cw_dejsclmx.jldwbm=bdm_cljldwbm.cljldwbm(+) and cw_dejsclmx.glflbm=bdm_glflbm.glflbm(+)";

    ls_sql+=" UNION ALL ";
/*
*/
	ls_sql+=" SELECT wlbm,glflmc,DECODE(wlllbz,'Y','需要','N','否') wlllbz,'' lx,glmc,pp,xhgg,cljldwmc,TO_CHAR(dj),TO_CHAR(dj),xhl,0,0  ";
	ls_sql+=" FROM bj_khglfxb,bdm_cljldwbm,bdm_glflbm  ";
	ls_sql+=" where bj_khglfxb.khbh='"+khbh+"' and bj_khglfxb.wlbm='"+wlbm+"'";
    ls_sql+=" and bj_khglfxb.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_khglfxb.glflbm=bdm_glflbm.glflbm(+)";
	ls_sql+=" and bj_khglfxb.glflbm='1' and bj_khglfxb.wlllbz='N' ";//只取材料类，包括不需要物流领料

	ls_sql+=" order by wlllbz desc,lx desc,glmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">定额结算材料明细（<%=khbh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">结算材料编码</td>
	<td  width="5%">工料分类编码</td>
	<td  width="5%">需到物流领料</td>
	<td  width="7%">类型</td>
	<td  width="16%">工料名称</td>
	<td  width="12%">品牌</td>
	<td  width="10%">型号规格</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">标准单价</td>
	<td  width="6%">结算单价</td>
	<td  width="7%">应领材料用量</td>
	<td  width="7%">实领材料用量</td>
	<td  width="8%">需补材料款</td>
</tr>
<%
		pageObj.displayDateSum();
%> 
</table>

结算单价＝
<BR>若是非物流领料，直接取取工料分析表的单价；
<BR>若是物流领料，如果有出库记录，则取平均单价，若没有出库记录，则从物流材料价格表中取最新单价；
<BR>若是物流领料，但物流没有对应材料，由人工录入客户工料分析，直接取取工料分析表的单价；
<BR>自定义项目，由人工录入客户工料分析，直接取取工料分析表的单价


<CENTER >
  <B><font size="3">物流材料出库汇总清单（<%=khbh%>）</font></B>
</CENTER>
<%

	ls_sql="select wlbm,glmc,pp,xhgg,cljldwmc,NVL2(wljsbz,TO_CHAR(ROUND(sum(sl*dj)/sum(sl*wljsbz),2)),0),sum(sl*wljsbz) ckzsl,sum(sl*dj) ckzje ";
	ls_sql+=" from bdm_cljldwbm,bj_clckmx,bj_clckd  ";
    ls_sql+=" where bj_clckd.khbh='"+khbh+"' and bj_clckmx.jswlbm='"+wlbm+"'";
    ls_sql+=" and bj_clckmx.jsjldwbm=bdm_cljldwbm.cljldwbm(+) and bj_clckd.ckdh=bj_clckmx.ckdh ";
	ls_sql+=" group by wlbm,glmc,pp,xhgg,cljldwmc,dj,wljsbz";
    ls_sql+=" order by wlbm,glmc,pp,xhgg,cljldwmc,dj,wljsbz";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">物流材料编码</td>	
	<td  width="12%">物流材料名称</td>
	<td  width="12%">品牌</td>
	<td  width="10%">型号规格</td>
	<td  width="6%">计量单位</td>
	<td  width="6%">平均单价</td>
	<td  width="10%">出库总数量</td>
	<td  width="10%">出库总金额</td>
</tr>
<%
	pageObj.displayDateSum();
%> 
</table>


</body>

</html>