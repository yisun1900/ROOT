<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;


	String wheresql=request.getParameter("wheresql");
	String dwbh=cf.GB2Uni(cf.getParameter(request,"dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));

	ls_sql="SELECT crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,jc_zcdd.clgw,jc_zcdd.ppbm,jc_zcdd.ddbh,jc_zcdd.xshth,jc_zcdd.wdzje,jc_zcdd.zcpclf,jc_zcdd.tjpclf,jc_zcdd.qtf,jc_zcdd.ycf,jc_zcdd.fdbl||'%',jc_zcdd.tjpfdbl||'%',round(jc_zcdd.zcpclf*jc_zcdd.fdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpfdbl/100,2)+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2) cbze,jc_zcdd.khfdbl||'%',jc_zcdd.tjpkhfdbl||'%',round(jc_zcdd.zcpclf*jc_zcdd.khfdbl/100+jc_zcdd.tjpclf*jc_zcdd.tjpkhfdbl/100,2) hkze,jc_zcdd.tcjrbl||'%',jc_zcdd.tjptcjrbl||'%',jc_zcdd.htyjjrje,jc_zcdd.qhtsj,jc_zcdd.gys,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a ";
    ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh and jc_zcdd.dwbh=a.dwbh";
	ls_sql+=" and jc_zcdd.ddlx='C'";//C：选配主材主材
	ls_sql+=" and crm_khxx.sjs='"+sjs+"'";
	ls_sql+=" and crm_khxx.dwbh='"+dwbh+"'";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_zcdd.lrsj desc,jc_zcdd.ddbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">选配主材主材返点－查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate();
	pageObj.printPageLink(240);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="3%">设计师</td>
	<td  width="3%">材料顾问</td>
	<td  width="4%">子品牌</td>

	<td  width="3%">订单编号</td>
	<td  width="3%">销售合同号</td>
	<td  width="4%">合同总额</td>
	<td  width="4%">正常品材料费</td>
	<td  width="4%">特价品材料费</td>
	<td  width="3%">安装辅料加工费</td>
	<td  width="3%">远程费</td>
	<td  width="3%">正常品结算比例</td>
	<td  width="3%">特价品结算比例</td>
	<td  width="4%">结算金额</td>
	<td  width="3%">正常品客户返点比例</td>
	<td  width="3%">特价品客户返点比例</td>
	<td  width="4%">客户优惠金额</td>
	<td  width="3%">正常品提成记入比例</td>
	<td  width="3%">特价品提成记入比例</td>
	<td  width="4%">提成记入金额</td>
	<td  width="3%">购买日期</td>
	<td  width="8%">供应商</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="411%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
</html>