<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String wheresql="";
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String tjsjlx=request.getParameter("tjsjlx");
	String jzsj=request.getParameter("jzsj");

	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+dwbh+"'");

	if (tjsjlx.equals("qyrq"))
	{
		wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	}
	else{
		wheresql+=" and lrsj>=TO_DATE('"+sjfw+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
		wheresql+=" and lrsj<=TO_DATE('"+sjfw2+" "+jzsj+":00:00','YYYY-MM-DD HH24:MI:SS')";
	}


	ls_sql="SELECT khbh,hth,khxm,fwdz,lxfs,qye,a.dwmc qydm,lrsj,TO_CHAR(qyrq,'YYYY-MM-DD'),TO_CHAR(kgrq,'YYYY-MM-DD'),sgdmc sgd,sjs,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_sgd";
    ls_sql+=" where crm_khxx.sjsbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and zt='2'";
    ls_sql+=" and crm_khxx.sjsbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt='2'";
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
  <B><font size="3">店面签约明细（<%=dwmc%>）
  <BR>(时间范围：<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">客户编号</td>
	<td  width="5%">合同号</td>
	<td  width="5%">姓名</td>
	<td  width="20%">房屋地址</td>
	<td  width="10%">联系方式</td>
	<td  width="8%">工程签约额</td>
	<td  width="10%">设计室</td>
	<td  width="7%">录入时间</td>
	<td  width="7%">签约日期</td>
	<td  width="7%">合同开工日期</td>
	<td  width="5%">施工队</td>
	<td  width="5%">设计师</td>
	<td  width="5%">质检员</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
	pageObj.printSum();
%> 
</table>
</body>
</html>