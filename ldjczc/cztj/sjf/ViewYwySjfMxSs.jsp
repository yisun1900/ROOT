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
	String ywy=cf.GB2Uni(cf.getParameter(request,"ywy"));
	



	ls_sql="SELECT '',crm_zxkhxx.khbh,khxm,fwdz,crm_zxkhxx.sjs,crm_zxkhxx.khjl,crm_zxkhxx.ywy,crm_zxkhxx.hth,TO_CHAR(sjhtje) sjhtje,qsjhtsj,TO_CHAR(fwmj),cw_khfkjl.fkje,cw_khfkjl.sksj,cw_khfkjl.sjsj,crm_zxkhxx.lrsj,zjsmsj,smcs";
	ls_sql+=" FROM crm_zxkhxx,cw_khfkjl ";
	ls_sql+=" where crm_zxkhxx.khbh=cw_khfkjl.khbh ";
	ls_sql+=" and cw_khfkjl.scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('53')";//53：设计费
	ls_sql+=" and (  skdd='1' OR (skdd='2' and dsksjbz='Y')  )";
	ls_sql+=" and crm_zxkhxx.ywybm='"+dwbh+"' and crm_zxkhxx.ywy='"+ywy+"'";

	ls_sql+=" and cw_khfkjl.sksj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and cw_khfkjl.sksj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by cw_khfkjl.sksj";

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
  <B><font size="3">实收设计费客户
  <BR>(实收设计费时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="14%">房屋地址</td>
	<td  width="5%">设计师</td>
	<td  width="5%">客户经理</td>
	<td  width="4%">业务员</td>
	<td  width="6%">设计合同号</td>
	<td  width="6%">设计合同金额</td>
	<td  width="6%">签设计合同时间</td>
	<td  width="5%">房屋面积</td>
	<td  width="7%">实收设计费金额</td>
	<td  width="6%">收款时间</td>
	<td  width="6%">审核时间</td>
	<td  width="6%">入店时间</td>
	<td  width="6%">最近上门时间</td>
	<td  width="5%">上门次数</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>