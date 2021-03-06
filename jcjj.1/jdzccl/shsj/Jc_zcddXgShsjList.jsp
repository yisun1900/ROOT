<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="DBpageObj" scope="session" class="ybl.common.DBPageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhjs=(String)session.getAttribute("yhjs");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String yhmc=(String)session.getAttribute("yhmc");
String zwbm=(String)session.getAttribute("zwbm");//08:家居顾问;10:项目专员;12:家居设计师;18:木门测量师
String ssfgs=(String)session.getAttribute("ssfgs");
String xmzyglbz=cf.fillNull(cf.executeQuery("select xmzyglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//项目专员过滤
String jjgwglbz=cf.fillNull(cf.executeQuery("select jjgwglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//家居顾问过滤
String jjsjsglbz=cf.fillNull(cf.executeQuery("select jjsjsglbz from sq_dwxx where dwbh='"+ssfgs+"'"));//家居设计师过滤

if (zwbm.equals("10"))//10:项目专员
{
	if (xmzyglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}
else if (zwbm.equals("08"))//08:家居顾问
{
	if (jjgwglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}
else if (zwbm.equals("12"))//12:家居设计师
{
	if (jjsjsglbz.equals("N"))//过滤标志
	{
		zwbm="";
	}
}

	
	
int curPage=0;//当前需要显示的页序号
String pageStr=request.getParameter("curPage");//获取当前页号
if (DBpageObj.needInit(pageStr))//判断是否需要初始化，若第一次进入此页，则需要初始化
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (t_Organization.FNumber='"+khbh+"')";
	}
	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (t_Organization.FName='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (t_Organization.FName like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (t_Organization.FAddress='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (t_Organization.FAddress like '%"+fwdz2+"%')";
	}



	String ddbh=null;
	ddbh=request.getParameter("ddbh");
	if (ddbh!=null)
	{
		ddbh=cf.GB2Uni(ddbh);
		if (!(ddbh.equals("")))	wheresql+=" and  (SEOrder.FBillNo='"+ddbh+"')";
	}
	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (SEOrder.clzt='"+clzt+"')";
	}

	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (SEOrder.ppbm='"+ppbm+"')";
	}
	String ppbm2=null;
	ppbm2=request.getParameter("ppbm2");
	if (ppbm2!=null)
	{
		ppbm2=cf.GB2Uni(ppbm2);
		if (!(ppbm2.equals("")))	wheresql+=" and  (SEOrder.ppbm='"+ppbm2+"')";
	}

	String clgw=null;
	clgw=request.getParameter("clgw");
	if (clgw!=null)
	{
		clgw=cf.GB2Uni(clgw);
		if (!(clgw.equals("")))	wheresql+=" and  (SEOrder.clgw='"+clgw+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (SEOrder.xmzy='"+xmzy+"')";
	}

	String jhshsj=null;
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (SEOrder.jhshsj>=TO_DATE('"+jhshsj+"','YYYY-MM-DD'))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (SEOrder.jhshsj<=TO_DATE('"+jhshsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	ls_sql="SELECT SEOrder.fbillno,clztmc,CONVERT(char(10),SEOrder.jhshsj,111 ),ppbm,t_Organization.fnumber khbh,t_Organization.FName,t_Organization.FAddress,SEOrder.clgw,SEOrder.xmzy ,CONVERT(char(10),SEOrder.FDate,111 ) ";
	ls_sql+=" FROM t_Organization,SEOrder,jdm_zcddzt ";
    ls_sql+=" where SEOrder.FCustID=t_Organization.FItemID";
    ls_sql+=" and SEOrder.clzt*=jdm_zcddzt.clzt ";
	if (zwbm.equals("08"))//08:家居顾问
	{
		ls_sql+=" and (SEOrder.clgw='"+yhmc+"' OR SEOrder.ztjjgw='"+yhmc+"' OR SEOrder.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("12"))//12:家居设计师
	{
		ls_sql+=" and (SEOrder.jjsjs='"+yhmc+"' OR SEOrder.lrr='"+yhmc+"')";
	}
	if (zwbm.equals("10"))//10:项目专员
	{
		ls_sql+=" and (SEOrder.xmzy='"+yhmc+"' OR SEOrder.lrr='"+yhmc+"')";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by SEOrder.jhshsj desc";
	

	DBpageObj.sql=ls_sql;
//进行对象初始化
	DBpageObj.initPage("Jc_zcddXgShsjList.jsp","","","XgShsjJc_zcdd.jsp","sqlserver","sa","");
//	DBpageObj.setPageRow(3000);//设置每页显示记录数
	DBpageObj.setDateType("long");//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","SEOrder_clgw","SEOrder_jkxz","SEOrder_jkdd","SEOrder_ddshbz","SEOrder_hkze","SEOrder_xclbz","SEOrder_clzt","SEOrder_lrsj","SEOrder_dwbh","SEOrder_bz","SEOrder_xmzy","crm_khxx_lxfs"};
	DBpageObj.setDisColName(disColName);
*/

//设置主键
	String[] keyName={"fbillno"};
	DBpageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"删除送货时间"};//按钮的显示名称
	String[] buttonLink={"DeleteShsjJc_zcdd.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	DBpageObj.setButton(buttonName,buttonLink,buttonNew);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	DBpageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

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
  <B><font size="3">主材订单处理－－修改接收</font></B>
</CENTER>
<%
	DBpageObj.out=out;
	DBpageObj.getDate(curPage);
	DBpageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="8%">订单编号</td>
	<td  width="8%">处理状态</td>
	<td  width="7%">计划送货时间</td>
	<td  width="16%">品牌</td>
	<td  width="6%">客户编号</td>
	<td  width="7%">客户姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="6%">家居顾问</td>
	<td  width="6%">项目专员</td>
	<td  width="7%">订单日期</td>
</tr>
<%
	DBpageObj.displayDateSum();
	DBpageObj.displayFoot();
%> 

</table>
</form> 
</body>
</html>

<script  LANGUAGE="javascript">
<!--
<%
	DBpageObj.printScript();
%> 
//-->
</script>
