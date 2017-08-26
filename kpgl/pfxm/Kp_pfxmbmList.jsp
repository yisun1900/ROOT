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
	String kp_pfxmbm_pfxmbm=null;
	String kp_pfxmbm_pfxmmc=null;
	String kp_pfxmbm_fz=null;
	String kp_pfxmbm_kpdlbm=null;
	kp_pfxmbm_pfxmbm=request.getParameter("kp_pfxmbm_pfxmbm");
	if (kp_pfxmbm_pfxmbm!=null)
	{
		kp_pfxmbm_pfxmbm=cf.GB2Uni(kp_pfxmbm_pfxmbm);
		if (!(kp_pfxmbm_pfxmbm.equals("")))	wheresql+=" and  (kp_pfxmbm.pfxmbm='"+kp_pfxmbm_pfxmbm+"')";
	}
	kp_pfxmbm_pfxmmc=request.getParameter("kp_pfxmbm_pfxmmc");
	if (kp_pfxmbm_pfxmmc!=null)
	{
		kp_pfxmbm_pfxmmc=cf.GB2Uni(kp_pfxmbm_pfxmmc);
		if (!(kp_pfxmbm_pfxmmc.equals("")))	wheresql+=" and  (kp_pfxmbm.pfxmmc='"+kp_pfxmbm_pfxmmc+"')";
	}
	kp_pfxmbm_fz=request.getParameter("kp_pfxmbm_fz");
	if (kp_pfxmbm_fz!=null)
	{
		kp_pfxmbm_fz=kp_pfxmbm_fz.trim();
		if (!(kp_pfxmbm_fz.equals("")))	wheresql+=" and (kp_pfxmbm.fz="+kp_pfxmbm_fz+") ";
	}
	kp_pfxmbm_kpdlbm=request.getParameter("kp_pfxmbm_kpdlbm");
	if (kp_pfxmbm_kpdlbm!=null)
	{
		kp_pfxmbm_kpdlbm=cf.GB2Uni(kp_pfxmbm_kpdlbm);
		if (!(kp_pfxmbm_kpdlbm.equals("")))	wheresql+=" and  (kp_pfxmbm.kpdlbm='"+kp_pfxmbm_kpdlbm+"')";
	}
	ls_sql="SELECT kp_pfxmbm.pfxmbm,kp_pfxmbm.pfxmmc,kp_pfxmbm.fz,kp_kpdlbm.kpdlmc  ";
	ls_sql+=" FROM kp_kpdlbm,kp_pfxmbm  ";
    ls_sql+=" where kp_pfxmbm.kpdlbm=kp_kpdlbm.kpdlbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_pfxmbm.pfxmbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_pfxmbmList.jsp","SelectKp_pfxmbm.jsp","","EditKp_pfxmbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"pfxmbm","kp_pfxmbm_pfxmmc","kp_pfxmbm_fz","kp_kpdlbm_kpdlmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"pfxmbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Kp_pfxmbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] pfxmbm = request.getParameterValues("pfxmbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(pfxmbm,"pfxmbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from kp_pfxmbm where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="12%">评分项目编码</td>
	<td  width="22%">评分项目名称</td>
	<td  width="12%">分值</td>
	<td  width="22%">对应考评大类</td>
</tr>
<%
	pageObj.displayDateSum();
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