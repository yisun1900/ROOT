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
	String jc_mmsys_wjjbm=null;
	String jc_mmsys_mmsysbm=null;
	String jc_mmsys_bm=null;
	jc_mmsys_wjjbm=request.getParameter("jc_mmsys_wjjbm");
	if (jc_mmsys_wjjbm!=null)
	{
		jc_mmsys_wjjbm=cf.GB2Uni(jc_mmsys_wjjbm);
		if (!(jc_mmsys_wjjbm.equals("")))	wheresql+=" and  (jc_mmsys.wjjbm='"+jc_mmsys_wjjbm+"')";
	}
	jc_mmsys_mmsysbm=request.getParameter("jc_mmsys_mmsysbm");
	if (jc_mmsys_mmsysbm!=null)
	{
		jc_mmsys_mmsysbm=cf.GB2Uni(jc_mmsys_mmsysbm);
		if (!(jc_mmsys_mmsysbm.equals("")))	wheresql+=" and  (jc_mmsys.mmsysbm='"+jc_mmsys_mmsysbm+"')";
	}
	jc_mmsys_bm=request.getParameter("jc_mmsys_bm");
	if (jc_mmsys_bm!=null)
	{
		jc_mmsys_bm=cf.GB2Uni(jc_mmsys_bm);
		if (!(jc_mmsys_bm.equals("")))	wheresql+=" and  (jc_mmsys.bm='"+jc_mmsys_bm+"')";
	}
	ls_sql="SELECT jc_mmsys.wjjbm as wjjbm,jdm_wjjbm.wjjmc as jdm_wjjbm_wjjmc,jc_mmsys.mmsysbm as mmsysbm,jdm_mmsysbm.mmsysmc as jdm_mmsysbm_mmsysmc,jc_mmsys.bm as jc_mmsys_bm  ";
	ls_sql+=" FROM jdm_wjjbm,jdm_mmsysbm,jc_mmsys  ";
    ls_sql+=" where jc_mmsys.wjjbm=jdm_wjjbm.wjjbm and jc_mmsys.mmsysbm=jdm_mmsysbm.mmsysbm";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_mmsys.wjjbm,jc_mmsys.mmsysbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_mmsysCxList.jsp","SelectCxJc_mmsys.jsp","","");
	pageObj.setPageRow(200);//设置每页显示记录数
//设置显示列
	String[] disColName={"jdm_wjjbm_wjjmc","jdm_mmsysbm_mmsysmc","jc_mmsys_bm"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"wjjbm","mmsysbm"};
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
	<td  width="20%">五金件</td>
	<td  width="20%">锁颜色</td>
	<td  width="20%">编码</td>
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