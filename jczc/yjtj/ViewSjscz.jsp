<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";

	String dwbh=request.getParameter("dwbh");
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
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
  <B><font size="3">设计师结转（退单）业绩明细（<%=sjs%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="1%" rowspan="2">&nbsp;</td>
  <td width="2%" rowspan="2">设计师</td>
  <td width="3%" rowspan="2">合同号</td>
  <td width="3%" rowspan="2">姓名</td>
  <td width="2%" rowspan="2">家装标志</td>
  <td width="2%" rowspan="2">客户类型</td>
  <td width="3%" rowspan="2">退单时间</td>
  <td width="3%" rowspan="2">签约日期</td>
  <td colspan="2">折扣</td>
  <td colspan="3" bgcolor="#FFFF99">工程费</td>
  <td colspan="3" bgcolor="#99FFFF">管理费</td>
  <td colspan="2" bgcolor="#FFFFCC">税金</td>
  <td colspan="2" bgcolor="#FFFF99">业绩（工程费+管理费+税金）</td>
  <td width="2%" rowspan="2">平米均价</td>
  <td colspan="3" bgcolor="#FFFFCC">增减项（折后）</td>
  <td width="5%" rowspan="2" bgcolor="#FFFF99">增减后总额 </td>
  <td width="4%" rowspan="2">设计费</td>
  <td width="5%" rowspan="2">财务家装实收款额</td>
  <td width="2%" rowspan="2" bgcolor="#FFFF99">实收款比例</td>
  <td width="2%" rowspan="2">施工队</td>
  <td width="2%" rowspan="2">质检员</td>
  <td width="8%" rowspan="2">促销活动</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">合同</td>
	<td  width="2%">增减项</td>

	<td  width="5%" bgcolor="#FFFF99">工程原报价</td>
	<td  width="5%" bgcolor="#FFFF99">工程签约额</td>
	<td  width="3%" bgcolor="#FFFF99">减免额</td>

	<td  width="3%" bgcolor="#99FFFF">折前</td>
	<td  width="3%" bgcolor="#99FFFF">折后</td>
	<td  width="3%" bgcolor="#99FFFF">减免额</td>

	<td  width="3%" bgcolor="#FFFFCC">税金</td>
	<td  width="3%" bgcolor="#FFFFCC">减免额</td>


	<td  width="5%" bgcolor="#FFFF99">折前业绩</td>
	<td  width="5%" bgcolor="#FFFF99">折后业绩</td>

	<td  width="3%" bgcolor="#FFFFCC">工程增减</td>
	<td  width="3%" bgcolor="#FFFFCC">管理费增减</td>
	<td  width="3%" bgcolor="#FFFFCC">税金增减</td>
  </tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,DECODE(cw_qmjzmx.jzbz,'1','家装','2','工装'),DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),tdsj,qyrq ";
	ls_sql+=" ,TO_CHAR(zkl),TO_CHAR(zjxzkl),wdzgce,qye,NVL(cdzwjmje,0),NVL(zqguanlif,0),NVL(guanlif,0),NVL(glfjmje,0),NVL(suijin,0),NVL(sjjmje,0) ";
	ls_sql+=" ,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0),qye+NVL(guanlif,0)+NVL(suijin,0)";
	ls_sql+=" ,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,NVL(zhzjxje,0),NVL(zjxguanlif,0),NVL(zjxsuijin,0) ";
	ls_sql+=" ,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,sjf,cwsfke,DECODE((qye+NVL(guanlif,0)+NVL(suijin,0)),0,'',ROUND(cwsfke*100/(qye+NVL(guanlif,0)+NVL(suijin,0)),1)||'%' ),sgdmc sgd,zjxm ,cxhdbm ";

	ls_sql+=" FROM cw_qmjzmx,sq_sgd";
    ls_sql+=" where cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_qmjzmx.dwbh='"+dwbh+"' and cw_qmjzmx.sjs='"+sjs+"'";
	ls_sql+=" and cw_qmjzmx.zt in ('3')";
	ls_sql+=wheresql;
	ls_sql+=" order by sjs,qyrq";

