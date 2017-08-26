<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">员工姓名</td>
	<td  width="7%">行政职务</td>
	<td  width="8%">所属部门</td>
	<td  width="5%">客户编号</td>
	<td  width="5%">客户姓名</td>
	<td  width="15%">地址</td>
	<td  width="7%">家装签约额</td>
	<td  width="7%">主材金额</td>
	<td  width="7%">提成基数</td>
	<td  width="5%">提成比率</td>
	<td  width="7%">提成金额</td>
	<td  width="5%">签单提成比率</td>
	<td  width="5%">业务员扣点</td>
	<td  width="5%">主材考核提成比率</td>
	<td  width="7%">备注</td>
</tr>
<%
	String ssfgs=request.getParameter("ssfgs");
	String khzq=request.getParameter("khzq");

	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;

	ls_sql="SELECT rs_qdtcmx.yhmc,rs_qdtcmx.xzzwbm,dwmc,rs_qdtcmx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,rs_qdtcmx.qye,rs_qdtcmx.zcje,tcjs,tcbl||'%',tcje,qdtcbl||'%',ywykd||'%',zckhtcbl||'%',rs_qdtcmx.bz  ";
	ls_sql+=" from rs_qdtcmx,sq_dwxx,crm_zxkhxx";
	ls_sql+=" where rs_qdtcmx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and rs_qdtcmx.khbh=crm_zxkhxx.khbh(+)";
	ls_sql+=" and rs_qdtcmx.khzq='"+khzq+"' and rs_qdtcmx.ssfgs='"+ssfgs+"'";
    ls_sql+=" order by rs_qdtcmx.xzzwbm,rs_qdtcmx.yhmc,rs_qdtcmx.ygbh,rs_qdtcmx.khbh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
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