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
	String ls_sql=null;
	String wheresql="";
	String cl_djj_khbh=null;

	cl_djj_khbh=request.getParameter("khbh");
	if (cl_djj_khbh!=null)
	{
		cl_djj_khbh=cf.GB2Uni(cl_djj_khbh);
		if (!(cl_djj_khbh.equals("")))	wheresql+=" and  (cl_djj.khbh='"+cl_djj_khbh+"')";
	}

	ls_sql="SELECT cl_djj.czxh, DECODE(cl_djj.czzt,'1','未提交','2','已提交','3','已打印','8','作废'), DECODE(cl_djj.sfjm,'1','不申请','2','申请减免'), DECODE(cl_djj.shzt,'1','未审核','2','一级审核','3','二级审核'),DECODE(shjl,'1','同意','2','不同意') shjl,DECODE(ejshjl,'1','同意','2','不同意') ejshjl,crm_khxx.khxm,cl_djj.qye,cl_djj.sqlqsl,cl_djj.sqlqje,cl_djj.sjsl,cl_djj.sjje,cl_djj.ylqze,cl_djj.ylqze-cl_djj.sjje,cl_djj.shr,cl_djj.shsj,cl_djj.shyj,cl_djj.ejshr,cl_djj.ejshsj,cl_djj.ejshyj,cl_djj.dysj,cl_djj.dyr,cl_djj.khbh,crm_khxx.fwdz,sgdmc,sq_dwxx.dwmc  ,cl_djj.lrr,cl_djj.lrsj,cl_djj.bz";
	ls_sql+=" FROM cl_djj,crm_khxx,sq_dwxx,sq_sgd  ";
    ls_sql+=" where cl_djj.dwbh=sq_dwxx.dwbh and cl_djj.khbh=crm_khxx.khbh and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sgdmc,cl_djj.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cl_djjCxList.jsp","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","czxh","cl_djj_khbh","cl_djj_qye","cl_djj_sqlqsl","cl_djj_sqlqje","cl_djj_sjsl","cl_djj_sjje","cl_djj_sfjm","cl_djj_jmyy","cl_djj_shzt","cl_djj_lrr","cl_djj_lrsj","cl_djj_czzt","cl_djj_bz","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"czxh"};
	pageObj.setKey(keyName);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"czxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/fcgl/cl_djj/ViewCl_djj.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("czxh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(340);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">操作序号</td>
	<td  width="2%">操作状态</td>
	<td  width="3%">是否申请减免</td>
	<td  width="3%">减免审核状态</td>
	<td  width="2%">一级审核结论</td>
	<td  width="2%">二级审核结论</td>
	<td  width="3%">客户姓名</td>
	<td  width="3%">签约额</td>
	<td  width="2%">申请领取数量</td>
	<td  width="4%">申请领取金额</td>
	<td  width="2%">实际数量</td>
	<td  width="4%">实际金额</td>
	<td  width="4%">应领取总额</td>
	<td  width="4%">减免金额</td>
	<td  width="2%">一级审核人</td>
	<td  width="3%">一级审核时间</td>
	<td  width="8%">一级审核意见</td>
	<td  width="2%">二级审核人</td>
	<td  width="3%">二级审核时间</td>
	<td  width="8%">二级审核意见</td>
	<td  width="3%">打印时间</td>
	<td  width="2%">打印人</td>
	<td  width="2%">客户编号</td>
	<td  width="8%">房屋地址</td>
	<td  width="2%">施工队</td>
	<td  width="4%">分公司</td>
	<td  width="2%">录入人</td>
	<td  width="3%">录入时间</td>
	<td  width="6%">备注</td>
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
