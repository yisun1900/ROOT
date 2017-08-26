<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String tc_tcwzczx_bjbbh=null;
	String tc_tcwzczx_dqbm=null;
	String tc_tcwzczx_bjjbbm=null;
	String tc_tcwzczx_xmmc=null;
	String tc_tcwzczx_ppmc=null;
	String tc_tcwzczx_xh=null;
	String tc_tcwzczx_jldw=null;
	String tc_tcwzczx_dj=null;
	String tc_tcwzczx_lrr=null;
	String tc_tcwzczx_lrsj=null;
	tc_tcwzczx_bjbbh=request.getParameter("tc_tcwzczx_bjbbh");
	if (tc_tcwzczx_bjbbh!=null)
	{
		tc_tcwzczx_bjbbh=cf.GB2Uni(tc_tcwzczx_bjbbh);
		if (!(tc_tcwzczx_bjbbh.equals("")))	wheresql+=" and  (tc_tcwzczx.bjbbh='"+tc_tcwzczx_bjbbh+"')";
	}
	tc_tcwzczx_dqbm=request.getParameter("tc_tcwzczx_dqbm");
	if (tc_tcwzczx_dqbm!=null)
	{
		tc_tcwzczx_dqbm=cf.GB2Uni(tc_tcwzczx_dqbm);
		if (!(tc_tcwzczx_dqbm.equals("")))	wheresql+=" and  (tc_tcwzczx.dqbm='"+tc_tcwzczx_dqbm+"')";
	}
	tc_tcwzczx_bjjbbm=request.getParameter("tc_tcwzczx_bjjbbm");
	if (tc_tcwzczx_bjjbbm!=null)
	{
		tc_tcwzczx_bjjbbm=cf.GB2Uni(tc_tcwzczx_bjjbbm);
		if (!(tc_tcwzczx_bjjbbm.equals("")))	wheresql+=" and  (tc_tcwzczx.bjjbbm='"+tc_tcwzczx_bjjbbm+"')";
	}
	tc_tcwzczx_xmmc=request.getParameter("tc_tcwzczx_xmmc");
	if (tc_tcwzczx_xmmc!=null)
	{
		tc_tcwzczx_xmmc=cf.GB2Uni(tc_tcwzczx_xmmc);
		if (!(tc_tcwzczx_xmmc.equals("")))	wheresql+=" and  (tc_tcwzczx.xmmc='"+tc_tcwzczx_xmmc+"')";
	}
	tc_tcwzczx_ppmc=request.getParameter("tc_tcwzczx_ppmc");
	if (tc_tcwzczx_ppmc!=null)
	{
		tc_tcwzczx_ppmc=cf.GB2Uni(tc_tcwzczx_ppmc);
		if (!(tc_tcwzczx_ppmc.equals("")))	wheresql+=" and  (tc_tcwzczx.ppmc='"+tc_tcwzczx_ppmc+"')";
	}
	tc_tcwzczx_xh=request.getParameter("tc_tcwzczx_xh");
	if (tc_tcwzczx_xh!=null)
	{
		tc_tcwzczx_xh=cf.GB2Uni(tc_tcwzczx_xh);
		if (!(tc_tcwzczx_xh.equals("")))	wheresql+=" and  (tc_tcwzczx.xh='"+tc_tcwzczx_xh+"')";
	}
	tc_tcwzczx_jldw=request.getParameter("tc_tcwzczx_jldw");
	if (tc_tcwzczx_jldw!=null)
	{
		tc_tcwzczx_jldw=cf.GB2Uni(tc_tcwzczx_jldw);
		if (!(tc_tcwzczx_jldw.equals("")))	wheresql+=" and  (tc_tcwzczx.jldw='"+tc_tcwzczx_jldw+"')";
	}
	tc_tcwzczx_dj=request.getParameter("tc_tcwzczx_dj");
	if (tc_tcwzczx_dj!=null)
	{
		tc_tcwzczx_dj=tc_tcwzczx_dj.trim();
		if (!(tc_tcwzczx_dj.equals("")))	wheresql+=" and  (tc_tcwzczx.dj="+tc_tcwzczx_dj+") ";
	}
	tc_tcwzczx_lrr=request.getParameter("tc_tcwzczx_lrr");
	if (tc_tcwzczx_lrr!=null)
	{
		tc_tcwzczx_lrr=cf.GB2Uni(tc_tcwzczx_lrr);
		if (!(tc_tcwzczx_lrr.equals("")))	wheresql+=" and  (tc_tcwzczx.lrr='"+tc_tcwzczx_lrr+"')";
	}
	tc_tcwzczx_lrsj=request.getParameter("tc_tcwzczx_lrsj");
	if (tc_tcwzczx_lrsj!=null)
	{
		tc_tcwzczx_lrsj=tc_tcwzczx_lrsj.trim();
		if (!(tc_tcwzczx_lrsj.equals("")))	wheresql+="  and (tc_tcwzczx.lrsj=TO_DATE('"+tc_tcwzczx_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_tcwzczx.bjbbh,tc_tcwzczx.dqbm,dm_dqbm.dqmc,tc_tcwzczx.bjjbbm,tc_tcwzczx.xmmc,tc_tcwzczx.ppmc,tc_tcwzczx.xh,tc_tcwzczx.jldw,tc_tcwzczx.dj,tc_tcwzczx.bz,tc_tcwzczx.lrr,tc_tcwzczx.lrsj  ";
	ls_sql+=" FROM dm_dqbm,tc_tcwzczx  ";
    ls_sql+=" where tc_tcwzczx.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_tcwzczxCxList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"bjbbh","dqbm","dm_dqbm_dqmc","bjjbbm","xmmc","tc_tcwzczx_ppmc","tc_tcwzczx_xh","tc_tcwzczx_jldw","tc_tcwzczx_dj","tc_tcwzczx_bz","tc_tcwzczx_lrr","tc_tcwzczx_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"bjbbh","dqbm","bjjbbm","xmmc"};
	pageObj.setKey(keyName);
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
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
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
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">报价版本号</td>
	<td  width="8%">地区</td>
	<td  width="8%">地区</td>
	<td  width="8%">报价级别</td>
	<td  width="8%">项目名称</td>
	<td  width="8%">品牌</td>
	<td  width="8%">型号</td>
	<td  width="8%">计量单位</td>
	<td  width="8%">单价</td>
	<td  width="8%">备注及工艺说明</td>
	<td  width="8%">录入人</td>
	<td  width="8%">录入时间</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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