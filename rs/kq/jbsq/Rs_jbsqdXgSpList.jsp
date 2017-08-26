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

	ls_sql="SELECT rs_jbsqd.sqxh,DECODE(rs_jbsqd.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),ztmc,a.dwmc fgsbh,rs_jbsqd.ygbh,rs_jbsqd.yhmc, DECODE(rs_jbsqd.xb,'M','男','W','女'),b.dwmc dwbh,rs_jbsqd.xzzwbm,rs_jbsqd.kssj,rs_jbsqd.jzsj,rs_jbsqd.ljts,rs_jbsqd.yysm,rs_jbsqd.sqrq,rs_jbsqd.lrr,rs_jbsqd.lrsj,c.dwmc lrbm,rs_jbsqd.bz,rs_jbsqd.spxh,rs_jbsqd.shr,rs_jbsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_jbsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_jbsqd.fgsbh=a.dwbh(+) and rs_jbsqd.dwbh=b.dwbh(+) and rs_jbsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_jbsqd.shjl=rs_shjlbm.shjl(+) and rs_jbsqd.ztbm=rs_ztbm.ztbm";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_jbsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_jbsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_jbsqd.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_jbsqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_jbsqdXgSpList.jsp","","","XgSpRs_jbsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_jbsqd_ygbh","rs_jbsqd_yhmc","rs_jbsqd_xb","rs_jbsqd_yfgsbh","rs_jbsqd_dwbh","rs_jbsqd_xzzwbm","rs_jbsqd_yrzsj","rs_jbsqd_ylzrq","rs_jbsqd_ylzyy","rs_jbsqd_xdwbh","rs_jbsqd_xxzzwbm","rs_jbsqd_xrzyy","rs_jbsqd_lrr","rs_jbsqd_lrsj","rs_jbsqd_lrbm","rs_jbsqd_bz","rs_jbsqd_clzt","rs_jbsqd_ztbm","rs_jbsqd_spxh","rs_jbsqd_shr","rs_jbsqd_shsj","rs_jbsqd_shjl","rs_jbsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审批信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSpRs_jbsqd.jsp?ztbm="+ztbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_jbsqd.jsp";//为列参数：coluParm.link设置超级链接
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
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">申请序号</td>
	<td  width="3%">处理状态</td>
	<td  width="6%">审批状态</td>
	<td  width="5%">所属分公司</td>
	<td  width="3%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="2%">性别</td>
	<td  width="5%">所属部门</td>
	<td  width="4%">职务</td>

	<td  width="4%">开始时间</td>
	<td  width="4%">截至时间</td>
	<td  width="3%">累计小时</td>
	<td  width="14%">原因说明</td>
	<td  width="4%">申请日期</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="9%">备注</td>
	<td  width="3%">审批序号</td>
	<td  width="3%">审核人</td>
	<td  width="4%">审核时间</td>
	<td  width="4%">审核结论</td>
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