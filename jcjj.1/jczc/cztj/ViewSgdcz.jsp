<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String sgd=request.getParameter("sgd");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");

	String dwmc=cf.executeQuery("select sgdmc from sq_sgd where sgd='"+sgd+"'");



	ls_sql="SELECT khbh,khxm,fwdz,lxfs,qye,a.dwmc qydm,qyrq,DECODE(hdbz,'1','非回单','2','设计师回单','3','施工队回单','4','老客户回单','5','员工回单','6','班长回单','7','售楼处','8','材料商','9','其他'),hdr,DECODE(jlbz,'0','正常派','1','回单奖励','2','公司奖励','3','设计师指定派单','4','客户指定派单','5','大单抵小单','6','小单抵大单','7','特殊情况'),pdsj,pdr,pdsm,sjkgrq,sjjgrq,sgdmc sgd,sjs,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
    ls_sql+=" and crm_khxx.sgd='"+sgd+"'";
 	ls_sql+=" and pdsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and pdsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" order by pdsj";

    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//设置每页显示记录数

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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3"> 施工队接单统计 （<%=dwmc%>）
  <BR>(签约时间：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">客户编号</td>
	<td  width="4%">姓名</td>
	<td  width="15%">房屋地址</td>
	<td  width="9%">联系方式</td>
	<td  width="5%">工程签约额</td>
	<td  width="8%">签约店面</td>
	<td  width="5%">签约日期</td>
	<td  width="4%">回单标志</td>
	<td  width="4%">回单人</td>
	<td  width="4%">派单类型</td>
	<td  width="5%">派单时间</td>
	<td  width="4%">派单人</td>
	<td  width="7%">派单说明</td>
	<td  width="5%">实开工日期</td>
	<td  width="5%">实竣工日期</td>
	<td  width="3%">施工队</td>
	<td  width="3%">设计师</td>
	<td  width="3%">质检员</td>
</tr>
<%
	pageObj.displayDateSum();
%> 
</table>
</body>
</html>