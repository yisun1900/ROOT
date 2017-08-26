<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	pageObj.setType("EXCEL",response);

	String ls_sql=null;
	String wheresql="";
	String dqbm=null;

	dqbm=request.getParameter("dqbm");

	ls_sql="SELECT bjjbmc,DECODE(tckd_tczcbj.yxthsj,'Y','是','N','否'),tckd_tczcbj.kdbm,tckd_tczcbj.nbbm,tckd_tczcbj.ppmc,tckd_tczcbj.gysmc,jxc_cldlbm.cldlmc,clxlmc,tckd_tczcbj.cpbm,tckd_tczcbj.cpmc,tckd_tczcbj.xh,tckd_tczcbj.gg,tckd_tczcbj.jldw,tckd_tczcbj.xdjldw,tckd_tczcbj.xdb,tckd_tczcbj.sh,DECODE(tckd_tczcbj.sfxclxs,'1','向上取整','2','向下取整','3','4舍5入','4','不处理') sfxclxs,tckd_tczcbj.jsj,DECODE(tckd_tczcbj.sfyx,'1','永远有效','2','无效','3','阶段有效') sfyx,tckd_tczcbj.yxkssj,tckd_tczcbj.yxjzsj, tckd_tczcbj.xuhao ";
	ls_sql+=" FROM tckd_tczcbj,jxc_cldlbm,jxc_clxlbm,jdm_bjjbbm ";
    ls_sql+=" where tckd_tczcbj.tccpdlbm=jxc_cldlbm.cldlbm(+) and tckd_tczcbj.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and tckd_tczcbj.bjjbbm=jdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tckd_tczcbj.dqbm='"+dqbm+"'";
    ls_sql+=" order by tckd_tczcbj.bjjbbm,tckd_tczcbj.kdbm,tckd_tczcbj.tccpdlbm,tckd_tczcbj.tccplbbm,tckd_tczcbj.cpbm";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="190%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">报价级别</td>
	<td  width="5%">允许替换升级</td>
	<td  width="5%">阔达编码</td>
	<td  width="5%">内部编码</td>
	<td  width="5%">品牌</td>
	<td  width="9%">供应商</td>
	<td  width="5%">产品大类</td>
	<td  width="4%">产品类别</td>
	<td  width="5%">产品编码</td>
	<td  width="7%">产品名称</td>
	<td  width="7%">型号</td>
	<td  width="6%">规格</td>
	<td  width="3%">计量单位</td>
	<td  width="3%">下单计量单位</td>
	<td  width="3%">下单比</td>
	<td  width="3%">损耗(%)</td>
	<td  width="4%">是否需处理小数</td>
	<td  width="3%">结算价</td>
	<td  width="3%">是否有效</td>
	<td  width="4%">有效开始时间</td>
	<td  width="4%">有效结束时间</td>
	<td  width="2%">排序序号</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

</body>
</html>