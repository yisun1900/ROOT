<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String ddlx=request.getParameter("ddlx");
	String fgsbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String gys=cf.GB2Uni(cf.getParameter(request,"gys"));
	String zcdlbm=cf.GB2Uni(cf.getParameter(request,"zcdlbm"));
	String ppbm=cf.GB2Uni(cf.getParameter(request,"ppbm"));

%>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">供应商结算已付款明细（<%=gys%>）
  <BR>(结算时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="470%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="1%">&nbsp;</td>
   	<td  width="1%">订单编号</td>
	<td  width="2%">处理状态</td>
	<td  width="2%">订单类型</td>
	<td  width="2%">子品牌</td>
	<td  width="2%">结算状态</td>
	<td  width="2%" bgcolor="#99FFFF"><strong>结算金额</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong>合同额-折前</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong><font color="#0000CC">合同额-折后</font></strong></td>
	<td  width="2%">签合同时间</td>
	<td  width="2%">完结时间</td>
	<td  width="2%">结算时间</td>
	<td  width="1%">客户姓名</td>
	<td  width="4%">房屋地址</td>
	<td  width="1%">驻店家居顾问</td>
	<td  width="2%">主材大类</td>
	<td  width="4%">供应商</td>
	<td  width="1%">是否计入家装合同</td>
	<td  width="2%">工程进度</td>
	<td  width="4%">参加促销活动</td>
	<td  width="1%">家装设计师</td>
	<td  width="3%">签约店面</td>
	<td  width="1%">展厅家居顾问</td>
	<td  width="1%">项目专员</td>
	<td  width="1%">折扣率</td>
	<td  width="2%"><strong>合同赠送额</strong></td>
	<td  width="2%"><strong>增减项赠送额</strong></td>

	<td  width="2%" bgcolor="#99FFFF"><strong>合同材料费-折前</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong><font color="#0000CC">合同材料费-折后</font></strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong>合同远程费</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong>套餐订单远程费</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong>合同其它费</strong></td>


	<td  width="2%" bgcolor="#99FFFF"><strong>合同计入活动金额</strong></td>
	<td  width="2%"><strong>增减项-折前</strong></td>
	<td  width="2%"><strong><font color="#0000CC">增减项-折后</font></strong></td>

	<td  width="2%"><strong>增减项材料费-折前</strong></td>
	<td  width="2%"><strong><font color="#0000CC">增减项材料费-折后</font></strong></td>
	<td  width="2%"><strong>增减项远程费</strong></td>
	<td  width="2%"><strong>增减项其它费</strong></td>
	
	<td  width="2%"><strong>增减项计入活动金额</strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong>全部总额-折前</strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong><font color="#0000CC">全部总额-折前</font></strong></td>


	<td  width="2%" bgcolor="#FFFFCC"><strong>材料费总计-折前</strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong><font color="#0000CC">材料费总计-折后</font></strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong>远程费总计</strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong>其它费总计</strong></td>
	
	<td  width="2%" bgcolor="#FFFFCC"><strong>计入活动总额</strong></td>
	<td  width="2%">订单确认时间</td>
	<td  width="2%">录入时间</td>
	<td  width="1%">客户编号</td>
	<td  width="55%">备注</td>
</tr>

<%
	ls_sql="SELECT '',jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材'),ppbm,DECODE(jc_zcdd.sfjs,'N','未结算','C','已选择结算','Y','已结算','M','结算已审核','F','结算付款'),jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2),jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.qhtsj,jc_zcdd.wjsj,jc_zcdd.jssj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcdd.clgw,zcdlbm,gys,DECODE(jc_zcdd.sfjrht,'Y','计入','N','不计入') sfjrht,ysgcjdmc,cxhdbm,crm_khxx.sjs,c.dwmc dm,jc_zcdd.ztjjgw,jc_zcdd.xmzy,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtycf,jc_zcdd.qtf,jc_zcdd.htcxhdje,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf,jc_zcdd.zjxcxhdje,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje,jc_zcdd.ddqrsj,jc_zcdd.lrsj,jc_zcdd.khbh,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx c ,jdm_zcddzt,dm_gcjdbm ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=c.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";


	ls_sql+=" and jc_zcdd.sfjs in('F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
	ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_zcdd.gys='"+gys+"'";
	ls_sql+=" and jc_zcdd.zcdlbm='"+zcdlbm+"'";
	ls_sql+=" and jc_zcdd.ppbm='"+ppbm+"'";
	ls_sql+=" and jc_zcdd.ddlx='"+ddlx+"'";



	ls_sql+=" order by jssj";

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

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>

<BR>

<table border="1" width="270%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="1%">&nbsp;</td>
	<td  width="3%">增减项序号</td>
	<td  width="3%">处理状态</td>
	<td  width="3%">订单类型</td>
	<td  width="4%">子品牌</td>
	<td  width="3%">结算状态</td>
	<td  width="3%" bgcolor="#CC99FF">结算金额</td>
	<td  width="3%">折前增减项总额</td>
	<td  width="3%">折后增减项总额</td>
	<td  width="3%">增减项发生时间</td>
	<td  width="3%">完结时间</td>
	<td  width="3%">结算时间</td>
	<td  width="3%">客户姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="2%">驻店家居顾问</td>
	<td  width="3%">主材大类</td>
	<td  width="7%">供应商</td>
	<td  width="3%">增减项计入活动金额</td>
	<td  width="2%">结算人</td>
	<td  width="2%" bgcolor="#CC99FF">增减项折扣</td>
	<td  width="5%">打折原因</td>
	<td  width="3%">订单编号</td>
	<td  width="2%">展厅家居顾问</td>
	<td  width="2%">项目专员</td>
	<td  width="3%">确认时间</td>
	<td  width="4%">增减项原因</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="3%">合同号</td>
	<td  width="2%">客户编号</td>
	<td  width="27%">备注</td>
</tr>
<%
	ls_sql="SELECT '',jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','录入未完成','01','录入已完成','02','已确认','04','厂家已接收','03','已送货','05','部分送货','30','单项完结','99','退单'),DECODE(jc_zcdd.ddlx,'1','代销品','3','补录合同','4','有库存订单','5','标准套餐','6','家具健康套餐','7','温暖静音套餐','8','窗帘套餐','9','代购主材','A','顶配升级','B','顶配独立收费','C','选配主材','D','套餐外主材') ddlx,jc_zczjx.ppbm,DECODE(jc_zczjx.sfjs,'N','未结算','C','已选择结算','Y','已结算','M','结算已审核','F','结算付款') sfjs,jc_zczjx.zjxcbze+jc_zczjx.zjxycf+jc_zczjx.zjxqtf,jc_zczjx.zqzjxze,jc_zczjx.zjxze,jc_zczjx.zjxfssj,jc_zczjx.wjsj,jc_zczjx.jissj,crm_khxx.khxm,crm_khxx.fwdz,jc_zczjx.clgw,jc_zczjx.zcdlbm,jc_zczjx.gys,jc_zczjx.zjxcxhdje,jc_zczjx.jisr,TO_CHAR(jc_zczjx.zjxzkl) zjxzkl,jc_zczjx.dzyy,jc_zczjx.ddbh,jc_zczjx.ztjjgw,jc_zczjx.xmzy,jc_zczjx.qrsj,zczjxyymc,jc_zczjx.lrsj,dwmc lrbm,crm_khxx.hth,crm_khxx.khbh,jc_zczjx.bz";
	ls_sql+=" FROM crm_khxx,jc_zczjx,jc_zcdd,sq_dwxx,jdm_zczjxyybm";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and jc_zczjx.dwbh=sq_dwxx.dwbh and jc_zczjx.zczjxyybm=jdm_zczjxyybm.zczjxyybm(+)";
	ls_sql+=" and jc_zczjx.ddbh=jc_zcdd.ddbh";

	ls_sql+=" and jc_zczjx.sfjs in('F')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核；F：结算付款
	ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zczjx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_zczjx.gys='"+gys+"'";
	ls_sql+=" and jc_zczjx.zcdlbm='"+zcdlbm+"'";
	ls_sql+=" and jc_zczjx.ppbm='"+ppbm+"'";
	ls_sql+=" and jc_zcdd.ddlx='"+ddlx+"'";

    ls_sql+=" order by jc_zczjx.jissj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey2={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey2;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey3={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey3;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%>
</body>
</html>