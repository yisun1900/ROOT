<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String khbh=request.getParameter("khbh");


	String ls_sql=null;

	ls_sql="SELECT crm_khxx.khxm,jxc_clpsd.psph,DECODE(jxc_clpsd.psdzt,'0','等待提交','1','等待审核','2','等待出库','3','已出库','5','部分出库','6','驳回重新修改','7','作废') psdzt,DECODE(jxc_clpsd.shjl,'Y','同意','N','作废','M','驳回重新修改'),jxc_clpsd.dysj,jxc_clpsd.pszsl,jxc_clpsd.pszje,jxc_clpsd.yf,jxc_clpsd.qtsf,jxc_clpsd.fkje,jxc_clpsd.lrrq,jxc_clpsd.bz  ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx ";
    ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh(+) ";
	ls_sql+=" and jxc_clpsd.khbh='"+khbh+"' and jxc_clpsd.psdzt!='7'";;
    ls_sql+=" order by jxc_clpsd.lrrq ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


//设置主键
	String[] keyName={"psph"};
	pageObj.setKey(keyName);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"psph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/jxcfc/psdgl/ViewJxc_clpsd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("psph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">材料单查询</font></B>
</CENTER>

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">客户姓名</td>
	<td  width="9%">材料单号</td>
	<td  width="6%">材料单状态</td>
	<td  width="8%">审核结论</td>
	<td  width="7%">打印时间</td>
	<td  width="8%">总数量</td>
	<td  width="8%">总金额</td>
	<td  width="6%">配送运费</td>
	<td  width="6%">其它收费</td>
	<td  width="6%">返款金额</td>
	<td  width="7%">录入日期</td>
	<td  width="22%">备注</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDateSum();

%> 

</table>
</body>

</html>