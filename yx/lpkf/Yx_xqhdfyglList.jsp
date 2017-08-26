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
	String fgsbh=null;
	String xqmc=null;
	String khzq=null;
	String dqhd=null;
	String kfjd=null;
	String sjfylx=null;
	String lrr=null;
	String lrsj=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (fgsbh='"+fgsbh+"')";
	}
	xqmc=request.getParameter("xqmc");
	if (xqmc!=null)
	{
		xqmc=cf.GB2Uni(xqmc);
		if (!(xqmc.equals("")))	wheresql+=" and  (xqmc='"+xqmc+"')";
	}
	khzq=request.getParameter("khzq");
	if (khzq!=null)
	{
		khzq=cf.GB2Uni(khzq);
		if (!(khzq.equals("")))	wheresql+=" and  (khzq='"+khzq+"')";
	}
	dqhd=request.getParameter("dqhd");
	if (dqhd!=null)
	{
		dqhd=cf.GB2Uni(dqhd);
		if (!(dqhd.equals("")))	wheresql+=" and  (dqhd='"+dqhd+"')";
	}
	kfjd=request.getParameter("kfjd");
	if (kfjd!=null)
	{
		kfjd=cf.GB2Uni(kfjd);
		if (!(kfjd.equals("")))	wheresql+=" and  (kfjd='"+kfjd+"')";
	}
	sjfylx=request.getParameter("sjfylx");
	if (sjfylx!=null)
	{
		sjfylx=cf.GB2Uni(sjfylx);
		if (!(sjfylx.equals("")))	wheresql+=" and  (sjfylx='"+sjfylx+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
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
	ls_sql="SELECT fgsbh,dwmc,xqmc,khzq,yjzczfj,dqsjcz,dqkfhs,pjde,dqhd,xqzyl,jzds1,jzds1zyl,jzds2,jzds2zyl,jzds3,jzds3zyl,kfjd,sjfylx,dqsjfy,lrr,lrsj,yx_xqhdfygl.bz  ";
	ls_sql+=" FROM yx_xqhdfygl,sq_dwxx  ";
    ls_sql+=" where yx_xqhdfygl.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by yx_xqhdfygl.lrsj,yx_xqhdfygl.xqmc,yx_xqhdfygl.khzq";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Yx_xqhdfyglList.jsp","SelectYx_xqhdfygl.jsp","","EditYx_xqhdfygl.jsp");
//	pageObj.setPageRow(10);//设置每页显示记录数
//设置显示列
	String[] disColName={"dwmc","xqmc","khzq","yjzczfj","dqsjcz","dqkfhs","pjde","dqhd","xqzyl","jzds1","jzds1zyl","jzds2","jzds2zyl","jzds3","jzds3zyl","kfjd","sjfylx","dqsjfy","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//设置主键
	String[] keyName={"fgsbh","xqmc","khzq"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除选中的信息"};//按钮的显示名称
	String[] buttonLink={"DeleteYx_xqhdfygl.jsp?"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"xqmc","fgsbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewYx_xqcxhdgl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("xqmc",coluParm);//列参数对象加入Hash表
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
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">公司</td>
	<td  width="7%">小区名称</td>
	<td  width="5%">考核周期</td>
	<td  width="4%">预计总产值分解</td>
	<td  width="4%">当期实际产值</td>
	<td  width="4%">当期开发户数</td>
	<td  width="4%">平均单额</td>
	<td  width="5%">当期活动</td>
	<td  width="4%">小区占有率</td>
	<td  width="5%">竞争对手1</td>
	<td  width="3%">竞争对手1占有率</td>
	<td  width="5%">竞争对手2</td>
	<td  width="3%">竞争对手2占有率</td>
	<td  width="5%">竞争对手3</td>
	<td  width="3%">竞争对手3占有率</td>
	<td  width="4%">开发进度</td>
	<td  width="5%">实际费用类型</td>
	<td  width="4%">当期实际费用</td>
	<td  width="3%">录入人</td>
	<td  width="4%">录入时间</td>
	<td  width="12%">备注</td>
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