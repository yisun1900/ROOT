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



	String fgsbh=request.getParameter("fgsbh");
	String khzq=request.getParameter("khzq");

	String tcqssj=cf.executeQuery("select TO_CHAR(khqssj,'YYYY-MM-DD') from cw_jrkhzq where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'");
	String tcjzsj=cf.executeQuery("select TO_CHAR(khjzsj,'YYYY-MM-DD') from cw_jrkhzq where khzq='"+khzq+"' and fgsbh='"+fgsbh+"'");


	ls_sql="SELECT DECODE(crm_khxx.sjsjsbz,'0','未提成','1','签单提成','2','结算提成'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,bjjbmc,crm_khxx.sjs,crm_khxx.zjxm,sgdmc,qye,sfke,dwmc,crm_khxx.khbh,gcjdmc  ";
	ls_sql+=" FROM crm_khxx,sq_dwxx,sq_sgd,dm_gcjdbm,bdm_bjjbbm ";
    ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and crm_khxx.fgsbh='"+fgsbh+"'";

	
	ls_sql+=" and ";
	ls_sql+=" ( ";

	ls_sql+=" ( ";//签单客户
	ls_sql+=" crm_khxx.zt in('2','3')";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	ls_sql+=" and crm_khxx.sjsjsbz='0'";//0：未提成；1：签单提成；2：结算提成
//	ls_sql+=" and crm_khxx.yjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD') ";
//	ls_sql+=" and crm_khxx.yjjzsj<=TO_DATE('"+tcjzsj+"','YYYY-MM-DD') ";
	ls_sql+=" ) ";

	ls_sql+=" OR ";
	ls_sql+=" ( ";//退单客户
	ls_sql+=" crm_khxx.zt='3'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	ls_sql+=" and crm_khxx.sjsjsbz='1'";//0：未提成；1：签单提成；2：结算提成
//	ls_sql+=" and crm_khxx.tdyjjzsj>=TO_DATE('"+tcqssj+"','YYYY-MM-DD') ";
//	ls_sql+=" and crm_khxx.tdyjjzsj<=TO_DATE('"+tcjzsj+"','YYYY-MM-DD') ";
	ls_sql+=" ) ";

	ls_sql+=" OR ";
	ls_sql+=" ( ";//结算客户
	ls_sql+=" crm_khxx.zt='2'";//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	ls_sql+=" and crm_khxx.sjsjsbz='1'";//0：未提成；1：签单提成；2：结算提成
	ls_sql+=" and crm_khxx.gdjsjd='8'";//8：完工结算
	ls_sql+=" and crm_khxx.khjsbz='Y'";//'N','未结算','Y','已结算','S','已审核'
	ls_sql+=" ) ";

	ls_sql+=" ) ";



    ls_sql+=" order by crm_khxx.dwbh,sjs,khxm";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("Crm_khxxCxList.jsp","","","InsertCw_jrtcmx.jsp?khzq="+khzq);
//	pageObj.setPageRow(10);//设置每页显示记录数


//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("提成");

//设置按钮参数
	String[] buttonName={"提成"};//按钮的显示名称
	String[] buttonLink={"InsertCw_jrtcmx.jsp?khzq="+khzq};//按钮单击调用的网页，可以增加参数
	int[] buttonNew={1};//设置按钮单击是否打开新的窗口，0：不打开；1：打开
	pageObj.setButton(buttonName,buttonLink,buttonNew);

	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
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
  <B><font size="3">提成</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(130);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">&nbsp;</td>
	<td  width="6%">结算进度</td>
	<td  width="5%">客户姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="7%">合同号</td>
	<td  width="5%">报价级别</td>
	<td  width="5%">设计师</td>
	<td  width="5%">客户经理</td>
	<td  width="5%">施工队</td>
	<td  width="8%">签约额</td>
	<td  width="7%">实收款</td>
	<td  width="11%">签约店面</td>
	<td  width="4%">客户编号</td>
	<td  width="5%">工程进度</td>
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