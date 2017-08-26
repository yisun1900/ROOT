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
	String khzq=null;
	String fgsbh=null;
	String dwbh=null;
	String yhmc=null;
	khzq=request.getParameter("khzq");
	if (khzq!=null)
	{
		khzq=cf.GB2Uni(khzq);
		if (!(khzq.equals("")))	wheresql+=" and  (cw_jrclyjxkh.khzq='"+khzq+"')";
	}
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (cw_jrclyjxkh.fgsbh='"+fgsbh+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_jrclyjxkh.dwbh='"+dwbh+"')";
	}
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (cw_jrclyjxkh.yhmc='"+yhmc+"')";
	}
	ls_sql="SELECT cw_jrclyjxkh.khzq,cw_jrclyjxkh.khqssj,cw_jrclyjxkh.khjzsj,cw_jrclyjxkh.fgsbh,a.dwmc fgs,cw_jrclyjxkh.dwbh,b.dwmc,cw_jrclyjxkh.yhmc,DECODE(cw_jrclyjxkh.clzt,'1','未审核','2','审核') clzt,cw_jrclyjxkh.khfs,tsl,tslfs,ddjdfs,xtsyfs,tsclfs,rcglfs,lckhfs,cw_jrclyjxkh.lrr,cw_jrclyjxkh.lrsj,cw_jrclyjxkh.bz  ";
	ls_sql+=" FROM cw_jrclyjxkh,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_jrclyjxkh.fgsbh=a.dwbh(+)";
    ls_sql+=" and cw_jrclyjxkh.dwbh=b.dwbh(+)";
    ls_sql+=" and cw_jrclyjxkh.clzt='1'";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrclyjxkh.khzq,cw_jrclyjxkh.fgsbh,cw_jrclyjxkh.dwbh,cw_jrclyjxkh.yhmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrclyjxkhList.jsp","","","ChooseYhmc.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数

//设置显示列
	String[] disColName={"khzq","khqssj","khjzsj","dwmc","yhmc","clzt","khfs","tsl","tslfs","ddjdfs","xtsyfs","tsclfs","rcglfs","lckhfs","lrr","lrsj","fgs","bz"};
	pageObj.setDisColName(disColName);


//设置主键
	String[] keyName={"khzq","fgsbh","dwbh","yhmc"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Cw_jrclyjxkhList.jsp"};//按钮单击调用的网页，可以增加参数
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
	String chooseitem = cf.getParameter(request,"chooseitem");
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from cw_jrclyjxkh where clzt='1' and "+chooseitem;
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
  <B><font size="3">材料员考核－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="3%">考核周期</td>
	<td  width="5%">考核起始时间</td>
	<td  width="5%">考核截至时间</td>
	<td  width="9%">所属部门</td>
	<td  width="4%">姓名</td>
	<td  width="4%">审核状态</td>
	<td  width="5%">考核分数</td>
	<td  width="5%">投诉率</td>
	<td  width="5%">投诉得分</td>
	<td  width="5%">订单进度记录</td>
	<td  width="5%">按规范使用系统</td>
	<td  width="5%">投诉及时处理</td>
	<td  width="5%">违反日常管理制度</td>
	<td  width="5%">日常业务及流程考核</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="8%">分公司</td>
	<td  width="58%">备注</td>
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