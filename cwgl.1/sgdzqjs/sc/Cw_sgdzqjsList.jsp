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
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第三次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_sgdzqjs_jsjlh=null;
	String cw_sgdzqjs_khbh=null;
	String cw_sgdzqjs_sgd=null;
	String sq_sgd_sgdmc=null;
	String cw_sgdzqjs_sgbz=null;
	String cw_sgdzqjs_jsrq=null;
	String cw_sgdzqjs_jsbl=null;
	String cw_sgdzqjs_jsje=null;
	String cw_sgdzqjs_clf=null;
	String cw_sgdzqjs_gdyp=null;
	String cw_sgdzqjs_sjbk=null;
	String cw_sgdzqjs_lx=null;
	String cw_sgdzqjs_lrr=null;
	String cw_sgdzqjs_lrsj=null;
	String cw_sgdzqjs_lrbm=null;
	String cw_sgdzqjs_jsjs=null;
	cw_sgdzqjs_jsjlh=request.getParameter("cw_sgdzqjs_jsjlh");
	if (cw_sgdzqjs_jsjlh!=null)
	{
		cw_sgdzqjs_jsjlh=cf.GB2Uni(cw_sgdzqjs_jsjlh);
		if (!(cw_sgdzqjs_jsjlh.equals("")))	wheresql+=" and  (cw_sgdzqjs.jsjlh='"+cw_sgdzqjs_jsjlh+"')";
	}
	cw_sgdzqjs_khbh=request.getParameter("cw_sgdzqjs_khbh");
	if (cw_sgdzqjs_khbh!=null)
	{
		cw_sgdzqjs_khbh=cf.GB2Uni(cw_sgdzqjs_khbh);
		if (!(cw_sgdzqjs_khbh.equals("")))	wheresql+=" and  (cw_sgdzqjs.khbh='"+cw_sgdzqjs_khbh+"')";
	}
	cw_sgdzqjs_sgd=request.getParameter("cw_sgdzqjs_sgd");
	if (cw_sgdzqjs_sgd!=null)
	{
		cw_sgdzqjs_sgd=cf.GB2Uni(cw_sgdzqjs_sgd);
		if (!(cw_sgdzqjs_sgd.equals("")))	wheresql+=" and  (cw_sgdzqjs.sgd='"+cw_sgdzqjs_sgd+"')";
	}
	sq_sgd_sgdmc=request.getParameter("sq_sgd_sgdmc");
	if (sq_sgd_sgdmc!=null)
	{
		sq_sgd_sgdmc=cf.GB2Uni(sq_sgd_sgdmc);
		if (!(sq_sgd_sgdmc.equals("")))	wheresql+=" and  (sq_sgd.sgdmc='"+sq_sgd_sgdmc+"')";
	}
	cw_sgdzqjs_sgbz=request.getParameter("cw_sgdzqjs_sgbz");
	if (cw_sgdzqjs_sgbz!=null)
	{
		cw_sgdzqjs_sgbz=cf.GB2Uni(cw_sgdzqjs_sgbz);
		if (!(cw_sgdzqjs_sgbz.equals("")))	wheresql+=" and  (cw_sgdzqjs.sgbz='"+cw_sgdzqjs_sgbz+"')";
	}
	cw_sgdzqjs_jsrq=request.getParameter("cw_sgdzqjs_jsrq");
	if (cw_sgdzqjs_jsrq!=null)
	{
		cw_sgdzqjs_jsrq=cw_sgdzqjs_jsrq.trim();
		if (!(cw_sgdzqjs_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjs.jsrq>=TO_DATE('"+cw_sgdzqjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjs_jsrq=request.getParameter("cw_sgdzqjs_jsrq2");
	if (cw_sgdzqjs_jsrq!=null)
	{
		cw_sgdzqjs_jsrq=cw_sgdzqjs_jsrq.trim();
		if (!(cw_sgdzqjs_jsrq.equals("")))	wheresql+="  and (cw_sgdzqjs.jsrq<=TO_DATE('"+cw_sgdzqjs_jsrq+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjs_jsbl=request.getParameter("cw_sgdzqjs_jsbl");
	if (cw_sgdzqjs_jsbl!=null)
	{
		cw_sgdzqjs_jsbl=cw_sgdzqjs_jsbl.trim();
		if (!(cw_sgdzqjs_jsbl.equals("")))	wheresql+=" and  (cw_sgdzqjs.jsbl="+cw_sgdzqjs_jsbl+") ";
	}
	cw_sgdzqjs_jsje=request.getParameter("cw_sgdzqjs_jsje");
	if (cw_sgdzqjs_jsje!=null)
	{
		cw_sgdzqjs_jsje=cw_sgdzqjs_jsje.trim();
		if (!(cw_sgdzqjs_jsje.equals("")))	wheresql+=" and  (cw_sgdzqjs.jsje="+cw_sgdzqjs_jsje+") ";
	}
	cw_sgdzqjs_clf=request.getParameter("cw_sgdzqjs_clf");
	if (cw_sgdzqjs_clf!=null)
	{
		cw_sgdzqjs_clf=cw_sgdzqjs_clf.trim();
		if (!(cw_sgdzqjs_clf.equals("")))	wheresql+=" and  (cw_sgdzqjs.clf="+cw_sgdzqjs_clf+") ";
	}
	cw_sgdzqjs_gdyp=request.getParameter("cw_sgdzqjs_gdyp");
	if (cw_sgdzqjs_gdyp!=null)
	{
		cw_sgdzqjs_gdyp=cw_sgdzqjs_gdyp.trim();
		if (!(cw_sgdzqjs_gdyp.equals("")))	wheresql+=" and  (cw_sgdzqjs.gdyp="+cw_sgdzqjs_gdyp+") ";
	}
	cw_sgdzqjs_sjbk=request.getParameter("cw_sgdzqjs_sjbk");
	if (cw_sgdzqjs_sjbk!=null)
	{
		cw_sgdzqjs_sjbk=cw_sgdzqjs_sjbk.trim();
		if (!(cw_sgdzqjs_sjbk.equals("")))	wheresql+=" and  (cw_sgdzqjs.sjbk="+cw_sgdzqjs_sjbk+") ";
	}
	cw_sgdzqjs_lx=request.getParameter("cw_sgdzqjs_lx");
	if (cw_sgdzqjs_lx!=null)
	{
		cw_sgdzqjs_lx=cf.GB2Uni(cw_sgdzqjs_lx);
		if (!(cw_sgdzqjs_lx.equals("")))	wheresql+=" and  (cw_sgdzqjs.lx='"+cw_sgdzqjs_lx+"')";
	}
	cw_sgdzqjs_lrr=request.getParameter("cw_sgdzqjs_lrr");
	if (cw_sgdzqjs_lrr!=null)
	{
		cw_sgdzqjs_lrr=cf.GB2Uni(cw_sgdzqjs_lrr);
		if (!(cw_sgdzqjs_lrr.equals("")))	wheresql+=" and  (cw_sgdzqjs.lrr='"+cw_sgdzqjs_lrr+"')";
	}
	cw_sgdzqjs_lrsj=request.getParameter("cw_sgdzqjs_lrsj");
	if (cw_sgdzqjs_lrsj!=null)
	{
		cw_sgdzqjs_lrsj=cw_sgdzqjs_lrsj.trim();
		if (!(cw_sgdzqjs_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjs.lrsj>=TO_DATE('"+cw_sgdzqjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjs_lrsj=request.getParameter("cw_sgdzqjs_lrsj2");
	if (cw_sgdzqjs_lrsj!=null)
	{
		cw_sgdzqjs_lrsj=cw_sgdzqjs_lrsj.trim();
		if (!(cw_sgdzqjs_lrsj.equals("")))	wheresql+="  and (cw_sgdzqjs.lrsj<=TO_DATE('"+cw_sgdzqjs_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sgdzqjs_lrbm=request.getParameter("cw_sgdzqjs_lrbm");
	if (cw_sgdzqjs_lrbm!=null)
	{
		cw_sgdzqjs_lrbm=cf.GB2Uni(cw_sgdzqjs_lrbm);
		if (!(cw_sgdzqjs_lrbm.equals("")))	wheresql+=" and  (cw_sgdzqjs.lrbm='"+cw_sgdzqjs_lrbm+"')";
	}
	cw_sgdzqjs_jsjs=request.getParameter("cw_sgdzqjs_jsjs");
	if (cw_sgdzqjs_jsjs!=null)
	{
		cw_sgdzqjs_jsjs=cf.GB2Uni(cw_sgdzqjs_jsjs);
		if (!(cw_sgdzqjs_jsjs.equals("")))	wheresql+=" and  (cw_sgdzqjs.jsjs='"+cw_sgdzqjs_jsjs+"')";
	}

	ls_sql="SELECT cw_sgdzqjs.jsjlh,cw_sgdzqjs.khbh,crm_khxx.khxm,sq_sgd.sgdmc,cw_sgdzqjs.sgbz,gdjsjdmc,cw_sgdzqjs.jsrq,cw_sgdzqjs.htje,cw_sgdzqjs.zjxje, DECODE(cw_sgdzqjs.jsjs,'1','工程费','2','工程费＋其它费','3','实收款总额','4','一期款','5','二期款','6','三期款','7','工程基础报价','8','工程基础报价＋其它费基础报价','9','工程施工成本价','A','工程施工成本价＋其它费施工成本','B','工程成本价','C','工程成本价＋其它费成本'),cw_sgdzqjs.jsjsze,cw_sgdzqjs.jsbl||'%',cw_sgdzqjs.jsje,cw_sgdzqjs.clf,cw_sgdzqjs.gdyp,cw_sgdzqjs.sjbk,cw_sgdzqjs.lrr,cw_sgdzqjs.lrsj,dwmc,cw_sgdzqjs.bz  ";
	ls_sql+=" FROM cw_sgdzqjs,sq_sgd,dm_gdjsjd,sq_dwxx,crm_khxx  ";
    ls_sql+=" where cw_sgdzqjs.sgd=sq_sgd.sgd(+) and cw_sgdzqjs.lx=dm_gdjsjd.gdjsjd(+) and cw_sgdzqjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_sgdzqjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_sgdzqjs.lx='H'";//0:未结算
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sgdzqjs.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_sgdzqjsList.jsp","","","EditCw_sgdzqjs.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","cw_sgdzqjs_khbh","sq_sgd_sgdmc","cw_sgdzqjs_sgbz","cw_sgdzqjs_jsrq","cw_sgdzqjs_jsbl","cw_sgdzqjs_jsje","cw_sgdzqjs_clf","cw_sgdzqjs_gdyp","cw_sgdzqjs_sjbk","cw_sgdzqjs_lx","cw_sgdzqjs_lrr","cw_sgdzqjs_lrsj","cw_sgdzqjs_lrbm","cw_sgdzqjs_bz","cw_sgdzqjs_jsjs","cw_sgdzqjs_htje","cw_sgdzqjs_zjxje","cw_sgdzqjs_jsjsze"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_sgdzqjs.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_sgdzqjs.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第三次进入此页，不需要初始化
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
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">结算记录号</td>
	<td  width="3%">客户编号</td>
	<td  width="4%">客户姓名</td>
	<td  width="4%">施工队</td>
	<td  width="4%">现场负责人</td>
	<td  width="6%">类型</td>
	<td  width="4%">结算日期</td>
	<td  width="5%">合同金额</td>
	<td  width="4%">增减项金额</td>
	<td  width="5%">结算基数</td>
	<td  width="5%">结算基数总额</td>
	<td  width="3%">结算比例</td>
	<td  width="5%">结算金额</td>
	<td  width="4%">材料费</td>
	<td  width="4%">工地用品</td>
	<td  width="5%">实际拨款</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="54%">备注</td>
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