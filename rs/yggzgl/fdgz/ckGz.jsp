<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String xh=request.getParameter("xh");
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	ls_sql="SELECT dwmc,TO_CHAR(ygbh) ygbh,bianhao,yhmc,glgz,gwgz,jbgz,jtbt,cb,dhbt,yjsxe,jj,qtbt,qtkk,tc,sqgz,ksk,shgz,rs_yggzb.bz";
	ls_sql+=" FROM rs_yggzb,sq_dwxx  ";
    ls_sql+=" where rs_yggzb.dwbh=sq_dwxx.dwbh and xh='"+xh+"'";
    ls_sql+=" order by rs_yggzb.dwbh,yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("ckGz.jsp?xh="+xh,"","","EditRs_yggzb.jsp?xh="+xh);
	pageObj.setPageRow(2000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"xh","ygbh","bianhao","yhmc","dwbh","glgz","gwgz","jbgz","jtbt","cb","dhbt","yjsxe","jj","qtbt","qtkk","tc","ksk","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"ckGz.jsp?xh="+xh};//按钮单击调用的网页，可以增加参数
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
	String[] ygbh = request.getParameterValues("ygbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ygbh,"ygbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from rs_yggzb where "+chooseitem;
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
  <B><font size="3">查看工资信息（序号：<%=xh%>）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="7%">所属部门</td>
	<td  width="4%">员工序号</td>
	<td  width="5%">工号</td>
	<td  width="5%">员工姓名</td>
	<td  width="5%">工龄工资</td>
	<td  width="5%">岗位工资</td>
	<td  width="5%">底薪</td>
	<td  width="5%">交通补贴</td>
	<td  width="4%">餐补</td>
	<td  width="4%">电话补</td>
	<td  width="4%">扣保费</td>
	<td  width="5%">奖金</td>
	<td  width="5%">其它补贴</td>
	<td  width="5%">其它扣款</td>
	<td  width="5%">提成</td>
	<td  width="5%">税前工资</td>
	<td  width="5%">扣税款</td>
	<td  width="5%">税后工资</td>
	<td  width="7%">备注</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.printSum();
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