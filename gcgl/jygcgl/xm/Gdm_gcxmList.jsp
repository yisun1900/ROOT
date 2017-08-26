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
	String gdm_gcxm_xmbm=null;
	String gdm_gcxm_xmmc=null;
	String gdm_gcxm_xmdlbm=null;
	String gdm_gcxm_xmxlbm=null;

	gdm_gcxm_xmbm=request.getParameter("gdm_gcxm_xmbm");
	if (gdm_gcxm_xmbm!=null)
	{
		gdm_gcxm_xmbm=cf.GB2Uni(gdm_gcxm_xmbm);
		if (!(gdm_gcxm_xmbm.equals("")))	wheresql+=" and  (gdm_gcxm.xmbm='"+gdm_gcxm_xmbm+"')";
	}
	gdm_gcxm_xmmc=request.getParameter("gdm_gcxm_xmmc");
	if (gdm_gcxm_xmmc!=null)
	{
		gdm_gcxm_xmmc=cf.GB2Uni(gdm_gcxm_xmmc);
		if (!(gdm_gcxm_xmmc.equals("")))	wheresql+=" and  (gdm_gcxm.xmmc='"+gdm_gcxm_xmmc+"')";
	}
	gdm_gcxm_xmdlbm=request.getParameter("gdm_gcxm_xmdlbm");
	if (gdm_gcxm_xmdlbm!=null)
	{
		gdm_gcxm_xmdlbm=cf.GB2Uni(gdm_gcxm_xmdlbm);
		if (!(gdm_gcxm_xmdlbm.equals("")))	wheresql+=" and  (gdm_gcxm.xmdlbm='"+gdm_gcxm_xmdlbm+"')";
	}
	gdm_gcxm_xmxlbm=request.getParameter("gdm_gcxm_xmxlbm");
	if (gdm_gcxm_xmxlbm!=null)
	{
		gdm_gcxm_xmxlbm=cf.GB2Uni(gdm_gcxm_xmxlbm);
		if (!(gdm_gcxm_xmxlbm.equals("")))	wheresql+=" and  (gdm_gcxm.xmxlbm='"+gdm_gcxm_xmxlbm+"')";
	}


	ls_sql="SELECT gdm_gcxm.xmbm,gdm_gcxm.xmmc,gdm_xmdlbm.xmdlmc,gdm_xmxlbm.xmxlmc,gdm_gcxm.bz ";
	ls_sql+=" FROM gdm_gcxm,gdm_xmdlbm,gdm_xmxlbm  ";
    ls_sql+=" where gdm_gcxm.xmdlbm=gdm_xmdlbm.xmdlbm(+)";
    ls_sql+=" and gdm_gcxm.xmxlbm=gdm_xmxlbm.xmxlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by gdm_gcxm.xmdlbm,gdm_gcxm.xmxlbm,gdm_gcxm.xmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Gdm_gcxmList.jsp","","","EditGdm_gcxm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xmbm","gdm_gcxm_xmmc","gdm_gcxm_xmdlbm","gdm_gcxm_xmxlbm","gdm_gcxm_bz","gdm_gcxmcfbz_wgjbbm","gdm_gcxmcfbz_xzzwbm","gdm_gcxmcfbz_zgyq","gdm_gcxmcfbz_sgdkf","gdm_gcxmcfbz_sgdfkje","gdm_gcxmcfbz_ygkf","gdm_gcxmcfbz_ygfkje","gdm_gcxmcfbz_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Gdm_gcxmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] xmbm = request.getParameterValues("xmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xmbm,"xmbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from gdm_gcxm where "+chooseitem;
		sql[1]="delete from gdm_gcxmcfbz where "+chooseitem;
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
	<td  width="10%">项目编码</td>
	<td  width="25%">项目名称</td>
	<td  width="15%">项目大类</td>
	<td  width="15%">项目小类</td>
	<td  width="27%">项目备注</td>
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