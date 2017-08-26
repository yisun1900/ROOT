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
	String sq_fxfzr_ssfgs=null;
	String sq_fxfzr_fzrmc=null;
	String sq_fxfzr_xb=null;
	String sq_fxfzr_dh=null;
	String sq_fxfzr_zz=null;
	String sq_fxfzr_sfzh=null;
	String sq_fxfzr_lx=null;

	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (sq_fxfzr.sgd='"+sgd+"')";
	}
	sq_fxfzr_ssfgs=request.getParameter("sq_fxfzr_ssfgs");
	if (sq_fxfzr_ssfgs!=null)
	{
		sq_fxfzr_ssfgs=cf.GB2Uni(sq_fxfzr_ssfgs);
		if (!(sq_fxfzr_ssfgs.equals("")))	wheresql+=" and  (sq_fxfzr.ssfgs='"+sq_fxfzr_ssfgs+"')";
	}
	sq_fxfzr_fzrmc=request.getParameter("sq_fxfzr_fzrmc");
	if (sq_fxfzr_fzrmc!=null)
	{
		sq_fxfzr_fzrmc=cf.GB2Uni(sq_fxfzr_fzrmc);
		if (!(sq_fxfzr_fzrmc.equals("")))	wheresql+=" and  (sq_fxfzr.fzrmc='"+sq_fxfzr_fzrmc+"')";
	}
	sq_fxfzr_xb=request.getParameter("sq_fxfzr_xb");
	if (sq_fxfzr_xb!=null)
	{
		sq_fxfzr_xb=cf.GB2Uni(sq_fxfzr_xb);
		if (!(sq_fxfzr_xb.equals("")))	wheresql+=" and  (sq_fxfzr.xb='"+sq_fxfzr_xb+"')";
	}
	sq_fxfzr_dh=request.getParameter("sq_fxfzr_dh");
	if (sq_fxfzr_dh!=null)
	{
		sq_fxfzr_dh=cf.GB2Uni(sq_fxfzr_dh);
		if (!(sq_fxfzr_dh.equals("")))	wheresql+=" and  (sq_fxfzr.dh='"+sq_fxfzr_dh+"')";
	}
	sq_fxfzr_zz=request.getParameter("sq_fxfzr_zz");
	if (sq_fxfzr_zz!=null)
	{
		sq_fxfzr_zz=cf.GB2Uni(sq_fxfzr_zz);
		if (!(sq_fxfzr_zz.equals("")))	wheresql+=" and  (sq_fxfzr.zz='"+sq_fxfzr_zz+"')";
	}
	sq_fxfzr_sfzh=request.getParameter("sq_fxfzr_sfzh");
	if (sq_fxfzr_sfzh!=null)
	{
		sq_fxfzr_sfzh=cf.GB2Uni(sq_fxfzr_sfzh);
		if (!(sq_fxfzr_sfzh.equals("")))	wheresql+=" and  (sq_fxfzr.sfzh='"+sq_fxfzr_sfzh+"')";
	}
	sq_fxfzr_lx=request.getParameter("sq_fxfzr_lx");
	if (sq_fxfzr_lx!=null)
	{
		sq_fxfzr_lx=cf.GB2Uni(sq_fxfzr_lx);
		if (!(sq_fxfzr_lx.equals("")))	wheresql+=" and  (sq_fxfzr.lx='"+sq_fxfzr_lx+"')";
	}
	ls_sql="SELECT sq_fxfzr.ssfgs,sq_dwxx.dwmc,sgdmc,DECODE(sq_fxfzr.lx,'1','木工','2','泥瓦工','3','水电工','4','油漆工'),sq_fxfzr.fzrmc, DECODE(sq_fxfzr.xb,'M','男','W','女'),sq_fxfzr.dh,sq_fxfzr.zz,sq_fxfzr.sfzh,sq_fxfzr.bz  ";
	ls_sql+=" FROM sq_dwxx,sq_fxfzr,sq_sgd  ";
    ls_sql+=" where sq_fxfzr.ssfgs=sq_dwxx.dwbh(+) and sq_fxfzr.sgd=sq_sgd.sgd(+)";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and sq_fxfzr.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by sq_fxfzr.ssfgs,sq_fxfzr.sgd,sq_fxfzr.lx,sq_fxfzr.fzrmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_fxfzrList.jsp","","","EditSq_fxfzr.jsp");
	pageObj.setPageRow(200);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ssfgs","sq_dwxx_dwmc","fzrmc","sq_fxfzr_xb","sq_fxfzr_dh","sq_fxfzr_zz","sq_fxfzr_sfzh","sq_fxfzr_lx","sq_fxfzr_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ssfgs","fzrmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Sq_fxfzrList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"saleid","corpid"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="link.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String chooseitem=cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from sq_fxfzr where "+chooseitem;
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
  <B><font size="3">查询结果</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="5%">所属分公司</td>
	<td  width="8%">所属分公司</td>
	<td  width="6%">所属施工队</td>
	<td  width="6%">类型</td>
	<td  width="7%">分项负责人名称</td>
	<td  width="6%">性别</td>
	<td  width="14%">电话</td>
	<td  width="14%">住址</td>
	<td  width="9%">身份证号</td>
	<td  width="14%">备注</td>
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