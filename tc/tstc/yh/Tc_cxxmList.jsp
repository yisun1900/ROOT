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
	String tc_cxxm_cxxmbm=null;
	String tc_cxxm_dqbm=null;
	String tc_cxxm_bjjbbm=null;
	String tc_cxxm_xmmc=null;
	String tc_cxxm_ppmc=null;
	String tc_cxxm_xh=null;
	String tc_cxxm_jldw=null;
	String tc_cxxm_dj=null;
	String tc_cxxm_lrr=null;
	String tc_cxxm_lrsj=null;
	tc_cxxm_cxxmbm=request.getParameter("tc_cxxm_cxxmbm");
	if (tc_cxxm_cxxmbm!=null)
	{
		tc_cxxm_cxxmbm=cf.GB2Uni(tc_cxxm_cxxmbm);
		if (!(tc_cxxm_cxxmbm.equals("")))	wheresql+=" and  (tc_cxxm.cxxmbm='"+tc_cxxm_cxxmbm+"')";
	}
	tc_cxxm_dqbm=request.getParameter("tc_cxxm_dqbm");
	if (tc_cxxm_dqbm!=null)
	{
		tc_cxxm_dqbm=cf.GB2Uni(tc_cxxm_dqbm);
		if (!(tc_cxxm_dqbm.equals("")))	wheresql+=" and  (tc_cxxm.dqbm='"+tc_cxxm_dqbm+"')";
	}
	tc_cxxm_bjjbbm=request.getParameter("tc_cxxm_bjjbbm");
	if (tc_cxxm_bjjbbm!=null)
	{
		tc_cxxm_bjjbbm=cf.GB2Uni(tc_cxxm_bjjbbm);
		if (!(tc_cxxm_bjjbbm.equals("")))	wheresql+=" and  (tc_cxxm.bjjbbm='"+tc_cxxm_bjjbbm+"')";
	}
	tc_cxxm_xmmc=request.getParameter("tc_cxxm_xmmc");
	if (tc_cxxm_xmmc!=null)
	{
		tc_cxxm_xmmc=cf.GB2Uni(tc_cxxm_xmmc);
		if (!(tc_cxxm_xmmc.equals("")))	wheresql+=" and  (tc_cxxm.xmmc='"+tc_cxxm_xmmc+"')";
	}
	tc_cxxm_ppmc=request.getParameter("tc_cxxm_ppmc");
	if (tc_cxxm_ppmc!=null)
	{
		tc_cxxm_ppmc=cf.GB2Uni(tc_cxxm_ppmc);
		if (!(tc_cxxm_ppmc.equals("")))	wheresql+=" and  (tc_cxxm.ppmc='"+tc_cxxm_ppmc+"')";
	}
	tc_cxxm_xh=request.getParameter("tc_cxxm_xh");
	if (tc_cxxm_xh!=null)
	{
		tc_cxxm_xh=cf.GB2Uni(tc_cxxm_xh);
		if (!(tc_cxxm_xh.equals("")))	wheresql+=" and  (tc_cxxm.xh='"+tc_cxxm_xh+"')";
	}
	tc_cxxm_jldw=request.getParameter("tc_cxxm_jldw");
	if (tc_cxxm_jldw!=null)
	{
		tc_cxxm_jldw=cf.GB2Uni(tc_cxxm_jldw);
		if (!(tc_cxxm_jldw.equals("")))	wheresql+=" and  (tc_cxxm.jldw='"+tc_cxxm_jldw+"')";
	}
	tc_cxxm_dj=request.getParameter("tc_cxxm_dj");
	if (tc_cxxm_dj!=null)
	{
		tc_cxxm_dj=tc_cxxm_dj.trim();
		if (!(tc_cxxm_dj.equals("")))	wheresql+=" and  (tc_cxxm.dj="+tc_cxxm_dj+") ";
	}
	tc_cxxm_lrr=request.getParameter("tc_cxxm_lrr");
	if (tc_cxxm_lrr!=null)
	{
		tc_cxxm_lrr=cf.GB2Uni(tc_cxxm_lrr);
		if (!(tc_cxxm_lrr.equals("")))	wheresql+=" and  (tc_cxxm.lrr='"+tc_cxxm_lrr+"')";
	}
	tc_cxxm_lrsj=request.getParameter("tc_cxxm_lrsj");
	if (tc_cxxm_lrsj!=null)
	{
		tc_cxxm_lrsj=tc_cxxm_lrsj.trim();
		if (!(tc_cxxm_lrsj.equals("")))	wheresql+="  and (tc_cxxm.lrsj=TO_DATE('"+tc_cxxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_cxxm.cxxmbm,tc_cxxm.dqbm,dm_dqbm.dqmc,tc_cxxm.bjjbbm,tc_cxxm.xmmc,tc_cxxm.ppmc,tc_cxxm.xh,tc_cxxm.jldw,tc_cxxm.dj,tc_cxxm.bz,tc_cxxm.lrr,tc_cxxm.lrsj  ";
	ls_sql+=" FROM dm_dqbm,tc_cxxm  ";
    ls_sql+=" where tc_cxxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_cxxmList.jsp","","","Edittc_cxxm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","xmmc","tc_cxxm_ppmc","tc_cxxm_xh","tc_cxxm_jldw","tc_cxxm_dj","tc_cxxm_bz","tc_cxxm_lrr","tc_cxxm_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cxxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_cxxmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tc_cxxm where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">套餐促销项目</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="12%">&nbsp;</td>
	<td  width="7%">促销项目编码</td>
	<td  width="7%">地区</td>
	<td  width="7%">地区</td>
	<td  width="7%">报价级别</td>
	<td  width="7%">项目名称</td>
	<td  width="7%">品牌</td>
	<td  width="7%">型号</td>
	<td  width="7%">计量单位</td>
	<td  width="7%">单价</td>
	<td  width="7%">备注及工艺说明</td>
	<td  width="7%">录入人</td>
	<td  width="7%">录入时间</td>
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