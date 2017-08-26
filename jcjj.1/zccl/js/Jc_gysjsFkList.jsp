<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (pageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jsjlh=null;
	String jssj=null;
	String jsr=null;

 	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (jc_gysjs.ssfgs='"+fgs+"')";

	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (jc_gysjs.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql+=" and  (jc_gysjs.ppbm like '%"+ppbm2+"%')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (jc_gysjs.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (jc_gysjs.gys like '%"+gys2+"%')";
	}

	
	
	String fkr=null;
	fkr=request.getParameter("fkr");
	if (fkr!=null)
	{
		fkr=cf.GB2Uni(fkr);
		if (!(fkr.equals("")))	wheresql+=" and  (jc_gysjs.fkr='"+fkr+"')";
	}
	String fksj=null;
	fksj=request.getParameter("fksj");
	if (fksj!=null)
	{
		fksj=fksj.trim();
		if (!(fksj.equals("")))	wheresql+="  and (jc_gysjs.fksj>=TO_DATE('"+fksj+"','YYYY/MM/DD'))";
	}
	fksj=request.getParameter("fksj2");
	if (fksj!=null)
	{
		fksj=fksj.trim();
		if (!(fksj.equals("")))	wheresql+="  and (jc_gysjs.fksj<=TO_DATE('"+fksj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	String cwzq=null;
	cwzq=request.getParameter("cwzq");
	if (cwzq!=null)
	{
		cwzq=cf.GB2Uni(cwzq);
		if (!(cwzq.equals("")))	wheresql+=" and  (jc_gysjs.cwzq like '%"+cwzq+"%')";
	}

	String shbz=null;
	shbz=request.getParameter("shbz");
	if (shbz!=null)
	{
		shbz=cf.GB2Uni(shbz);
		if (!(shbz.equals("")))	wheresql+=" and  (jc_gysjs.shbz='"+shbz+"')";
	}
	
	
	jsjlh=request.getParameter("jsjlh");
	if (jsjlh!=null)
	{
		jsjlh=jsjlh.trim();
		if (!(jsjlh.equals("")))	wheresql+=" and (jsjlh="+jsjlh+") ";
	}
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (jsr='"+jsr+"')";
	}
	
	String shsj=null;
	shsj=request.getParameter("shsj");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj>=TO_DATE('"+shsj+"','YYYY/MM/DD'))";
	}
	shsj=request.getParameter("shsj2");
	if (shsj!=null)
	{
		shsj=shsj.trim();
		if (!(shsj.equals("")))	wheresql+="  and (shsj<=TO_DATE('"+shsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}
	String shr=null;
	shr=request.getParameter("shr");
	if (shr!=null)
	{
		shr=cf.GB2Uni(shr);
		if (!(shr.equals("")))	wheresql+=" and  (shr='"+shr+"')";
	}

	ls_sql="SELECT jsjlh,DECODE(shbz,'N','未审核','Y','审核','F','结算付款'),gys,ppbm,jssj,jsr,kcfy,jsje,cbzj,ycfzj,qtfzj,(select sum(hkze) from jc_zcdd,jc_gysjsmx where jc_zcdd.ddbh=jc_gysjsmx.ddbh and jc_gysjsmx.jsjlh=jc_gysjs.jsjlh ),jssm,shr,shsj,fkr,fksj,fksm,dwmc  ";
	ls_sql+=" FROM jc_gysjs,sq_dwxx  ";
    ls_sql+=" where  jc_gysjs.ssfgs=sq_dwxx.dwbh and jc_gysjs.lx='1'";//1：订单；2：代购主材
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and jc_gysjs.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and jc_gysjs.ssfgs in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jc_gysjs.ssfgs,jc_gysjs.jsjlh desc";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//进行对象初始化
	pageObj.initPage("Jc_gysjsFkList.jsp","","","");
//	pageObj.setPageRow(10);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"jsjlh","gys","jssj","jsr","cbzj","ycfzj","qtfzj","kcfy","jsje","jssm"};
	pageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"批量付款"};//按钮的显示名称
	String[] buttonLink={"SavePlFk.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"jsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="dy.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("jsjlh",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">结算单付款</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="3%">结算记录号</td>
	<td  width="3%">审核标志</td>
	<td  width="9%">供应商</td>
	<td  width="5%">品牌</td>
	<td  width="4%">结算时间</td>
	<td  width="3%">结算人</td>
	<td  width="4%">扣除费用</td>
	<td  width="5%">结算金额</td>
	<td  width="5%">材料成本</td>
	<td  width="4%">远程费</td>
	<td  width="4%">其它费</td>
	<td  width="5%">合同金额</td>
	<td  width="15%">结算说明</td>
	<td  width="3%">审核人</td>
	<td  width="4%">审核时间</td>
	<td  width="3%">付款人</td>
	<td  width="4%">付款时间</td>
	<td  width="11%">付款说明</td>
	<td  width="6%">所属公司</td>
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