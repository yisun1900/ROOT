<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String cw_kmdmb_kmdm=null;
	String cw_kmdmb_xmmc1=null;
	String cw_kmdmb_xmmc2=null;
	String cw_kmdmb_xmmc3=null;
	String cw_kmdmb_xmmc4=null;
	String cw_kmdmb_dwbh=null;
	cw_kmdmb_kmdm=request.getParameter("cw_kmdmb_kmdm");
	if (cw_kmdmb_kmdm!=null)
	{
		cw_kmdmb_kmdm=cf.GB2Uni(cw_kmdmb_kmdm);
		if (!(cw_kmdmb_kmdm.equals("")))	wheresql+=" and  (cw_kmdmb.kmdm='"+cw_kmdmb_kmdm+"')";
	}
	cw_kmdmb_xmmc1=request.getParameter("cw_kmdmb_xmmc1");
	if (cw_kmdmb_xmmc1!=null)
	{
		cw_kmdmb_xmmc1=cf.GB2Uni(cw_kmdmb_xmmc1);
		if (!(cw_kmdmb_xmmc1.equals("")))	wheresql+=" and  (cw_kmdmb.xmmc1='"+cw_kmdmb_xmmc1+"')";
	}
	cw_kmdmb_xmmc2=request.getParameter("cw_kmdmb_xmmc2");
	if (cw_kmdmb_xmmc2!=null)
	{
		cw_kmdmb_xmmc2=cf.GB2Uni(cw_kmdmb_xmmc2);
		if (!(cw_kmdmb_xmmc2.equals("")))	wheresql+=" and  (cw_kmdmb.xmmc2='"+cw_kmdmb_xmmc2+"')";
	}
	cw_kmdmb_xmmc3=request.getParameter("cw_kmdmb_xmmc3");
	if (cw_kmdmb_xmmc3!=null)
	{
		cw_kmdmb_xmmc3=cf.GB2Uni(cw_kmdmb_xmmc3);
		if (!(cw_kmdmb_xmmc3.equals("")))	wheresql+=" and  (cw_kmdmb.xmmc3='"+cw_kmdmb_xmmc3+"')";
	}
	cw_kmdmb_xmmc4=request.getParameter("cw_kmdmb_xmmc4");
	if (cw_kmdmb_xmmc4!=null)
	{
		cw_kmdmb_xmmc4=cf.GB2Uni(cw_kmdmb_xmmc4);
		if (!(cw_kmdmb_xmmc4.equals("")))	wheresql+=" and  (cw_kmdmb.xmmc4='"+cw_kmdmb_xmmc4+"')";
	}
	cw_kmdmb_dwbh=request.getParameter("cw_kmdmb_dwbh");
	if (cw_kmdmb_dwbh!=null)
	{
		cw_kmdmb_dwbh=cf.GB2Uni(cw_kmdmb_dwbh);
		if (!(cw_kmdmb_dwbh.equals("")))	wheresql+=" and  (cw_kmdmb.dwbh='"+cw_kmdmb_dwbh+"')";
	}
	ls_sql="SELECT cw_kmdmb.kmdm,cw_kmdmb.xmmc1,cw_kmdmb.xmmc2,cw_kmdmb.xmmc3,cw_kmdmb.xmmc4,sq_dwxx.dwmc  ";
	ls_sql+=" FROM cw_kmdmb,sq_dwxx  ";
    ls_sql+=" where cw_kmdmb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","EditCw_kmdmb.jsp");
	pageObj.setPageRow(40000);
/*
//设置显示列
	String[] disColName={"kmdm","cw_kmdmb_xmmc1","cw_kmdmb_xmmc2","cw_kmdmb_xmmc3","cw_kmdmb_xmmc4","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kmdm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_kmdmbList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="14%">科目代码</td>
	<td  width="14%">第一个核算项目所属类别名称</td>
	<td  width="14%">第二个核算项目所属类别名称</td>
	<td  width="14%">第三个核算项目所属类别名称</td>
	<td  width="14%">第四个核算项目所属类别名称</td>
	<td  width="14%">单位名称</td>
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
