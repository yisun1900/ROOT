<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String kkbbz=(String)session.getAttribute("kkbbz");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
	String dwbh=(String)session.getAttribute("dwbh");
	String yhdlm=(String)session.getAttribute("yhdlm");
	String sjs=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='04'");
	if (sjs!=null)
	{
		wheresql+=" and  (crm_zxkhxx.sjs='"+sjs+"')";
	}
	String ywy=cf.executeQuery("select yhmc from sq_yhxx where yhdlm='"+yhdlm+"' and zwbm='19'");
	if (ywy!=null)
	{
		wheresql+=" and  (crm_zxkhxx.ywy='"+ywy+"')";
	}


	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
	}
	else if (yhjs.equals("F0") || yhjs.equals("F1"))
	{
		wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";
	}
	else if (yhjs.equals("F2"))
	{
		wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";
	}


	String lrsj=request.getParameter("lrsj");
	if (!(lrsj.equals("")))	wheresql+="  and (SYSDATE-crm_zxkhxx.lrsj>="+lrsj+")";


	

	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm, DECODE(crm_zxkhxx.xb,'M','男','W','女') as crm_zxkhxx_xb,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,sjs,ywy,DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') as crm_zxkhxx_zxzt,lrsj,b.dwmc as zxdm,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,crm_zxkhxx.hfrq as crm_zxkhxx_hfrq";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where (crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) )";
    ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) and crm_zxkhxx.zxzt not in('2','3','4')";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhxx.ssfgs,crm_zxkhxx.lrsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("LrsjCxList.jsp","","","");
	pageObj.setPageRow(22);//设置每页显示记录数


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
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
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


<CENTER >
  <B><font size="3">签单提醒－录入时间</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">客户编号</td>
	<td  width="6%">姓名</td>
	<td  width="4%">性别</td>
	<td  width="20%">房屋地址</td>
	<td  width="6%">设计师</td>
	<td  width="6%">业务员</td>
	<td  width="9%">咨询状态</td>
	<td  width="8%">录入时间</td>
	<td  width="9%">咨询店面</td>
	<td  width="10%">咨询登记部门</td>
	<td  width="8%">房屋类型</td>
	<td  width="8%">回访日期</td>
</tr>
<%
	pageObj.displayDate();
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