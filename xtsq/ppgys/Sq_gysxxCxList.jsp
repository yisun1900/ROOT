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
	String sq_gysxx_gysbh=null;
	String sq_gysxx_gysmc=null;
	String sq_gysxx_dqbm=null;
	String sq_gysxx_gyslb=null;
	String sq_gysxx_zclb=null;

	String sfyyh=null;
	sfyyh=request.getParameter("sfyyh");
	if (sfyyh!=null)
	{
		sfyyh=cf.GB2Uni(sfyyh);
		if (!(sfyyh.equals("")))	wheresql+=" and  (sq_gysxx.sfyyh='"+sfyyh+"')";
	}


	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (sq_gysxx.ppbm='"+ppbm+"')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (sq_gysxx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (sq_gysxx.ppmc like '%"+ppmc2+"%')";
	}

	String gysbm=null;
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=cf.GB2Uni(gysbm);
		if (!(gysbm.equals("")))	wheresql+=" and  (sq_gysxx.gysbm='"+gysbm+"')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (sq_gysxx.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (sq_gysxx.gys like '%"+gys2+"%')";
	}

	
	sq_gysxx_gysbh=request.getParameter("sq_gysxx_gysbh");
	if (sq_gysxx_gysbh!=null)
	{
		sq_gysxx_gysbh=cf.GB2Uni(sq_gysxx_gysbh);
		if (!(sq_gysxx_gysbh.equals("")))	wheresql+=" and  (sq_gysxx.gysbh='"+sq_gysxx_gysbh+"')";
	}
	sq_gysxx_gysmc=request.getParameter("sq_gysxx_gysmc");
	if (sq_gysxx_gysmc!=null)
	{
		sq_gysxx_gysmc=cf.GB2Uni(sq_gysxx_gysmc);
		if (!(sq_gysxx_gysmc.equals("")))	wheresql+=" and  (sq_gysxx.gysmc like '%"+sq_gysxx_gysmc+"%')";
	}
	sq_gysxx_dqbm=request.getParameter("sq_gysxx_dqbm");
	if (sq_gysxx_dqbm!=null)
	{
		sq_gysxx_dqbm=cf.GB2Uni(sq_gysxx_dqbm);
		if (!(sq_gysxx_dqbm.equals("")))	wheresql+=" and  (sq_gysxx.dqbm='"+sq_gysxx_dqbm+"')";
	}
	sq_gysxx_gyslb=request.getParameter("sq_gysxx_gyslb");
	if (sq_gysxx_gyslb!=null)
	{
		sq_gysxx_gyslb=cf.GB2Uni(sq_gysxx_gyslb);
		if (!(sq_gysxx_gyslb.equals("")))	wheresql+=" and  (sq_gysxx.gyslb='"+sq_gysxx_gyslb+"')";
	}
	sq_gysxx_zclb=request.getParameter("sq_gysxx_zclb");
	if (sq_gysxx_zclb!=null)
	{
		sq_gysxx_zclb=cf.GB2Uni(sq_gysxx_zclb);
		if (!(sq_gysxx_zclb.equals("")))	wheresql+=" and  (sq_gysxx.zclb='"+sq_gysxx_zclb+"')";
	}

	String px=request.getParameter("px");
	
	ls_sql="SELECT  sq_gysxx.gysbh,sq_gysxx.gysmc,sq_gysxx.cwdm,mrazhs,DECODE(sq_gysxx.gyslb,'1','木门','2','橱柜','3','家具','4','主材') gyslb,zclb,DECODE(sq_gysxx.sfyyh,'Y','是','N','否') sfyyh,sq_gysxx.yhkssj,sq_gysxx.yhjzsj,sq_gysxx.yhnr,sq_gysxx.ppbm,sq_gysxx.ppmc,sq_gysxx.gysbm,sq_gysxx.gys,dm_dqbm.dqmc, sq_gysxx.bz  ";
	ls_sql+=" FROM dm_dqbm,sq_gysxx  ";
    ls_sql+=" where sq_gysxx.dqbm=dm_dqbm.dqbm ";
    ls_sql+=wheresql;
	if (px.equals(""))
	{
		ls_sql+=" order by sq_gysxx.dqbm,sq_gysxx.gyslb,sq_gysxx.zclb,sq_gysxx.gysmc";
	}
	else{
		ls_sql+=" order by "+px;
	}
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Sq_gysxxCxList.jsp","SelectCxSq_gysxx.jsp","","");
	pageObj.setPageRow(10000);//设置每页显示记录数


//设置主键
	String[] keyName={"gysbm"};
	pageObj.setKey(keyName);

//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zclb","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"gysbm"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/xtsq/gys/ViewSq_gysbm.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gysbm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"gysbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/xtsq/ppgys/ViewSq_gysxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gysbh",coluParm);//列参数对象加入Hash表
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
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">品牌供应商编号</td>
	<td  width="10%">品牌供应商名称</td>
	<td  width="3%">财务代码</td>
	<td  width="3%">每日安装户数限制</td>
	<td  width="3%">供应商类别</td>
	<td  width="9%">主材类别</td>
	<td  width="3%">是否有优惠</td>
	<td  width="4%">优惠开始时间</td>
	<td  width="4%">优惠截至时间</td>
	<td  width="17%">优惠内容</td>
	<td  width="3%">品牌编码</td>
	<td  width="9%">品牌名称</td>
	<td  width="3%">供应商编码</td>
	<td  width="12%">供应商名称</td>
	<td  width="3%">所属地区</td>
	<td  width="11%">备注</td>
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