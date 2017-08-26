<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT xh,khbh,xmbh,xmmc,xmdlbm,xmxlbm,xmflbm,smbm,jldwbm,clcb,rgcb,jxcb,cbenj,sgcbj,cldj,rgdj,jxdj,zcf,shf,ysf,qtf,sfyxdz,zdzk,zqdj,zk,dj,sgdbj,bjjb,dqbm,bjlx,sfbxx,zdyxmyxq,jzbz,xmlx,ckxm,sfxycl,sfxyyjd,sfzgzc,tcnxmbz,xmpx,glxmbh,lrr,lrsj,gycl,flmcgg,bz  ";
	ls_sql+=" FROM bj_bjxmmx  ";
    ls_sql+=" where khbh='"+khbh+"'";
    ls_sql+=" order by xmbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_bjxmmxCxList.jsp","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数
	pageObj.setDateType("long");


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">序号</td>
	<td  width="2%">客户编号</td>
	<td  width="2%">项目编号</td>
	<td  width="4%">项目名称</td>
	<td  width="2%">项目大类编码</td>
	<td  width="2%">项目小类编码</td>
	<td  width="2%">项目分类编码</td>
	<td  width="2%">饰面编码</td>
	<td  width="1%">计量单位</td>
	<td  width="2%">材料成本</td>
	<td  width="2%">人工成本</td>
	<td  width="2%">机械成本</td>
	<td  width="2%">成本价</td>
	<td  width="2%">施工成本价</td>
	<td  width="2%">材料报价</td>
	<td  width="2%">人工报价</td>
	<td  width="2%">机械报价</td>
	<td  width="2%">主材费</td>
	<td  width="2%">损耗费</td>
	<td  width="2%">运输费</td>
	<td  width="2%">其它费</td>
	<td  width="2%">是否允许打折</td>
	<td  width="2%">最低折扣</td>
	<td  width="2%">客户折前报价</td>
	<td  width="2%">折扣</td>
	<td  width="2%">客户折后报价</td>
	<td  width="2%">工程基础报价</td>
	<td  width="1%">报价级别</td>
	<td  width="1%">地区编码</td>
	<td  width="1%">报价类型</td>
	<td  width="2%">是否必选项</td>
	<td  width="2%">自定义项目有效期</td>
	<td  width="1%">家装标志</td>
	<td  width="1%">项目类型</td>
	<td  width="2%">参考项目</td>
	<td  width="2%">是否需要材料</td>
	<td  width="2%">是否需要预交底</td>
	<td  width="2%">是否客户自购主材</td>
	<td  width="2%">套餐内项目标志</td>
	<td  width="1%">项目排序</td>
	<td  width="2%">关联项目编号</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="9%">工艺材料简介</td>
	<td  width="4%">辅料名称规格</td>
	<td  width="6%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>