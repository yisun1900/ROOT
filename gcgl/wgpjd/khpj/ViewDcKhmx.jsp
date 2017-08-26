<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String wtbh=null;
	String dabh=null;

	String fgsbh=null;
	fgsbh=request.getParameter("fgsbh");
	if (!(fgsbh.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgsbh+"')";


	wtbh=request.getParameter("wtbh");
	if (wtbh!=null)
	{
		if (!(wtbh.equals("")))	wheresql+=" and  (crm_khdcb.wtbh='"+wtbh+"')";
	}
	dabh=request.getParameter("dabh");
	if (dabh!=null)
	{
		if (!(dabh.equals("")))	wheresql+=" and  (crm_khdcb.dabh='"+dabh+"')";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_khdcb.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	String lrsj2=null;
	lrsj2=request.getParameter("lrsj2");
	if (lrsj2!=null)
	{
		if (!(lrsj2.equals("")))	wheresql+="  and (crm_khdcb.lrsj<=TO_DATE('"+lrsj2+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT distinct crm_khxx.khbh,hth,khxm,fwdz,dwmc,sgdmc sgd,sjs,zjxm,kgrq,jgrq ";
	ls_sql+=" FROM crm_khdcb,crm_khxx,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_khdcb.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_khxx.khxm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);

//进行对象初始化
	pageObj.initPage("","","/gcgl/wgpjd/khpj/ViewCrm_khpjb.jsp","");
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

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">客户调查表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(105);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="7%">客户编号</td>
	<td  width="9%">合同号</td>
	<td  width="6%">姓名</td>
	<td  width="23%">房屋地址</td>
	<td  width="12%">签约店面</td>
	<td  width="6%">施工队</td>
	<td  width="6%">设计师</td>
	<td  width="6%">工程担当</td>
	<td  width="10%">合同开工日期</td>
	<td  width="10%">合同完工日期</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>

</html>