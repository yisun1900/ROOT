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

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (dqbm!=null)
	{
		dqbm=cf.GB2Uni(dqbm);
		if (!(dqbm.equals("")))	wheresql+=" and  (sq_dwxx.dqbm='"+dqbm+"')";
	}
	String cpbm=null;
	cpbm=request.getParameter("cpbm");
	if (cpbm!=null)
	{
		cpbm=cf.GB2Uni(cpbm);
		if (!(cpbm.equals("")))	wheresql+=" and  (jc_zcddmx.zcbm='"+cpbm+"')";
	}

	ls_sql="SELECT TO_CHAR(xh) xh,jc_zcddmx.ddbh,clztmc,crm_khxx.khxm,crm_khxx.fwdz,zcmc,jc_zcddmx.ppmc,xinghao,TO_CHAR(cbj),sl,ROUND(cbj*sl,2),zjhsl,ROUND(cbj*zjhsl,2),gg,zcpzwzbm,jc_zcddmx.khbh";
	ls_sql+=" FROM jc_zcddmx,jc_zcdd,jdm_zcddzt,crm_khxx,sq_dwxx";
    ls_sql+=" where jc_zcddmx.ddbh=jc_zcdd.ddbh and jc_zcddmx.fgsbh=sq_dwxx.dwbh and jc_zcddmx.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and jc_zcdd.sfjs in('N','C')";//N：未结算；C：已选择结算；Y：已结算；M：结算已审核
    ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
    ls_sql+=" and jc_zcdd.clzt not in('98','99')";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_zcddmx.cbj,xh";
    pageObj.sql=ls_sql;

//进行对象初始化
	pageObj.initPage("CpbmCxList.jsp","","","");
	pageObj.setPageRow(300);//设置每页显示记录数



//设置主键
	String[] keyName={"xh"};
	pageObj.setKey(keyName);
//设置按钮参数
	String[] buttonName={"批量修改【结算价】"};//按钮的显示名称
	String[] buttonLink={"PlUpdateJsj.jsp"};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"ddbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("ddbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
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
  <B><font size="3">修改单品结算价（注意：已结算订单不能修改）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">序号</td>
	<td  width="5%">订单编号</td>
	<td  width="5%">订单状态</td>
	<td  width="4%">客户姓名</td>
	<td  width="13%">房屋地址</td>
	<td  width="7%">主材名称</td>
	<td  width="7%">品牌</td>
	<td  width="8%">型号</td>
	<td  width="5%">结算价</td>
	<td  width="4%">合同数量</td>
	<td  width="5%">合同结算金额</td>
	<td  width="4%">增减后数量</td>
	<td  width="5%">增减后结算金额</td>
	<td  width="11%">规格</td>
	<td  width="7%">铺装位置</td>
	<td  width="7%">客户编号</td>
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