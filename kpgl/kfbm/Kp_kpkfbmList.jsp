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
	String kp_kpkfbm_kpkfbm=null;
	String kp_kpkfbm_kpkfmc=null;
	String kp_kpkfbm_kfs=null;
	String kp_kpkfbm_pfxmbm=null;
	String kp_kpkfbm_kflx=null;
	kp_kpkfbm_kpkfbm=request.getParameter("kp_kpkfbm_kpkfbm");
	if (kp_kpkfbm_kpkfbm!=null)
	{
		kp_kpkfbm_kpkfbm=cf.GB2Uni(kp_kpkfbm_kpkfbm);
		if (!(kp_kpkfbm_kpkfbm.equals("")))	wheresql+=" and  (kp_kpkfbm.kpkfbm='"+kp_kpkfbm_kpkfbm+"')";
	}
	kp_kpkfbm_kpkfmc=request.getParameter("kp_kpkfbm_kpkfmc");
	if (kp_kpkfbm_kpkfmc!=null)
	{
		kp_kpkfbm_kpkfmc=cf.GB2Uni(kp_kpkfbm_kpkfmc);
		if (!(kp_kpkfbm_kpkfmc.equals("")))	wheresql+=" and  (kp_kpkfbm.kpkfmc='"+kp_kpkfbm_kpkfmc+"')";
	}
	kp_kpkfbm_kfs=request.getParameter("kp_kpkfbm_kfs");
	if (kp_kpkfbm_kfs!=null)
	{
		kp_kpkfbm_kfs=kp_kpkfbm_kfs.trim();
		if (!(kp_kpkfbm_kfs.equals("")))	wheresql+=" and (kp_kpkfbm.kfs="+kp_kpkfbm_kfs+") ";
	}
	kp_kpkfbm_pfxmbm=request.getParameter("kp_kpkfbm_pfxmbm");
	if (kp_kpkfbm_pfxmbm!=null)
	{
		kp_kpkfbm_pfxmbm=cf.GB2Uni(kp_kpkfbm_pfxmbm);
		if (!(kp_kpkfbm_pfxmbm.equals("")))	wheresql+=" and  (kp_kpkfbm.pfxmbm='"+kp_kpkfbm_pfxmbm+"')";
	}
	kp_kpkfbm_kflx=request.getParameter("kp_kpkfbm_kflx");
	if (kp_kpkfbm_kflx!=null)
	{
		kp_kpkfbm_kflx=cf.GB2Uni(kp_kpkfbm_kflx);
		if (!(kp_kpkfbm_kflx.equals("")))	wheresql+=" and  (kp_kpkfbm.kflx='"+kp_kpkfbm_kflx+"')";
	}
	ls_sql="SELECT kp_kpkfbm.kpkfbm,kp_kpkfbm.kpkfmc,kp_kpkfbm.kfs,kp_pfxmbm.pfxmmc, DECODE(kp_kpkfbm.kflx,'1','扣分','2','某项分数为0')  ";
	ls_sql+=" FROM kp_kpkfbm,kp_pfxmbm  ";
    ls_sql+=" where kp_kpkfbm.pfxmbm=kp_pfxmbm.pfxmbm(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by kp_kpkfbm.kpkfbm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Kp_kpkfbmList.jsp","SelectKp_kpkfbm.jsp","","EditKp_kpkfbm.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"kpkfbm","kp_kpkfbm_kpkfmc","kp_kpkfbm_kfs","kp_pfxmbm_pfxmmc","kp_kpkfbm_kflx"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"kpkfbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Kp_kpkfbmList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] kpkfbm = request.getParameterValues("kpkfbm");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(kpkfbm,"kpkfbm"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from kp_kpkfbm where "+chooseitem;
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
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">&nbsp;</td>
	<td  width="15%">考评扣分编码</td>
	<td  width="20%">考评扣分名称</td>
	<td  width="15%">扣分数</td>
	<td  width="20%">扣为0分项目</td>
	<td  width="15%">扣分类型</td>
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