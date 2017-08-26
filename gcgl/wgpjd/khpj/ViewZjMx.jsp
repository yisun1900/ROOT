<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (!(fgsbh.equals("")) )	wheresql+=" and  (crm_khxx.fgsbh='"+fgsbh+"')";

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khpjb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	String lrsj2=null;
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals("")))	wheresql+="  and (crm_khpjb.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}
	String zjxm=request.getParameter("zjxm");


	ls_sql="SELECT crm_khxx.khbh,hth,khxm,dwmc,sgdmc,sgbz,sjs,zjxm,crm_khpjb.xmfl,crm_khpjb.pjxm,DECODE(crm_khpjb.pjjgbm,'1','<B>√</B>','2','<font color=\"#CC0000\"><B>×</B></font>','9','') ,crm_khpjb.lrsj ";
	ls_sql+=" FROM crm_khpjb,crm_khxx,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khpjb.spjrybm='03' and crm_khpjb.xmfl!='07' and crm_khpjb.pjjgbm!='1'";
	ls_sql+=" and crm_khxx.zjxm='"+zjxm+"'";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khpjb.pjjgbm desc,crm_khxx.khxm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);

//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(300);//设置每页显示记录数


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

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"khbh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/gcgl/wgpjd/khpj/ViewCrm_khpjb.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khxm",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表


//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","2");//列参数对象加入Hash表
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("dwmc","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	spanColHash.put("sgbz","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("zjxm","1");//列参数对象加入Hash表
	spanColHash.put("xmfl","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户评价表（工程担当）</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="6%">姓名</td>
	<td  width="12%">签约店面</td>
	<td  width="6%">施工队</td>
	<td  width="6%">班长</td>
	<td  width="7%">设计师</td>
	<td  width="6%">工程担当</td>
	<td  width="9%">项目分类</td>
	<td  width="21%">评价项目</td>
	<td  width="5%">结果</td>
	<td  width="8%">录入时间</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>

</html>