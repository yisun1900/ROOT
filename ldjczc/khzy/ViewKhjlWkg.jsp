<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String fgsbh=request.getParameter("fgsbh");
	String yhmc=cf.GB2Uni(cf.getParameter(request,"yhmc"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">待开工地量</font></b>
</CENTER>
<table border="1" width="410%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">设计师</td>
	<td  width="2%">合同号</td>
	<td  width="2%">姓名</td>
	<td  width="5%">房屋地址</td>
	<td  width="2%">工程进度</td>
	<td  width="2%">报价级别</td>
	<td  width="2%">退单标志</td>
	<td  width="2%">签单记入业绩时间</td>
	<td  width="2%">退单记入业绩时间</td>
	  <td  width="2%" >返券金额</td>
	<td  width="3%">折前合同总额</td>
	<td  width="1%">折扣率</td>
	<td  width="3%">折后合同总额</td>
	<td  width="2%">增减项</td>
	<td  width="3%">折前工程费</td>
	<td  width="3%">折后工程费</td>
	<td  width="2%">税率</td>
	<td  width="2%">折前税金</td>
	<td  width="2%">税金</td>
	<td  width="2%">管理费百分比</td>
	<td  width="2%">折前管理费</td>
	<td  width="2%">折后管理费</td>
	<td  width="2%">折前记入业绩其它费</td>
	<td  width="2%">折后记入业绩其它费</td>
	<td  width="2%">折前不记业绩其它费</td>
	<td  width="2%">折后不记业绩其它费</td>
	<td  width="2%">折前设计费</td>
	<td  width="2%">折后设计费</td>


	<td  width="3%">财务实收款</td>
	<td  width="2%">首次收装款时间</td>
	<td  width="2%">财务首次审核时间</td>


	<td  width="2%">返券总金额</td>
	<td  width="2%">公司承担返券额</td>
	<td  width="1%">施工队</td>
	<td  width="1%">质检员</td>
	<td  width="1%">客户经理</td>
	<td  width="1%">业务员</td>
	<td  width="1%">材料员</td>
	<td  width="1%">店长</td>
	<td  width="1%">文员</td>
	<td  width="1%">面积</td>
	<td  width="8%">促销活动</td>
	<td  width="3%">签约店面</td>
	<td  width="2%">签约日期</td>
	<td  width="2%">退单时间</td>
	<td  width="43%">领取礼品</td>
</tr>
<%
	ls_sql="SELECT '',crm_khxx.sjs,crm_khxx.hth,crm_khxx.khxm,crm_khxx.fwdz,ysgcjdmc,bjjbmc,DECODE(crm_khxx.zt,'2','签单','3','退单客户','5','设计'),crm_khxx.yjjzsj,crm_khxx.tdyjjzsj,(select sum(fqje) from cw_khfqdj  where cw_khfqdj.scbz='N' and cw_khfqdj.khbh=crm_khxx.khbh),crm_khxx.wdzgce,TO_CHAR(crm_khxx.zkl),crm_khxx.qye,crm_khxx.zhljzjx,crm_khxx.zqgczjf,crm_khxx.zhgczjf,suijinbfb||'%',zqsuijin,suijin,glfbfb||'%',zqguanlif,guanlif,zqqtsf,zhqtsf,zqwjrqyexm,zhwjrqyexm,NVL(crm_khxx.zqsjf,0)+NVL(crm_zxkhxx.sjhtje,0),NVL(crm_khxx.sjf,0)+NVL(crm_zxkhxx.sjhtje,0) ,cwsfke,TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),crm_khxx.fjje,crm_khxx.gsfje,sgdmc,crm_khxx.zjxm,crm_khxx.khjl,crm_khxx.ywy,crm_khxx.clgw,crm_khxx.dianz,crm_khxx.weny,TO_CHAR(crm_khxx.fwmj),crm_khxx.cxhdbm,a.dwmc qydm,TO_CHAR(crm_khxx.qyrq,'YYYY-MM-DD'),crm_khxx.tdsj,(select lpmc from yx_lqlpdj where yx_lqlpdj.khbh=crm_khxx.khbh and rownum<2) ";
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx a,sq_sgd,bdm_bjjbbm,dm_gcjdbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.khjl='"+yhmc+"' and crm_khxx.fgsbh='"+fgsbh+"'";
		ls_sql+=" and crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户；6：散客
		ls_sql+=" and crm_khxx.gcjdbm in('1')";//1：未开工；2：工程开工；6：隐蔽工程完成；3：中期验收；4：工程完工；5：工程完结；7：合同异常终止



	ls_sql+=" order by sjs,qyrq";

// 	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
	pageObj.printFoot();
%>
</table>

</body>
</html>