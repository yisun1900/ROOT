<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.DBPageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

	
	
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String FBillNo=null;
	FBillNo=request.getParameter("FBillNo");
	if (FBillNo!=null)
	{
		if (!(FBillNo.equals("")))	wheresql+=" and  (SEOrder.FBillNo='"+FBillNo+"')";
	}
	
	
	String FName=null;
	FName=request.getParameter("FName");
	if (FName!=null)
	{
		FName=cf.GB2Uni(FName);
		if (!(FName.equals("")))	wheresql+=" and  (t_Organization.FName  like '%"+FName+"%') or (t_Organization.FNameEN  like '%"+FName+"%')";
	}
	
	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (SEOrder.clgw  like '%"+clgw+"%')";
	}

	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (SEOrder.xmzy  like '%"+xmzy+"%')";
	}

	String ztjjgw=null;
	ztjjgw=request.getParameter("ztjjgw");
	if (ztjjgw!=null)
	{
		ztjjgw=cf.GB2Uni(ztjjgw);
		if (!(ztjjgw.equals("")))	wheresql+=" and  (SEOrder.ztjjgw  like '%"+ztjjgw+"%')";
	}

	String ddqrr=null;
	ddqrr=request.getParameter("ddqrr");
	if (ddqrr!=null)
	{
		ddqrr=cf.GB2Uni(ddqrr);
		if (!(ddqrr.equals("")))	wheresql+=" and  (SEOrder.ddqrr  like '%"+ddqrr+"%')";
	}
  
	
	//购货时间
	String FDate=null;
	FDate=request.getParameter("FDate");
	if (FDate!=null)
	{
		if (!(FDate.equals("")))	wheresql+="  and (SEOrder.FDate>=cast('"+FDate+"' as datetime))";
	}
	FDate=request.getParameter("FDate2");
	if (FDate!=null)
	{
		if (!(FDate.equals("")))	wheresql+="  and (SEOrder.FDate<=cast('"+FDate+"' as datetime))";
	}
	
	//订单确认时间
	String ddqrsj=null;
	ddqrsj=request.getParameter("ddqrsj");
	if (ddqrsj!=null)
	{
		if (!(ddqrsj.equals("")))	wheresql+="  and (SEOrder.ddqrsj>=cast('"+ddqrsj+"' as datetime))";
	}
	ddqrsj=request.getParameter("ddqrsj2");
	if (ddqrsj!=null)
	{
		if (!(ddqrsj.equals("")))	wheresql+="  and (SEOrder.ddqrsj<=cast('"+ddqrsj+"' as datetime))";
	}
	//计划测量时间
	String jhclsj=null;
	jhclsj=request.getParameter("jhclsj");
	if (jhclsj!=null)
	{
		if (!(jhclsj.equals("")))	wheresql+="  and (SEOrder.jhclsj>=cast('"+jhclsj+"' as datetime))";
	}
	jhclsj=request.getParameter("jhclsj2");
	if (jhclsj!=null)
	{
		if (!(jhclsj.equals("")))	wheresql+="  and (SEOrder.jhclsj<=cast('"+jhclsj+"' as datetime))";
	}
	//实际测量时间
	String sjclsj=null;
	sjclsj=request.getParameter("sjclsj");
	if (sjclsj!=null)
	{
		if (!(sjclsj.equals("")))	wheresql+="  and (SEOrder.sjclsj>=cast('"+sjclsj+"' as datetime))";
	}
	sjclsj=request.getParameter("sjclsj2");
	if (sjclsj!=null)
	{
		if (!(sjclsj.equals("")))	wheresql+="  and (SEOrder.sjclsj<=cast('"+sjclsj+"' as datetime))";
	}
	//计划送货时间
	String htshsj=null;
	htshsj=request.getParameter("htshsj");
	if (htshsj!=null)
	{
		if (!(htshsj.equals("")))	wheresql+="  and (SEOrder.htshsj>=cast('"+htshsj+"' as datetime))";
	}
	htshsj=request.getParameter("htshsj2");
	if (htshsj!=null)
	{
		if (!(htshsj.equals("")))	wheresql+="  and (SEOrder.htshsj<=cast('"+htshsj+"' as datetime))";
	}
	//计划送货时间
	String jhshsj=null;
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		if (!(jhshsj.equals("")))	wheresql+="  and (SEOrder.jhshsj>=cast('"+jhshsj+"' as datetime))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		if (!(jhshsj.equals("")))	wheresql+="  and (SEOrder.jhshsj<=cast('"+jhshsj+"' as datetime))";
	}
	//通知送货时间
	String tzshsj=null;
	tzshsj=request.getParameter("tzshsj");
	if (tzshsj!=null)
	{
		tzshsj=tzshsj.trim();
		if (!(tzshsj.equals("")))	wheresql+="  and (SEOrder.tzshsj>=cast('"+tzshsj+"' as datetime))";
	}
	tzshsj=request.getParameter("tzshsj2");
	if (tzshsj!=null)
	{
		tzshsj=tzshsj.trim();
		if (!(tzshsj.equals("")))	wheresql+="  and (SEOrder.tzshsj<=cast('"+tzshsj+"' as datetime))";
	}
	//实际送货时间
	String sshsj=null;
	sshsj=request.getParameter("sshsj");
	if (sshsj!=null)
	{
		sshsj=sshsj.trim();
		if (!(sshsj.equals("")))	wheresql+="  and (SEOrder.sshsj>=cast('"+sshsj+"' as datetime))";
	}
	sshsj=request.getParameter("sshsj2");
	if (sshsj!=null)
	{
		sshsj=sshsj.trim();
		if (!(sshsj.equals("")))	wheresql+="  and (SEOrder.sshsj<=cast('"+sshsj+"' as datetime))";
	}



	ls_sql="SELECT   '<a href =\"ViewOrderEntry.jsp?FBillNo='||FBillNo||'\" target=\"_back\">'||FBillNo||'</a>' FBillNo,FName,FDate,clgw,ztjjgw,xmzy,ddqrr,ddqrsj,gysjslrr,gysjslrsj,jhclsj,tzclsj,cltzr,sclsj,sclr,htshsj,jhshsj,tzry,tzshsj,tzshr,shtzsm,sshsj,sshr,shqk,tztbhsj,tztbhr,tbhtzry,jhtbhsj,stbhsj,stbhr,tbhqk,ycyybm,ycsm,ycclzt,zsycyybm,ychsqk,ychsr,ychssj,clzt,lsclzt,wjlrr,wjsj,sfydy,dysj";
	ls_sql+=" FROM SEOrder ,t_Organization  ";
	ls_sql+=" where FCustID=FNumber ";
	
	//ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh";
	//ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
	//ls_sql+=" and jc_zcdd.clzt in('00','03','05')";
	
    ls_sql+=wheresql;
    ls_sql+=" order by FBillNo";

	System.out.println(ls_sql);

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("DdList.jsp","","","","sqlserver","sa","");

