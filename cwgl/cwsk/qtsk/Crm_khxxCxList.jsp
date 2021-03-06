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


	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh ='"+fgs+"')";
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";

	if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";


	ls_sql=" SELECT hth,khxm,fwdz,fkcsmc,qye,zjxje,sfke,qyrq,sjjgrq,sq_dwxx.dwmc,sgdmc,sjs,zjxm,khbh ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,cw_fkcs";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_khxx.jzkfkcs=cw_fkcs.fkcs(+) ";
//	ls_sql+=" and crm_khxx.khjsbz not in('Y','2')";//N：未结算；Y：已结算；2：审批同意；3：审批不同意
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by lrsj desc";


//	out.println(ls_sql);

	pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxCxList.jsp","","InsertCw_khfkjl.jsp","");
//	pageObj.setPageRow(40);//设置每页显示记录数

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("收款");
	pageObj.setViewBolt("");

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link=" /khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
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
  <B><font size="3">其它收款</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="6%">合同号</td>
	<td  width="5%">姓名</td>
	<td  width="17%">房屋地址</td>
	<td  width="5%">收款期数</td>
	<td  width="8%">签约额</td>
	<td  width="7%">增减项</td>
	<td  width="8%">实收款额</td>
	<td  width="6%">签约日期</td>
	<td  width="6%">实竣工日期</td>
	<td  width="9%">签约店面</td>
	<td  width="5%">施工队</td>
	<td  width="5%">设计师</td>
	<td  width="5%">质检员</td>
	<td  width="5%">客户编号</td>
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