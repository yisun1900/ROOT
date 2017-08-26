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
	String qh_xcpzzsh_shbbh=null;
	String qh_xcpzzsh_sqsj=null;
	String qh_xcpzzsh_zznr=null;
	String qh_xcpzzsh_sl=null;
	String qh_xcpzzsh_gg=null;
	String qh_xcpzzsh_xs=null;
	String qh_xcpzzsh_wznr=null;
	String qh_xcpzzsh_ysyq=null;
	String qh_xcpzzsh_qtyq=null;
	String qh_xcpzzsh_wcsj=null;
	String qh_xcpzzsh_bz=null;
	String sq_dwxx_dwmc=null;
	String qh_xcpzzsh_zgbmjlyj=null;
	qh_xcpzzsh_shbbh=request.getParameter("qh_xcpzzsh_shbbh");
	if (qh_xcpzzsh_shbbh!=null)
	{
		qh_xcpzzsh_shbbh=cf.GB2Uni(qh_xcpzzsh_shbbh);
		if (!(qh_xcpzzsh_shbbh.equals("")))	wheresql+=" and  (qh_xcpzzsh.shbbh='"+qh_xcpzzsh_shbbh+"')";
	}
	qh_xcpzzsh_sqsj=request.getParameter("qh_xcpzzsh_sqsj");
	if (qh_xcpzzsh_sqsj!=null)
	{
		qh_xcpzzsh_sqsj=qh_xcpzzsh_sqsj.trim();
		if (!(qh_xcpzzsh_sqsj.equals("")))	wheresql+="  and (qh_xcpzzsh.sqsj>=TO_DATE('"+qh_xcpzzsh_sqsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_sqsj=request.getParameter("qh_xcpzzsh_sqsj2");
	if (qh_xcpzzsh_sqsj!=null)
	{
		qh_xcpzzsh_sqsj=qh_xcpzzsh_sqsj.trim();
		if (!(qh_xcpzzsh_sqsj.equals("")))	wheresql+="  and (qh_xcpzzsh.sqsj<=TO_DATE('"+qh_xcpzzsh_sqsj+"','YYYY/MM/DD'))";
	}
	
	qh_xcpzzsh_zznr=request.getParameter("qh_xcpzzsh_zznr");
	if (qh_xcpzzsh_zznr!=null)
	{
		qh_xcpzzsh_zznr=cf.GB2Uni(qh_xcpzzsh_zznr);
		if (!(qh_xcpzzsh_zznr.equals("")))	wheresql+=" and  (qh_xcpzzsh.zznr='"+qh_xcpzzsh_zznr+"')";
	}
	qh_xcpzzsh_sl=request.getParameter("qh_xcpzzsh_sl");
	if (qh_xcpzzsh_sl!=null)
	{
		qh_xcpzzsh_sl=qh_xcpzzsh_sl.trim();
		if (!(qh_xcpzzsh_sl.equals("")))	wheresql+=" and (qh_xcpzzsh.sl="+qh_xcpzzsh_sl+") ";
	}
	qh_xcpzzsh_gg=request.getParameter("qh_xcpzzsh_gg");
	if (qh_xcpzzsh_gg!=null)
	{
		qh_xcpzzsh_gg=cf.GB2Uni(qh_xcpzzsh_gg);
		if (!(qh_xcpzzsh_gg.equals("")))	wheresql+=" and  (qh_xcpzzsh.gg='"+qh_xcpzzsh_gg+"')";
	}
	qh_xcpzzsh_xs=request.getParameter("qh_xcpzzsh_xs");
	if (qh_xcpzzsh_xs!=null)
	{
		qh_xcpzzsh_xs=cf.GB2Uni(qh_xcpzzsh_xs);
		if (!(qh_xcpzzsh_xs.equals("")))	wheresql+=" and  (qh_xcpzzsh.xs='"+qh_xcpzzsh_xs+"')";
	}
	qh_xcpzzsh_wznr=request.getParameter("qh_xcpzzsh_wznr");
	if (qh_xcpzzsh_wznr!=null)
	{
		qh_xcpzzsh_wznr=cf.GB2Uni(qh_xcpzzsh_wznr);
		if (!(qh_xcpzzsh_wznr.equals("")))	wheresql+=" and  (qh_xcpzzsh.wznr='"+qh_xcpzzsh_wznr+"')";
	}
	qh_xcpzzsh_ysyq=request.getParameter("qh_xcpzzsh_ysyq");
	if (qh_xcpzzsh_ysyq!=null)
	{
		qh_xcpzzsh_ysyq=cf.GB2Uni(qh_xcpzzsh_ysyq);
		if (!(qh_xcpzzsh_ysyq.equals("")))	wheresql+=" and  (qh_xcpzzsh.ysyq='"+qh_xcpzzsh_ysyq+"')";
	}
	qh_xcpzzsh_qtyq=request.getParameter("qh_xcpzzsh_qtyq");
	if (qh_xcpzzsh_qtyq!=null)
	{
		qh_xcpzzsh_qtyq=cf.GB2Uni(qh_xcpzzsh_qtyq);
		if (!(qh_xcpzzsh_qtyq.equals("")))	wheresql+=" and  (qh_xcpzzsh.qtyq='"+qh_xcpzzsh_qtyq+"')";
	}
	qh_xcpzzsh_wcsj=request.getParameter("qh_xcpzzsh_wcsj");
	if (qh_xcpzzsh_wcsj!=null)
	{
		qh_xcpzzsh_wcsj=qh_xcpzzsh_wcsj.trim();
		if (!(qh_xcpzzsh_wcsj.equals("")))	wheresql+="  and (qh_xcpzzsh.wcsj=TO_DATE('"+qh_xcpzzsh_wcsj+"','YYYY/MM/DD'))";
	}
	qh_xcpzzsh_bz=request.getParameter("qh_xcpzzsh_bz");
	if (qh_xcpzzsh_bz!=null)
	{
		qh_xcpzzsh_bz=cf.GB2Uni(qh_xcpzzsh_bz);
		if (!(qh_xcpzzsh_bz.equals("")))	wheresql+=" and  (qh_xcpzzsh.bz='"+qh_xcpzzsh_bz+"')";
	}
	sq_dwxx_dwmc=request.getParameter("dwbh");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+sq_dwxx_dwmc+"')";
	}
	qh_xcpzzsh_zgbmjlyj=request.getParameter("qh_xcpzzsh_zgbmjlyj");
	if (qh_xcpzzsh_zgbmjlyj!=null)
	{
		qh_xcpzzsh_zgbmjlyj=cf.GB2Uni(qh_xcpzzsh_zgbmjlyj);
		if (!(qh_xcpzzsh_zgbmjlyj.equals("")))	wheresql+=" and  (qh_xcpzzsh.zgbmjlyj='"+qh_xcpzzsh_zgbmjlyj+"')";
	}
	ls_sql="SELECT qh_xcpzzsh.shbbh as shbbh,qh_xcpzzsh.sqsj as qh_xcpzzsh_sqsj,qh_xcpzzsh.zznr as qh_xcpzzsh_zznr,qh_xcpzzsh.sl as qh_xcpzzsh_sl,qh_xcpzzsh.gg as qh_xcpzzsh_gg,qh_xcpzzsh.xs as qh_xcpzzsh_xs,qh_xcpzzsh.wznr as qh_xcpzzsh_wznr,qh_xcpzzsh.ysyq as qh_xcpzzsh_ysyq,qh_xcpzzsh.qtyq as qh_xcpzzsh_qtyq,qh_xcpzzsh.wcsj as qh_xcpzzsh_wcsj,qh_xcpzzsh.scwjm,qh_xcpzzsh.bz as qh_xcpzzsh_bz,sq_dwxx.dwmc as sq_dwxx_dwmc,qh_xcpzzsh.zgbmjlyj as qh_xcpzzsh_zgbmjlyj  ";
	ls_sql+=" FROM qh_xcpzzsh,sq_dwxx  ";
    ls_sql+=" where qh_xcpzzsh.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Qh_xcpzzshList.jsp","SelectQh_xcpzzsh.jsp","ViewQh_xcpzzsh.jsp","EditQh_xcpzzsh.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"shbbh","qh_xcpzzsh_sqsj","qh_xcpzzsh_zznr","qh_xcpzzsh_sl","qh_xcpzzsh_gg","qh_xcpzzsh_xs","qh_xcpzzsh_wznr","qh_xcpzzsh_ysyq","qh_xcpzzsh_qtyq","qh_xcpzzsh_wcsj","qh_xcpzzsh_bz","sq_dwxx_dwmc","qh_xcpzzsh_zgbmjlyj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"shbbh"};
	pageObj.setKey(keyName);
	//设置主键
	//String[] keyName1={"khbh","sgd"};
	//pageObj.setKey(keyName1);
	//pageObj.setEditStr("调查");
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Qh_xcpzzshList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	coluParmHash.put("saleid",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
//设置主键的显示方式
	pageObj.setKeyMark("SQL");//SQL：主键以SQL的方式显示；PARAM：主键以"123*we*4455"的方式显示
*/
}
else//非第一次进入此页，不需要初始化
{
	String[] shbbh = request.getParameterValues("shbbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(shbbh,"shbbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from qh_xcpzzsh where "+chooseitem;
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
	<td  width="12%">&nbsp;</td>
	<td  width="6%">审核表编号</td>
	<td  width="6%">申请时间</td>
	<td  width="6%">制作内容</td>
	<td  width="6%">数量</td>
	<td  width="6%">规格</td>
	<td  width="6%">形式</td>
	<td  width="6%">文字内容</td>
	<td  width="6%">颜色要求</td>
	<td  width="6%">其它要求</td>
	<td  width="6%">完成时间</td>
	<td  width="6%">企划文件名</td>
	<td  width="6%">备注</td>
	<td  width="6%">申报部门</td>
	<td  width="6%">主管部门经理意见</td>
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