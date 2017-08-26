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
	String crm_htlqjl_lqjlh=null;
	String crm_htlqjl_lqsl=null;
	String crm_htlqjl_sysl=null;
	String crm_htlqjl_zfsl=null;
	String crm_htlqjl_dwbh=null;
	String crm_htlqjl_fgsbh=null;
	String crm_htlqjl_lqr=null;
	String crm_htlqjl_lqsj=null;
	String crm_htlqjl_qshth=null;
	String crm_htlqjl_zzhth=null;
	String crm_htlqjl_xzbz=null;
	String crm_htlqjl_xzr=null;
	String crm_htlqjl_xzsj=null;
	String crm_htlqjl_lrr=null;
	String crm_htlqjl_lrsj=null;
	crm_htlqjl_lqjlh=request.getParameter("crm_htlqjl_lqjlh");
	if (crm_htlqjl_lqjlh!=null)
	{
		crm_htlqjl_lqjlh=cf.GB2Uni(crm_htlqjl_lqjlh);
		if (!(crm_htlqjl_lqjlh.equals("")))	wheresql+=" and  (crm_htlqjl.lqjlh='"+crm_htlqjl_lqjlh+"')";
	}
	crm_htlqjl_lqsl=request.getParameter("crm_htlqjl_lqsl");
	if (crm_htlqjl_lqsl!=null)
	{
		crm_htlqjl_lqsl=crm_htlqjl_lqsl.trim();
		if (!(crm_htlqjl_lqsl.equals("")))	wheresql+=" and (crm_htlqjl.lqsl="+crm_htlqjl_lqsl+") ";
	}
	crm_htlqjl_sysl=request.getParameter("crm_htlqjl_sysl");
	if (crm_htlqjl_sysl!=null)
	{
		crm_htlqjl_sysl=crm_htlqjl_sysl.trim();
		if (!(crm_htlqjl_sysl.equals("")))	wheresql+=" and (crm_htlqjl.sysl="+crm_htlqjl_sysl+") ";
	}
	crm_htlqjl_zfsl=request.getParameter("crm_htlqjl_zfsl");
	if (crm_htlqjl_zfsl!=null)
	{
		crm_htlqjl_zfsl=crm_htlqjl_zfsl.trim();
		if (!(crm_htlqjl_zfsl.equals("")))	wheresql+=" and (crm_htlqjl.zfsl="+crm_htlqjl_zfsl+") ";
	}
	crm_htlqjl_dwbh=request.getParameter("crm_htlqjl_dwbh");
	if (crm_htlqjl_dwbh!=null)
	{
		crm_htlqjl_dwbh=cf.GB2Uni(crm_htlqjl_dwbh);
		if (!(crm_htlqjl_dwbh.equals("")))	wheresql+=" and  (crm_htlqjl.dwbh='"+crm_htlqjl_dwbh+"')";
	}
	crm_htlqjl_fgsbh=request.getParameter("crm_htlqjl_fgsbh");
	if (crm_htlqjl_fgsbh!=null)
	{
		crm_htlqjl_fgsbh=cf.GB2Uni(crm_htlqjl_fgsbh);
		if (!(crm_htlqjl_fgsbh.equals("")))	wheresql+=" and  (crm_htlqjl.fgsbh='"+crm_htlqjl_fgsbh+"')";
	}
	crm_htlqjl_lqr=request.getParameter("crm_htlqjl_lqr");
	if (crm_htlqjl_lqr!=null)
	{
		crm_htlqjl_lqr=cf.GB2Uni(crm_htlqjl_lqr);
		if (!(crm_htlqjl_lqr.equals("")))	wheresql+=" and  (crm_htlqjl.lqr='"+crm_htlqjl_lqr+"')";
	}
	crm_htlqjl_lqsj=request.getParameter("crm_htlqjl_lqsj");
	if (crm_htlqjl_lqsj!=null)
	{
		crm_htlqjl_lqsj=crm_htlqjl_lqsj.trim();
		if (!(crm_htlqjl_lqsj.equals("")))	wheresql+="  and (crm_htlqjl.lqsj>=TO_DATE('"+crm_htlqjl_lqsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_lqsj=request.getParameter("crm_htlqjl_lqsj2");
	if (crm_htlqjl_lqsj!=null)
	{
		crm_htlqjl_lqsj=crm_htlqjl_lqsj.trim();
		if (!(crm_htlqjl_lqsj.equals("")))	wheresql+="  and (crm_htlqjl.lqsj<=TO_DATE('"+crm_htlqjl_lqsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_qshth=request.getParameter("crm_htlqjl_qshth");
	if (crm_htlqjl_qshth!=null)
	{
		crm_htlqjl_qshth=cf.GB2Uni(crm_htlqjl_qshth);
		if (!(crm_htlqjl_qshth.equals("")))	wheresql+=" and  (crm_htlqjl.qshth='"+crm_htlqjl_qshth+"')";
	}
	crm_htlqjl_zzhth=request.getParameter("crm_htlqjl_zzhth");
	if (crm_htlqjl_zzhth!=null)
	{
		crm_htlqjl_zzhth=cf.GB2Uni(crm_htlqjl_zzhth);
		if (!(crm_htlqjl_zzhth.equals("")))	wheresql+=" and  (crm_htlqjl.zzhth='"+crm_htlqjl_zzhth+"')";
	}
	crm_htlqjl_xzbz=request.getParameter("crm_htlqjl_xzbz");
	if (crm_htlqjl_xzbz!=null)
	{
		crm_htlqjl_xzbz=cf.GB2Uni(crm_htlqjl_xzbz);
		if (!(crm_htlqjl_xzbz.equals("")))	wheresql+=" and  (crm_htlqjl.xzbz='"+crm_htlqjl_xzbz+"')";
	}
	crm_htlqjl_xzr=request.getParameter("crm_htlqjl_xzr");
	if (crm_htlqjl_xzr!=null)
	{
		crm_htlqjl_xzr=cf.GB2Uni(crm_htlqjl_xzr);
		if (!(crm_htlqjl_xzr.equals("")))	wheresql+=" and  (crm_htlqjl.xzr='"+crm_htlqjl_xzr+"')";
	}
	crm_htlqjl_xzsj=request.getParameter("crm_htlqjl_xzsj");
	if (crm_htlqjl_xzsj!=null)
	{
		crm_htlqjl_xzsj=crm_htlqjl_xzsj.trim();
		if (!(crm_htlqjl_xzsj.equals("")))	wheresql+="  and (crm_htlqjl.xzsj>=TO_DATE('"+crm_htlqjl_xzsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_xzsj=request.getParameter("crm_htlqjl_xzsj2");
	if (crm_htlqjl_xzsj!=null)
	{
		crm_htlqjl_xzsj=crm_htlqjl_xzsj.trim();
		if (!(crm_htlqjl_xzsj.equals("")))	wheresql+="  and (crm_htlqjl.xzsj<=TO_DATE('"+crm_htlqjl_xzsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_lrr=request.getParameter("crm_htlqjl_lrr");
	if (crm_htlqjl_lrr!=null)
	{
		crm_htlqjl_lrr=cf.GB2Uni(crm_htlqjl_lrr);
		if (!(crm_htlqjl_lrr.equals("")))	wheresql+=" and  (crm_htlqjl.lrr='"+crm_htlqjl_lrr+"')";
	}
	crm_htlqjl_lrsj=request.getParameter("crm_htlqjl_lrsj");
	if (crm_htlqjl_lrsj!=null)
	{
		crm_htlqjl_lrsj=crm_htlqjl_lrsj.trim();
		if (!(crm_htlqjl_lrsj.equals("")))	wheresql+="  and (crm_htlqjl.lrsj>=TO_DATE('"+crm_htlqjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_htlqjl_lrsj=request.getParameter("crm_htlqjl_lrsj2");
	if (crm_htlqjl_lrsj!=null)
	{
		crm_htlqjl_lrsj=crm_htlqjl_lrsj.trim();
		if (!(crm_htlqjl_lrsj.equals("")))	wheresql+="  and (crm_htlqjl.lrsj<=TO_DATE('"+crm_htlqjl_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT crm_htlqjl.lqjlh, DECODE(crm_htlqjl.xzbz,'N','未销账','Y','销账'),crm_htlqjl.lqsl,crm_htlqjl.sysl,crm_htlqjl.zfsl,crm_htlqjl.lqr,crm_htlqjl.lqsj,crm_htlqjl.qshth,crm_htlqjl.zzhth,a.dwmc dwbh,b.dwmc fgsbh,crm_htlqjl.xzr,crm_htlqjl.xzsj,crm_htlqjl.bz,crm_htlqjl.lrr,crm_htlqjl.lrsj  ";
	ls_sql+=" FROM crm_htlqjl,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where crm_htlqjl.dwbh=a.dwbh(+) and crm_htlqjl.fgsbh=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_htlqjl.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_htlqjlXzList.jsp","SelectXzCrm_htlqjl.jsp","","XzCrm_htlqjl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"lqjlh","crm_htlqjl_lqsl","crm_htlqjl_sysl","crm_htlqjl_zfsl","sq_dwxx_dwmc","crm_htlqjl_fgsbh","crm_htlqjl_lqr","crm_htlqjl_lqsj","crm_htlqjl_qshth","crm_htlqjl_zzhth","crm_htlqjl_xzbz","crm_htlqjl_xzr","crm_htlqjl_xzsj","crm_htlqjl_bz","crm_htlqjl_lrr","crm_htlqjl_lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"lqjlh"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"删除销账信息"};//按钮的显示名称
	String[] buttonLink={"Crm_htlqjlXgXzList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] lqjlh = request.getParameterValues("lqjlh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(lqjlh,"lqjlh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from crm_htlqjl where "+chooseitem;
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
  <B><font size="3">合同销账－维护</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">领取记录号</td>
	<td  width="4%">销账标志</td>
	<td  width="4%">领取数量</td>
	<td  width="4%">使用数量</td>
	<td  width="4%">做废数量</td>
	<td  width="4%">领取人</td>
	<td  width="5%">领取时间</td>
	<td  width="7%">起始合同号</td>
	<td  width="7%">终止合同号</td>
	<td  width="8%">领取部门</td>
	<td  width="7%">领取分公司</td>
	<td  width="4%">销账人</td>
	<td  width="5%">销账时间</td>
	<td  width="19%">备注</td>
	<td  width="4%">录入人</td>
	<td  width="5%">录入时间</td>
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