<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String khbh=request.getParameter("khbh");


	ls_sql="SELECT crm_zxkhxx.khxm,crm_zxkhxx.fwdz,yx_lqlpdj.lpmc,yx_lqlpdj.lpsl,yx_lqlpdj.lqsj,DECODE(yx_lqlpdj.shth,'1','领取','2','退回'),yx_lqlpdj.thdjr,yx_lqlpdj.thdjsj,crm_zxkhxx.sjs,b.dwmc zxdm,yx_lqlpdj.lrr,yx_lqlpdj.lrsj,a.dwmc lrbm,yx_lqlpdj.bz,yx_lqlpdj.khbh";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b,yx_lqlpdj  ";
    ls_sql+=" where yx_lqlpdj.khbh=crm_zxkhxx.khbh and yx_lqlpdj.lrbm=a.dwbh and crm_zxkhxx.zxdm=b.dwbh(+)";
    ls_sql+=" and yx_lqlpdj.khbh='"+khbh+"'";
    ls_sql+=" order by yx_lqlpdj.lqsj,yx_lqlpdj.khbh";

//	out.println(ls_sql);
	
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yx_lqlpdjKhList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_sjs","crm_zxkhxx_zxdm","lpmc","yx_lqlpdj_lpsl","yx_lqlpdj_lqsj","yx_lqlpdj_shth","yx_lqlpdj_lrr","yx_lqlpdj_lrsj","sq_dwxx_dwmc","yx_lqlpdj_bz","yx_lqlpdj_thdjr","yx_lqlpdj_thdjsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh","lpmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"退礼品"};//按钮的显示名称
	String[] buttonLink={"Yx_lqlpdjKhList.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String chooseitem =request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update yx_lqlpdj set shth='2',thdjr='"+yhmc+"',thdjsj=TRUNC(SYSDATE) where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">退礼品</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="4%">客户姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="12%">礼品名称</td>
	<td  width="3%">礼品数量</td>
	<td  width="5%">领取时间</td>
	<td  width="3%">是否退回</td>
	<td  width="3%">退回登记人</td>
	<td  width="5%">退回登记时间</td>
	<td  width="4%">设计师</td>
	<td  width="7%">咨询店面</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="8%">录入部门</td>
	<td  width="19%">备注</td>
	<td  width="4%">客户编号</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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