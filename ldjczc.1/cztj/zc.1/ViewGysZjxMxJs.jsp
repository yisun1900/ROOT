<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String fgsbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String gys=cf.GB2Uni(cf.getParameter(request,"gys"));


	ls_sql="SELECT '',jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','录入未完成','01','录入完成','02','已确认','04','厂家已接收','03','已送货','05','部分送货','30','单项完结','99','退单'),jc_zczjx.ppbm,jc_zczjx.zjxfssj,jc_zczjx.zjxcbze,jc_zczjx.zqzjxze,jc_zczjx.zjxze,jc_zczjx.clgw,jc_zczjx.ddbh,crm_khxx.khxm,crm_khxx.fwdz,TO_CHAR(jc_zczjx.zjxzkl) zjxzkl,jc_zczjx.zjxcxhdje,jc_zczjx.ztjjgw,jc_zczjx.xmzy,jc_zczjx.qrsj,zczjxyymc,DECODE(jc_zczjx.sfjs,'N','未结算','C','已选择结算','Y','已结算','M','结算已审核'),jc_zczjx.jissj,jc_zczjx.jisr,jc_zczjx.lrsj,DECODE(jc_zczjx.sfjrht,'Y','计入','N','不计入') sfjrht,crm_khxx.khbh,jc_zczjx.gys,jc_zczjx.bz";
	ls_sql+=" FROM crm_khxx,jc_zczjx,jdm_zczjxyybm";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and jc_zczjx.zczjxyybm=jdm_zczjxyybm.zczjxyybm(+)";


	ls_sql+=" and jc_zczjx.clzt not in('00')";
	ls_sql+=" and jc_zczjx.zjxfssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.zjxfssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zczjx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_zczjx.gys='"+gys+"'";
	ls_sql+=" order by jc_zczjx.zjxfssj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"zjxbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zccl/zjx/ViewJeJc_zczjx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("zjxbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">供应商增减项明细（<%=gys%>）
  <BR>(增减项发生时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="230%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="1%">&nbsp;</td>
	<td  width="3%">增减项序号</td>
	<td  width="3%">处理状态</td>
	<td  width="4%">子品牌</td>
	<td  width="3%">增减项发生时间</td>
	<td  width="3%">结算金额</td>
	<td  width="3%">折前增减项总额</td>
	<td  width="3%">折后增减项总额</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="3%">订单编号</td>
	<td  width="3%">客户姓名</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">增减项折扣</td>
	<td  width="3%">增减项计入活动金额</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="3%">确认时间</td>
	<td  width="4%">增减项原因</td>
	<td  width="3%">是否已结算</td>
	<td  width="3%">结算时间</td>
	<td  width="2%">结算人</td>
	<td  width="3%">录入时间</td>
	<td  width="2%">计入家装合同</td>
	<td  width="2%">客户编号</td>
	<td  width="7%">供应商</td>
	<td  width="97%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>