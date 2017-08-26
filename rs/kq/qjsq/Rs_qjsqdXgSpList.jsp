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

	ls_sql="SELECT rs_qjsqd.sqxh,DECODE(rs_qjsqd.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消'),ztmc,a.dwmc fgsbh,rs_qjsqd.ygbh,rs_qjsqd.yhmc, DECODE(rs_qjsqd.xb,'M','男','W','女'),b.dwmc dwbh,rs_qjsqd.xzzwbm,rs_qjsqd.kssj,rs_qjsqd.jzsj,rs_qjsqd.ljts,rs_qjsqd.yysm,rs_qjsqd.sqrq,rs_qjsqd.lrr,rs_qjsqd.lrsj,c.dwmc lrbm,rs_qjsqd.bz,rs_qjsqd.spxh,rs_qjsqd.shr,rs_qjsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_qjsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_qjsqd.fgsbh=a.dwbh(+) and rs_qjsqd.dwbh=b.dwbh(+) and rs_qjsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_qjsqd.shjl=rs_shjlbm.shjl(+) and rs_qjsqd.ztbm=rs_ztbm.ztbm";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_qjsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_qjsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_qjsqd.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_qjsqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_qjsqdXgSpList.jsp","","","XgSpRs_qjsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_qjsqd_ygbh","rs_qjsqd_yhmc","rs_qjsqd_xb","rs_qjsqd_yfgsbh","rs_qjsqd_dwbh","rs_qjsqd_xzzwbm","rs_qjsqd_yrzsj","rs_qjsqd_ylzrq","rs_qjsqd_ylzyy","rs_qjsqd_xdwbh","rs_qjsqd_xxzzwbm","rs_qjsqd_xrzyy","rs_qjsqd_lrr","rs_qjsqd_lrsj","rs_qjsqd_lrbm","rs_qjsqd_bz","rs_qjsqd_clzt","rs_qjsqd_ztbm","rs_qjsqd_spxh","rs_qjsqd_shr","rs_qjsqd_shsj","rs_qjsqd_shjl","rs_qjsqd_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审批信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSpRs_qjsqd.jsp?ztbm="+ztbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_qjsqd.jsp";//为列参数：coluParm.link设置超级链接
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