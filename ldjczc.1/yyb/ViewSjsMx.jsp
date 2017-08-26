<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"170201")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String kkbbz=(String)session.getAttribute("kkbbz");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	String skfw=cf.GB2Uni(cf.getParameter(request,"skfw"));
	String wheresql=cf.GB2Uni(cf.getParameter(request,"wheresql"));


	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','店面退回客户','3','已签约','4','公司签单失败','5','重新分配店面'),sum(cw_khfkjl.fkje),crm_zxkhxx.fwdz,b.dwmc as zxdm,crm_zxkhxx.sjs,khjl,ywy,dzbjze,bjjbmc,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,sjf,jsjfsj,lfsj,ctsj,cxgtsj,csgtsj,DECODE(crm_zxkhxx.jzbz,'1','家装','2','公装'),crm_zxkhxx.lrsj,fwlxmc";
	ls_sql+=" FROM crm_zxkhxx,cw_khfkjl,dm_fwlxbm,sq_dwxx b,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) ";
	ls_sql+=" and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.khbh=cw_khfkjl.khbh";
	ls_sql+=" and  crm_zxkhxx.zxzt in('0','1','5')";
	ls_sql+=" and (NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0))!=0";
	ls_sql+=" and  cw_khfkjl.scbz='N'";
	ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=wheresql;
	if (sjs.equals("?"))
	{
		ls_sql+=" and  crm_zxkhxx.sjs is null";
	}
	else{
		ls_sql+=" and  crm_zxkhxx.sjs='"+sjs+"'";
	}
	if (skfw!=null)
	{
		skfw=cf.GB2Uni(skfw);
		if (skfw.equals("1"))
		{
			ls_sql+=" and  (cw_khfkjl.fklxbm in('51','52','53'))";
		}
		else if (skfw.equals("2"))
		{
			ls_sql+=" and  (cw_khfkjl.fklxbm not in('51','52','53'))";
		}
	}
	ls_sql+=" group by crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.zxzt,crm_zxkhxx.fwdz,b.dwmc,crm_zxkhxx.sjs,ysy,khjl,ywy,dzbjze,bjjbmc,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,sjf,jsjfsj,lfsj,ctsj,cxgtsj,csgtsj,crm_zxkhxx.jzbz,crm_zxkhxx.lrsj,fwlxmc";
	ls_sql+=" order by b.dwmc,khxm";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);



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
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<%
if (kkbbz.equals("Y"))//Y：可拷贝；N：不可拷贝
{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
	<%
}
else{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>
<noscript><iframe scr="*.htm"></iframe></noscript>

<CENTER >
  <B><font size="3">积单明细（<%=sjs%>）</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="3%">咨询状态</td>
	<td  width="4%">付款总额</td>
	<td  width="10%">房屋地址</td>
	<td  width="4%">咨询店面</td>
	<td  width="3%">设计师</td>
	<td  width="3%">客户经理</td>
	<td  width="3%">业务员</td>
	<td  width="4%">电子报价总额</td>
	<td  width="3%">报价级别</td>
	<td  width="4%">家装订金</td>
	<td  width="4%">交家装订金时间</td>
	<td  width="7%">参加促销活动</td>
	<td  width="4%">套餐意向订金</td>
	<td  width="4%">交套餐意向订金时间</td>
	<td  width="4%">实收设计费</td>
	<td  width="4%">交设计费时间</td>
	<td  width="4%">量房时间</td>
	<td  width="4%">出平面图时间</td>
	<td  width="4%">出效果图时间</td>
	<td  width="4%">出施工图时间</td>
	<td  width="2%">家装标志</td>
	<td  width="4%">录入时间</td>
	<td  width="3%">房屋类型</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">

function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>