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
	String cw_jrtcph_khzq=null;
	String cw_jrtcph_ssfgs=null;
	String cw_jrtcph_clzt=null;
	String cw_jrtcph_spr=null;
	String cw_jrtcph_spsj=null;
	String cw_jrtcph_spyj=null;
	String cw_jrtcph_lrsj=null;
	cw_jrtcph_khzq=request.getParameter("cw_jrtcph_khzq");
	if (cw_jrtcph_khzq!=null)
	{
		cw_jrtcph_khzq=cf.GB2Uni(cw_jrtcph_khzq);
		if (!(cw_jrtcph_khzq.equals("")))	wheresql+=" and  (cw_jrtcph.khzq='"+cw_jrtcph_khzq+"')";
	}
	cw_jrtcph_ssfgs=request.getParameter("cw_jrtcph_ssfgs");
	if (cw_jrtcph_ssfgs!=null)
	{
		cw_jrtcph_ssfgs=cf.GB2Uni(cw_jrtcph_ssfgs);
		if (!(cw_jrtcph_ssfgs.equals("")))	wheresql+=" and  (cw_jrtcph.ssfgs='"+cw_jrtcph_ssfgs+"')";
	}
	cw_jrtcph_clzt=request.getParameter("cw_jrtcph_clzt");
	if (cw_jrtcph_clzt!=null)
	{
		cw_jrtcph_clzt=cf.GB2Uni(cw_jrtcph_clzt);
		if (!(cw_jrtcph_clzt.equals("")))	wheresql+=" and  (cw_jrtcph.clzt='"+cw_jrtcph_clzt+"')";
	}
	cw_jrtcph_spr=request.getParameter("cw_jrtcph_spr");
	if (cw_jrtcph_spr!=null)
	{
		cw_jrtcph_spr=cf.GB2Uni(cw_jrtcph_spr);
		if (!(cw_jrtcph_spr.equals("")))	wheresql+=" and  (cw_jrtcph.spr='"+cw_jrtcph_spr+"')";
	}
	cw_jrtcph_spsj=request.getParameter("cw_jrtcph_spsj");
	if (cw_jrtcph_spsj!=null)
	{
		cw_jrtcph_spsj=cw_jrtcph_spsj.trim();
		if (!(cw_jrtcph_spsj.equals("")))	wheresql+="  and (cw_jrtcph.spsj>=TO_DATE('"+cw_jrtcph_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrtcph_spsj=request.getParameter("cw_jrtcph_spsj2");
	if (cw_jrtcph_spsj!=null)
	{
		cw_jrtcph_spsj=cw_jrtcph_spsj.trim();
		if (!(cw_jrtcph_spsj.equals("")))	wheresql+="  and (cw_jrtcph.spsj<=TO_DATE('"+cw_jrtcph_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrtcph_spyj=request.getParameter("cw_jrtcph_spyj");
	if (cw_jrtcph_spyj!=null)
	{
		cw_jrtcph_spyj=cf.GB2Uni(cw_jrtcph_spyj);
		if (!(cw_jrtcph_spyj.equals("")))	wheresql+=" and  (cw_jrtcph.spyj='"+cw_jrtcph_spyj+"')";
	}
	cw_jrtcph_lrsj=request.getParameter("cw_jrtcph_lrsj");
	if (cw_jrtcph_lrsj!=null)
	{
		cw_jrtcph_lrsj=cw_jrtcph_lrsj.trim();
		if (!(cw_jrtcph_lrsj.equals("")))	wheresql+="  and (cw_jrtcph.lrsj>=TO_DATE('"+cw_jrtcph_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrtcph_lrsj=request.getParameter("cw_jrtcph_lrsj2");
	if (cw_jrtcph_lrsj!=null)
	{
		cw_jrtcph_lrsj=cw_jrtcph_lrsj.trim();
		if (!(cw_jrtcph_lrsj.equals("")))	wheresql+="  and (cw_jrtcph.lrsj<=TO_DATE('"+cw_jrtcph_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_jrtcph.khzq,cw_jrtcph.ssfgs,a.dwmc fgsmc,cw_jrtcph.tcqssj,cw_jrtcph.tcjzsj,cw_jrtcph.tcdsl,cw_jrtcph.zxktcze,cw_jrtcph.sjftcze, DECODE(cw_jrtcph.clzt,'1','结算','2','审批同意','3','审批不同意'),cw_jrtcph.spr,cw_jrtcph.spsj,cw_jrtcph.spyj,cw_jrtcph.lrr,cw_jrtcph.lrsj,b.dwmc lrbm,cw_jrtcph.bz  ";
	ls_sql+=" FROM cw_jrtcph,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_jrtcph.ssfgs=a.dwbh(+)";
    ls_sql+=" and cw_jrtcph.lrbm=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrtcph.ssfgs,cw_jrtcph.khzq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Cw_jrtcphList.jsp","","","EditCw_jrtcph.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"khzq","ssfgs","sq_dwxx_dwmc","cw_jrtcph_tcqssj","cw_jrtcph_tcjzsj","cw_jrtcph_tcdsl","cw_jrtcph_zxktcze","cw_jrtcph_sjftcze","cw_jrtcph_clzt","cw_jrtcph_spr","cw_jrtcph_spsj","cw_jrtcph_spyj","cw_jrtcph_lrr","cw_jrtcph_lrsj","cw_jrtcph_lrbm","cw_jrtcph_bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"khzq","ssfgs"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteCw_jrtcph.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khzq","ssfgs"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_jrtcph.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khzq",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

}
else//非第一次进入此页，不需要初始化
{
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
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">考核周期</td>
	<td  width="4%">分公司</td>
	<td  width="7%">分公司</td>
	<td  width="5%">计算提成起始时间</td>
	<td  width="5%">计算提成截至时间</td>
	<td  width="4%">提成单数量</td>
	<td  width="5%">装修款提成总额</td>
	<td  width="5%">设计费提成总额</td>
	<td  width="4%">处理状态</td>
	<td  width="3%">审批人</td>
	<td  width="5%">审批时间</td>
	<td  width="15%">审批意见</td>
	<td  width="3%">录入人</td>
	<td  width="5%">录入时间</td>
	<td  width="6%">录入部门</td>
	<td  width="14%">备注</td>
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