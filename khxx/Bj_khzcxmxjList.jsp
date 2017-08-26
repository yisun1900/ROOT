<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	color: #0000CC;
	font-weight: bold;
}
-->
</style>
</head>
<%
	String khbh=request.getParameter("khbh");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户主材项目小计（<%=khbh%>）</font></B>
</CENTER>

<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">结构位置</td>
	<td  width="5%">套餐升级分类</td>
	<td  width="6%">产品类别</td>
	<td  width="3%"><span class="STYLE1">升级是否收费</span></td>
	<td  width="3%"><span class="STYLE1">原报价级别</span></td>
	<td  width="3%"><span class="STYLE1">升级后级别</span></td>
	<td  width="3%"><span class="STYLE1">升级收费数量</span></td>
	<td  width="4%"><span class="STYLE1">升级差价</span></td>
	<td  width="4%"><span class="STYLE1">升级收费金额</span></td>
	<td  width="4%"><span class="STYLE1">升级有促销</span></td>
	<td  width="3%">是否必选项</td>
	<td  width="3%">计量单位</td>
	<td  width="6%">是否限制数量</td>
	<td  width="3%">标准数量</td>
	<td  width="4%">实际数量</td>
	<td  width="4%">实际加损耗数量</td>
	<td  width="4%">实际减免数量</td>
	<td  width="5%">实际减免金额</td>
	<td  width="3%">是否可减免</td>
	<td  width="4%">允许减免最大数量</td>
	<td  width="4%">减免单价</td>
	<td  width="4%">是否可更换</td>
	<td  width="3%">可换最大数量</td>
	<td  width="4%">更换折价</td>
	<td  width="4%">是否要求相同品牌</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	ls_sql="SELECT jgwzbm,bj_khzcxmxj.tcsjflbm,tcsjflmc,bj_khzcxmxj.tccplbbm,jxc_clxlbm.clxlmc,DECODE(sfbxx,'Y','是','N','否') sfbxx,DECODE(sfyxsj,'Y','收费','N','否') sfyxsj,a.bjjbmc khbjjbbm,b.bjjbmc,sjsfsl,DECODE(sjcj,0,'',sjcj) sjcj,DECODE(sjsfje,0,'',sjsfje) sjsfje,DECODE(sjsfycx,'1','无','2','无数量限制促销','3','有数量限制促销') sjsfycx  ,jldw,DECODE(bj_khzcxmxj.sfxzsl,'1','超量需加价','2','不可超量','3','无数量限制') sfxzsl,bzsl,DECODE(bj_khzcxmxj.sfkjm,'1','否','2','可以') sfkjm,bj_khzcxmxj.yxjmzdsl,jmdj,DECODE(sfkgh,'1','否','2','可换') sfkgh,khzdsl,ghzj,DECODE(sfyqxtpp,'Y','是','N','否') sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje";
	ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm,bj_tcsjflbm,bdm_bjjbbm a,bdm_bjjbbm b  ";
    ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) and bj_khzcxmxj.khbh='"+khbh+"'";
    ls_sql+=" and bj_khzcxmxj.khbjjbbm=a.bjjbbm(+) and bj_khzcxmxj.bjjbbm=b.bjjbbm(+)";
    ls_sql+=" order by bj_khzcxmxj.jgwzbm,bj_khzcxmxj.tcsjflbm,bj_khzcxmxj.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置显示列
	String[] disColName={ "jgwzbm","tcsjflmc","clxlmc","sfyxsj","khbjjbbm","bjjbmc","sjsfsl","sjcj","sjsfje","sjsfycx","sfbxx","jldw","sfxzsl","bzsl","sjsl","sjjshsl","sjjmsl","sjjmje","sfkjm","yxjmzdsl","jmdj","sfkgh","khzdsl","ghzj","sfyqxtpp"};
	pageObj.setDisColName(disColName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jgwzbm","1");//列参数对象加入Hash表
	spanColHash.put("tcsjflbm","1");//列参数对象加入Hash表
	spanColHash.put("tcsjflmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
	pageObj.printFoot();
%> 
</table>
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
