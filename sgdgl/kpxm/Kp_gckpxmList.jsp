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
	String kp_gckpxm_kpxmbm=null;
	String kp_gckpxm_kpxmmc=null;
	String kp_gckpxm_kpdlbm=null;
	String kp_gckpxm_kpjg=null;
	String kp_gckpxm_kpjgdy=null;
	String kf=null;
	kf=request.getParameter("kf");
	if (kf!=null)
	{
		kf=cf.GB2Uni(kf);
		if (!(kf.equals("")))	wheresql+=" and  (kp_gckpxm.kf="+kf+")";
	}
	String sgdfk=null;
	sgdfk=request.getParameter("sgdfk");
	if (sgdfk!=null)
	{
		sgdfk=cf.GB2Uni(sgdfk);
		if (!(sgdfk.equals("")))	wheresql+=" and  (kp_gckpxm.sgdfk="+sgdfk+")";
	}
	String kcjdebl=null;
	kcjdebl=request.getParameter("kcjdebl");
	if (kcjdebl!=null)
	{
		kcjdebl=cf.GB2Uni(kcjdebl);
		if (!(kcjdebl.equals("")))	wheresql+=" and  (kp_gckpxm.kcjdebl="+kcjdebl+")";
	}

	String kp_gckpxm_kpcfbm=null;
	kp_gckpxm_kpxmbm=request.getParameter("kp_gckpxm_kpxmbm");
	if (kp_gckpxm_kpxmbm!=null)
	{
		kp_gckpxm_kpxmbm=cf.GB2Uni(kp_gckpxm_kpxmbm);
		if (!(kp_gckpxm_kpxmbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpxmbm='"+kp_gckpxm_kpxmbm+"')";
	}
	kp_gckpxm_kpxmmc=request.getParameter("kp_gckpxm_kpxmmc");
	if (kp_gckpxm_kpxmmc!=null)
	{
		kp_gckpxm_kpxmmc=cf.GB2Uni(kp_gckpxm_kpxmmc);
		if (!(kp_gckpxm_kpxmmc.equals("")))	wheresql+=" and  (kp_gckpxm.kpxmmc='"+kp_gckpxm_kpxmmc+"')";
	}
	kp_gckpxm_kpdlbm=request.getParameter("kp_gckpxm_kpdlbm");
	if (kp_gckpxm_kpdlbm!=null)
	{
		kp_gckpxm_kpdlbm=cf.GB2Uni(kp_gckpxm_kpdlbm);
		if (!(kp_gckpxm_kpdlbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpdlbm='"+kp_gckpxm_kpdlbm+"')";
	}
	kp_gckpxm_kpjg=request.getParameter("kp_gckpxm_kpjg");
	if (kp_gckpxm_kpjg!=null)
	{
		kp_gckpxm_kpjg=cf.GB2Uni(kp_gckpxm_kpjg);
		if (!(kp_gckpxm_kpjg.equals("")))	wheresql+=" and  (kp_gckpxm.kpjg='"+kp_gckpxm_kpjg+"')";
	}
	kp_gckpxm_kpjgdy=request.getParameter("kp_gckpxm_kpjgdy");
	if (kp_gckpxm_kpjgdy!=null)
	{
		kp_gckpxm_kpjgdy=cf.GB2Uni(kp_gckpxm_kpjgdy);
		if (!(kp_gckpxm_kpjgdy.equals("")))	wheresql+=" and  (kp_gckpxm.kpjgdy='"+kp_gckpxm_kpjgdy+"')";
	}
	kp_gckpxm_kpcfbm=request.getParameter("kp_gckpxm_kpcfbm");
	if (kp_gckpxm_kpcfbm!=null)
	{
		kp_gckpxm_kpcfbm=cf.GB2Uni(kp_gckpxm_kpcfbm);
		if (!(kp_gckpxm_kpcfbm.equals("")))	wheresql+=" and  (kp_gckpxm.kpcfbm='"+kp_gckpxm_kpcfbm+"')";
	}
	ls_sql="SELECT kp_kpdlbm.kpdlmc,kp_gckpxm.kpxmbm,kp_gckpxm.kpxmmc,kp_gckpxm.kpjg,ydcdmc,kp_gckpxm.kpjgdy,kf,sgdfk,kcjdebl||'%' kcjdebl,kp_kpcfbm.kpcfmc,kp_gckpxm.cfbz  ";
	ls_sql+=" FROM kp_gckpxm,kp_kpcfbm,kp_kpdlbm,kp_sgdyzcdbm  ";
    ls_sql+=" where kp_gckpxm.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm(+) and kp_gckpxm.kpjg=kp_sgdyzcdbm.yzcdbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_gckpxm.kpxmbm,kp_gckpxm.kpjg";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_gckpxmList.jsp","","","EditKp_gckpxm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"kpxmbm","kpxmmc","ydcdmc","kpjgdy","kf","sgdfk","kcjdebl","kpcfmc","cfbz","kpdlmc"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"kpxmbm","kpjg"};
	pageObj.setKey(keyName);
	pageObj.alignStr[4]="align='left'";
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Kp_gckpxmList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("kpxmbm","1");//列参数对象加入Hash表
	spanColHash.put("kpxmmc","1");//列参数对象加入Hash表
	spanColHash.put("kpdlmc","2");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from kp_gckpxm where "+chooseitem;
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
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="6%">违规项目编码</td>
	<td  width="16%">违规项目名称</td>
	<td  width="4%">违规分级</td>
	<td  width="22%">违规分级定义</td>
	<td  width="4%">扣分</td>
	<td  width="4%">罚款</td>
	<td  width="4%">扣除接单额百分比</td>
	<td  width="6%">处罚分类</td>
	<td  width="22%">处罚标准</td>
	<td  width="8%">项目大类</td>
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