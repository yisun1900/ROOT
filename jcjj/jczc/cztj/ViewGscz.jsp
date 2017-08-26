<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");
	String fgs=request.getParameter("fgs");

	ls_sql="SELECT khbh,khxm,fwdz,lxfs,qye,a.dwmc qydm,qyrq,sjkgrq,sjjgrq,sgdmc sgd,sjs,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
 	ls_sql+=" and TO_CHAR(qyrq,'YYYY')='"+nian+"'";
	ls_sql+=" and TO_CHAR(qyrq,'MM')='"+yue+"'";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	ls_sql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	ls_sql+=" order by crm_khxx.dwbh,qyrq";

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
  <B><font size="3">业绩增长分析
  <BR>(<%=nian%>年<%=yue%>月)</font></b>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">客户编号</td>
	<td  width="5%">姓名</td>
	<td  width="23%">房屋地址</td>
	<td  width="11%">联系方式</td>
	<td  width="8%">工程签约额</td>
	<td  width="10%">签约店面</td>
	<td  width="7%">签约日期</td>
	<td  width="7%">实开工日期</td>
	<td  width="7%">实竣工日期</td>
	<td  width="5%">施工队</td>
	<td  width="5%">设计师</td>
	<td  width="5%">质检员</td>
</tr>
<%
	pageObj.displayDateSum();
%> 
</table>
</body>
</html>