<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql=request.getParameter("wheresql");
	String nian=request.getParameter("nian");
	String yue=request.getParameter("yue");

	String spjrybm=null;
	spjrybm=request.getParameter("spjrybm");
	if (spjrybm!=null)
	{
		if (!(spjrybm.equals("")))	wheresql+=" and  (crm_khpjb.spjrybm='"+spjrybm+"')";
	}


	ls_sql="SELECT distinct '满意' myd,crm_khxx.khbh,hth,khxm,fwdz,dwmc,sgdmc,sgbz,sjs,zjxm,kgrq,jgrq ";
	ls_sql+=" FROM crm_khpjb,crm_khxx,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khpjb.xmflbm='07' and crm_khpjb.pjjgbm='1'";//1：同意；2：不同意；9：空
	ls_sql+=" and TO_CHAR(crm_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(crm_khpjb.lrsj,'MM')='"+yue+"'";
	ls_sql+=" and crm_khpjb.pjxmbm in('010701','010703','030701','030703','050701','050703','070701','070703','090701','090703')";//010701:非常满意;010703:满意;
    ls_sql+=wheresql;

	ls_sql+=" UNION ALL ";

	ls_sql+=" SELECT distinct '不满意' myd,crm_khxx.khbh,hth,khxm,fwdz,dwmc,sgdmc,sgbz,sjs,zjxm,kgrq,jgrq ";
	ls_sql+=" FROM crm_khpjb,crm_khxx,sq_dwxx,sq_sgd ";
    ls_sql+=" where crm_khpjb.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
	ls_sql+=" and crm_khpjb.xmflbm='07' and crm_khpjb.pjjgbm='1'";//1：同意；2：不同意；9：空
	ls_sql+=" and TO_CHAR(crm_khpjb.lrsj,'YYYY')='"+nian+"' and TO_CHAR(crm_khpjb.lrsj,'MM')='"+yue+"'";
	ls_sql+=" and crm_khpjb.pjxmbm not in('010701','010703','030701','030703','050701','050703','070701','070703','090701','090703')";//010701:非常满意;010703:满意;
    ls_sql+=wheresql;
	
	ls_sql+=" order by myd desc,khxm";

    pageObj.sql=ls_sql;
//	out.println(ls_sql);

//进行对象初始化
	pageObj.initPage("","","/gcgl/wgpjd/khpj/ViewCrm_khpjb.jsp","");
	pageObj.setPageRow(300);//设置每页显示记录数

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");

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
  <B><font size="3">客户评价表</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="5%">标志</td>
	<td  width="6%">客户编号</td>
	<td  width="8%">合同号</td>
	<td  width="6%">姓名</td>
	<td  width="18%">房屋地址</td>
	<td  width="11%">签约店面</td>
	<td  width="6%">施工队</td>
	<td  width="6%">班长</td>
	<td  width="6%">设计师</td>
	<td  width="6%">工程担当</td>
	<td  width="9%">合同开工日期</td>
	<td  width="9%">合同完工日期</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>

</html>