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
	String tzph=null;
	String dqbm=null;
	String ckbh=null;
	String tzr=null;
	String tzrq=null;
	String ssfgs=null;
	String ssbm=null;
	String bz=null;
	tzph=request.getParameter("tzph");
	if (tzph!=null)
	{
		tzph=tzph.trim();
		if (!(tzph.equals("")))	wheresql+=" and (jxc_zltzjl.tzph="+tzph+") ";
	}
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (jxc_zltzjl.dqbm='"+dqbm+"')";
	}
	ckbh=request.getParameter("ckbh");
	if (ckbh!=null)
	{
		ckbh=cf.GB2Uni(ckbh);
		if (!(ckbh.equals("")))	wheresql+=" and  (jxc_zltzjl.ckbh='"+ckbh+"')";
	}
	tzr=request.getParameter("tzr");
	if (tzr!=null)
	{
		tzr=cf.GB2Uni(tzr);
		if (!(tzr.equals("")))	wheresql+=" and  (jxc_zltzjl.tzr='"+tzr+"')";
	}
	tzrq=request.getParameter("tzrq");
	if (tzrq!=null)
	{
		tzrq=tzrq.trim();
		if (!(tzrq.equals("")))	wheresql+="  and (jxc_zltzjl.tzrq>=TO_DATE('"+tzrq+"','YYYY/MM/DD'))";
	}
	tzrq=request.getParameter("tzrq2");
	if (tzrq!=null)
	{
		tzrq=tzrq.trim();
		if (!(tzrq.equals("")))	wheresql+="  and (jxc_zltzjl.tzrq<=TO_DATE('"+tzrq+"','YYYY/MM/DD'))";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (jxc_zltzjl.ssfgs='"+ssfgs+"')";
	}
	ssbm=request.getParameter("ssbm");
	if (ssbm!=null)
	{
		ssbm=cf.GB2Uni(ssbm);
		if (!(ssbm.equals("")))	wheresql+=" and  (jxc_zltzjl.ssbm='"+ssbm+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_zltzjl.bz like '%"+bz+"%')";
	}
	ls_sql="SELECT tzph,dqmc,ckmc,tzr,tzrq,a.dwmc ssfgs,b.dwmc ssbm,jxc_zltzjl.bz  ";
	ls_sql+=" FROM jxc_zltzjl,jxc_ckmc,sq_dwxx a,sq_dwxx b,dm_dqbm ";
    ls_sql+=" where jxc_zltzjl.ckbh=jxc_ckmc.ckbh and jxc_zltzjl.ssfgs=a.dwbh and jxc_zltzjl.ssbm=b.dwbh and jxc_zltzjl.dqbm=dm_dqbm.dqbm ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_zltzjlCxList.jsp","SelectCxJxc_zltzjl.jsp","ViewJxc_zltzjl.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"tzph","dqbm","ckbh","tzr","tzrq","ssfgs","ssbm","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"tzph"};
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
	<td  width="6%">&nbsp;</td>
	<td  width="3%">批号</td>
	<td  width="11%">地区</td>
	<td  width="11%">仓库</td>
	<td  width="8%">调整人</td>
	<td  width="11%">调整日期</td>
	<td  width="11%">分公司</td>
	<td  width="11%">所属部门</td>
	<td  width="15%">备注</td>
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