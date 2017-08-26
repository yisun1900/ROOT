<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jc_cgdd.ddbh,clztmc,ysgcjdmc,crm_khxx.khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh,crm_khxx.sjs,DECODE(jc_cgdd.sfpsjs,'1','是','2','否') sfpsjs, jc_cgdd.cgsjs,sq_dwxx.dwmc dm,cxhdbm,jc_cgdd.xmzy,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.sccsj,jc_cgdd.sfcsj,jc_cgdd.qhtsj,jc_cgdd.jhazrq,jc_cgdd.ksazsj,jc_cgdd.sazrq,jc_cgdd.tdsj,jc_cgdd.pgcsj,jc_cgdd.pdgc,jc_cgdd.pdgcmc,jc_cgdd.gys,jc_cgdd.ppmc,sdks,xtbc,cghs,tmpp,tmhs,blcz,jiaolian,jc_cgdd.dj,TO_CHAR(jc_cgdd.cgzkl) cgzkl,TO_CHAR(jc_cgdd.tmzkl) tmzkl,TO_CHAR(jc_cgdd.wjzkl) wjzkl,TO_CHAR(jc_cgdd.dqzkl) dqzkl,jc_cgdd.dzyy,jc_cgdd.htze,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.wdzje,jc_cgdd.zqgtbfje,jc_cgdd.zqtmbfje,jc_cgdd.zqwjhtze,jc_cgdd.zqdqhtze   ,jc_cgdd.zjhze,jc_cgdd.gtzjje,jc_cgdd.tmzjje,jc_cgdd.wjzjje,jc_cgdd.dqzjje ,jc_cgdd.zqzjhze,jc_cgdd.zqgtzjje,jc_cgdd.zqtmzjje,jc_cgdd.zqwjzjje,jc_cgdd.zqdqzjje  ,jc_cgdd.lrr,jc_cgdd.lrsj,jc_cgdd.khbh ";
	ls_sql+=" FROM jc_cgdd,jdm_cgddzt,sq_dwxx,crm_khxx,dm_gcjdbm,sq_bzxx";
	ls_sql+=" where jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+) and crm_khxx.dwbh=sq_dwxx.dwbh(+)  ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
	ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
    ls_sql+=" and jc_cgdd.khbh='"+khbh+"'";
    ls_sql+=" order by jc_cgdd.ddbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数

//设置主键
	String[] keyName={"ddbh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/cgdd/ViewJc_cgdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">橱柜订单明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(660);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">订单编号</td>
	<td  width="120px">处理状态</td>
	<td  width="90px">工程进度</td>
	<td  width="100px">客户姓名</td>
	<td  width="70px">合同号</td>
	<td  width="310px">房屋地址</td>
	<td  width="120px">班长</td>
	<td  width="290px">班长电话</td>
	<td  width="80px">家装设计师</td>
	<td  width="70px">需派设计师 </td>
	<td  width="70px">家居设计师</td>
	<td  width="160px">签约店面</td>
    <td  width="290px">促销活动</td>
	<td  width="70px">项目专员</td>
	<td  width="70px">驻店家居顾问</td>
	<td  width="70px">展厅家居顾问</td>
	<td  width="90px">初测日期</td>
	<td  width="90px">复测日期</td>
	<td  width="90px">签约日期</td>
	<td  width="90px">合同安装日期</td>
	<td  width="90px">安装开始日期</td>
	<td  width="90px">安装完成日期</td>
	<td  width="90px">确认退单日期</td>
	<td  width="90px">派工厂时间</td>
    <td  width="70px">所派工厂编号</td>
    <td  width="220px">工厂名称</td>
    <td  width="220px">供应商</td>
    <td  width="220px">品牌</td>
    <td  width="180px">橱柜款式</td>
    <td  width="180px">箱体板材</td>
    <td  width="180px">橱柜花色</td>
    <td  width="180px">台面品牌</td>
    <td  width="180px">台面花色</td>
    <td  width="180px">玻璃材质</td>
    <td  width="180px">铰链</td>
	<td  width="80px">收取定金</td>
	<td  width="80px">柜体折扣率</td>
	<td  width="80px">台面折扣率</td>
	<td  width="80px">五金折扣率</td>
	<td  width="80px">电器折扣率</td>
	<td  width="400px">打折原因</td>
	<td  width="120px"><font color="#000099"><strong>合同总额</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>柜体合同金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>台面合同金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>五金合同金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>电器合同金额-折后</strong></font></td>
	<td  width="120px"><strong>未打折合同额</strong></td>
	<td  width="120px"><strong>柜体合同金额-折前</strong></td>
	<td  width="120px"><strong>台面合同金额-折前</strong></td>
	<td  width="120px"><strong>五金合同金额-折前</strong></td>
	<td  width="120px"><strong>电器合同金额-折前</strong></td>
	<td  width="120px"><font color="#000099"><strong>增减后总额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>柜体增减后金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>台面增减后金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>五金增减后金额-折后</strong></font></td>
	<td  width="120px"><font color="#000099"><strong>电器增减后金额-折后</strong></font></td>
	<td  width="120px"><strong>增减后总额-折前</strong></td>
	<td  width="120px"><strong>柜体增减后金额-折前</strong></td>
	<td  width="120px"><strong>台面增减后金额-折前</strong></td>
	<td  width="120px"><strong>五金增减后金额-折前</strong></td>
	<td  width="120px"><strong>电器增减后金额-折前</strong></td>
	<td  width="70px">录入人</td>
	<td  width="90px">录入时间</td>
	<td  width="60px">客户编号</td>
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