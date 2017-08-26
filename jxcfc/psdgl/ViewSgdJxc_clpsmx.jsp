<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
</head>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	String ls_sql=null;
	String wheresql="";

	String sgd=request.getParameter("sgd");
	String tjsj=request.getParameter("tjsj");
	String tjsj2=request.getParameter("tjsj2");
%>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户材料单统计</font></B>
<BR>录入日期：（<%=tjsj%>－－<%=tjsj2%>）
</CENTER>

<table border="1" width="340%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">客户编号</td>
	<td  width="3%">合同号</td>
	<td  width="3%">客户姓名</td>
	<td  width="2%">施工队</td>
	<td  width="7%">房屋地址</td>
	<td  width="3%">出库批号</td>
	<td  width="2%">序号</td>
	<td  width="3%">内部编码</td>
	<td  width="6%">材料名称</td>
	<td  width="3%">型号</td>
	<td  width="4%">规格</td>
	<td  width="4%">材料编码</td>
	<td  width="4%">材料大类</td>
	<td  width="4%">材料小类</td>
	<td  width="2%">计量单位</td>
	<td  width="3%">单价</td>
	<td  width="3%">开单数量</td>
	<td  width="4%">金额</td>
	<td  width="3%">出库数量</td>
	<td  width="4%">品牌</td>
	<td  width="7%">供应商</td>
	<td  width="3%">出库单状态</td>
	<td  width="3%">录入日期</td>
	<td  width="3%">审核时间</td>
	<td  width="3%">计划送货时间</td>
	<td  width="4%">签单店面</td>
</tr>
<%

	ls_sql="SELECT jxc_clpsd.khbh,crm_khxx.hth,crm_khxx.khxm,sq_sgd.sgdmc,crm_khxx.fwdz,jxc_clpsmx.psph,TO_CHAR(jxc_clpsmx.psxh),jxc_clpsmx.nbbm,jxc_clpsmx.clmc,jxc_clpsmx.xh,jxc_clpsmx.gg,jxc_clpsmx.clbm,jxc_clpsmx.cldlbm,jxc_clpsmx.clxlbm,jxc_clpsmx.jldwbm,TO_CHAR(jxc_clpsmx.dj),jxc_clpsmx.pssl,jxc_clpsmx.psje,jxc_clpsmx.cksl,jxc_clpsmx.ppmc,jxc_clpsmx.gysmc,DECODE(jxc_clpsd.psdzt,'0','等待提交','1','等待审核','2','等待出库','3','已出库','5','部分出库','6','驳回重新修改','7','作废') psdzt,jxc_clpsd.lrrq,jxc_clpsd.shsj,jxc_clpsd.jhshsj,dwmc ";
	ls_sql+=" FROM jxc_clpsd,jxc_clpsmx,crm_khxx,sq_sgd,sq_dwxx ";
	ls_sql+=" where jxc_clpsmx.psph=jxc_clpsd.psph(+) and jxc_clpsd.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
	ls_sql+=" and jxc_clpsd.psdzt in('2','3','5') ";//0：等待提交；1：等待审核；2：等待出库；3：已出库；5：部分出库；6：驳回重新修改；7：作废
	ls_sql+="  and (jxc_clpsd.lrrq>=TO_DATE('"+tjsj+"','YYYY/MM/DD'))";
	ls_sql+="  and (jxc_clpsd.lrrq<=TO_DATE('"+tjsj2+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	ls_sql+="  and crm_khxx.sgd='"+sgd+"'";
	ls_sql+=" order by jxc_clpsmx.psph,jxc_clpsmx.psxh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);


//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"psph"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="ViewJxc_clpsd.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("psph",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khbh",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDateSum();
%> 
</table>

</body>
</html>