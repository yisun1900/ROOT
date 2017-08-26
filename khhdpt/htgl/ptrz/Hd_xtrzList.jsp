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
	String ip=null;
	String yhdlm=null;
	String yhkl=null;
	String khbh=null;
	String khxm=null;
	String dlsj=null;
	String dlsj2=null;
	String tcsj=null;
	String tcsj2=null;
	String fgs=null;
	String crm_khxx_dwbh=null;
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	dlsj=request.getParameter("dlsj");
	if (dlsj!=null)
	{
		dlsj=dlsj.trim();
		if (!(dlsj.equals("")))	wheresql+="  and (hd_xtrz.dlsj>=TO_DATE('"+dlsj+"','YYYY/MM/DD'))";
	}
	dlsj2=request.getParameter("dlsj2");
	if (dlsj2!=null)
	{
		dlsj2=dlsj2.trim();
		if (!(dlsj2.equals("")))	wheresql+="  and (hd_xtrz.dlsj<=TO_DATE('"+dlsj2+"','YYYY/MM/DD'))";
	}
	tcsj=request.getParameter("tcsj");
	if (dlsj!=null)
	{
		tcsj=tcsj.trim();
		if (!(tcsj.equals("")))	wheresql+="  and (hd_xtrz.tcsj>=TO_DATE('"+tcsj+"','YYYY/MM/DD'))";
	}
	tcsj2=request.getParameter("tcsj2");
	if (tcsj2!=null)
	{
		tcsj2=tcsj2.trim();
		if (!(tcsj2.equals("")))	wheresql+="  and (hd_xtrz.tcsj<=TO_DATE('"+tcsj2+"','YYYY/MM/DD'))";
	}
	ip=request.getParameter("ip");
	if (ip!=null)
	{
		ip=cf.GB2Uni(ip);
		if (!(ip.equals("")))	wheresql+=" and  (ip='"+ip+"')";
	}
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (yhdlm='"+yhdlm+"')";
	}
	yhkl=request.getParameter("yhkl");
	if (yhkl!=null)
	{
		yhkl=cf.GB2Uni(yhkl);
		if (!(yhkl.equals("")))	wheresql+=" and  (yhkl='"+yhkl+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (khbh='"+khbh+"')";
	}
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (khxm='"+khxm+"')";
	}
	dlsj=request.getParameter("dlsj");
	if (dlsj!=null)
	{
		dlsj=dlsj.trim();
		if (!(dlsj.equals("")))	wheresql+="  and (dlsj=TO_DATE('"+dlsj+"','YYYY/MM/DD'))";
	}
	tcsj=request.getParameter("tcsj");
	if (tcsj!=null)
	{
		tcsj=tcsj.trim();
		if (!(tcsj.equals("")))	wheresql+="  and (tcsj=TO_DATE('"+tcsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT xh,ip,hd_xtrz.yhdlm,hd_xtrz.yhkl,decode(dlqk,'1','用户名登陆','2','合同号登陆','3','口令不正确','4','身份证号不正确','5','用户登陆名不存在'),hd_xtrz.khbh,hd_xtrz.khxm,hd_xtrz.dlsj,hd_xtrz.tcsj  ";
	ls_sql+=" FROM hd_xtrz,crm_khxx  ";
    ls_sql+=" where hd_xtrz.khbh=crm_khxx.khbh and (1=1)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Hd_xtrzList.jsp","SelectHd_xtrz.jsp","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","ip","yhdlm","yhkl","dlqk","khbh","khxm","dlsj","tcsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Hd_xtrzList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] xh = request.getParameterValues("xh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(xh,"xh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from hd_xtrz where "+chooseitem;
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
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="5%">序号</td>
	<td  width="12%">IP地址</td>
	<td  width="12%">用户登陆名</td>
	<td  width="13%">用户口令</td>
	<td  width="13%">登陆情况</td>
	<td  width="7%">客户编号</td>
	<td  width="7%">客户姓名</td>
	<td  width="9%">登陆时间</td>
	<td  width="9%">退出时间</td>
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