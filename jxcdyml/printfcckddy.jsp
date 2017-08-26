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
	String whereckph=cf.GB2Uni(request.getParameter("ckph"));
	if (whereckph!=null)
	{
		whereckph=cf.GB2Uni(whereckph);
		if (!(whereckph.equals("")))	wheresql+=" and  (jxc_ckmx.ckph='"+whereckph+"')";
	}
	ls_sql="select jxc_ckmx.clbm,clmc,xh,gg,ckdj,cksl,cksl*ckdj ";
	ls_sql+=" from  jxc_ckmx,jxc_clbm ";
	ls_sql+=" where jxc_ckmx.clbm=jxc_clbm.clbm ";
    ls_sql+=wheresql;
//	out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(100000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"clbm","dqbm","gys","lsj","xsj","cxhdbl","myqjf","sfycx","cxkssj","cxjzsj","cxj","lscxhdbl","cxmyqjf","sfykc","zcpzsl","dhsl","ycgsl"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"打印选中材料"};//按钮的显示名称
	String[] buttonLink={"printfcckdcw.jsp?ckph="+whereckph+"&"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
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
	String chooseitem = cf.GB2Uni(request.getParameter("chooseitem"));
//	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
//	{
//		String[] sql=new String[1];//要执行的SQL
//		boolean needCommit=false;//不需要事务处理
//		sql[0]="delete from jxc_cljgb where zcpzsl=0 and dhsl=0 and ycgsl=0 and "+chooseitem;
//		out.print(sql[0]);
//		pageObj.execDelete(sql,needCommit);
//	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">请勾选需打印的产品</font></B><br>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">材料编码</td>
	<td  width="3%">材料名称</td>
	<td  width="3%">型号</td>
	<td  width="3%">规格</td>
	<td  width="3%">出库单价</td>
	<td  width="3%">出库数量</td>
	<td  width="3%">出库总价</td>

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