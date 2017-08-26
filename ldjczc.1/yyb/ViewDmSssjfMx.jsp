<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',crm_zxkhxx.sjs,crm_zxkhxx.khbh,khxm,fwdz,crm_zxkhxx.khjl,crm_zxkhxx.hth,TO_CHAR(sjhtje) sjhtje,qsjhtsj,TO_CHAR(fwmj),DECODE(sjfbz,'N','未交设计费','Y','已交费','T','退设计费'),cw_khfkjl.fkje,cw_khfkjl.sjsj,crm_zxkhxx.lrsj,sczbjsj,zjsmsj,smcs";
	ls_sql+=" FROM crm_zxkhxx,cw_khfkjl ";
	ls_sql+=" where crm_zxkhxx.khbh=cw_khfkjl.khbh ";
	ls_sql+=" and cw_khfkjl.dwbh='"+dwbh+"' and cw_khfkjl.fklxbm='53' and cw_khfkjl.scbz='N'";
	ls_sql+=" and cw_khfkjl.fkje>0 and cw_khfkjl.zffs!='31'";//11:现金；12：支票；13：存折；14：银行卡；15：银行转帐；16：现金券；31：转出；99：其它
	ls_sql+=" and cw_khfkjl.sjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by crm_zxkhxx.sjs,cw_khfkjl.sjsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("khbh","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("fwdz","1");//列参数对象加入Hash表
	spanColHash.put("khjl","1");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("sjhtje","1");//列参数对象加入Hash表
	spanColHash.put("qsjhtsj","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">实收设计费客户（<%=dwmc%>）
  <BR>(实收设计费时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">设计师</td>
	<td  width="5%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="14%">房屋地址</td>
	<td  width="4%">客户经理</td>
	<td  width="6%">设计合同号</td>
	<td  width="6%">设计合同金额</td>
	<td  width="6%">签设计合同时间</td>
	<td  width="5%">房屋面积</td>
	<td  width="6%">已收设计费</td>
	<td  width="6%">实收设计费金额</td>
	<td  width="6%">实收设计费时间</td>
	<td  width="6%">入店时间</td>
	<td  width="6%">首次做报价时间</td>
	<td  width="6%">最近上门时间</td>
	<td  width="4%">上门次数</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>