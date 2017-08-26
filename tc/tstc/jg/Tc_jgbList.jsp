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
	String tc_jgb_dqbm=null;
	String tc_jgb_bjjbbm=null;
	String tc_jgb_tcmc=null;
	String tc_jgb_mjdj=null;
	String tc_jgb_zxmj=null;
	tc_jgb_dqbm=request.getParameter("tc_jgb_dqbm");
	if (tc_jgb_dqbm!=null)
	{
		tc_jgb_dqbm=cf.GB2Uni(tc_jgb_dqbm);
		if (!(tc_jgb_dqbm.equals("")))	wheresql+=" and  (tc_jgb.dqbm='"+tc_jgb_dqbm+"')";
	}
	tc_jgb_bjjbbm=request.getParameter("tc_jgb_bjjbbm");
	if (tc_jgb_bjjbbm!=null)
	{
		tc_jgb_bjjbbm=cf.GB2Uni(tc_jgb_bjjbbm);
		if (!(tc_jgb_bjjbbm.equals("")))	wheresql+=" and  (tc_jgb.bjjbbm='"+tc_jgb_bjjbbm+"')";
	}
	tc_jgb_tcmc=request.getParameter("tc_jgb_tcmc");
	if (tc_jgb_tcmc!=null)
	{
		tc_jgb_tcmc=cf.GB2Uni(tc_jgb_tcmc);
		if (!(tc_jgb_tcmc.equals("")))	wheresql+=" and  (tc_jgb.tcmc='"+tc_jgb_tcmc+"')";
	}
	tc_jgb_mjdj=request.getParameter("tc_jgb_mjdj");
	if (tc_jgb_mjdj!=null)
	{
		tc_jgb_mjdj=tc_jgb_mjdj.trim();
		if (!(tc_jgb_mjdj.equals("")))	wheresql+=" and  (tc_jgb.mjdj="+tc_jgb_mjdj+") ";
	}
	tc_jgb_zxmj=request.getParameter("tc_jgb_zxmj");
	if (tc_jgb_zxmj!=null)
	{
		tc_jgb_zxmj=tc_jgb_zxmj.trim();
		if (!(tc_jgb_zxmj.equals("")))	wheresql+=" and  (tc_jgb.zxmj="+tc_jgb_zxmj+") ";
	}
	ls_sql="SELECT tc_jgb.dqbm,dm_dqbm.dqmc,tc_jgb.bjjbbm,bjjbmc,tc_jgb.tcmc,tc_jgb.mjdj,tc_jgb.zxmj,tc_jgb.yssl,tc_jgb.tsf,tc_jgb.wyjg,tc_jgb.czjg  ";
	ls_sql+=" FROM dm_dqbm,tc_jgb,bdm_bjjbbm  ";
    ls_sql+=" where tc_jgb.dqbm=dm_dqbm.dqbm(+) and tc_jgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_jgb.bjjbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_jgbList.jsp","","","EditTc_jgb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","tc_jgb_tcmc","tc_jgb_mjdj","tc_jgb_zxmj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjjbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_jgbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from tc_jgb where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">&nbsp;</td>
	<td  width="7%">地区</td>
	<td  width="8%">地区</td>
	<td  width="7%">报价级别</td>
	<td  width="10%">报价级别</td>
	<td  width="11%">套餐名称</td>
	<td  width="11%">平米单价</td>
	<td  width="8%">最小面积</td>
	<td  width="8%">油漆限定颜色数量</td>
	<td  width="7%">调色费</td>
	<td  width="8%">每套卫浴价格</td>
	<td  width="8%">每套磁砖价格</td>
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