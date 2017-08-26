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

	ls_sql="SELECT sq_dwxx.dwbh,dwmc,ssdqmc,dqmc,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssdw) ssdwmc,DECODE(dwlx,'A0','总部','A1','总部部门','F0','分公司','F1','分公司部门','F2','店面','F3','部门小组','J0','加盟商') as dwlx,dwflmc,jryjbfb||'%',sq_dwxx.bianma,sq_dwxx.cwdm,sq_dwxx.hthqz,DECODE(sfjms,'Y','加盟商','N','否'),DECODE(jcppbz,'Y','取订单','N','取数据字典'),DECODE(zcmmbz,'Y','取订单','N','取数据字典','M','可空'),DECODE(cgjjbz,'Y','取订单','N','取数据字典','M','可空'),DECODE(zxkhlrjc,'Y','启用','N','不启用'),zxkhlrts,DECODE(qdkhbljc,'Y','启用','N','不启用'),qdkhblts,DECODE(dzbjjc,'1','根据[折扣率]算[签约额]','2','根据[签约额]算[折扣率]','3','全部人工录入','4','签约额、折扣自动取','5','签约额自动取，录入折扣'),DECODE(jcddblxs,2,'2位小数',1,'1位小数',0,'保留个位',-1,'保留十位',-2,'保留百位',-3,'保留千位'),hfsjzdsz,DECODE(sq_dwxx.xmzyglbz,'Y','启用','N','不启用'),DECODE(sq_dwxx.jjgwglbz,'Y','启用','N','不启用'),yjjzrq,DECODE(sq_dwxx.cxbz,'Y','撤销','N',''),sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.bz";
	ls_sql+=" FROM sq_dwxx,dm_dqbm,sq_ssdqbm,dm_dwflbm ";
    ls_sql+=" where sq_dwxx.dqbm=dm_dqbm.dqbm(+) and sq_dwxx.ssdqbm=sq_ssdqbm.ssdqbm(+) and sq_dwxx.dwflbm=dm_dwflbm.dwflbm(+)";
    ls_sql+=" and sq_dwxx.dwlx in('A0','F0') and sq_dwxx.cxbz='N'";

	ls_sql+=" order by sq_dwxx.dqbm,sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.ssdw,sq_dwxx.dwlx,dwbh";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","PlOneFgsSq.jsp");
	pageObj.setPageRow(500);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dwbh","dwmc","dwfzr","dwdh","dwcz","email"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("分公司授权");
	pageObj.setEditBolt("");
//设置按钮参数
	String[] buttonName={"多公司批量授权"};//按钮的显示名称
	String[] buttonLink={"PlFgsSq.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"dwbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewSq_dwxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("dwbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">按分公司批量授权</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="2%">单位编号</td>
	<td  width="5%">单位名称</td>
	<td  width="3%">所属大区</td>
	<td  width="3%">所属地区</td>
	<td  width="5%">上级单位</td>
	<td  width="4%">单位类型</td>
	<td  width="4%">单位分类</td>
	<td  width="3%">计入业绩收款比例</td>
	<td  width="3%">编码</td>
	<td  width="3%">财务代码</td>
	<td  width="3%">合同号前缀</td>
	<td  width="2%">是否加盟商</td>
	<td  width="3%">投诉报修供应商检查</td>
	<td  width="3%">主材木门收款检查</td>
	<td  width="3%">橱柜家具收款检查</td>
	<td  width="3%">启用咨询客户录入检查</td>
	<td  width="3%">咨询客户提前录入天数</td>
	<td  width="3%">启用签单客户补录检查</td>
	<td  width="3%">签单客户补录允许天数</td>
	<td  width="6%">启用电子报价检查</td>
	<td  width="3%">集成订单保留小数</td>
	<td  width="3%">启用回访时间自动设置</td>
	<td  width="3%">集成订单对项目专员过滤</td>
	<td  width="3%">集成订单对家居顾问过滤</td>
	<td  width="3%">计算业绩的截至日期</td>
	<td  width="2%">撤销标志</td>
	<td  width="3%">开店时间</td>
	<td  width="3%">关店时间</td>
	<td  width="7%">备注</td>
</tr>
<%
	pageObj.displayDate();
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