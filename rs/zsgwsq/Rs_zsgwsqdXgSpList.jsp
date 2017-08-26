<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ztbm=request.getParameter("ztbm");

	ls_sql="SELECT rs_zsgwsqd.sqxh,DECODE(rs_zsgwsqd.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消') clzt,ztmc,a.dwmc fgsbh,b.dwmc dwbh,rs_zsgwsqd.zsgwmc,rs_zsgwsqd.zbrs,rs_zsgwsqd.slrq,rs_zsgwsqd.sqzbly,rs_zsgwsqd.bmryjg,rs_zsgwsqd.zbgwzn,rs_zsgwsqd.zbgwxcfw,rs_zsgwsqd.sqrq,rs_zsgwsqd.lrr,rs_zsgwsqd.lrsj,c.dwmc lrbm,rs_zsgwsqd.bz,rs_zsgwsqd.spxh,rs_zsgwsqd.shr,rs_zsgwsqd.shsj,shjlmc,rs_zsgwsqd.shyj";
	ls_sql+=" FROM rs_zsgwsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_zsgwsqd.fgsbh=a.dwbh(+) and rs_zsgwsqd.dwbh=b.dwbh(+) and rs_zsgwsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_zsgwsqd.shjl=rs_shjlbm.shjl(+) and rs_zsgwsqd.ztbm=rs_ztbm.ztbm(+)";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_zsgwsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_zsgwsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_zsgwsqd.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_zsgwsqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_zsgwsqdXgSpList.jsp","","","XgSpRs_zsgwsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_zsgwsqd_ygbh","rs_zsgwsqd_yhmc","rs_zsgwsqd_xb","rs_zsgwsqd_yfgsbh","rs_zsgwsqd_dwbh","rs_zsgwsqd_xzzwbm","rs_zsgwsqd_yrzsj","rs_zsgwsqd_ylzrq","rs_zsgwsqd_ylzyy","rs_zsgwsqd_xdwbh","rs_zsgwsqd_xxzzwbm","rs_zsgwsqd_xrzyy","rs_zsgwsqd_lrr","rs_zsgwsqd_lrsj","rs_zsgwsqd_lrbm","rs_zsgwsqd_bz","rs_zsgwsqd_clzt","rs_zsgwsqd_ztbm","rs_zsgwsqd_spxh","rs_zsgwsqd_shr","rs_zsgwsqd_shsj","rs_zsgwsqd_shjl","rs_zsgwsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审批信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSpRs_zsgwsqd.jsp?ztbm="+ztbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_zsgwsqd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sqxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
/*
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
  <B><font size="3">修改审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(440);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">申请序号</td>
	<td  width="2%">处理状态</td>
	<td  width="5%">审批状态</td>
	<td  width="3%">申报公司</td>
	<td  width="3%">增设岗位部门</td>
	<td  width="4%">增设岗位名称</td>
	<td  width="2%">增补人数</td>
	<td  width="2%">设立日期</td>
	<td  width="12%">申请增补理由</td>
	<td  width="11%">增补部门人员结构</td>
	<td  width="11%">增补岗位职能</td>
	<td  width="7%">增补岗位薪酬范围</td>

	<td  width="2%">申请日期</td>
	<td  width="2%">录入人</td>
	<td  width="2%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="8%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="2%">审核人</td>
	<td  width="2%">审核时间</td>
	<td  width="2%">审核结论</td>
	<td  width="8%">审核意见</td>
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