//	out.println(ls_sql);

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
	coluParmHash.put("hth",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>

<CENTER >
  <B><font size="3">设计师结转（签单）业绩明细（<%=sjs%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="1%" rowspan="2">&nbsp;</td>
  <td width="2%" rowspan="2">设计师</td>
  <td width="3%" rowspan="2">合同号</td>
  <td width="3%" rowspan="2">姓名</td>
  <td width="2%" rowspan="2">家装标志</td>
  <td width="2%" rowspan="2">客户类型</td>
  <td width="3%" rowspan="2">退单时间</td>
  <td width="3%" rowspan="2">签约日期</td>
  <td colspan="2">折扣</td>
  <td colspan="3" bgcolor="#FFFF99">工程费</td>
  <td colspan="3" bgcolor="#99FFFF">管理费</td>
  <td colspan="2" bgcolor="#FFFFCC">税金</td>
  <td colspan="2" bgcolor="#FFFF99">业绩（工程费+管理费+税金）</td>
  <td width="2%" rowspan="2">平米均价</td>
  <td colspan="3" bgcolor="#FFFFCC">增减项（折后）</td>
  <td width="5%" rowspan="2" bgcolor="#FFFF99">增减后总额 </td>
  <td width="4%" rowspan="2">设计费</td>
  <td width="5%" rowspan="2">财务家装实收款额</td>
  <td width="2%" rowspan="2" bgcolor="#FFFF99">实收款比例</td>
  <td width="2%" rowspan="2">施工队</td>
  <td width="2%" rowspan="2">质检员</td>
  <td width="8%" rowspan="2">促销活动</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">合同</td>
	<td  width="2%">增减项</td>

	<td  width="5%" bgcolor="#FFFF99">工程原报价</td>
	<td  width="5%" bgcolor="#FFFF99">工程签约额</td>
	<td  width="3%" bgcolor="#FFFF99">减免额</td>

	<td  width="3%" bgcolor="#99FFFF">折前</td>
	<td  width="3%" bgcolor="#99FFFF">折后</td>
	<td  width="3%" bgcolor="#99FFFF">减免额</td>

	<td  width="3%" bgcolor="#FFFFCC">税金</td>
	<td  width="3%" bgcolor="#FFFFCC">减免额</td>


	<td  width="5%" bgcolor="#FFFF99">折前业绩</td>
	<td  width="5%" bgcolor="#FFFF99">折后业绩</td>

	<td  width="3%" bgcolor="#FFFFCC">工程增减</td>
	<td  width="3%" bgcolor="#FFFFCC">管理费增减</td>
	<td  width="3%" bgcolor="#FFFFCC">税金增减</td>
  </tr>
<%
	ls_sql="SELECT '',sjs,hth,khxm,DECODE(cw_qmjzmx.jzbz,'1','家装','2','工装'),DECODE(zt,'2','家装','4','集成','5','设计','3','<font color=\"#FF00FF\">已退单</font>'),tdsj,qyrq ";
	ls_sql+=" ,TO_CHAR(zkl),TO_CHAR(zjxzkl),wdzgce,qye,NVL(cdzwjmje,0),NVL(zqguanlif,0),NVL(guanlif,0),NVL(glfjmje,0),NVL(suijin,0),NVL(sjjmje,0) ";
	ls_sql+=" ,wdzgce+NVL(zqguanlif,0)+NVL(suijin,0),qye+NVL(guanlif,0)+NVL(suijin,0)";
	ls_sql+=" ,TO_CHAR(round(DECODE(fwmj,0,0,qye/fwmj))) pmjj,NVL(zhzjxje,0),NVL(zjxguanlif,0),NVL(zjxsuijin,0) ";
	ls_sql+=" ,NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ";
	ls_sql+=" ,sjf,cwsfke,DECODE((qye+NVL(guanlif,0)+NVL(suijin,0)),0,'',ROUND(cwsfke*100/(qye+NVL(guanlif,0)+NVL(suijin,0)),1)||'%' ),sgdmc sgd,zjxm ,cxhdbm ";

	ls_sql+=" FROM cw_qmjzmx,sq_sgd";
    ls_sql+=" where cw_qmjzmx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and cw_qmjzmx.dwbh='"+dwbh+"' and cw_qmjzmx.sjs='"+sjs+"'";
	ls_sql+=" and cw_qmjzmx.zt in ('2')";
	ls_sql+=wheresql;
	ls_sql+=" order by sjs,qyrq";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置列超级连接
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
