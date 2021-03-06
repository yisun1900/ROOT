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
	String kp_sxgdjl_sxjlh=null;
	String kp_sxgdjl_yhdlm=null;
	String kp_sxgdjl_sxsj=null;
	kp_sxgdjl_sxjlh=request.getParameter("kp_sxgdjl_sxjlh");
	if (kp_sxgdjl_sxjlh!=null)
	{
		kp_sxgdjl_sxjlh=kp_sxgdjl_sxjlh.trim();
		if (!(kp_sxgdjl_sxjlh.equals("")))	wheresql+=" and (kp_sxgdjl.sxjlh="+kp_sxgdjl_sxjlh+") ";
	}
	kp_sxgdjl_yhdlm=request.getParameter("kp_sxgdjl_yhdlm");
	if (kp_sxgdjl_yhdlm!=null)
	{
		kp_sxgdjl_yhdlm=cf.GB2Uni(kp_sxgdjl_yhdlm);
		if (!(kp_sxgdjl_yhdlm.equals("")))	wheresql+=" and  (kp_sxgdjl.yhdlm='"+kp_sxgdjl_yhdlm+"')";
	}
	kp_sxgdjl_sxsj=request.getParameter("kp_sxgdjl_sxsj");
	if (kp_sxgdjl_sxsj!=null)
	{
		kp_sxgdjl_sxsj=kp_sxgdjl_sxsj.trim();
		if (!(kp_sxgdjl_sxsj.equals("")))	wheresql+="  and (kp_sxgdjl.sxsj>=TO_DATE('"+kp_sxgdjl_sxsj+"','YYYY/MM/DD'))";
	}
	kp_sxgdjl_sxsj=request.getParameter("kp_sxgdjl_sxsj2");
	if (kp_sxgdjl_sxsj!=null)
	{
		kp_sxgdjl_sxsj=kp_sxgdjl_sxsj.trim();
		if (!(kp_sxgdjl_sxsj.equals("")))	wheresql+="  and (kp_sxgdjl.sxsj<=TO_DATE('"+kp_sxgdjl_sxsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT kp_sxgdjl.sxjlh,sq_yhxx.yhmc,kp_sxgdjl.sxsj,kp_sxgdjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,crm_khxx.sjs,crm_khxx.qyrq,crm_khxx.kgrq,crm_khxx.sjkgrq,crm_khxx.jgrq,sgdmc,crm_khxx.zjxm  ";
	ls_sql+=" FROM crm_khxx,kp_sxgdjl,sq_yhxx,sq_sgd  ";
    ls_sql+=" where kp_sxgdjl.yhdlm=sq_yhxx.yhdlm(+) and kp_sxgdjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_sxgdjl.sxjlh  desc,crm_khxx.khxm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_sxgdjlCxList.jsp","SelectCxKp_sxgdjl.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sxjlh","khbh","sq_yhxx_yhmc","kp_sxgdjl_sxsj","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_kgrq","crm_khxx_sjkgrq","crm_khxx_jgrq","crm_khxx_sgd","crm_khxx_zjxm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sxjlh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sxjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewKp_sxgdjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sxjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sxjlh","1");//列参数对象加入Hash表
	spanColHash.put("yhmc","1");//列参数对象加入Hash表
	spanColHash.put("sxsj","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">筛选记录号</td>
	<td  width="5%">筛选人</td>
	<td  width="5%">筛选时间</td>
	<td  width="5%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="5%">联系方式</td>
	<td  width="5%">合同号</td>
	<td  width="5%">设计师</td>
	<td  width="5%">签约日期</td>
	<td  width="5%">合同开工日期</td>
	<td  width="5%">实际开工日期</td>
	<td  width="5%">合同竣工日期</td>
	<td  width="5%">施工队</td>
	<td  width="5%">质检</td>
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