<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1：按分公司授权；2：按店面授权；3：不授权

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cgjhph=null;
	String cgjhmc=null;
	String cgsqr=null;
	String jhkssj=null;
	String jhjssj=null;
	String jhje=null;
	String jhnr=null;
	String jhdzt=null;
	String ssfgs=null;
	String lrr=null;
	String lrsj=null;
	String shr=null;
	String shsj=null;
	String shjg=null;
	String shnr=null;
	String bz=null;
	String cglb=null;
	cglb=request.getParameter("cglb");
	if (cglb!=null)
	{
		cglb=cf.GB2Uni(cglb);
		if (!(cglb.equals("")))	wheresql+=" and  (cglb='"+cglb+"')";
	}
	String cllb=null;
	cllb=request.getParameter("cllb");
	if (cllb!=null)
	{
		cllb=cf.GB2Uni(cllb);
		if (!(cllb.equals("")))	wheresql+=" and  (cllb='"+cllb+"')";
	}
	cgjhph=request.getParameter("cgjhph");
	if (cgjhph!=null)
	{
		cgjhph=cf.GB2Uni(cgjhph);
		if (!(cgjhph.equals("")))	wheresql+=" and  (cgjhph='"+cgjhph+"')";
	}
	cgjhmc=request.getParameter("cgjhmc");
	if (cgjhmc!=null)
	{
		cgjhmc=cf.GB2Uni(cgjhmc);
		if (!(cgjhmc.equals("")))	wheresql+=" and  (cgjhmc='"+cgjhmc+"')";
	}
	cgsqr=request.getParameter("cgsqr");
	if (cgsqr!=null)
	{
		cgsqr=cf.GB2Uni(cgsqr);
		if (!(cgsqr.equals("")))	wheresql+=" and  (cgsqr='"+cgsqr+"')";
	}
	jhkssj=request.getParameter("jhkssj");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj>=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhkssj=request.getParameter("jhkssj2");
	if (jhkssj!=null)
	{
		jhkssj=jhkssj.trim();
		if (!(jhkssj.equals("")))	wheresql+="  and (jhkssj<=TO_DATE('"+jhkssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj>=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	jhjssj=request.getParameter("jhjssj2");
	if (jhjssj!=null)
	{
		jhjssj=jhjssj.trim();
		if (!(jhjssj.equals("")))	wheresql+="  and (jhjssj<=TO_DATE('"+jhjssj+"','YYYY/MM/DD'))";
	}
	jhje=request.getParameter("jhje");
	if (jhje!=null)
	{
		jhje=jhje.trim();
		if (!(jhje.equals("")))	wheresql+=" and  (jhje>="+jhje+") ";
	}
	jhje=request.getParameter("jhje2");
	if (jhje!=null)
	{
		jhje=jhje.trim();
		if (!(jhje.equals("")))	wheresql+=" and  (jhje<="+jhje+") ";
	}
	jhnr=request.getParameter("jhnr");
	if (jhnr!=null)
	{
		jhnr=cf.GB2Uni(jhnr);
		if (!(jhnr.equals("")))	wheresql+=" and  (jhnr like '%"+jhnr+"%')";
	}
	jhdzt=request.getParameter("jhdzt");
	if (jhdzt!=null)
	{
		jhdzt=cf.GB2Uni(jhdzt);
		if (!(jhdzt.equals("")))	wheresql+=" and  (jxc_clcgjh.jhdzt='"+jhdzt+"')";
	}
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		ssfgs=cf.GB2Uni(ssfgs);
		if (!(ssfgs.equals("")))	wheresql+=" and  (jxc_clcgjh.ssfgs='"+ssfgs+"')";
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
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (shr='"+shr+"')";
	}
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shjg=request.getParameter("shjg");
	if (shjg!=null)
	{
		shjg=cf.GB2Uni(shjg);
		if (!(shjg.equals("")))	wheresql+=" and  (shjg='"+shjg+"')";
	}
	shnr=request.getParameter("shnr");
	if (shnr!=null)
	{
		shnr=cf.GB2Uni(shnr);
		if (!(shnr.equals("")))	wheresql+=" and  (shnr='"+shnr+"')";
	}
	bz=request.getParameter("bz");
	if (bz!=null)
	{
		bz=cf.GB2Uni(bz);
		if (!(bz.equals("")))	wheresql+=" and  (jxc_clcgjh.bz='"+bz+"')";
	}
	ls_sql="SELECT cgjhph,DECODE(jhdzt,'0','未提交','1','等待审核','2','审核完成','3','已分解订单','5','办理入库','9','计划完结'),cgjhmc,dwmc,cgsqr,jhje,DECODE(shjg,'Y','通过','N','未通过'),shr,shsj,shnr,lrr,lrsj,jxc_clcgjh.bz  ";
	ls_sql+=" FROM jxc_clcgjh,sq_dwxx  ";
    ls_sql+=" where jxc_clcgjh.ssfgs=sq_dwxx.dwbh ";
    ls_sql+=" and jxc_clcgjh.shjg='Y'";
    ls_sql+=" and jxc_clcgjh.cllb='0'";//0：主材；1：辅材
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jxc_clcgjh.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jxc_clcgjh.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Jxc_clcgjhFjList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"cgjhph","cgjhmc","cgsqr","jhkssj","jhjssj","jhje","jhnr","jhdzt","ssfgs","lrr","lrsj","shr","shsj","shjg","shnr","bz"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"cgjhph"};
	pageObj.setKey(keyName);

//设置按钮参数
	String[] buttonName={"批量分解（系统默认供应商）"};//按钮的显示名称
	String[] buttonLink={"SaveFjJxc_clcgjh.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"cgjhph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jxcfc/cgjhgl/ViewJxc_clcgjh.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("cgjhph",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">根据采购计划－>生成供应商订单</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(190);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="6%">采购计划批号</td>
	<td  width="5%">计划单状态</td>
	<td  width="8%">采购计划名称</td>
	<td  width="8%">所属分公司</td>
	<td  width="4%">采购申请人</td>
	<td  width="6%">计划金额</td>
	<td  width="4%">审核结果</td>
	<td  width="4%">审核人</td>
	<td  width="5%">审核时间</td>
	<td  width="20%">审核内容</td>
	<td  width="4%">录入人</td>
	<td  width="6%">录入时间</td>
	<td  width="40%">备注</td>
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