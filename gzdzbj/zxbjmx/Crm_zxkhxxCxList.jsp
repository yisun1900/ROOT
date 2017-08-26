<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhmc=(String)session.getAttribute("yhmc");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	String khxm=cf.GB2Uni(request.getParameter("khxm"));
	String ssfgs=request.getParameter("ssfgs");

	String khbh=request.getParameter("khbh");
	String bjjb=request.getParameter("bjjb");
	String dqbm=request.getParameter("dqbm");

	ls_sql="SELECT crm_zxkhxx.khxm,crm_zxkhxx.fwdz,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','飞单审核未通过','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,DECODE(shbz,'N','未审核','Y','审核'),DECODE(sfzdzbj,'N','未做','Y','已做'),dzbjze,bjjbmc,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),b.dwmc as zxdm,sjs,DECODE(crm_zxkhxx.xb,'M','男','W','女') as crm_zxkhxx_xb,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,ywy,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,crm_zxkhxx.khbh as khbh";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
    ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
    ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.ssfgs='"+ssfgs+"' and crm_zxkhxx.khxm like '%"+khxm+"%' and crm_zxkhxx.sjs='"+yhmc+"'";
    ls_sql+=" order by crm_zxkhxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","CopyKhbj.jsp?drkhbh="+khbh+"&bjjb="+bjjb+"&dqbm="+dqbm);
	pageObj.setPageRow(100);//设置每页显示记录数
	pageObj.setEditBolt("");//设置每页显示记录数
	pageObj.setEditStr("复制");//设置每页显示记录数


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);

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

	pageObj.alignStr[8]="align='left'";
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">复制报价（只能复制自己客户的报价）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">姓名</td>
	<td  width="11%">房屋地址</td>
	<td  width="5%">咨询状态</td>
	<td  width="3%">审核标志</td>
	<td  width="3%">电子报价</td>
	<td  width="4%">电子报价总额</td>
	<td  width="4%">报价级别</td>
	<td  width="3%">家装标志</td>
	<td  width="6%">咨询店面</td>
	<td  width="4%">设计师</td>
	<td  width="2%">性别</td>
	<td  width="10%">联系方式</td>
	<td  width="4%">业务员</td>
	<td  width="6%">失败原因</td>
	<td  width="4%">录入时间</td>
	<td  width="7%">咨询登记部门</td>
	<td  width="4%">房屋类型</td>
	<td  width="3%">客户编号</td>
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