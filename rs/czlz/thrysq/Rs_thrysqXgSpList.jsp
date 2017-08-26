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

	ls_sql="SELECT rs_thrysq.sqxh,DECODE(rs_thrysq.clzt,'01','等待审批','02','正在审批','03','审批通过','04','审批取消') clzt,ztmc,a.dwmc fgsbh,rs_thrysq.ygbh,rs_thrysq.yhmc,rs_thrysq.bianhao,rs_thrysq.sfzh,rs_thrysq.xzzwbm,rs_thrysq.rzsj,b.dwmc dwbh,rs_thrysq.yysm,rs_thrysq.gzbx,rs_thrysq.wpjjqk,rs_thrysq.sqrq,rs_thrysq.lrr,rs_thrysq.lrsj,c.dwmc lrbm,rs_thrysq.bz,rs_thrysq.spxh,rs_thrysq.shr,rs_thrysq.shsj,shjlmc,rs_thrysq.shyj";
	ls_sql+=" FROM rs_thrysq,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_thrysq.fgsbh=a.dwbh(+) and rs_thrysq.dwbh=b.dwbh(+) and rs_thrysq.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_thrysq.shjl=rs_shjlbm.shjl(+) and rs_thrysq.ztbm=rs_ztbm.ztbm ";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_thrysq.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_thrysq.shr='"+yhmc+"'";
	ls_sql+=" and rs_thrysq.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_thrysq.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_thrysqXgSpList.jsp","","","XgSpRs_thrysq.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_thrysq_ygbh","rs_thrysq_yhmc","rs_thrysq_xb","rs_thrysq_yfgsbh","rs_thrysq_dwbh","rs_thrysq_xzzwbm","rs_thrysq_yrzsj","rs_thrysq_ylzrq","rs_thrysq_ylzyy","rs_thrysq_xdwbh","rs_thrysq_xxzzwbm","rs_thrysq_xrzyy","rs_thrysq_lrr","rs_thrysq_lrsj","rs_thrysq_lrbm","rs_thrysq_bz","rs_thrysq_clzt","rs_thrysq_ztbm","rs_thrysq_spxh","rs_thrysq_shr","rs_thrysq_shsj","rs_thrysq_shjl","rs_thrysq_shyj"};
	pageObj.setDisColName(disColName);
*/


//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审批信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSpRs_thrysq.jsp?ztbm="+ztbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewRs_thrysq.jsp";//为列参数：coluParm.link设置超级链接
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
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">退回人员申请序号</td>
	<td  width="2%">处理状态</td>
	<td  width="4%">审批状态</td>
	<td  width="3%">所属分公司</td>
	<td  width="2%">员工序号</td>
	<td  width="2%">员工名称</td>
	<td  width="2%">工号</td>
	<td  width="4%">身份证号</td>
	<td  width="3%">行政职务</td>
	<td  width="3%">入职日期</td>
	<td  width="4%">所属部门</td>

	<td  width="10%">退回原因</td>
	<td  width="10%">在职期间工作表现</td>
	<td  width="10%">物品交接情况</td>
	<td  width="3%">申请日期</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="7%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="2%">审核人</td>
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