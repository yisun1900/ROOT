<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	
	ls_sql="SELECT '',crm_zxkhxx.hddj,TO_CHAR(crm_zxkhxx.jhddjsj,'YYYY-MM-DD') jhddjsj,crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装') jzbz,crm_zxkhxx.cxhdbm,b.dwmc ssfgs,a.dwmc qydm,TO_CHAR(crm_zxkhxx.lrsj,'YYYY-MM-DD HH24:MI') lrsj";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b";
	ls_sql+=" where crm_zxkhxx.hddjbz='Y' and crm_zxkhxx.zxdm='"+dwbh+"'";
    ls_sql+=" and crm_zxkhxx.zxdm=a.dwbh(+) and crm_zxkhxx.ssfgs=b.dwbh(+) ";
	ls_sql+="  and crm_zxkhxx.zxzt in ('0','1','5') ";
	ls_sql+=" order by crm_zxkhxx.jhddjsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fwdz",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">累计收促销活动订金数（未签单</B>
</CENTER>
<table border="1" width="120%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="8%">活动订金</td>
	<td  width="7%">交活动订金时间</td>
	<td  width="7%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="16%">房屋地址</td>
	<td  width="6%">设计师</td>
	<td  width="6%">家装标志</td>
	<td  width="10%">促销活动</td>
	<td  width="8%">分公司</td>
	<td  width="10%">咨询店面</td>
	<td  width="12%">录入时间</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>