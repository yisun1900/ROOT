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
	String ztbm=request.getParameter("ztbm");

	ls_sql="SELECT rs_ecrzsqd.sqxh,DECODE(rs_ecrzsqd.clzt,'00','不需审批','01','等待审批','02','正在审批','03','审批通过','04','审批取消','05','已入职'),ztmc,a.dwmc fgsbh,rs_ecrzsqd.ygbh,rs_ecrzsqd.yhmc, DECODE(rs_ecrzsqd.xb,'M','男','W','女'),b.dwmc yfgsbh,c.dwmc ydwbh,rs_ecrzsqd.yxzzwbm,rs_ecrzsqd.yrzsj,rs_ecrzsqd.ylzrq,rs_ecrzsqd.ylzyy,d.dwmc xdwbh,rs_ecrzsqd.xxzzwbm,rs_ecrzsqd.xrzyy,rs_ecrzsqd.lrr,rs_ecrzsqd.lrsj,e.dwmc lrbm,rs_ecrzsqd.bz,rs_ecrzsqd.spxh,rs_ecrzsqd.shr,rs_ecrzsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_ecrzsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d,sq_dwxx e,rs_ztbm,rs_shjlbm,rs_ecrzspb ";
    ls_sql+=" where rs_ecrzsqd.fgsbh=a.dwbh(+) and rs_ecrzsqd.lrbm=e.dwbh(+) and rs_ecrzsqd.ztbm=rs_ztbm.ztbm(+)";
    ls_sql+=" and rs_ecrzsqd.yfgsbh=b.dwbh(+) and rs_ecrzsqd.ydwbh=c.dwbh(+) and rs_ecrzsqd.xdwbh=d.dwbh(+)";
    ls_sql+=" and rs_ecrzsqd.shjl=rs_shjlbm.shjl(+)";
    ls_sql+=" and rs_ecrzsqd.spxh=rs_ecrzspb.spxh";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_ecrzsqd.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_ecrzsqd.shr='"+yhmc+"'";
	ls_sql+=" and rs_ecrzspb.yztbm='"+ztbm+"'";
	
	ls_sql+=" order by rs_ecrzsqd.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ecrzsqdXgSpList.jsp","","","XgSpRs_ecrzsqd.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//设置每页显示记录数
//	pageObj.setEditStr("审批");
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_ecrzsqd_ygbh","rs_ecrzsqd_yhmc","rs_ecrzsqd_xb","rs_ecrzsqd_yfgsbh","rs_ecrzsqd_ydwbh","rs_ecrzsqd_yxzzwbm","rs_ecrzsqd_yrzsj","rs_ecrzsqd_ylzrq","rs_ecrzsqd_ylzyy","rs_ecrzsqd_xdwbh","rs_ecrzsqd_xxzzwbm","rs_ecrzsqd_xrzyy","rs_ecrzsqd_lrr","rs_ecrzsqd_lrsj","rs_ecrzsqd_lrbm","rs_ecrzsqd_bz","rs_ecrzsqd_clzt","rs_ecrzsqd_ztbm","rs_ecrzsqd_spxh","rs_ecrzsqd_shr","rs_ecrzsqd_shsj","rs_ecrzsqd_shjl","rs_ecrzsqd_shyj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除审批信息"};//按钮的显示名称
	String[] buttonLink={"DeleteSpRs_ecrzsqd.jsp?ztbm="+ztbm};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/rs/ecrzsh/ViewRs_ecrzsqd.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">重新入职申请－修改审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">申请序号</td>
	<td  width="3%">处理状态</td>
	<td  width="5%">审批状态</td>
	<td  width="4%">申报公司</td>
	<td  width="2%">员工序号</td>
	<td  width="2%">员工名称</td>
	<td  width="2%">性别</td>
	<td  width="4%">原分公司</td>
	<td  width="4%">原部门</td>
	<td  width="4%">原职位</td>
	<td  width="3%">上次入职日期</td>
	<td  width="3%">离职日期</td>
	<td  width="12%">离职原因</td>
	<td  width="4%">申请二次入职部门</td>
	<td  width="4%">申请二次入职职位</td>
	<td  width="12%">二次入职原因</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="4%">录入部门</td>
	<td  width="7%">备注</td>
	<td  width="2%">审批序号</td>
	<td  width="2%">审核人</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">审核结论</td>
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