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



	ls_sql="SELECT crm_zxkhxx.khbh,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过'),crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.sjs,crm_zxkhxx.ywy,dwmc,TO_CHAR(crm_zxkhxx.lrsj,'YYYY-MM-DD HH24:MI'),crm_zxkhxx.jlfdjsj,crm_zxkhxx.jhddjsj";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx";
    ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) ";
		ls_sql+=" and crm_zxkhxx.zxzt not in('2','3','4') ";
		ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"' ";

		ls_sql+=" and (crm_zxkhxx.lfdjbz in('Y','T') OR crm_zxkhxx.hddjbz in('Y','T'))";

		ls_sql+=" and (MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jlfdjsj)>3 OR MONTHS_BETWEEN(SYSDATE,crm_zxkhxx.jhddjsj)>3)";

	ls_sql+=" order by crm_zxkhxx.lrsj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
//	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">超三个月未消化定金数（<%=dwmc%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">客户编号</td>
	<td  width="7%">状态</td>
	<td  width="9%">姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="9%">设计师</td>
	<td  width="8%">业务员</td>
 	<td  width="12%">咨询店面</td>
	<td  width="12%">咨询客户录入时间</td>
	<td  width="8%">交设计订金时间</td>
	<td  width="8%">交活动订金时间</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();
%> 
</table>
</body>
</html>