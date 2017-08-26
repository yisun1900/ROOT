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
	String tc_csrjtcjgb_dqbm=null;
	String tc_csrjtcjgb_bjjbbm=null;
	String tc_csrjtcjgb_tcmc=null;
	String tc_csrjtcjgb_mjpmdj=null;
	tc_csrjtcjgb_dqbm=request.getParameter("tc_csrjtcjgb_dqbm");
	if (tc_csrjtcjgb_dqbm!=null)
	{
		tc_csrjtcjgb_dqbm=cf.GB2Uni(tc_csrjtcjgb_dqbm);
		if (!(tc_csrjtcjgb_dqbm.equals("")))	wheresql+=" and  (tc_csrjtcjgb.dqbm='"+tc_csrjtcjgb_dqbm+"')";
	}
	tc_csrjtcjgb_bjjbbm=request.getParameter("tc_csrjtcjgb_bjjbbm");
	if (tc_csrjtcjgb_bjjbbm!=null)
	{
		tc_csrjtcjgb_bjjbbm=cf.GB2Uni(tc_csrjtcjgb_bjjbbm);
		if (!(tc_csrjtcjgb_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjtcjgb.bjjbbm='"+tc_csrjtcjgb_bjjbbm+"')";
	}
	tc_csrjtcjgb_tcmc=request.getParameter("tc_csrjtcjgb_tcmc");
	if (tc_csrjtcjgb_tcmc!=null)
	{
		tc_csrjtcjgb_tcmc=cf.GB2Uni(tc_csrjtcjgb_tcmc);
		if (!(tc_csrjtcjgb_tcmc.equals("")))	wheresql+=" and  (tc_csrjtcjgb.tcmc='"+tc_csrjtcjgb_tcmc+"')";
	}
	tc_csrjtcjgb_mjpmdj=request.getParameter("tc_csrjtcjgb_mjpmdj");
	if (tc_csrjtcjgb_mjpmdj!=null)
	{
		tc_csrjtcjgb_mjpmdj=tc_csrjtcjgb_mjpmdj.trim();
		if (!(tc_csrjtcjgb_mjpmdj.equals("")))	wheresql+=" and  (tc_csrjtcjgb.mjpmdj="+tc_csrjtcjgb_mjpmdj+") ";
	}
	ls_sql="SELECT tc_csrjtcjgb.dqbm,dm_dqbm.dqmc,tc_csrjtcjgb.bjjbbm,bjjbmc,tc_csrjtcjgb.tcmc,tc_csrjtcjgb.mjpmdj,tc_csrjtcjgb.tnzxjjmj,tc_csrjtcjgb.cfdj,tc_csrjtcjgb.cfbzmj,tc_csrjtcjgb.cfccmjdj,tc_csrjtcjgb.wsjdj,tc_csrjtcjgb.wsjbzmj,tc_csrjtcjgb.wsjccmjdj,tc_csrjtcjgb.tlgbzjmj  ";
	ls_sql+=" FROM dm_dqbm,tc_csrjtcjgb,bdm_bjjbbm  ";
    ls_sql+=" where tc_csrjtcjgb.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_csrjtcjgb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjtcjgb.dqbm,tc_csrjtcjgb.bjjbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_csrjtcjgbList.jsp","","","EditTc_csrjtcjgb.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","dm_dqbm_dqmc","bjjbbm","tc_csrjtcjgb_tcmc","tc_csrjtcjgb_mjpmdj","tc_csrjtcjgb_tnzxjjmj","tc_csrjtcjgb_cfdj","tc_csrjtcjgb_cfbzmj","tc_csrjtcjgb_cfccmjdj","tc_csrjtcjgb_wsjdj","tc_csrjtcjgb_wsjbzmj","tc_csrjtcjgb_wsjccmjdj","tc_csrjtcjgb_tlgbzjmj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjjbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_csrjtcjgbList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from tc_csrjtcjgb where "+chooseitem;
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
	<td  width="6%">地区</td>
	<td  width="8%">地区</td>
	<td  width="6%">报价级别</td>
	<td  width="7%">报价级别</td>
	<td  width="9%">套餐名称</td>
	<td  width="6%">面积平米单价</td>
	<td  width="6%">套内最小计价面积</td>
	<td  width="7%">厨房单价</td>
	<td  width="6%">厨房标准面积</td>
	<td  width="6%">厨房超出面积单价</td>
	<td  width="7%">卫生间单价</td>
	<td  width="6%">卫生间标准面积</td>
	<td  width="6%">卫生间超出面积单价</td>
	<td  width="6%">涂料改为壁纸减免价</td>
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