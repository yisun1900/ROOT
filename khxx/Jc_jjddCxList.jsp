<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String khbh=request.getParameter("khbh");

	ls_sql="SELECT jc_jjdd.ddbh,clztmc,ysgcjdmc ,crm_khxx.khxm khxm,crm_khxx.hth,crm_khxx.fwdz,crm_khxx.sgbz,sq_bzxx.dh ,crm_khxx.sjs,sq_dwxx.dwmc dm ,DECODE(jc_jjdd.sfpsjs,'1','需要','2','否') sfpsjs,jc_jjdd.jjsjs,jc_jjdd.xmzy,jc_jjdd.clgw,jc_jjdd.ztjjgw,cxhdbm,jc_jjdd.pgcsj,jc_jjdd.pdgc,jc_jjdd.pdgcmc,jc_jjdd.jjppmc,jc_jjdd.jjgys,jc_jjdd.xcmgc,jc_jjdd.xcmgcmc,jc_jjdd.xcmppmc,jc_jjdd.xcmgys,jc_jjdd.qhtsj,jc_jjdd.sccsj,jc_jjdd.jhazrq,jc_jjdd.ksazsj,jc_jjdd.sazrq,jc_jjdd.tdsj,jc_jjdd.dj,TO_CHAR(jc_jjdd.jjzkl) jjzkl,jc_jjdd.dzyy,jc_jjdd.htze,jc_jjdd.jjje,jc_jjdd.xcmje,jc_jjdd.cpjjje,jc_jjdd.wdzje,jc_jjdd.zqjjje,jc_jjdd.zqxcmje,jc_jjdd.zqcpjjje,jc_jjdd.zjhze,jc_jjdd.jjzjje,jc_jjdd.xcmzjje,jc_jjdd.cpjjzjje,jc_jjdd.zqzjhze,jc_jjdd.zqjjzjje,jc_jjdd.zqxcmzjje,jc_jjdd.zqcpjjzjje,jc_jjdd.lrr,jc_jjdd.lrsj,jc_jjdd.khbh  ";
	ls_sql+=" FROM jc_jjdd,jdm_jjddzt,sq_dwxx,crm_khxx,sq_bzxx,dm_gcjdbm";
    ls_sql+=" where jc_jjdd.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+) ";
	ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+) ";
    ls_sql+=" and crm_khxx.sgbz=sq_bzxx.bzmc(+) and crm_khxx.sgd=sq_bzxx.sgd(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
    ls_sql+=" and jc_jjdd.khbh='"+khbh+"'";
    ls_sql+=" order by jc_jjdd.ddbh";
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
	coluParm.link="/jcjj/jjdd/ViewJc_jjdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">家具订单明细</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(520);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">订单编号</td>
	<td  width="110px">处理状态</td>
	<td  width="70px">工程进度</td>
	<td  width="110px">客户姓名</td>
	<td  width="70px">合同号</td>
	<td  width="240px">房屋地址</td>
	<td  width="80px">班长</td>
	<td  width="200px">班长电话</td>
	<td  width="70px">家装设计师</td>
	<td  width="150px">签约店面</td>
	<td  width="50px">派设计师</td>
	<td  width="70px">家居设计师</td>
	<td  width="70px">项目专员</td>
	<td  width="70px">驻店家居顾问</td>
	<td  width="70px">展厅家居顾问</td>
    <td  width="200px">促销活动</td>
	<td  width="80px">派工厂时间</td>
	<td  width="60px">家具工厂</td>
	<td  width="140px">家具工厂</td>
	<td  width="120px">家具品牌</td>
	<td  width="180px">家具供应商</td>
	<td  width="60px">型材门</td>
	<td  width="140px">型材门工厂</td>
	<td  width="120px">型材门品牌</td>
	<td  width="180px">型材门供应商</td>
	<td  width="80px">签约日期</td>
	<td  width="80px">初测日期</td>
	<td  width="80px">合同安装日期</td>
	<td  width="80px">开始安装时间</td>
	<td  width="80px">安装完成日期</td>
	<td  width="80px">确认退单日期</td>
	<td  width="80px">订金</td>
	<td  width="60px">折扣率</td>
	<td  width="350px">打折原因</td>
	<td  width="100px"><font color="#0000CC"><strong>合同总额-折后</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>家具合同金额-折后</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>型材门合同金额-折后</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>成品家具合同金额-折后</strong></font></td>
	<td  width="100px"><strong>合同总额-折前</strong></td>
	<td  width="100px"><strong>家具合同金额-折前</strong></td>
	<td  width="100px"><strong>型材门合同金额-折前</strong></td>
	<td  width="100px"><strong>成品家具合同金额-折前</strong></td>
	<td  width="100px"><font color="#0000CC"><strong>增减后总额-折后</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>家具增减后金额-折后</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>型材门增减后金额-折后</strong></font></td>
	<td  width="100px"><font color="#0000CC"><strong>成品家具增减后金额-折后</strong></font></td>
	<td  width="100px"><strong>增减后总额-折前</strong></td>
	<td  width="100px"><strong>家具增减后金额-折前</strong></td>
	<td  width="100px"><strong>型材门增减后金额-折前</strong></td>
	<td  width="100px"><strong>成品家具增减后金额-折前</strong></td>
	<td  width="60px">录入人</td>
	<td  width="80px">录入时间</td>
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