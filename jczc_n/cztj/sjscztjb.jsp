<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String wheresql1="";
	String ordersql=null;

	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	
	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String px=request.getParameter("px");
	String sx=request.getParameter("sx");
	String jzbz=request.getParameter("jzbz");
	String sjs=cf.GB2Uni(request.getParameter("sjs"));
	if (px!=null && !(px.equals("")))
	{
		if (sx!=null && sx.equals("0"))
		{
		ordersql=" order by "+px+" desc ";
		}
		else
		{ordersql=" order by "+px+" ";}
	}
	else
	{ordersql=" order by 2 ";}
//	out.print(ordersql);




	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	if (!(sjs.equals("")))	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";

	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}

//	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+fgsbh+"'");

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	wheresql1+=" and crm_tddj.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql1+=" and crm_tddj.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

//out.println(wheresql);
	ls_sql="SELECT '','<A HREF=\"ViewSjssjf.jsp?dwbh='||crm_khxx.dwbh||'&sjfw="+sjfw+"&sjfw2="+sjfw2+"&sjs='||crm_zxkhxx.sjs||'&jzbz="+jzbz+"\" target=\"_blank\">'||crm_zxkhxx.sjs||'</a>',dwmc,count(*),sum(crm_zxkhxx.dzbjze),ROUND(sum(crm_khxx.zkl)/count(*),2),ROUND(sum(crm_khxx.zjxzkl)/count(*),2),sum(wdzgce+NVL(zqguanlif,0)+NVL(suijin,0)),sum(qye+NVL(guanlif,0)+NVL(suijin,0)),sum(crm_khxx.wdzgce),sum(crm_khxx.qye),sum(NVL(cdzwjmje,0)),sum(NVL(zqguanlif,0)),sum(NVL(guanlif,0)),sum(NVL(glfjmje,0)),sum(NVL(suijin,0)),sum(NVL(sjjmje,0)),ROUND(sum(round(DECODE(crm_khxx.fwmj,0,0,qye/crm_khxx.fwmj)))/count(*),2),sum(NVL(zhzjxje,0)),sum(NVL(zjxguanlif,0)),sum(NVL(zjxsuijin,0)),sum(NVL(zhzjxje,0)+NVL(zjxguanlif,0)+NVL(zjxsuijin,0)+qye+NVL(guanlif,0)+NVL(suijin,0) ),sum(crm_khxx.sjf),sum(cwsfke) ";

	ls_sql+=" FROM crm_khxx,sq_sgd,crm_zxkhxx,sq_dwxx";
    ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh=crm_zxkhxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
//    ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and crm_khxx.zt in ('2')";
	ls_sql+=wheresql;
	ls_sql+=" group by crm_khxx.dwbh,dwmc,'<A HREF=\"ViewSjssjf.jsp?dwbh='||crm_khxx.dwbh||'&sjfw="+sjfw+"&sjfw2="+sjfw2+"&sjs='||crm_zxkhxx.sjs||'&jzbz="+jzbz+"\" target=\"_blank\">'||crm_zxkhxx.sjs||'</a>'";
	ls_sql+=ordersql;

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

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
	coluParmHash.put("fwdz",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">店面签约明细（注意：不包含退单）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="250%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
  <td width="1%" rowspan="2">&nbsp;</td>
  <td width="2%" rowspan="2">设计师</td>
  <td width="4%" rowspan="2">店面</td>
  <td width="2%" rowspan="2">签约数</td>
  <td width="4%" rowspan="2">电子报价总额</td>
  <td colspan="2">折扣</td>
  <td colspan="2" bgcolor="#99FFFF">业绩（工程费+管理费+税金）</td>
  <td colspan="3" bgcolor="#FFFF99">工程费</td>
  <td colspan="3" bgcolor="#99FFFF">管理费</td>
  <td colspan="2" bgcolor="#FFFFCC">税金</td>
  <td width="2%" rowspan="2">平米均价</td>
  <td colspan="3" bgcolor="#FFFFCC">增减项（折后）</td>
  <td width="5%" rowspan="2" bgcolor="#FFFF99">增减后总额 </td>
  <td width="4%" rowspan="2">设计费</td>
  <td width="4%" rowspan="2">财务家装实收款额</td>
  </tr>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">合同</td>
	<td  width="2%">增减项</td>
	<td  width="4%" bgcolor="#99FFFF">折前业绩</td>
	<td  width="4%" bgcolor="#99FFFF">折后业绩</td>

	<td  width="4%" bgcolor="#FFFF99">工程原报价</td>
	<td  width="4%" bgcolor="#FFFF99">工程签约额</td>
	<td  width="3%" bgcolor="#FFFF99">减免额</td>

	<td  width="3%" bgcolor="#99FFFF">折前</td>
	<td  width="3%" bgcolor="#99FFFF">折后</td>
	<td  width="3%" bgcolor="#99FFFF">减免额</td>

	<td  width="3%" bgcolor="#FFFFCC">税金</td>
	<td  width="3%" bgcolor="#FFFFCC">减免额</td>



	<td  width="3%" bgcolor="#FFFFCC">工程增减</td>
	<td  width="3%" bgcolor="#FFFFCC">管理费增减</td>
	<td  width="3%" bgcolor="#FFFFCC">税金增减</td>
  </tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate(true);
	pageObj.printSum();
%> 
</table>

</body>
</html>

