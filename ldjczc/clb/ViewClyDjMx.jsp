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
	String clgw=cf.GB2Uni(cf.getParameter(request,"clgw"));
	

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");



	ls_sql="SELECT '',crm_zxkhxx.khbh,khxm,fwdz,crm_zxkhxx.sjs,crm_zxkhxx.clgw,crm_zxkhxx.khjl,crm_zxkhxx.lfdj,crm_zxkhxx.jlfdjsj,crm_zxkhxx.hddj,crm_zxkhxx.jhddjsj,crm_zxkhxx.sjf,crm_zxkhxx.jsjfsj,crm_zxkhxx.hth,TO_CHAR(sjhtje),qsjhtsj,TO_CHAR(fwmj),DECODE(sjfbz,'N','未交设计费','Y','已交费','T','退设计费'),crm_zxkhxx.lrsj,sczbjsj,zjsmsj,smcs";
	ls_sql+=" FROM crm_zxkhxx ";
	ls_sql+=" where crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";
	ls_sql+=" and  crm_zxkhxx.clgw='"+clgw+"'";

	ls_sql+=" and  (";

	ls_sql+=" ( crm_zxkhxx.lfdjbz='Y'";//N：未交订金；Y：已交订金；T：退订金
	ls_sql+=" and  crm_zxkhxx.lfdj>0";
	ls_sql+=" and crm_zxkhxx.jlfdjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.jlfdjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" )";

	ls_sql+=" or ";

	ls_sql+=" ( crm_zxkhxx.hddjbz='Y'";//N：未交订金；Y：已交订金；T：退订金
	ls_sql+=" and  crm_zxkhxx.hddj>0";
	ls_sql+=" and crm_zxkhxx.jhddjsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.jhddjsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" )";

	ls_sql+=" or ";

	ls_sql+=" ( crm_zxkhxx.sjfbz='Y'";//N：未交设计费；Y：已交设计费；T：退设计费
	ls_sql+=" and crm_zxkhxx.sjf>0";
	ls_sql+=" and crm_zxkhxx.jsjfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.jsjfsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" )";
	
	ls_sql+=" )";

	ls_sql+=" order by crm_zxkhxx.khbh ";

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
  <B><font size="3">材料员定金（<%=dwmc%>:<%=clgw%>）
  <BR>(交款时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="160%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="4%">设计师</td>
	<td  width="4%">材料员</td>
	<td  width="4%">客户经理</td>

	<td  width="4%">家装定金</td>
	<td  width="5%">交家装定金时间</td>
	<td  width="4%">套餐意向书金额</td>
	<td  width="5%">交套餐定金时间</td>
	<td  width="4%">设计费</td>
	<td  width="5%">交设计费时间</td>

	<td  width="5%">设计合同号</td>
	<td  width="4%">设计合同金额</td>
	<td  width="5%">签设计合同时间</td>
	<td  width="3%">房屋面积</td>
	<td  width="5%">已收设计费</td>
	<td  width="5%">入店时间</td>
	<td  width="5%">首次做报价时间</td>
	<td  width="5%">最近上门时间</td>
	<td  width="3%">上门次数</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>