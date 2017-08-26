<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String zjxxh=request.getParameter("zjxxh");
	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','代销品','2','系统不存在品牌订单','3','补录合同','4','有库存订单','5','套餐分解订单','6','主材套餐'),DECODE(jc_zcdd.sfjrht,'Y','计入','N','不计入') sfjrht,crm_khxx.khxm,ysgcjdmc,ppbm,ppmc,gys,zcdlbm,zcxlbm,crm_khxx.hth,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,c.dwmc dm,crm_khxx.sgbz,sq_bzxx.dh,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.dzyy,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtf,jc_zcdd.htcxhdje,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf,jc_zcdd.zjxcxhdje,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje, DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'),jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),DECODE(jc_zcdd.xclbz,'1','非定制','2','定制式产品'),jc_zcdd.lrr,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.khbh,DECODE(jc_zcdd.sfjs,'N','未结算','Y','已结算'),jc_zcdd.jssj,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,sq_bzxx,dm_gcjdbm ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and jc_zcdd.khbh='"+khbh+"' and jc_zcdd.zjxxh='"+zjxxh+"' ";

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','代销品','2','系统不存在品牌订单','3','补录合同','4','有库存订单','5','套餐分解订单','6','主材套餐'),DECODE(jc_zcdd.sfjrht,'Y','计入','N','不计入') sfjrht,crm_khxx.khxm,ysgcjdmc,ppbm,ppmc,gys,zcdlbm,zcxlbm,crm_khxx.hth,crm_khxx.fwdz,cxhdbm,crm_khxx.sjs,c.dwmc dm,crm_khxx.sgbz,sq_bzxx.dh,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.jjsjs,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.dzyy,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtf,jc_zcdd.htcxhdje,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf,jc_zcdd.zjxcxhdje,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje, DECODE(jc_zcdd.jkxz,'1','未付款','2','全款','3','材料商收余款','4','预付款减出'), DECODE(jc_zcdd.jkdd,'1','材料商现场收余款','2','店面收款','3','公司财务收款'),jc_zcdd.qhtsj,jc_zcdd.ddqrsj,jc_zcdd.htshsj,jc_zcdd.jhshsj,jc_zcdd.tzshsj,jc_zcdd.sshsj,jc_zcdd.wjsj,tzry,shqk, DECODE(jc_zcdd.ddshbz,'1','不需待电','2','待电未通知','3','待电已通知'),DECODE(jc_zcdd.xclbz,'1','非定制','2','定制式产品'),jc_zcdd.lrr,jc_zcdd.lrsj,a.dwmc lrdw,jc_zcdd.khbh,DECODE(jc_zcdd.sfjs,'N','未结算','Y','已结算'),jc_zcdd.jssj,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx a,sq_dwxx c ,jdm_zcddzt,sq_bzxx,dm_gcjdbm ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and jc_zcdd.dwbh=a.dwbh(+) and crm_khxx.dwbh=c.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
	ls_sql+=" and jc_zcdd.khbh='"+khbh+"'  ";

	ls_sql+=" and jc_zcdd.clzt='99' and jc_zcdd.tdsm='套餐增减项退单"+zjxxh+"'";
	
	
	ls_sql+=" order by ddbh";
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","/jcjj/dygl/DyZcHt.jsp");
	pageObj.setEditStr("打印");
	pageObj.setPageRow(1000);


//	out.println(ls_sql);

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"合并打印订单"};//按钮的显示名称
	String[] buttonLink={"/jcjj/dygl/zcddhbdy.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
    
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<title>查询数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">分解订单</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(800);
%>

<tr bgcolor="#CCCCCC"  align="center">
    <td  width="55px">&nbsp;</td>
   	<td  width="60px">订单编号</td>
	<td  width="80px">处理状态</td>
	<td  width="80px">订单类型</td>
	<td  width="55px">是否计入家装合同</td>
	<td  width="80px">客户姓名</td>
	<td  width="110px">工程进度</td>
	<td  width="160px">子品牌</td>
	<td  width="120px">品牌</td>
	<td  width="220px">供应商</td>
	<td  width="120px">主材大类</td>
	<td  width="120px">主材小类</td>
	<td  width="70px">合同号</td>
	<td  width="390px">房屋地址</td>
	<td  width="420px">参加促销活动</td>
	<td  width="60px">家装设计师</td>
	<td  width="120px">签约店面</td>
	<td  width="60px">施工班长</td>
	<td  width="170px">班长电话</td>
	<td  width="60px">驻店家居顾问</td>
	<td  width="60px">展厅家居顾问</td>
	<td  width="60px">项目专员</td>
	<td  width="60px">家居设计师</td>
	<td  width="50px">折扣率</td>
	<td  width="300px">打折原因</td>
	<td  width="90px"><strong>合同赠送额</strong></td>
	<td  width="90px"><strong>增减项赠送额</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>合同额-折前</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong><font color="#0000CC">合同额-折后</font></strong></td>

	<td  width="90px" bgcolor="#99FFFF"><strong>合同材料费-折前</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong><font color="#0000CC">合同材料费-折后</font></strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>合同远程费</strong></td>
	<td  width="90px" bgcolor="#99FFFF"><strong>合同其它费</strong></td>


	<td  width="90px" bgcolor="#99FFFF"><strong>合同计入活动金额</strong></td>
	<td  width="90px"><strong>增减项-折前</strong></td>
	<td  width="90px"><strong><font color="#0000CC">增减项-折后</font></strong></td>

	<td  width="90px"><strong>增减项材料费-折前</strong></td>
	<td  width="90px"><strong><font color="#0000CC">增减项材料费-折后</font></strong></td>
	<td  width="90px"><strong>增减项远程费</strong></td>
	<td  width="90px"><strong>增减项其它费</strong></td>
	
	<td  width="90px"><strong>增减项计入活动金额</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>全部总额-折前</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong><font color="#0000CC">全部总额-折前</font></strong></td>


	<td  width="90px" bgcolor="#FFFFCC"><strong>材料费总计-折前</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong><font color="#0000CC">材料费总计-折后</font></strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>远程费总计</strong></td>
	<td  width="90px" bgcolor="#FFFFCC"><strong>其它费总计</strong></td>
	
	<td  width="90px" bgcolor="#FFFFCC"><strong>计入活动总额</strong></td>
	<td  width="80px">客户交款性质</td>
	<td  width="110px">交款地点</td>
	<td  width="65px">签合同时间</td>
	<td  width="65px">订单确认时间</td>
	<td  width="65px">合同送货时间</td>
	<td  width="65px">计划送货时间</td>
	<td  width="65px">发送货通知时间</td>
	<td  width="65px">实送货时间</td>
	<td  width="65px">完结时间</td>
	<td  width="80px">通知人员</td>
	<td  width="320px">送货情况</td>
	<td  width="80px">等待送货通知</td>
	<td  width="80px">产品类型</td>
	<td  width="45px">录入人</td>
	<td  width="65px">录入时间</td>
	<td  width="110px">录入部门</td>
	<td  width="50px">客户编号</td>
	<td  width="50px">是否已结算</td>
	<td  width="65px">结算时间</td>
	<td  width="310px">备注</td>
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