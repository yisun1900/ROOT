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
	String sqbh=null;
	String zbye=null;
	String zbzw=null;
	String fgs=null;
	String dwbh=null;
	String zbly=null;
	String zbqt=null;
	String xwdgsj=null;
	String xb=null;
	String hy=null;
	String nl=null;
	String xl=null;
	String zy=null;
	String wy=null;
	String jsjjn=null;
	String gzjy=null;
	String gx=null;
	String jn=null;
	String qt=null;
	String jhzt=null;
	String lrr=null;
	String ssfgs=null;
	String lrsj=null;
	sqbh=request.getParameter("sqbh");
	if (sqbh!=null)
	{
		sqbh=cf.GB2Uni(sqbh);
		if (!(sqbh.equals("")))	wheresql+=" and  (sqbh='"+sqbh+"')";
	}
	zbye=request.getParameter("zbye");
	if (zbye!=null)
	{
		zbye=zbye.trim();
		if (!(zbye.equals("")))	wheresql+=" and (zbye="+zbye+") ";
	}
	zbzw=request.getParameter("zbzw");
	if (zbzw!=null)
	{
		zbzw=cf.GB2Uni(zbzw);
		if (!(zbzw.equals("")))	wheresql+=" and  (zbzw='"+zbzw+"')";
	}
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		fgs=cf.GB2Uni(fgs);
		if (!(fgs.equals("")))	wheresql+=" and  (rs_ryzbsq.fgs='"+fgs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (rs_ryzbsq.dwbh='"+dwbh+"')";
	}
	zbly=request.getParameter("zbly");
	if (zbly!=null)
	{
		zbly=cf.GB2Uni(zbly);
		if (!(zbly.equals("")))	wheresql+=" and  (zbly='"+zbly+"')";
	}
	zbqt=request.getParameter("zbqt");
	if (zbqt!=null)
	{
		zbqt=cf.GB2Uni(zbqt);
		if (!(zbqt.equals("")))	wheresql+=" and  (zbqt='"+zbqt+"')";
	}
	xwdgsj=request.getParameter("xwdgsj");
	if (xwdgsj!=null)
	{
		xwdgsj=xwdgsj.trim();
		if (!(xwdgsj.equals("")))	wheresql+="  and (xwdgsj>=TO_DATE('"+xwdgsj+"','YYYY/MM/DD'))";
	}
	xwdgsj=request.getParameter("xwdgsj2");
	if (xwdgsj!=null)
	{
		xwdgsj=xwdgsj.trim();
		if (!(xwdgsj.equals("")))	wheresql+="  and (xwdgsj<=TO_DATE('"+xwdgsj+"','YYYY/MM/DD'))";
	}
	xb=request.getParameter("xb");
	if (xb!=null)
	{
		xb=cf.GB2Uni(xb);
		if (!(xb.equals("")))	wheresql+=" and  (xb='"+xb+"')";
	}
	hy=request.getParameter("hy");
	if (hy!=null)
	{
		hy=cf.GB2Uni(hy);
		if (!(hy.equals("")))	wheresql+=" and  (hy='"+hy+"')";
	}
	nl=request.getParameter("nl");
	if (nl!=null)
	{
		nl=cf.GB2Uni(nl);
		if (!(nl.equals("")))	wheresql+=" and  (nl='"+nl+"')";
	}
	xl=request.getParameter("xl");
	if (xl!=null)
	{
		xl=cf.GB2Uni(xl);
		if (!(xl.equals("")))	wheresql+=" and  (xl='"+xl+"')";
	}
	zy=request.getParameter("zy");
	if (zy!=null)
	{
		zy=cf.GB2Uni(zy);
		if (!(zy.equals("")))	wheresql+=" and  (zy='"+zy+"')";
	}
	wy=request.getParameter("wy");
	if (wy!=null)
	{
		wy=cf.GB2Uni(wy);
		if (!(wy.equals("")))	wheresql+=" and  (wy='"+wy+"')";
	}
	jsjjn=request.getParameter("jsjjn");
	if (jsjjn!=null)
	{
		jsjjn=cf.GB2Uni(jsjjn);
		if (!(jsjjn.equals("")))	wheresql+=" and  (jsjjn='"+jsjjn+"')";
	}
	gzjy=request.getParameter("gzjy");
	if (gzjy!=null)
	{
		gzjy=cf.GB2Uni(gzjy);
		if (!(gzjy.equals("")))	wheresql+=" and  (gzjy='"+gzjy+"')";
	}
	gx=request.getParameter("gx");
	if (gx!=null)
	{
		gx=cf.GB2Uni(gx);
		if (!(gx.equals("")))	wheresql+=" and  (gx='"+gx+"')";
	}
	jn=request.getParameter("jn");
	if (jn!=null)
	{
		jn=cf.GB2Uni(jn);
		if (!(jn.equals("")))	wheresql+=" and  (jn='"+jn+"')";
	}
	qt=request.getParameter("qt");
	if (qt!=null)
	{
		qt=cf.GB2Uni(qt);
		if (!(qt.equals("")))	wheresql+=" and  (qt='"+qt+"')";
	}
	jhzt=request.getParameter("jhzt");
	if (jhzt!=null)
	{
		jhzt=cf.GB2Uni(jhzt);
		if (!(jhzt.equals("")))	wheresql+=" and  (jhzt='"+jhzt+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (rs_ryzbsq.ssfgs='"+ssfgs+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT sqbh,zbye,dm_xzzwbm.xzzwmc zbzw,a.dwmc fgs,b.dwmc dwbh, DECODE(zbly,'1','缺员补充','2','扩大编制','3','储备人力','4','其他'),zbqt,xwdgsj,DECODE(jhzt,'1','等待审批','2','审批流程中','3','招聘完成','4','审批未通过','5','修改计划','6','审核完成'),lrr,c.dwmc ssfgs,lrsj  ";
	ls_sql+=" FROM rs_ryzbsq,sq_dwxx a,sq_dwxx b ,dm_xzzwbm,sq_dwxx c ";
    ls_sql+=" where  a.dwbh=rs_ryzbsq.fgs and b.dwbh=rs_ryzbsq.dwbh and dm_xzzwbm.xzzwbm=rs_ryzbsq.zbzw and c.dwbh=rs_ryzbsq.ssfgs ";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Rs_ryzbsqList.jsp","SelectRs_ryzbsq.jsp","","EditRs_ryzbsq.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"sqbh","zbye","zbzw","fgs","dwbh","zbly","zbqt","xwdgsj","xb","hy","nl","xl","zy","wy","jsjjn","gzjy","gx","jn","qt","jhzt","lrr","ssfgs","lrsj"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"sqbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Rs_ryzbsqList.jsp?"};//按钮单击调用的网页，可以增加参数
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
	String[] sqbh = request.getParameterValues("sqbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(sqbh,"sqbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[1];//要执行的SQL
		boolean needCommit=false;//不需要事务处理
		sql[0]="delete from rs_ryzbsq where "+chooseitem;
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
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">&nbsp;</td>
	<td  width="7%">申请编号</td>
	<td  width="6%">增补员额</td>
	<td  width="7%">增补职务</td>
	<td  width="9%">所属分公司</td>
	<td  width="8%">申请部门</td>
	<td  width="6%">增补理由</td>
	<td  width="9%">增补其他</td>
	<td  width="9%">希望到岗时间</td>
	<td  width="7%">申请状态</td>
	<td  width="7%">录入人</td>
	<td  width="10%">录入人分公司</td>
	<td  width="8%">录入时间</td>
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