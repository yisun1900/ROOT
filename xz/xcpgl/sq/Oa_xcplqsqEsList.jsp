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
	String oa_xcplqsq_sqxh=null;
	String oa_xcplqsq_dwbh=null;
	String oa_xcplqsq_fgsbh=null;
	String oa_xcplqsq_slr=null;
	String oa_xcplqsq_jhlqrq=null;
	String oa_xcplqsq_lrr=null;
	String oa_xcplqsq_lrrq=null;
	String oa_xcplqsq_sfxsp=null;
	String oa_xcplqsq_lqzt=null;
	String oa_xcplqsq_yjspr=null;
	String oa_xcplqsq_yjspsj=null;
	String oa_xcplqsq_yjspjl=null;

	oa_xcplqsq_sqxh=request.getParameter("oa_xcplqsq_sqxh");
	if (oa_xcplqsq_sqxh!=null)
	{
		oa_xcplqsq_sqxh=oa_xcplqsq_sqxh.trim();
		if (!(oa_xcplqsq_sqxh.equals("")))	wheresql+=" and (oa_xcplqsq.sqxh="+oa_xcplqsq_sqxh+") ";
	}
	oa_xcplqsq_dwbh=request.getParameter("oa_xcplqsq_dwbh");
	if (oa_xcplqsq_dwbh!=null)
	{
		oa_xcplqsq_dwbh=cf.GB2Uni(oa_xcplqsq_dwbh);
		if (!(oa_xcplqsq_dwbh.equals("")))	wheresql+=" and  (oa_xcplqsq.dwbh='"+oa_xcplqsq_dwbh+"')";
	}
	oa_xcplqsq_fgsbh=request.getParameter("oa_xcplqsq_fgsbh");
	if (oa_xcplqsq_fgsbh!=null)
	{
		oa_xcplqsq_fgsbh=cf.GB2Uni(oa_xcplqsq_fgsbh);
		if (!(oa_xcplqsq_fgsbh.equals("")))	wheresql+=" and  (oa_xcplqsq.fgsbh='"+oa_xcplqsq_fgsbh+"')";
	}
	oa_xcplqsq_slr=request.getParameter("oa_xcplqsq_slr");
	if (oa_xcplqsq_slr!=null)
	{
		oa_xcplqsq_slr=cf.GB2Uni(oa_xcplqsq_slr);
		if (!(oa_xcplqsq_slr.equals("")))	wheresql+=" and  (oa_xcplqsq.slr='"+oa_xcplqsq_slr+"')";
	}
	oa_xcplqsq_jhlqrq=request.getParameter("oa_xcplqsq_jhlqrq");
	if (oa_xcplqsq_jhlqrq!=null)
	{
		oa_xcplqsq_jhlqrq=oa_xcplqsq_jhlqrq.trim();
		if (!(oa_xcplqsq_jhlqrq.equals("")))	wheresql+="  and (oa_xcplqsq.jhlqrq>=TO_DATE('"+oa_xcplqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_jhlqrq=request.getParameter("oa_xcplqsq_jhlqrq2");
	if (oa_xcplqsq_jhlqrq!=null)
	{
		oa_xcplqsq_jhlqrq=oa_xcplqsq_jhlqrq.trim();
		if (!(oa_xcplqsq_jhlqrq.equals("")))	wheresql+="  and (oa_xcplqsq.jhlqrq<=TO_DATE('"+oa_xcplqsq_jhlqrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_lrr=request.getParameter("oa_xcplqsq_lrr");
	if (oa_xcplqsq_lrr!=null)
	{
		oa_xcplqsq_lrr=cf.GB2Uni(oa_xcplqsq_lrr);
		if (!(oa_xcplqsq_lrr.equals("")))	wheresql+=" and  (oa_xcplqsq.lrr='"+oa_xcplqsq_lrr+"')";
	}
	oa_xcplqsq_lrrq=request.getParameter("oa_xcplqsq_lrrq");
	if (oa_xcplqsq_lrrq!=null)
	{
		oa_xcplqsq_lrrq=oa_xcplqsq_lrrq.trim();
		if (!(oa_xcplqsq_lrrq.equals("")))	wheresql+="  and (oa_xcplqsq.lrrq>=TO_DATE('"+oa_xcplqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_lrrq=request.getParameter("oa_xcplqsq_lrrq2");
	if (oa_xcplqsq_lrrq!=null)
	{
		oa_xcplqsq_lrrq=oa_xcplqsq_lrrq.trim();
		if (!(oa_xcplqsq_lrrq.equals("")))	wheresql+="  and (oa_xcplqsq.lrrq<=TO_DATE('"+oa_xcplqsq_lrrq+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_sfxsp=request.getParameter("oa_xcplqsq_sfxsp");
	if (oa_xcplqsq_sfxsp!=null)
	{
		oa_xcplqsq_sfxsp=cf.GB2Uni(oa_xcplqsq_sfxsp);
		if (!(oa_xcplqsq_sfxsp.equals("")))	wheresql+=" and  (oa_xcplqsq.sfxsp='"+oa_xcplqsq_sfxsp+"')";
	}
	oa_xcplqsq_lqzt=request.getParameter("oa_xcplqsq_lqzt");
	if (oa_xcplqsq_lqzt!=null)
	{
		oa_xcplqsq_lqzt=cf.GB2Uni(oa_xcplqsq_lqzt);
		if (!(oa_xcplqsq_lqzt.equals("")))	wheresql+=" and  (oa_xcplqsq.lqzt='"+oa_xcplqsq_lqzt+"')";
	}
	oa_xcplqsq_yjspr=request.getParameter("oa_xcplqsq_yjspr");
	if (oa_xcplqsq_yjspr!=null)
	{
		oa_xcplqsq_yjspr=cf.GB2Uni(oa_xcplqsq_yjspr);
		if (!(oa_xcplqsq_yjspr.equals("")))	wheresql+=" and  (oa_xcplqsq.yjspr='"+oa_xcplqsq_yjspr+"')";
	}
	oa_xcplqsq_yjspsj=request.getParameter("oa_xcplqsq_yjspsj");
	if (oa_xcplqsq_yjspsj!=null)
	{
		oa_xcplqsq_yjspsj=oa_xcplqsq_yjspsj.trim();
		if (!(oa_xcplqsq_yjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.yjspsj>=TO_DATE('"+oa_xcplqsq_yjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_yjspsj=request.getParameter("oa_xcplqsq_yjspsj2");
	if (oa_xcplqsq_yjspsj!=null)
	{
		oa_xcplqsq_yjspsj=oa_xcplqsq_yjspsj.trim();
		if (!(oa_xcplqsq_yjspsj.equals("")))	wheresql+="  and (oa_xcplqsq.yjspsj<=TO_DATE('"+oa_xcplqsq_yjspsj+"','YYYY/MM/DD'))";
	}
	oa_xcplqsq_yjspjl=request.getParameter("oa_xcplqsq_yjspjl");
	if (oa_xcplqsq_yjspjl!=null)
	{
		oa_xcplqsq_yjspjl=cf.GB2Uni(oa_xcplqsq_yjspjl);
		if (!(oa_xcplqsq_yjspjl.equals("")))	wheresql+=" and  (oa_xcplqsq.yjspjl='"+oa_xcplqsq_yjspjl+"')";
	}

	ls_sql="SELECT oa_xcplqsq.sqxh, DECODE(oa_xcplqsq.sfxsp,'N','不需要','Y','需要'), DECODE(oa_xcplqsq.lqzt,'1','未完成','2','完成申请','3','一级审批','4','二级审批','5','三级审批','6','已领取'),a.dwmc dw,b.dwmc fgsbh ,oa_xcplqsq.slr,oa_xcplqsq.jhlqrq,oa_xcplqsq.lrr,oa_xcplqsq.lrrq,oa_xcplqsq.yjspr,oa_xcplqsq.yjspsj, DECODE(oa_xcplqsq.yjspjl,'1','同意','2','返回上级','3','撤销'),oa_xcplqsq.yjspsm,oa_xcplqsq.jhlqsl,oa_xcplqsq.jhlqje,oa_xcplqsq.bz  ";
	ls_sql+=" FROM oa_xcplqsq,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where oa_xcplqsq.dwbh=a.dwbh(+) and oa_xcplqsq.fgsbh=b.dwbh(+) ";
    ls_sql+=" and ((oa_xcplqsq.lqzt='3' and oa_xcplqsq.yjspjl='1')  OR  (oa_xcplqsq.lqzt='5' and oa_xcplqsq.sjspjl='2') )";
    ls_sql+=wheresql;
    ls_sql+=" order by oa_xcplqsq.yjspsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Oa_xcplqsqEsList.jsp","SelectEsOa_xcplqsq.jsp","","EsOa_xcplqsq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqxh","sq_dwxx_dwmc","oa_xcplqsq_fgsbh","oa_xcplqsq_slr","oa_xcplqsq_jhlqrq","oa_xcplqsq_lrr","oa_xcplqsq_lrrq","oa_xcplqsq_sfxsp","oa_xcplqsq_lqzt","oa_xcplqsq_yjspr","oa_xcplqsq_yjspsj","oa_xcplqsq_yjspjl","oa_xcplqsq_yjspsm","oa_xcplqsq_ejspr","oa_xcplqsq_ejspsj","oa_xcplqsq_ejspjl","oa_xcplqsq_ejspsm","oa_xcplqsq_sjspr","oa_xcplqsq_sjspsj","oa_xcplqsq_sjspjl","oa_xcplqsq_sjspsm","oa_xcplqsq_blr","oa_xcplqsq_lqsj","oa_xcplqsq_jhlqsl","oa_xcplqsq_jhlqje","oa_xcplqsq_slqsl","oa_xcplqsq_slqje","oa_xcplqsq_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("审批");

//设置按钮参数
	String[] buttonName={"批量同意","批量不同意"};//按钮的显示名称
	String[] buttonLink={"Oa_xcplqsqEsList.jsp?ejspjl=1","Oa_xcplqsqEsList.jsp?ejspjl=3"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0,0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"sqxh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewOa_xcplqsq.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("sqxh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表
}
else//非第一次进入此页，不需要初始化
{
	String yhmc=(String)session.getAttribute("yhmc");
	String ejspjl=request.getParameter("ejspjl");
	String[] sqxh = request.getParameterValues("sqxh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sqxh,"sqxh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="update oa_xcplqsq set lqzt='4',ejspr='"+yhmc+"',ejspsj=TRUNC(SYSDATE),ejspjl='"+ejspjl+"',ejspsm='批量审批' where oa_xcplqsq.lqzt='3' and oa_xcplqsq.yjspjl='1' and ("+chooseitem+")";
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
  <B><font size="3">印刷品领取申请---二级审批</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(200);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="3%">申请序号</td>
	<td  width="3%">是否需审批</td>
	<td  width="4%">领取状态</td>
	<td  width="8%">申领单位</td>
	<td  width="7%">申领分公司</td>
	<td  width="3%">申领人</td>
	<td  width="5%">计划领取日期</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入日期</td>
	<td  width="3%">一级审批人</td>
	<td  width="5%">一级审批时间</td>
	<td  width="4%">一级审批结论</td>
	<td  width="17%">一级审批说明</td>
	<td  width="4%">计划领取数量</td>
	<td  width="4%">计划领取金额</td>
	<td  width="18%">备注</td>
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