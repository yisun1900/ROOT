<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";

	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	
	String jzbz=request.getParameter("jzbz");
	if (!jzbz.equals("0"))
	{
		wheresql+=" and  cw_qmjzmx.jzbz='"+jzbz+"'";
	}

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	wheresql+=" and jzrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and jzrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";


%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">退单明细（<%=dwmc%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">设计师</td>
	<td  width="6%">合同号</td>
	<td  width="5%">姓名</td>
	<td  width="4%">家装标志</td>
	<td  width="4%">客户类型</td>
	<td  width="6%">退单时间</td>
	<td  width="6%">签约日期</td>
	<td  width="6%">促销活动</td>
	<td  width="6%">工程原报价</td>
	<td  width="4%">折扣率</td>
	<td  width="6%">工程签约额</td>
	<td  width="5%">平米均价</td>
	<td  width="5%">增减项</td>
	<td  width="7%">增减后总额 </td>
	<td  width="5%">设计费</td>
	<td  width="6%">财务家装实收款额</td>
	<td  width="4%">实收款比例</td>
	<td  width="4%">施工队</td>
	<td  width="4%">质检员</td>

</tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,DECODE(cw_qmjzmx.jzbz,'1','家装','2','工装'),DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),tdsj,qyrq,cxhdbm,wdzgce,TO_CHAR(zkl),qye,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,zhzjxje,NVL(zhzjxje,0)+qye,sjf,cwsfke,DECODE(qye,0,'',ROUND(cwsfke*100/qye,1)||'%' ),sgdmc sgd,zjxm";
	ls_sql+=" FROM cw_qmjzmx,sq_sgd";
    ls_sql+=" where cw_qmjzmx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and cw_qmjzmx.zt in ('3')";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=wheresql;
	ls_sql+=" order by sjs,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>

<CENTER >
  <B><font size="3">签单明细（<%=dwmc%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="130%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="5%">设计师</td>
	<td  width="6%">合同号</td>
	<td  width="5%">姓名</td>
	<td  width="4%">家装标志</td>
	<td  width="4%">客户类型</td>
	<td  width="6%">退单时间</td>
	<td  width="6%">签约日期</td>
	<td  width="6%">促销活动</td>
	<td  width="6%">工程原报价</td>
	<td  width="4%">折扣率</td>
	<td  width="6%">工程签约额</td>
	<td  width="5%">平米均价</td>
	<td  width="5%">增减项</td>
	<td  width="7%">增减后总额 </td>
	<td  width="5%">设计费</td>
	<td  width="6%">财务家装实收款额</td>
	<td  width="4%">实收款比例</td>
	<td  width="4%">施工队</td>
	<td  width="4%">质检员</td>

</tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,DECODE(cw_qmjzmx.jzbz,'1','家装','2','工装'),DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),tdsj,qyrq,cxhdbm,wdzgce,TO_CHAR(zkl),qye,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,zhzjxje,NVL(zhzjxje,0)+qye,sjf,cwsfke,DECODE(qye,0,'',ROUND(cwsfke*100/qye,1)||'%' ),sgdmc sgd,zjxm";
	ls_sql+=" FROM cw_qmjzmx,sq_sgd";
    ls_sql+=" where cw_qmjzmx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and cw_qmjzmx.zt in ('2')";
    ls_sql+=" and cw_qmjzmx.fgsbh='"+dwbh+"'";
	ls_sql+=wheresql;
	ls_sql+=" order by sjs,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置显示合并列
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
//设置列超级连接
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>

</body>
</html>
