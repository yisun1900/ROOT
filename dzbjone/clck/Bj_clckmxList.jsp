<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String ckdh=request.getParameter("ckdh");


	ls_sql="SELECT bj_clckmx.wlbm,bj_clckmx.glmc,bj_clckmx.xhgg,bj_clckmx.pp,cljldwmc,TO_CHAR(bj_clckmx.dj),bj_clckmx.sl,bj_clckmx.dj*bj_clckmx.sl,jswlbm,bj_jscljgb.glmc||NVL2(bj_jscljgb.pp,'('||bj_jscljgb.pp||')',''),cldlmc";
	ls_sql+=" FROM bj_clckmx,bdm_cldlbm,bdm_cljldwbm,bj_jscljgb ";
	ls_sql+=" where bj_clckmx.cldlbm=bdm_cldlbm.cldlbm(+)";
	ls_sql+=" and bj_clckmx.jldwbm=bdm_cljldwbm.cljldwbm(+) and bj_clckmx.jswlbm=bj_jscljgb.wlbm(+)";
    ls_sql+=" and bj_clckmx.ckdh='"+ckdh+"'";
    ls_sql+=" order by bj_clckmx.wlbm";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqmc","cldlbm","wlbm","glmc","pp","xhgg","cljldwmc","dj","lrr","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"wlbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteBj_clckmx.jsp?ckdh="+ckdh};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料出库明细（出库单号：<%=ckdh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="7%">物流材料编码</td>
    <td  width="12%">物流材料名称</td>
	<td  width="11%">型号规格</td>
	<td  width="15%">品牌</td>
	<td  width="5%">计量单位</td>
	<td  width="5%">单价</td>
	<td  width="6%">出库数量</td>
	<td  width="7%">出库金额</td>
	<td  width="6%">结算物料编码</td>
	<td  width="12%">结算物料名称</td>
	<td  width="8%">材料类别</td>
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