<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String khbh=request.getParameter("khbh");
	//String zjxxh=request.getParameter("zjxxh");

	ls_sql="select wlbm,glmc,pp,xhgg,cljldwmc,TO_CHAR(dj),sum(sl) ckzsl,sum(sl*dj) ckzje ";
	ls_sql+=" from bdm_cljldwbm,bj_clckmx,bj_clckd  ";
    ls_sql+=" where bj_clckd.khbh='"+khbh+"'";
    ls_sql+=" and bj_clckmx.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_clckd.ckdh=bj_clckmx.ckdh ";
    ls_sql+=wheresql;
	ls_sql+=" group by wlbm,glmc,pp,xhgg,cljldwmc,dj";
    ls_sql+=" order by wlbm,glmc,pp,xhgg,cljldwmc,dj";
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
  <B><font size="3">物流材料出库汇总清单（<%=khbh%>）</font></B>
</CENTER>
<%
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
	<td  width="6%">出库单价</td>
	<td  width="10%">出库总数量</td>
	<td  width="10%">出库总金额</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>