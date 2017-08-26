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
	<%
	String yy_lr_fgs=null;
	String yy_lrglf_ysbl=null;
	String yy_lrglf_sjsq=null;
	double i=0;
	String yy_lrsj_ysbl=null;
	String yy_lrsj_sjsq=null;
	double j=0;
	String yy_lrgc_qnpj=null;
	String yy_lrgc_bzzs=null;
	double k=0;
	String yy_lrzc_qnpj=null;
	String yy_lrzc_bzzs=null;
	double l=0;
	
	String wheresql="";
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	String date_bs=request.getParameter("date_bs");//本周开始时间
	if(date_bs!=null)
	{
	date_bs=cf.GB2Uni(date_bs);
	if(!(date_bs.equals("")))	wheresql=" and (to_date(yy_lr_lrsj,'YYYY-MM-DD HH24:Mi')>=(to_date('"+date_bs+"','YYYY-MM-DD'))) ";
	}
	String date_be=request.getParameter("date_be");
	if(date_be!=null)
	{
	date_be=cf.GB2Uni(date_be);
	if(!(date_be.equals("")))	wheresql=" and (to_date(yy_lr_lrsj,'YYYY-MM-DD HH24:Mi')>=(to_date('"+date_be+"','YYYY-MM-DD'))) ";
	}
	ls_sql="select yy_lr_fgs,yy_lrglf_ysbl,yy_lrglf_sjsq,to_number(yy_lrglf_ysbl)-to_number(yy_lrglf_sjsq) i,yy_lrsj_ysbl,yy_lrsj_sjsq,to_number(yy_lrsj_ysbl)-to_number(yy_lrsj_sjsq) j,yy_lrgc_qnpj,yy_lrgc_bzzs,to_number(yy_lrgc_qnpj)-to_number(yy_lrgc_bzzs) k,yy_lrzc_qnpj,yy_lrzc_bzzs,to_number(yy_lrzc_qnpj)-to_number(yy_lrzc_bzzs) l";
	ls_sql+=" from Yy_cx";
	ls_sql+=wheresql;
	ls_sql+=" order by yy_lr_fgs";
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yy_lrList.jsp","","","");
	String[] keyName={"fgs"};
	pageObj.setKey(keyName);
	
}
else//非第一次进入此页，不需要初始化
{
	curPage=Integer.parseInt(pageStr);
}
%>

<body>

<table>
<tr height=48>
  <td colspan=21 height=48  align="center">运营关键指标汇总表</td>
</tr>
<tr class=xl96 height=28>
  <td colspan=3 height=28>上周日期：<span>&nbsp; </span>月<span>&nbsp; </span>日至<span>&nbsp; </span>月<span>&nbsp;
  </span>日</td>
  <td colspan=3 height=28>本周日期：<span>&nbsp; </span>月<span>&nbsp; </span>日至<span>&nbsp; </span>月<span>&nbsp;
  </span>日</td>
  </tr>
 <tr height=28 >
  <td width="100px" rowspan=2>分公司</td>
  <td colspan=4>目标客户数量</td>
  <td colspan=4>收取定金数量</td>
  <td colspan=4>设计费</td>
  <td colspan=4>工程产值</td>
  <td colspan=4>主材产值</td>
 </tr>
 <tr>
  <td  width="100px">本月计划</td>
  <td  width="100px">本月累计</td>
  <td  width="100px">本月达成率</td>
  <td  width="100px">本周预计</td>
  <td  width="100px">本月计划</td>
  <td  width="100px">本月累计</td>
  <td  width="100px">本月达成率</td>
  <td  width="100px">本周预计</td>
  <td  width="100px">本月计划</td>
  <td  width="100px">本月累计</td>
  <td  width="100px">本月达成率</td>
  <td  width="100px">本周预计</td>
  <td  width="100px">本月计划</td>
  <td  width="100px">本月累计</td>
  <td  width="100px">本月达成率</td>
  <td  width="100px">本周预计</td>
  <td  width="100px">本月计划</td>
  <td  width="100px">本月累计</td>
  <td  width="100px">本月达成率</td>
  <td  width="100px">本周预计</td>
 </tr>
</table>

</body>

</html>
