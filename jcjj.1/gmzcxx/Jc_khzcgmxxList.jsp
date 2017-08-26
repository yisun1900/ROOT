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
	String jc_khzcgmxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String jc_khzcgmxx_clzt=null;
	String jc_khzcgmxx_lrr=null;
	String jc_khzcgmxx_lrsj=null;
	String jc_khzcgmxx_lrbm=null;
	String jc_khzcgmxx_shr=null;
	String jc_khzcgmxx_shsj=null;
	jc_khzcgmxx_khbh=request.getParameter("jc_khzcgmxx_khbh");
	if (jc_khzcgmxx_khbh!=null)
	{
		jc_khzcgmxx_khbh=cf.GB2Uni(jc_khzcgmxx_khbh);
		if (!(jc_khzcgmxx_khbh.equals("")))	wheresql+=" and  (jc_khzcgmxx.khbh='"+jc_khzcgmxx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	jc_khzcgmxx_clzt=request.getParameter("jc_khzcgmxx_clzt");
	if (jc_khzcgmxx_clzt!=null)
	{
		jc_khzcgmxx_clzt=cf.GB2Uni(jc_khzcgmxx_clzt);
		if (!(jc_khzcgmxx_clzt.equals("")))	wheresql+=" and  (jc_khzcgmxx.clzt='"+jc_khzcgmxx_clzt+"')";
	}
	jc_khzcgmxx_lrr=request.getParameter("jc_khzcgmxx_lrr");
	if (jc_khzcgmxx_lrr!=null)
	{
		jc_khzcgmxx_lrr=cf.GB2Uni(jc_khzcgmxx_lrr);
		if (!(jc_khzcgmxx_lrr.equals("")))	wheresql+=" and  (jc_khzcgmxx.lrr='"+jc_khzcgmxx_lrr+"')";
	}
	jc_khzcgmxx_lrsj=request.getParameter("jc_khzcgmxx_lrsj");
	if (jc_khzcgmxx_lrsj!=null)
	{
		jc_khzcgmxx_lrsj=jc_khzcgmxx_lrsj.trim();
		if (!(jc_khzcgmxx_lrsj.equals("")))	wheresql+="  and (jc_khzcgmxx.lrsj>=TO_DATE('"+jc_khzcgmxx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_khzcgmxx_lrsj=request.getParameter("jc_khzcgmxx_lrsj2");
	if (jc_khzcgmxx_lrsj!=null)
	{
		jc_khzcgmxx_lrsj=jc_khzcgmxx_lrsj.trim();
		if (!(jc_khzcgmxx_lrsj.equals("")))	wheresql+="  and (jc_khzcgmxx.lrsj<=TO_DATE('"+jc_khzcgmxx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_khzcgmxx_lrbm=request.getParameter("jc_khzcgmxx_lrbm");
	if (jc_khzcgmxx_lrbm!=null)
	{
		jc_khzcgmxx_lrbm=cf.GB2Uni(jc_khzcgmxx_lrbm);
		if (!(jc_khzcgmxx_lrbm.equals("")))	wheresql+=" and  (jc_khzcgmxx.lrbm='"+jc_khzcgmxx_lrbm+"')";
	}
	jc_khzcgmxx_shr=request.getParameter("jc_khzcgmxx_shr");
	if (jc_khzcgmxx_shr!=null)
	{
		jc_khzcgmxx_shr=cf.GB2Uni(jc_khzcgmxx_shr);
		if (!(jc_khzcgmxx_shr.equals("")))	wheresql+=" and  (jc_khzcgmxx.shr='"+jc_khzcgmxx_shr+"')";
	}
	jc_khzcgmxx_shsj=request.getParameter("jc_khzcgmxx_shsj");
	if (jc_khzcgmxx_shsj!=null)
	{
		jc_khzcgmxx_shsj=jc_khzcgmxx_shsj.trim();
		if (!(jc_khzcgmxx_shsj.equals("")))	wheresql+="  and (jc_khzcgmxx.shsj>=TO_DATE('"+jc_khzcgmxx_shsj+"','YYYY/MM/DD'))";
	}
	jc_khzcgmxx_shsj=request.getParameter("jc_khzcgmxx_shsj2");
	if (jc_khzcgmxx_shsj!=null)
	{
		jc_khzcgmxx_shsj=jc_khzcgmxx_shsj.trim();
		if (!(jc_khzcgmxx_shsj.equals("")))	wheresql+="  and (jc_khzcgmxx.shsj<=TO_DATE('"+jc_khzcgmxx_shsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT jc_khzcgmxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,jc_khzcgmxx.zje, DECODE(jc_khzcgmxx.clzt,'N','未审核','Y','审核'),jc_khzcgmxx.lrr,jc_khzcgmxx.lrsj,dwmc,jc_khzcgmxx.shr,jc_khzcgmxx.shsj,jc_khzcgmxx.shyj,jc_khzcgmxx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_khzcgmxx,sq_dwxx  ";
    ls_sql+=" where jc_khzcgmxx.khbh=crm_khxx.khbh(+) and jc_khzcgmxx.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_khzcgmxx.lrsj desc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jc_khzcgmxxList.jsp","","","EditJc_khzcgmxx.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","jc_khzcgmxx_zje","jc_khzcgmxx_clzt","jc_khzcgmxx_lrr","jc_khzcgmxx_lrsj","jc_khzcgmxx_lrbm","jc_khzcgmxx_shr","jc_khzcgmxx_shsj","jc_khzcgmxx_shyj","jc_khzcgmxx_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"Jc_khzcgmxxList.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={0};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_khzcgmxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJc_khzcgmmx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//判断是否需要执行删除操作
	{
		String[] sql=new String[2];//要执行的SQL
		boolean needCommit=true;//不需要事务处理
		sql[0]="delete from jc_khzcgmxx where "+chooseitem;
		sql[1]="delete from jc_khzcgmmx where "+chooseitem;
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
  <B><font size="3">客户主材购买信息－修改</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">客户编号</td>
	<td  width="7%">客户姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="7%">总金额</td>
	<td  width="5%">处理状态</td>
	<td  width="5%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="7%">录入部门</td>
	<td  width="5%">审核人</td>
	<td  width="7%">审核时间</td>
	<td  width="13%">审核意见</td>
	<td  width="15%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
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