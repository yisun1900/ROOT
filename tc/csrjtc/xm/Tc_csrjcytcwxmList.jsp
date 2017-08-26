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
	String tc_csrjcytcwxm_dqbm=null;
	String tc_csrjcytcwxm_bjjbbm=null;
	String tc_csrjcytcwxm_tccplbbm=null;
	String tc_csrjcytcwxm_tccpdlbm=null;
	tc_csrjcytcwxm_dqbm=request.getParameter("tc_csrjcytcwxm_dqbm");
	if (tc_csrjcytcwxm_dqbm!=null)
	{
		tc_csrjcytcwxm_dqbm=cf.GB2Uni(tc_csrjcytcwxm_dqbm);
		if (!(tc_csrjcytcwxm_dqbm.equals("")))	wheresql+=" and  (tc_csrjcytcwxm.dqbm='"+tc_csrjcytcwxm_dqbm+"')";
	}
	tc_csrjcytcwxm_bjjbbm=request.getParameter("tc_csrjcytcwxm_bjjbbm");
	if (tc_csrjcytcwxm_bjjbbm!=null)
	{
		tc_csrjcytcwxm_bjjbbm=cf.GB2Uni(tc_csrjcytcwxm_bjjbbm);
		if (!(tc_csrjcytcwxm_bjjbbm.equals("")))	wheresql+=" and  (tc_csrjcytcwxm.bjjbbm='"+tc_csrjcytcwxm_bjjbbm+"')";
	}
	tc_csrjcytcwxm_tccplbbm=request.getParameter("tc_csrjcytcwxm_tccplbbm");
	if (tc_csrjcytcwxm_tccplbbm!=null)
	{
		tc_csrjcytcwxm_tccplbbm=tc_csrjcytcwxm_tccplbbm.trim();
		if (!(tc_csrjcytcwxm_tccplbbm.equals("")))	wheresql+=" and (tc_csrjcytcwxm.tccplbbm="+tc_csrjcytcwxm_tccplbbm+") ";
	}
	tc_csrjcytcwxm_tccpdlbm=request.getParameter("tc_csrjcytcwxm_tccpdlbm");
	if (tc_csrjcytcwxm_tccpdlbm!=null)
	{
		tc_csrjcytcwxm_tccpdlbm=tc_csrjcytcwxm_tccpdlbm.trim();
		if (!(tc_csrjcytcwxm_tccpdlbm.equals("")))	wheresql+=" and (tc_csrjcytcwxm.tccpdlbm="+tc_csrjcytcwxm_tccpdlbm+") ";
	}
	ls_sql="SELECT tc_csrjcytcwxm.dqbm,dqmc,tc_csrjcytcwxm.bjjbbm,bdm_bjjbbm.bjjbmc,tc_csrjcytcwxm.tccplbbm,clxlmc,jxc_cldlbm.cldlmc";
	ls_sql+=" FROM bdm_bjjbbm,tc_csrjcytcwxm,dm_dqbm,jxc_clxlbm,jxc_cldlbm  ";
    ls_sql+=" where tc_csrjcytcwxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and tc_csrjcytcwxm.dqbm=dm_dqbm.dqbm(+)";
    ls_sql+=" and tc_csrjcytcwxm.tccpdlbm=jxc_cldlbm.cldlbm(+)";
    ls_sql+=" and tc_csrjcytcwxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by tc_csrjcytcwxm.dqbm,tc_csrjcytcwxm.bjjbbm,tc_csrjcytcwxm.tccpdlbm,tc_csrjcytcwxm.tccplbbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Tc_csrjcytcwxmList.jsp","","","EditTc_csrjcytcwxm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"dqbm","bjjbbm","bdm_bjjbbm_bjjbmc","tccplbbm","tc_csrjcytcwxm_tccpdlbm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"dqbm","bjjbbm","tccplbbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Tc_csrjcytcwxmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
		sql[0]="delete from tc_csrjcytcwxm where "+chooseitem;
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
	<td  width="8%">地区</td>
	<td  width="17%">地区</td>
	<td  width="8%">报价级别</td>
	<td  width="17%">报价级别</td>
	<td  width="8%">产品类别</td>
	<td  width="17%">产品类别</td>
	<td  width="17%">产品大类</td>
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