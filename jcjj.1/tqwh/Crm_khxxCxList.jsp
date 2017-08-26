<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String khbh=request.getParameter("khbh");
	String khxm=cf.GB2Uni(request.getParameter("khxm"));
	String khxm2=cf.GB2Uni(request.getParameter("khxm2"));
	String fwdz=cf.GB2Uni(request.getParameter("fwdz"));
	String fwdz2=cf.GB2Uni(request.getParameter("fwdz2"));
	String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
	String lxfs2=cf.GB2Uni(request.getParameter("lxfs2"));

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String hth=request.getParameter("hth");

	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs ='"+fgs+"')";
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";
	if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	if (!(hth.equals("")))	wheresql+=" and  (crm_zxkhxx.hth='"+hth+"')";
	if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";

	if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";

	ls_sql="SELECT DECODE(crm_zxkhxx.zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','失败','5','飞单审核未通过') as crm_zxkhxx_zxzt,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,b.dwmc as zxdm,sjs, lrsj,a.dwmc zxdjbm,khbh";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" and crm_zxkhxx.zxzt not in('3')";
	ls_sql+=" order by lrsj desc";
//	out.println(ls_sql);
	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxCxList.jsp","","ZzCw_khfkjl.jsp","");
//	pageObj.setPageRow(40);//设置每页显示记录数

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("转帐");
	pageObj.setViewBolt("");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link=" /dhzx/dhzx/ViewCrm_zxkhxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
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
  <B><font size="3">客户间转帐</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="11%">咨询状态</td>
	<td  width="9%">姓名</td>
	<td  width="26%">房屋地址</td>
	<td  width="12%">咨询店面</td>
	<td  width="8%">设计师</td>
	<td  width="10%">录入时间</td>
	<td  width="12%">咨询登记部门</td>
	<td  width="7%">客户编号</td>
</tr>
<%
	pageObj.displayDateSum();
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