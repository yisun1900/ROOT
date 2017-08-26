<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String tjsjlx=request.getParameter("tjsjlx");
	String jzsj=request.getParameter("jzsj");

	String wheresql="";

	if (tjsjlx.equals("qyrq"))
	{
		wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	}
	else{
		wheresql+=" and lrsj>=TO_DATE('"+sjfw+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
		wheresql+=" and lrsj<=TO_DATE('"+sjfw2+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
	}

	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),crm_khxx.cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,sfke,ROUND(crm_khxx.wdzgce*jc_cxhd.yjzkl/10,2),ROUND(crm_khxx.wdzgce*jc_cxhd.dmzkl/10,2),ROUND(crm_khxx.wdzgce*jc_cxhd.zlzkl/10,2),ROUND(crm_khxx.wdzgce*jc_cxhd.sjszkl/10,2),ROUND(crm_khxx.wdzgce*jc_cxhd.sjstczkl/10,2),DECODE(crm_khxx.sffj,'Y','返卷','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI') lrsj,TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,jc_cxhd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
    ls_sql+=" and crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and jc_cxhd.hdlx='2'";
	ls_sql+=wheresql;

	ls_sql+=" UNION all";

	ls_sql+=" SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','家装','2','公装'),crm_khxx.cxhdbm,wdzgce,TO_CHAR(zkl),qye,zjxje,NVL(zjxje,0)+qye,sjf,sfke,qye-NVL(gsfje,0),qye-NVL(gsfje,0),qye-NVL(gsfje,0),qye-NVL(gsfje,0),qye-NVL(gsfje,0),DECODE(crm_khxx.sffj,'Y','返卷','N','否'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','认证','N','否'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI') lrsj,TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'是','<font color=\"#FF0000\">跨月</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,jc_cxhd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
    ls_sql+=" and crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
    ls_sql+=" and crm_khxx.cxhdbm=jc_cxhd.cxhdmc(+) and (jc_cxhd.hdlx='1' OR crm_khxx.cxhdbm is null)";
	ls_sql+=wheresql;
	ls_sql+=" order by lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数
	pageObj.setDateType("long");//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"hth"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("fwdz",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">设计师签约明细（<%=sjs%>）
  <BR>(统计时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="260%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">设计师</td>
	<td  width="3%">合同号</td>
	<td  width="3%">姓名</td>
	<td  width="7%">房屋地址</td>
	<td  width="2%">家装标志</td>
	<td  width="4%">促销活动</td>
	<td  width="4%">工程原报价</td>
	<td  width="2%">折扣率</td>
	<td  width="4%">工程签约额</td>
	<td  width="3%">增减项</td>
	<td  width="4%">增减后总额 </td>
	<td  width="3%">设计费</td>
	<td  width="4%">实收款</td>
	<td  width="4%">店面业绩</td>
	<td  width="4%">经理业绩</td>
	<td  width="4%">助理业绩</td>
	<td  width="4%">设计师业绩</td>
	<td  width="4%">设计师提成</td>
	<td  width="2%">是否返卷</td>
	<td  width="3%">返卷总金额</td>
	<td  width="3%">公司承担返卷额</td>
	<td  width="2%">是否认证</td>
	<td  width="3%">认证市场</td>
	<td  width="3%">签约店面</td>
	<td  width="3%">录入时间</td>
	<td  width="3%">签约日期</td>
	<td  width="2%">当月录入</td>
	<td  width="2%">施工队</td>
	<td  width="2%">质检员</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>