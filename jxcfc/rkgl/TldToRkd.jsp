<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sq_dwxx_dwmc=null;
String dqbm=null;
String gysbm=null;
String gysmc=null;
String cglb=null;
String cllb=null;
String dhzsl=null;
String dhzje=null;
String xdr=null;
String xdrq=null;
String psfs=null;
String yqdhsj=null;
String gysjsr=null;
String gysjsrq=null;
String fhsfwc=null;
String gysfhr=null;
String gysfhrq=null;
String sfjs=null;
String jsr=null;
String jsrq=null;
String sgph=null;
String ddzt=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String nian=null;
String bz=null;
String sfrksgdw=null;

String psph=cf.GB2Uni(request.getParameter("lydh"));
String rkph=cf.GB2Uni(request.getParameter("rkph"));
String ls_sql=null;
%>

<html>
<head>
<title>退料单－入库</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">退料单－入库
  <input type="button" value="退料单入库" onclick="window.close();window.open('SaveTldToRkd.jsp?psph=<%=psph%>&rkph=<%=rkph%>');">
</div>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">序号</td>
	<td  width="7%">材料编码</td>
	<td  width="7%">内部编码</td>
	<td  width="13%">材料名称</td>
	<td  width="11%">型号</td>
	<td  width="11%">规格</td>
	<td  width="5%">计量单位</td>
	<td  width="6%">出库单价</td>
	<td  width="6%">出库数量</td>
	<td  width="7%">出库金额</td>
	<td  width="10%">品牌</td>
	<td  width="18%">材料小类</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT psxh,clbm,nbbm,clmc,xh,gg,jldwbm,TO_CHAR(dj),pssl,psje,ppmc,clxlbm ";
	ls_sql+=" FROM jxc_clpsmx ";
    ls_sql+=" where psph='"+psph+"'";
	ls_sql+=" order by psxh";
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);//设置每页显示记录数
	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.printDateSum();
%> 
</table>

</body>
</html>