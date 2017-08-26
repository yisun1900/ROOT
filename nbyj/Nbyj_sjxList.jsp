<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>
<%
String yjygbh=request.getParameter("yjygbh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String yjbh=null;
	String yjzt=null;
	String sjr=null;
	String fjr=null;
	String fssj=null;
	String yjlx=null;
	String sfyd=null;
	String fjmc=null;
	String fjym=null;
	String yjnr=null;
	yjbh=request.getParameter("yjbh");
	if (yjbh!=null)
	{
		yjbh=cf.GB2Uni(yjbh);
		if (!(yjbh.equals("")))	wheresql+=" and  (yjbh='"+yjbh+"')";
	}
	yjzt=request.getParameter("yjzt");
	if (yjzt!=null)
	{
		yjzt=cf.GB2Uni(yjzt);
		if (!(yjzt.equals("")))	wheresql+=" and  (yjzt like '%"+yjzt+"%')";
	}
	sjr=request.getParameter("sjr");
	if (sjr!=null)
	{
		sjr=sjr.trim();
		if (!(sjr.equals("")))	wheresql+=" and (sjr="+sjr+") ";
	}
	fjr=request.getParameter("fjr");
	if (fjr!=null)
	{
		fjr=fjr.trim();
		if (!(fjr.equals("")))	wheresql+=" and (fjr="+fjr+") ";
	}
	fssj=request.getParameter("fssj");
	if (fssj!=null)
	{
		fssj=fssj.trim();
		if (!(fssj.equals("")))	wheresql+="  and (fssj>=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	fssj=request.getParameter("fssj2");
	if (fssj!=null)
	{
		fssj=fssj.trim();
		if (!(fssj.equals("")))	wheresql+="  and (fssj<=TO_DATE('"+fssj+"','YYYY/MM/DD'))";
	}
	yjlx=request.getParameter("yjlx");
	if (yjlx!=null)
	{
		yjlx=cf.GB2Uni(yjlx);
		if (!(yjlx.equals("")))	wheresql+=" and  (yjlx='"+yjlx+"')";
	}
	sfyd=request.getParameter("sfyd");
	if (sfyd!=null)
	{
		sfyd=cf.GB2Uni(sfyd);
		if (!(sfyd.equals("")))	wheresql+=" and  (sfyd='"+sfyd+"')";
	}
	fjmc=request.getParameter("fjmc");
	if (fjmc!=null)
	{
		fjmc=cf.GB2Uni(fjmc);
		if (!(fjmc.equals("")))	wheresql+=" and  (fjmc='"+fjmc+"')";
	}
	fjym=request.getParameter("fjym");
	if (fjym!=null)
	{
		fjym=cf.GB2Uni(fjym);
		if (!(fjym.equals("")))	wheresql+=" and  (fjym='"+fjym+"')";
	}
	yjnr=request.getParameter("yjnr");
	if (yjnr!=null)
	{
		yjnr=cf.GB2Uni(yjnr);
		if (!(yjnr.equals("")))	wheresql+=" and  (yjnr like '%"+yjnr+"%')";
	}
	ls_sql="SELECT '<a href=\"Delete_sjx.jsp?whereyjbh='||yjbh||'&yjygbh="+yjygbh+"\">删除</a>' sc,yjbh,DECODE(yjlx,'J','<font color=red>紧急</font>','P','普通') yjlx,DECODE(sfyd,'Y','已读','N','未读') sfyd,'<a href=\"ViewNbyj_sjx.jsp?yjbh='||yjbh||'\">'||yjzt||'</a>' yjzt,a.yhmc sjr,b.yhmc fjr,to_char(fssj,'YYYY-MM-DD'),fjym  ";
	ls_sql+=" FROM nbyj_sjx,sq_yhxx a,sq_yhxx b  ";
    ls_sql+=" where a.ygbh=nbyj_sjx.sjr and b.ygbh=nbyj_sjx.fjr ";
	ls_sql+=" and sjr="+yjygbh+" and fssj<=sysdate ";
    ls_sql+=wheresql;
	ls_sql+=" order by fssj desc,sfyd,yjlx desc  ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Nbyj_sjxList.jsp","","","");
	pageObj.setPageRow(100);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"yjbh","yjzt","sjr","fjr","fssj","yjlx","sfyd","fjmc","fjym","yjnr"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"yjbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Nbyj_sjxList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开;1：打开
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
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示;PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] yjbh = request.getParameterValues("yjbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(yjbh,"yjbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from nbyj_sjx where "+chooseitem+" and sfyd='Y'";
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
  <B><font size="3">查询结果</font></B><font color=red>（如果您的邮件删除不掉，说明还没有阅读）</font>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
<td  width="3%">&nbsp;</td>
	<td  width="3%">删除</td>
	<td  width="5%">邮件编号</td>
	<td  width="3%">邮件类型</td>
	<td  width="3%">是否已读</td>
	<td  width="20%">邮件主题</td>
	<td  width="4%">收件人</td>
	<td  width="4%">发件人</td>
	<td  width="5%">发送时间</td>
	<td  width="8%">附件原名</td>
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