/*
//设置显示列
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","xmzy","jkxz","jkdd","ddshbz","hkze","xclbz","clzt","lrsj","dwbh","bz","xmzy","crm_khxx_lxfs"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"FBillNo"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"FBillNo"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewOrderEntry.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("FBillNo",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">存货--查询</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td nowrap >订单编号</td>
	<td nowrap>客户名称</td>
	<td nowrap>购货日期</td>
	<td nowrap>驻店家居顾问</td>
<td nowrap>展厅家居顾问</td>
<td nowrap>项目专员</td>
<td nowrap>订单确认人</td>
<td nowrap>订单确认时间</td>
<td nowrap>供应商接收录入人</td>
<td nowrap>供应商接收录入时间</td>

<td nowrap>计划测量时间</td>
<td nowrap>通知测量时间</td>
<td nowrap>测量通知人</td>
<td nowrap>实测量时间</td>
<td nowrap>实测量人</td>
<td nowrap>合同送货时间</td>
<td nowrap>计划送货时间</td>
<td nowrap>通知送货人员</td>
<td nowrap>发送货通知时间</td>
<td nowrap>发送货通知人</td>
<td nowrap>送货通知说明</td>
<td nowrap>实送货时间</td>
<td nowrap>实送货人</td>
<td nowrap>送货情况</td>
<td nowrap>发退补货通知时间</td>
<td nowrap>发退补货通知人</td>
<td nowrap>退补货通知人员</td>
<td nowrap>约定退补货时间</td>
<td nowrap>实退补货时间</td>
<td nowrap>实退补货人</td>
<td nowrap>退补货情况</td>
<td nowrap>延迟原因编码</td>
<td nowrap>延迟说明</td>
<td nowrap>延迟处理状态</td>
<td nowrap>真实延迟原因编码</td>
<td nowrap>延迟核实情况</td>
<td nowrap>延迟核实人</td>
<td nowrap>延迟核实时间</td>

<td nowrap>处理状态</td>
<td nowrap>临时处理状态</td>
<td nowrap>完结录入人</td>
<td nowrap>完结时间</td>
<td nowrap>是否已打印</td>
<td nowrap>打印时间</td>

</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

</table>
</form> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
