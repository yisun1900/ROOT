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
	String tc_csrjbzxm_dqbm=null;
	String tc_csrjbzxm_bjjbbm=null;
	String tc_csrjbzxm_xmmc=null;
	String tc_csrjbzxm_ppmc=null;
	String tc_csrjbzxm_xh=null;
	String tc_csrjbzxm_jldw=null;
	String tc_csrjbzxm_bhsl=null;
	String tc_csrjbzxm_lrr=null;
	String tc_csrjbzxm_lrsj=null;
	tc_csrjbzxm_dqbm=request.getParameter("tc_csrjbzxm_dqbm");
	if (tc_csrjbzxm_dqbm!=null)
	{
		tc_csrjbzxm_dqbm=cf.GB2Uni(tc_csrjbzxm_dqbm);
		if (!(tc_csrjbzxm_dqbm.equals("")))	wheresql+=" and  (tc_csrjbzxm.dqbm='"+tc_csrjbzxm_dqbm+"')";
	}
	tc_csrjbzxm_bjjbbm=request.getParameter("tc_csrjbzxm_bjjbbm");
	if (tc_csrjbzxm_bjjbbm!=null)
	{
		tc_csrjbzxm_bjjbbm=cf.GB2Uni(tc_csrjbzxm_bjjbbm);
		if (!(tc_csrjbzxm_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjbzxm.bjjbbm='"+tc_csrjbzxm_bjjbbm+"')";
	}
	tc_csrjbzxm_xmmc=request.getParameter("tc_csrjbzxm_xmmc");
	if (tc_csrjbzxm_xmmc!=null)
	{
		tc_csrjbzxm_xmmc=cf.GB2Uni(tc_csrjbzxm_xmmc);
		if (!(tc_csrjbzxm_xmmc.equals("")))	wheresql+=" and  (tc_csrjbzxm.xmmc='"+tc_csrjbzxm_xmmc+"')";
	}
	tc_csrjbzxm_ppmc=request.getParameter("tc_csrjbzxm_ppmc");
	if (tc_csrjbzxm_ppmc!=null)
	{
		tc_csrjbzxm_ppmc=cf.GB2Uni(tc_csrjbzxm_ppmc);
		if (!(tc_csrjbzxm_ppmc.equals("")))	wheresql+=" and  (tc_csrjbzxm.ppmc='"+tc_csrjbzxm_ppmc+"')";
	}
	tc_csrjbzxm_xh=request.getParameter("tc_csrjbzxm_xh");
	if (tc_csrjbzxm_xh!=null)
	{
		tc_csrjbzxm_xh=cf.GB2Uni(tc_csrjbzxm_xh);
		if (!(tc_csrjbzxm_xh.equals("")))	wheresql+=" and  (tc_csrjbzxm.xh='"+tc_csrjbzxm_xh+"')";
	}
	tc_csrjbzxm_jldw=request.getParameter("tc_csrjbzxm_jldw");
	if (tc_csrjbzxm_jldw!=null)
	{
		tc_csrjbzxm_jldw=cf.GB2Uni(tc_csrjbzxm_jldw);
		if (!(tc_csrjbzxm_jldw.equals("")))	wheresql+=" and  (tc_csrjbzxm.jldw='"+tc_csrjbzxm_jldw+"')";
	}
	tc_csrjbzxm_bhsl=request.getParameter("tc_csrjbzxm_bhsl");
	if (tc_csrjbzxm_bhsl!=null)
	{
		tc_csrjbzxm_bhsl=tc_csrjbzxm_bhsl.trim();
		if (!(tc_csrjbzxm_bhsl.equals("")))	wheresql+=" and  (tc_csrjbzxm.bhsl="+tc_csrjbzxm_bhsl+") ";
	}
	tc_csrjbzxm_lrr=request.getParameter("tc_csrjbzxm_lrr");
	if (tc_csrjbzxm_lrr!=null)
	{
		tc_csrjbzxm_lrr=cf.GB2Uni(tc_csrjbzxm_lrr);
		if (!(tc_csrjbzxm_lrr.equals("")))	wheresql+=" and  (tc_csrjbzxm.lrr='"+tc_csrjbzxm_lrr+"')";
	}
	tc_csrjbzxm_lrsj=request.getParameter("tc_csrjbzxm_lrsj");
	if (tc_csrjbzxm_lrsj!=null)
	{
		tc_csrjbzxm_lrsj=tc_csrjbzxm_lrsj.trim();
		if (!(tc_csrjbzxm_lrsj.equals("")))	wheresql+="  and (tc_csrjbzxm.lrsj=TO_DATE('"+tc_csrjbzxm_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT tc_csrjbzxm.dqbm,dm_dqbm.dqmc,tc_csrjbzxm.bjjbbm,tc_csrjbzxm.xmmc,tc_csrjbzxm.ppmc,tc_csrjbzxm.xh,tc_csrjbzxm.jldw,tc_csrjbzxm.bhsl,tc_csrjbzxm.bz,tc_csrjbzxm.lrr,tc_csrjbzxm.lrsj  ";
	ls_sql+=" FROM dm_dqbm,tc_csrjbzxm  ";
    ls_sql+=" where tc_csrjbzxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjbzxm.dqbm,tc_csrjbzxm.xmmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_csrjbzxmList.jsp","","","EditTc_csrjbzxm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","xmmc","tc_csrjbzxm_ppmc","tc_csrjbzxm_xh","tc_csrjbzxm_jldw","tc_csrjbzxm_bhsl","tc_csrjbzxm_bz","tc_csrjbzxm_lrr","tc_csrjbzxm_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjjbbm","xmmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_csrjbzxmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from tc_csrjbzxm where "+chooseitem;
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
  <B><font size="3">套餐标准项目</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">地区</td>
	<td  width="4%">地区</td>
	<td  width="4%">报价级别</td>
	<td  width="13%">项目名称</td>
	<td  width="13%">品牌</td>
	<td  width="13%">型号</td>
	<td  width="4%">计量单位</td>
	<td  width="4%">包含数量</td>
	<td  width="28%">备注及工艺说明</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
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