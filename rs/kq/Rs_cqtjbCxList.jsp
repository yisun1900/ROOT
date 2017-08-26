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
	String rs_cqtjb_xh=null;
	String rs_cqtjb_nian=null;
	String rs_cqtjb_yue=null;
	String rs_cqtjb_ygbh=null;
	String rs_cqtjb_bianhao=null;
	String rs_cqtjb_yhmc=null;
	String rs_cqtjb_dwbh=null;
	String ssfgs=null;
	String rs_cqtjb_qqts=null;
	String rs_cqtjb_cqts=null;
	rs_cqtjb_xh=request.getParameter("rs_cqtjb_xh");
	if (rs_cqtjb_xh!=null)
	{
		rs_cqtjb_xh=rs_cqtjb_xh.trim();
		if (!(rs_cqtjb_xh.equals("")))	wheresql+=" and (rs_cqtjb.xh="+rs_cqtjb_xh+") ";
	}
	rs_cqtjb_nian=request.getParameter("rs_cqtjb_nian");
	if (rs_cqtjb_nian!=null)
	{
		rs_cqtjb_nian=cf.GB2Uni(rs_cqtjb_nian);
		if (!(rs_cqtjb_nian.equals("")))	wheresql+=" and  (rs_cqtjb.nian='"+rs_cqtjb_nian+"')";
	}
	rs_cqtjb_yue=request.getParameter("rs_cqtjb_yue");
	if (rs_cqtjb_yue!=null)
	{
		rs_cqtjb_yue=cf.GB2Uni(rs_cqtjb_yue);
		if (!(rs_cqtjb_yue.equals("")))	wheresql+=" and  (rs_cqtjb.yue='"+rs_cqtjb_yue+"')";
	}
	rs_cqtjb_ygbh=request.getParameter("rs_cqtjb_ygbh");
	if (rs_cqtjb_ygbh!=null)
	{
		rs_cqtjb_ygbh=rs_cqtjb_ygbh.trim();
		if (!(rs_cqtjb_ygbh.equals("")))	wheresql+=" and (rs_cqtjb.ygbh="+rs_cqtjb_ygbh+") ";
	}
	rs_cqtjb_bianhao=request.getParameter("rs_cqtjb_bianhao");
	if (rs_cqtjb_bianhao!=null)
	{
		rs_cqtjb_bianhao=cf.GB2Uni(rs_cqtjb_bianhao);
		if (!(rs_cqtjb_bianhao.equals("")))	wheresql+=" and  (rs_cqtjb.bianhao='"+rs_cqtjb_bianhao+"')";
	}
	rs_cqtjb_yhmc=request.getParameter("rs_cqtjb_yhmc");
	if (rs_cqtjb_yhmc!=null)
	{
		rs_cqtjb_yhmc=cf.GB2Uni(rs_cqtjb_yhmc);
		if (!(rs_cqtjb_yhmc.equals("")))	wheresql+=" and  (rs_cqtjb.yhmc='"+rs_cqtjb_yhmc+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (rs_cqtjb.ssfgs='"+ssfgs+"')";

	rs_cqtjb_dwbh=request.getParameter("rs_cqtjb_dwbh");
	if (rs_cqtjb_dwbh!=null)
	{
		rs_cqtjb_dwbh=cf.GB2Uni(rs_cqtjb_dwbh);
		if (!(rs_cqtjb_dwbh.equals("")))	wheresql+=" and  (rs_cqtjb.dwbh='"+rs_cqtjb_dwbh+"')";
	}
	rs_cqtjb_qqts=request.getParameter("rs_cqtjb_qqts");
	if (rs_cqtjb_qqts!=null)
	{
		rs_cqtjb_qqts=rs_cqtjb_qqts.trim();
		if (!(rs_cqtjb_qqts.equals("")))	wheresql+=" and (rs_cqtjb.qqts="+rs_cqtjb_qqts+") ";
	}
	rs_cqtjb_cqts=request.getParameter("rs_cqtjb_cqts");
	if (rs_cqtjb_cqts!=null)
	{
		rs_cqtjb_cqts=rs_cqtjb_cqts.trim();
		if (!(rs_cqtjb_cqts.equals("")))	wheresql+=" and (rs_cqtjb.cqts="+rs_cqtjb_cqts+") ";
	}

	ls_sql="SELECT rs_cqtjb.xh,rs_cqtjb.nian,rs_cqtjb.yue,sq_dwxx.dwmc,rs_cqtjb.ygbh,rs_cqtjb.bianhao,rs_cqtjb.yhmc,rs_cqtjb.qqts,rs_cqtjb.cqts,rs_cqtjb.bz  ";
	ls_sql+=" FROM sq_dwxx,rs_cqtjb  ";
    ls_sql+=" where rs_cqtjb.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
	ls_sql+=" order by rs_cqtjb.nian,rs_cqtjb.yue,rs_cqtjb.ssfgs,rs_cqtjb.dwbh,yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_cqtjbCxList.jsp","SelectCxRs_cqtjb.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","rs_cqtjb_nian","rs_cqtjb_yue","rs_cqtjb_ygbh","rs_cqtjb_bianhao","rs_cqtjb_yhmc","sq_dwxx_dwmc","rs_cqtjb_qqts","rs_cqtjb_cqts","rs_cqtjb_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
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
	<td  width="6%">序号</td>
	<td  width="8%">年</td>
	<td  width="6%">月</td>
	<td  width="14%">所属部门</td>
	<td  width="8%">员工序号</td>
	<td  width="10%">工号</td>
	<td  width="10%">员工姓名</td>
	<td  width="6%">全勤天数</td>
	<td  width="6%">出勤天数</td>
	<td  width="26%">备注</td>
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