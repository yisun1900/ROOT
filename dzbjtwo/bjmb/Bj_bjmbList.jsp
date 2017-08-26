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
	String bj_bjmb_yhdlm=null;
	String sq_yhxx_yhmc=null;
	String sq_yhxx_ssfgs=null;
	String sq_yhxx_dwbh=null;
	String sq_yhxx_sfzszg=null;
	String bj_bjmb_mbmc=null;
	String bj_bjmb_mblx=null;
	bj_bjmb_yhdlm=request.getParameter("bj_bjmb_yhdlm");
	if (bj_bjmb_yhdlm!=null)
	{
		bj_bjmb_yhdlm=cf.GB2Uni(bj_bjmb_yhdlm);
		if (!(bj_bjmb_yhdlm.equals("")))	wheresql+=" and  (bj_bjmb.yhdlm='"+bj_bjmb_yhdlm+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc='"+sq_yhxx_yhmc+"')";
	}
	sq_yhxx_ssfgs=request.getParameter("sq_yhxx_ssfgs");
	if (sq_yhxx_ssfgs!=null)
	{
		sq_yhxx_ssfgs=cf.GB2Uni(sq_yhxx_ssfgs);
		if (!(sq_yhxx_ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+sq_yhxx_ssfgs+"')";
	}
	sq_yhxx_dwbh=request.getParameter("sq_yhxx_dwbh");
	if (sq_yhxx_dwbh!=null)
	{
		sq_yhxx_dwbh=cf.GB2Uni(sq_yhxx_dwbh);
		if (!(sq_yhxx_dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+sq_yhxx_dwbh+"')";
	}
	sq_yhxx_sfzszg=request.getParameter("sq_yhxx_sfzszg");
	if (sq_yhxx_sfzszg!=null)
	{
		sq_yhxx_sfzszg=cf.GB2Uni(sq_yhxx_sfzszg);
		if (!(sq_yhxx_sfzszg.equals("")))	wheresql+=" and  (sq_yhxx.sfzszg='"+sq_yhxx_sfzszg+"')";
	}
	bj_bjmb_mbmc=request.getParameter("bj_bjmb_mbmc");
	if (bj_bjmb_mbmc!=null)
	{
		bj_bjmb_mbmc=cf.GB2Uni(bj_bjmb_mbmc);
		if (!(bj_bjmb_mbmc.equals("")))	wheresql+=" and  (bj_bjmb.mbmc like '%"+bj_bjmb_mbmc+"%')";
	}
	bj_bjmb_mblx=request.getParameter("bj_bjmb_mblx");
	if (bj_bjmb_mblx!=null)
	{
		bj_bjmb_mblx=cf.GB2Uni(bj_bjmb_mblx);
		if (!(bj_bjmb_mblx.equals("")))	wheresql+=" and  (bj_bjmb.mblx='"+bj_bjmb_mblx+"')";
	}
	ls_sql="SELECT distinct sq_yhxx.ssfgs,sq_yhxx.dwbh,bj_bjmb.mbmc, DECODE(bj_bjmb.mblx,'1','公用模板','2','私人模板') mblx,a.dwmc fgsmc,b.dwmc bmmc,bj_bjmb.yhdlm,sq_yhxx.yhmc,DECODE(sq_yhxx.sfzszg,'M','实习生','Y','转正','N','试用期','D','待岗','S','辞职','T','辞退') sfzszg";
	ls_sql+=" FROM sq_yhxx,bj_bjmb,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where bj_bjmb.yhdlm=sq_yhxx.yhdlm(+)";
	ls_sql+=" and sq_yhxx.ssfgs=a.dwbh(+) and sq_yhxx.dwbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_yhxx.ssfgs,sq_yhxx.dwbh,sq_yhxx.yhmc,bj_bjmb.mbmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Bj_bjmbList.jsp","SelectBj_bjmb.jsp","ViewBj_bjmb.jsp","");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"mbmc","mblx","fgsmc","bmmc","yhdlm","yhmc","sfzszg"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"yhdlm","mbmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息","转为公用模板"};//按钮的显示名称
	String[] buttonLink={"Bj_bjmbList.jsp?","ToGymb.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
	String chooseitem =request.getParameter("chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[3];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from bj_bjmbgclmx where "+chooseitem;
		sql[1]="delete from bj_bjmbfjxx where "+chooseitem;
		sql[2]="delete from bj_bjmb where "+chooseitem;
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
  <B><font size="3">家装模板--维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">&nbsp;</td>
	<td  width="25%">模板名称</td>
	<td  width="8%">模板类型</td>
	<td  width="12%">所属分公司</td>
	<td  width="16%">所属部门</td>
	<td  width="12%">用户登陆名</td>
	<td  width="8%">员工名称</td>
	<td  width="8%">员工状态</td>
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