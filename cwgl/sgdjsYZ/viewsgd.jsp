<%@ page contentType="text/html;charset=GBK" %>
<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String yhdlm=(String)session.getAttribute("yhdlm");
	String zdyhbz=cf.executeQuery("select zdyhbz from sq_yhxx where yhdlm='"+yhdlm+"'");
	String wheresql="";
	String xmzymc="";
	String sjfw=null;
    String sjfw2=null;
	String sgd=request.getParameter("sgd");
	if (sgd!=null){
		if (!(sgd.equals(""))) wheresql+="and cw_gdjsjl.sgd='"+sgd+"'";

	}
    sjfw=request.getParameter("jssj");
    sjfw2=request.getParameter("jssj2");
	if (sjfw!=null){
		if (!(sjfw.equals(""))) wheresql+="and (cw_gdjsjl.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))";

	}
	if (sjfw2!=null){
		if (!(sjfw2.equals(""))) wheresql+="and (cw_gdjsjl.jssj<=TO_DATE('"+sjfw2+"','YYYY-MM-DD'))";

	}
	String ls_sql=null;

		ls_sql="SELECT cw_gdjsjl.gdjsjlh, DECODE(cw_gdjsjl.jsjd,'1','结算部结算','2','结算审批','3','财务结算'), DECODE(cw_gdjsjl.spjl,'3','通过','4','未通过'),crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.hth,crm_khxx.zjxm ,sgdmc, DECODE(cw_gdjsjl.jzbz,'1','家装','2','公装'),cw_gdjsjl.wdzgce,cw_gdjsjl.qye,cw_gdjsjl.zkl,cw_gdjsjl.zjxje,cw_gdjsjl.khjskze,cw_gdjsjl.khsskze,cw_gdjsjl.sjcb,cw_gdjsjl.sj, DECODE(cw_gdjsjl.tdjs,'1','客户结算金额','2','实收款','3','签约额','4','实际成本'),cw_gdjsjl.glftd,cw_gdjsjl.glf,cw_gdjsjl.wxj,cw_gdjsjl.clf,cw_gdjsjl.zgclf,cw_gdjsjl.jkje,cw_gdjsjl.fakuan,cw_gdjsjl.kwxf,cw_gdjsjl.gckk,cw_gdjsjl.ksdf,cw_gdjsjl.kqtk,cw_gdjsjl.bk,cw_gdjsjl.gdjskze,cw_gdjsjl.jsr,cw_gdjsjl.jssj,dwmc,cw_gdjsjl.khbh,cw_gdjsjl.bz";
	ls_sql+=" FROM cw_gdjsjl,crm_khxx,sq_sgd,sq_dwxx  ";
    ls_sql+=" where cw_gdjsjl.khbh=crm_khxx.khbh";
    ls_sql+=" and cw_gdjsjl.sgd=sq_sgd.sgd(+) and cw_gdjsjl.jsdw=sq_dwxx.dwbh(+) and cw_gdjsjl.tdjsje>0 ";
    ls_sql+=wheresql;
	ls_sql+=" order by cw_gdjsjl.gdjsjlh ";
	//out.print(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
/*
//设置显示列
	String[] disColName={"ddbh","jc_jjdd_clzt","jhccsj","khxm","fwdz","hth","jc_jjdd_dj","yhmc","jc_jjdd_jjsjs","jc_jjdd_ssje","jc_jjdd_khlx","sq_dwxx_dwmc"};
	pageObj.setDisColName(disColName);
*/
//设置主键
	String[] keyName={"gdjsjlh"};
	pageObj.setKey(keyName);
//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"gdjsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewCw_gdjsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("gdjsjlh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">施工队结算</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	//pageObj.printPageLink(300);
%>
<table border="1" width="200%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">

	<td  width="3%">结算记录号</td>
	<td  width="3%">结算进度</td>
	<td  width="2%">审批结论</td>
	<td  width="2%">客户姓名</td>
	<td  width="9%">房屋地址</td>
	<td  width="2%">设计师</td>
	<td  width="3%">合同号</td>
	<td  width="2%">质检</td>
	<td  width="2%">施工队</td>
	<td  width="2%">家装标志</td>
	<td  width="3%">未打折工程额</td>
	<td  width="3%">工程签约额</td>
	<td  width="2%">折扣率</td>
	<td  width="2%">增减项金额</td>
	<td  width="3%">客户结算金额</td>
	<td  width="3%">工程实收款总额</td>
	<td  width="2%">实际成本</td>
	<td  width="2%">税金</td>
	<td  width="3%">提点基数</td>
	<td  width="2%">管理费提点</td>
	<td  width="2%">管理费</td>
	<td  width="2%">维修金</td>
	<td  width="2%">物流材料费</td>
	<td  width="2%">自购材料费</td>
	<td  width="2%">借款金额</td>
	<td  width="2%">罚款金额</td>
	<td  width="2%">扣维修费</td>
	<td  width="2%">工程扣款</td>
	<td  width="2%">扣水电费</td>
	<td  width="2%">扣其它款</td>
	<td  width="2%">补款</td>
	<td  width="3%">工队结算款总额</td>
	<td  width="2%">结算人</td>
	<td  width="3%">结算时间</td>
	<td  width="4%">结算单位</td>
	<td  width="2%">客户编号</td>
	<td  width="6%">备注</td>
</tr>
<%
	pageObj.displayDateSum();
%> 

</table>
</body>
</html>