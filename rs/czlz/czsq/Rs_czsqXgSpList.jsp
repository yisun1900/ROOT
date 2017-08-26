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

	ls_sql="SELECT rs_czsq.sqxh,DECODE(rs_czsq.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消','05','已离职') clzt,ztmc,a.dwmc fgsbh,rs_czsq.ygbh,rs_czsq.yhmc,rs_czsq.bianhao,rs_czsq.sfzh,rs_czsq.xzzwbm,rs_czsq.rzsj,b.dwmc dwbh,lzyyflmc,rs_czsq.yysm,rs_czsq.sqrq,rs_czsq.lrr,rs_czsq.lrsj,c.dwmc lrbm,rs_czsq.bz,rs_czsq.spxh,rs_czsq.shr,rs_czsq.shsj,shjlmc,rs_czsq.shyj";
	ls_sql+=" FROM rs_czsq,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm,dm_lzyyflbm,rs_czsqspb ";
    ls_sql+=" where rs_czsq.fgsbh=a.dwbh(+) and rs_czsq.dwbh=b.dwbh(+) and rs_czsq.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_czsq.shjl=rs_shjlbm.shjl(+) and rs_czsq.ztbm=rs_ztbm.ztbm and rs_czsq.lzyyflbm=dm_lzyyflbm.lzyyflbm(+)";
    ls_sql+=" and rs_czsq.spxh=rs_czsqspb.spxh";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_czsq.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_czsq.shr='"+yhmc+"'";
	ls_sql+=" and rs_czsqspb.yztbm='"+ztbm+"'";

	ls_sql+=" order by rs_czsq.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_czsqXgSpList.jsp","","","XgSpRs_czsq.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_czsq_ygbh","rs_czsq_yhmc","rs_czsq_xb","rs_czsq_yfgsbh","rs_czsq_dwbh","rs_czsq_xzzwbm","rs_czsq_yrzsj","rs_czsq_ylzrq","rs_czsq_ylzyy","rs_czsq_xdwbh","rs_czsq_xxzzwbm","rs_czsq_xrzyy","rs_czsq_lrr","rs_czsq_lrsj","rs_czsq_lrbm","rs_czsq_bz","rs_czsq_clzt","rs_czsq_ztbm","rs_czsq_spxh","rs_czsq_shr","rs_czsq_shsj","rs_czsq_shjl","rs_czsq_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审批信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSpRs_czsq.jsp?ztbm="+ztbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_czsq.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">辞职申请－修改审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">辞职申请序号</td>
	<td  width="3%">处理状态</td>
	<td  width="5%">审批状态</td>
	<td  width="4%">所属分公司</td>
	<td  width="2%">员工序号</td>
	<td  width="3%">员工名称</td>
	<td  width="3%">工号</td>
	<td  width="5%">身份证号</td>
	<td  width="3%">行政职务</td>
	<td  width="3%">入职日期</td>
	<td  width="5%">所属部门</td>

	<td  width="4%">离职原因分类</td>
	<td  width="13%">离职原因</td>
	<td  width="3%">申请日期</td>
	<td  width="3%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="5%">录入部门</td>
	<td  width="8%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="3%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核结论</td>
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