<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String wheresql="";
	String wheresql1="";
	String ls_sql=null;
	String sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		if (!(sgd.equals("")))	wheresql+=" and  (d.sgd='"+sgd+"')";
		if (!(sgd.equals("")))	wheresql1+=" and  (c.sgd='"+sgd+"')";
	}
	String sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		if (!(sgbz.equals("")))	wheresql+=" and  (d.sgbz='"+sgbz+"')";
		if (!(sgbz.equals("")))	wheresql1+=" and  (c.sgbz='"+sgbz+"')";
	}
	String cqbm=request.getParameter("cqbm");
	if (cqbm!=null)
	{
		if (!(cqbm.equals("")))	wheresql+=" and  (d.cqbm='"+cqbm+"')";
		if (!(cqbm.equals("")))	wheresql1+=" and  (c.cqbm='"+cqbm+"')";
	}
	String fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		if (!(fwdz.equals("")))	wheresql+=" and  (d.fwdz like '%"+fwdz+"%')";
		if (!(fwdz.equals("")))	wheresql1+=" and  (c.fwdz like '%"+fwdz+"%')";
	}

	ls_sql="SELECT sgbz";
	ls_sql+=" ,(select count(*) from crm_khxx c where c.sgbz=d.sgbz and c.zt='2' and c.wgbz='N' ) zsl";
	ls_sql+=" ,(select sum(qye) from crm_khxx c where c.sgbz=d.sgbz and c.zt='2' and c.wgbz='N' ) zje";
	ls_sql+=" ,a.dwmc sgdmc,khbh,cqmc,fwdz,qye,TO_CHAR(pmjj),sjs,zjxm,gcjdmc,sjkgrq,sjzkrq";
	ls_sql+=" FROM crm_khxx d,sq_sgd a,dm_gcjdbm,dm_cqbm  ";
    ls_sql+=" where d.sgd=a.sgd and zt='2' and wgbz='N'";
    ls_sql+=" and d.gcjdbm=dm_gcjdbm.gcjdbm(+) ";
	ls_sql+=" and d.cqbm=dm_cqbm.cqbm ";
    ls_sql+=wheresql;
    ls_sql+=" order by zje,sgbz,a.sgdmc";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置主键
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("sgbz","1");//列参数对象加入Hash表
	spanColHash.put("zsl","1");//列参数对象加入Hash表
	spanColHash.put("zje","1");//列参数对象加入Hash表
	spanColHash.put("sgdmc","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
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
  <B><font size="3">班组在施工程</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(110);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">班组</td>
	<td  width="4%">总数</td>
	<td  width="4%">总额</td>
	<td  width="5%">施工队</td>
	<td  width="7%">客户编号</td>
	<td  width="6%">城区</td>
	<td  width="18%">房屋地址</td>
	<td  width="7%">签约额</td>
	<td  width="5%">均价</td>
	<td  width="5%">设计师</td>
	<td  width="5%">质检</td>
	<td  width="10%">工程进度</td>
	<td  width="9%">开工日期</td>
	<td  width="9%">中期款日期</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
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