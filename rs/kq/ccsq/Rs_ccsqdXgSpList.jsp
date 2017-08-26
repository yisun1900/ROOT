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

	ls_sql="SELECT rs_ccsqd.sqxh,DECODE(rs_ccsqd.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),ztmc,a.dwmc fgsbh,rs_ccsqd.ygbh,rs_ccsqd.yhmc, DECODE(rs_ccsqd.xb,'M','男','W','女'),b.dwmc dwbh,rs_ccsqd.xzzwbm,rs_ccsqd.kssj,rs_ccsqd.jzsj,rs_ccsqd.ljts,rs_ccsqd.yysm,rs_ccsqd.sqrq,rs_ccsqd.lrr,rs_ccsqd.lrsj,c.dwmc lrbm,rs_ccsqd.bz,rs_ccsqd.spxh,rs_ccsqd.shr,rs_ccsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_ccsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_ccsqd.fgsbh=a.dwbh(+) and rs_ccsqd.dwbh=b.dwbh(+) and rs_ccsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_ccsqd.shjl=rs_shjlbm.shjl(+) and rs_ccsqd.ztbm=rs_ztbm.ztbm";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_ccsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_ccsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_ccsqd.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_ccsqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ccsqdXgSpList.jsp","","","XgSpRs_ccsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_ccsqd_ygbh","rs_ccsqd_yhmc","rs_ccsqd_xb","rs_ccsqd_yfgsbh","rs_ccsqd_dwbh","rs_ccsqd_xzzwbm","rs_ccsqd_yrzsj","rs_ccsqd_ylzrq","rs_ccsqd_ylzyy","rs_ccsqd_xdwbh","rs_ccsqd_xxzzwbm","rs_ccsqd_xrzyy","rs_ccsqd_lrr","rs_ccsqd_lrsj","rs_ccsqd_lrbm","rs_ccsqd_bz","rs_ccsqd_clzt","rs_ccsqd_ztbm","rs_ccsqd_spxh","rs_ccsqd_shr","rs_ccsqd_shsj","rs_ccsqd_shjl","rs_ccsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审批信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSpRs_ccsqd.jsp?ztbm="+ztbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_ccsqd.jsp";//为列参数：coluParm.link设置超级链接
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
	<td  width="3%">累计天数</td>
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