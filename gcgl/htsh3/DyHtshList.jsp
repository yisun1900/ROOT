<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>


<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;
	String wheresql="";
	String crm_khxx_dwbh=null;
	String htshsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}


	htshsj=request.getParameter("htshsj");
	if (htshsj!=null)
	{
		if (!(htshsj.equals("")))	wheresql+="  and (crm_khxx.htshsj>=TO_DATE('"+htshsj+"','YYYY/MM/DD'))";
	}
	htshsj=request.getParameter("htshsj2");
	if (htshsj!=null)
	{
		if (!(htshsj.equals("")))	wheresql+="  and (crm_khxx.htshsj<=TO_DATE('"+htshsj+"','YYYY/MM/DD'))";
	}


	String dwmc=cf.executeQuery("select dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'");

	ls_sql="SELECT hth,khxm,sjs,100-htshdf htshdf,shxmmc,crm_htshmx.bhgsl,-1*crm_htshmx.kf*crm_htshmx.bhgsl";
	ls_sql+=" FROM crm_khxx,crm_htshmx,dm_shxmbm";
    ls_sql+=" where crm_khxx.khbh=crm_htshmx.khbh and crm_htshmx.shxmbm=dm_shxmbm.shxmbm and htshbz='Y' and htshdf>0 ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by htshsj ";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(5000);//设置每页显示记录数
//设置显示合并列
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hth","1");//列参数对象加入Hash表
	spanColHash.put("khxm","1");//列参数对象加入Hash表
	spanColHash.put("sjs","1");//列参数对象加入Hash表
	spanColHash.put("htshdf","1");//列参数对象加入Hash表
	pageObj.setSpanCol(spanColHash);//列参数对象加入Hash表
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
  <table border="1" width="100%" cellspacing="0" cellpadding="1" style='FONT-SIZE: 14px'>
    <tr> 
      <td colspan="2" height="25"> 
        <div align="center"><b><font size="3">合同审核通报表</font></b></div>
      </td>
    </tr>
    <tr> 
      
    <td width="20%" height="25"> 
      <div align="center"><b>店面</b></div>
      </td>
      
    <td width="80%" height="25"> 
      <div align="center"><b><%=dwmc%></b></div>
      </td>
    </tr>
  </table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">合同号</td>
	<td  width="10%">客户姓名</td>
	<td  width="10%">设计师</td>
	<td  width="10%">得分</td>
	<td  width="40%">不合格项目</td>
	<td  width="10%">不合格数量</td>
	<td  width="10%">扣分</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDate();
%> 
</table>

</body>

</html>