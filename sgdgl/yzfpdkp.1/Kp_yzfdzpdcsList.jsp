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
	String kp_yzfdzpdcs_ssfgs=null;
	String kp_yzfdzpdcs_pjde=null;
	String kp_yzfdzpdcs_grs=null;
	String kp_yzfdzpdcs_zbj=null;
	String kp_yzfdzpdcs_khmyd=null;
	String kp_yzfdzpdcs_zxzsgds=null;
	String kp_yzfdzpdcs_zdzsgds=null;
	kp_yzfdzpdcs_ssfgs=request.getParameter("kp_yzfdzpdcs_ssfgs");
	if (kp_yzfdzpdcs_ssfgs!=null)
	{
		kp_yzfdzpdcs_ssfgs=cf.GB2Uni(kp_yzfdzpdcs_ssfgs);
		if (!(kp_yzfdzpdcs_ssfgs.equals("")))	wheresql+=" and  (kp_yzfdzpdcs.ssfgs='"+kp_yzfdzpdcs_ssfgs+"')";
	}
	kp_yzfdzpdcs_pjde=request.getParameter("kp_yzfdzpdcs_pjde");
	if (kp_yzfdzpdcs_pjde!=null)
	{
		kp_yzfdzpdcs_pjde=kp_yzfdzpdcs_pjde.trim();
		if (!(kp_yzfdzpdcs_pjde.equals("")))	wheresql+=" and  (kp_yzfdzpdcs.pjde="+kp_yzfdzpdcs_pjde+") ";
	}
	kp_yzfdzpdcs_grs=request.getParameter("kp_yzfdzpdcs_grs");
	if (kp_yzfdzpdcs_grs!=null)
	{
		kp_yzfdzpdcs_grs=kp_yzfdzpdcs_grs.trim();
		if (!(kp_yzfdzpdcs_grs.equals("")))	wheresql+=" and (kp_yzfdzpdcs.grs="+kp_yzfdzpdcs_grs+") ";
	}
	kp_yzfdzpdcs_zbj=request.getParameter("kp_yzfdzpdcs_zbj");
	if (kp_yzfdzpdcs_zbj!=null)
	{
		kp_yzfdzpdcs_zbj=kp_yzfdzpdcs_zbj.trim();
		if (!(kp_yzfdzpdcs_zbj.equals("")))	wheresql+=" and  (kp_yzfdzpdcs.zbj="+kp_yzfdzpdcs_zbj+") ";
	}
	kp_yzfdzpdcs_khmyd=request.getParameter("kp_yzfdzpdcs_khmyd");
	if (kp_yzfdzpdcs_khmyd!=null)
	{
		kp_yzfdzpdcs_khmyd=kp_yzfdzpdcs_khmyd.trim();
		if (!(kp_yzfdzpdcs_khmyd.equals("")))	wheresql+=" and  (kp_yzfdzpdcs.khmyd="+kp_yzfdzpdcs_khmyd+") ";
	}
	kp_yzfdzpdcs_zxzsgds=request.getParameter("kp_yzfdzpdcs_zxzsgds");
	if (kp_yzfdzpdcs_zxzsgds!=null)
	{
		kp_yzfdzpdcs_zxzsgds=kp_yzfdzpdcs_zxzsgds.trim();
		if (!(kp_yzfdzpdcs_zxzsgds.equals("")))	wheresql+=" and (kp_yzfdzpdcs.zxzsgds="+kp_yzfdzpdcs_zxzsgds+") ";
	}
	kp_yzfdzpdcs_zdzsgds=request.getParameter("kp_yzfdzpdcs_zdzsgds");
	if (kp_yzfdzpdcs_zdzsgds!=null)
	{
		kp_yzfdzpdcs_zdzsgds=kp_yzfdzpdcs_zdzsgds.trim();
		if (!(kp_yzfdzpdcs_zdzsgds.equals("")))	wheresql+=" and (kp_yzfdzpdcs.zdzsgds="+kp_yzfdzpdcs_zdzsgds+") ";
	}
	ls_sql="SELECT kp_yzfdzpdcs.ssfgs,sq_dwxx.dwmc,kp_yzfdzpdcs.pjde,kp_yzfdzpdcs.grs,kp_yzfdzpdcs.zbj,kp_yzfdzpdcs.khmyd,kp_yzfdzpdcs.zxzsgds,kp_yzfdzpdcs.zdzsgds  ";
	ls_sql+=" FROM kp_yzfdzpdcs,sq_dwxx  ";
    ls_sql+=" where kp_yzfdzpdcs.ssfgs=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_yzfdzpdcs.ssfgs";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_yzfdzpdcsList.jsp","SelectKp_yzfdzpdcs.jsp","","EditKp_yzfdzpdcs.jsp");
	pageObj.setPageRow(1000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ssfgs","sq_dwxx_dwmc","kp_yzfdzpdcs_pjde","kp_yzfdzpdcs_grs","kp_yzfdzpdcs_zbj","kp_yzfdzpdcs_khmyd","kp_yzfdzpdcs_zxzsgds","kp_yzfdzpdcs_zdzsgds"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ssfgs"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Kp_yzfdzpdcsList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] ssfgs = request.getParameterValues("ssfgs");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ssfgs,"ssfgs"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from kp_yzfdzpdcs where "+chooseitem;
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
	<td  width="10%">分公司</td>
	<td  width="18%">分公司</td>
	<td  width="12%">上一年度的平均单额</td>
	<td  width="10%">班组工人最小值</td>
	<td  width="12%">质保金最小值</td>
	<td  width="10%">客户满意度最小值</td>
	<td  width="10%">班组最小在施工地数</td>
	<td  width="10%">班组最大在施工地数</td>
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