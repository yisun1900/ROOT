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
	String jxc_kcjz_jzph=null;
	String jxc_kcjz_ckbh=null;
	String jxc_kcjz_zcpzsl=null;
	String jxc_kcjz_zcpzjg=null;
	String jxc_kcjz_ccpzsl=null;
	String jxc_kcjz_ccpzje=null;
	String jxc_kcjz_bfpzsl=null;
	String jxc_kcjz_bfpzje=null;
	String jxc_kcjz_jzrq=null;
	jxc_kcjz_jzph=request.getParameter("jxc_kcjz_jzph");
	if (jxc_kcjz_jzph!=null)
	{
		jxc_kcjz_jzph=cf.GB2Uni(jxc_kcjz_jzph);
		if (!(jxc_kcjz_jzph.equals("")))	wheresql+=" and  (jxc_kcjz.jzph='"+jxc_kcjz_jzph+"')";
	}
	jxc_kcjz_ckbh=request.getParameter("jxc_kcjz_ckbh");
	if (jxc_kcjz_ckbh!=null)
	{
		jxc_kcjz_ckbh=cf.GB2Uni(jxc_kcjz_ckbh);
		if (!(jxc_kcjz_ckbh.equals("")))	wheresql+=" and  (jxc_kcjz.ckbh='"+jxc_kcjz_ckbh+"')";
	}
	jxc_kcjz_zcpzsl=request.getParameter("jxc_kcjz_zcpzsl");
	if (jxc_kcjz_zcpzsl!=null)
	{
		jxc_kcjz_zcpzsl=jxc_kcjz_zcpzsl.trim();
		if (!(jxc_kcjz_zcpzsl.equals("")))	wheresql+=" and (jxc_kcjz.zcpzsl="+jxc_kcjz_zcpzsl+") ";
	}
	jxc_kcjz_zcpzjg=request.getParameter("jxc_kcjz_zcpzjg");
	if (jxc_kcjz_zcpzjg!=null)
	{
		jxc_kcjz_zcpzjg=jxc_kcjz_zcpzjg.trim();
		if (!(jxc_kcjz_zcpzjg.equals("")))	wheresql+=" and  (jxc_kcjz.zcpzjg="+jxc_kcjz_zcpzjg+") ";
	}
	jxc_kcjz_ccpzsl=request.getParameter("jxc_kcjz_ccpzsl");
	if (jxc_kcjz_ccpzsl!=null)
	{
		jxc_kcjz_ccpzsl=jxc_kcjz_ccpzsl.trim();
		if (!(jxc_kcjz_ccpzsl.equals("")))	wheresql+=" and (jxc_kcjz.ccpzsl="+jxc_kcjz_ccpzsl+") ";
	}
	jxc_kcjz_ccpzje=request.getParameter("jxc_kcjz_ccpzje");
	if (jxc_kcjz_ccpzje!=null)
	{
		jxc_kcjz_ccpzje=jxc_kcjz_ccpzje.trim();
		if (!(jxc_kcjz_ccpzje.equals("")))	wheresql+=" and  (jxc_kcjz.ccpzje="+jxc_kcjz_ccpzje+") ";
	}
	jxc_kcjz_bfpzsl=request.getParameter("jxc_kcjz_bfpzsl");
	if (jxc_kcjz_bfpzsl!=null)
	{
		jxc_kcjz_bfpzsl=jxc_kcjz_bfpzsl.trim();
		if (!(jxc_kcjz_bfpzsl.equals("")))	wheresql+=" and (jxc_kcjz.bfpzsl="+jxc_kcjz_bfpzsl+") ";
	}
	jxc_kcjz_bfpzje=request.getParameter("jxc_kcjz_bfpzje");
	if (jxc_kcjz_bfpzje!=null)
	{
		jxc_kcjz_bfpzje=jxc_kcjz_bfpzje.trim();
		if (!(jxc_kcjz_bfpzje.equals("")))	wheresql+=" and  (jxc_kcjz.bfpzje="+jxc_kcjz_bfpzje+") ";
	}
	jxc_kcjz_jzrq=request.getParameter("jxc_kcjz_jzrq");
	if (jxc_kcjz_jzrq!=null)
	{
		jxc_kcjz_jzrq=jxc_kcjz_jzrq.trim();
		if (!(jxc_kcjz_jzrq.equals("")))	wheresql+="  and (jxc_kcjz.jzrq=TO_DATE('"+jxc_kcjz_jzrq+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT jxc_kcjz.jzph,ckmc,jxc_kcjz.zcpzsl,jxc_kcjz.zcpzjg,jxc_kcjz.ccpzsl,jxc_kcjz.ccpzje,jxc_kcjz.bfpzsl,jxc_kcjz.bfpzje,jxc_kcjz.jzrq  ";
	ls_sql+=" FROM jxc_kcjz,jxc_ckmc  ";
    ls_sql+=" where jxc_kcjz.ckbh=jxc_ckmc.ckbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_kcjzCxList.jsp","SelectCxJxc_kcjz.jsp","ViewJxc_kcjz.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jzph","jxc_kcjz_ckbh","jxc_kcjz_zcpzsl","jxc_kcjz_zcpzjg","jxc_kcjz_ccpzsl","jxc_kcjz_ccpzje","jxc_kcjz_bfpzsl","jxc_kcjz_bfpzje","jxc_kcjz_jzrq"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jzph"};
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
	<td  width="4%">&nbsp;</td>
	<td  width="8%">结转批号</td>
	<td  width="11%">仓库名称</td>
	<td  width="11%">正常品总数量</td>
	<td  width="14%">正常品总金额</td>
	<td  width="9%">残次品总数量</td>
	<td  width="12%">残次品总金额</td>
	<td  width="9%">报废品总数量</td>
	<td  width="12%">报废品总金额</td>
	<td  width="10%">结转日期</td>
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