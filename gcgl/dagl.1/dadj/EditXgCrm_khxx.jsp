<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String dwbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String sfzhm=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
String sgbz=null;

String hth=null;
String smhtbh=null;

String ywy=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,khxm,xb,fwdz,crm_khxx.lxfs,crm_khxx.qtdh,crm_khxx.email,crm_khxx.sfzhm,sjs,zjxm,sgdmc,crm_khxx.sgbz ";
	ls_sql+=" ,hth,smhtbh,ywy ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		hth=cf.fillNull(rs.getString("hth"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		ywy=cf.fillNull(rs.getString("ywy"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>登记档案</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body >

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">档案编码</td>
	<td  width="5%">归档标志</td>
	<td  width="15%">档案明细</td>
	<td  width="4%">数量</td>
	<td  width="5%">保管人</td>
	<td  width="11%">保管部门</td>
	<td  width="7%">开始保管时间</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="33%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="select crm_gcdagl.damxbm,DECODE(crm_gcdagl.gdbz,'Y','归档','N','未归档'),damxmc,sl,bgr,a.dwmc bgdw,bgsj,crm_gcdagl.lrr,crm_gcdagl.lrsj,crm_gcdagl.bz ";
	ls_sql+=" FROM crm_gcdagl,crm_khxx,dm_damxbm,sq_dwxx a ";
    ls_sql+=" where crm_gcdagl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_gcdagl.damxbm=dm_damxbm.damxbm(+)";
	ls_sql+=" and crm_gcdagl.bgrdw=a.dwbh(+)";
	ls_sql+=" and crm_gcdagl.khbh='"+khbh+"'";
	ls_sql+=" order by khxm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","DeleteCrm_gcdamxTq.jsp?khbh="+khbh);
	pageObj.setPageRow(20000);//设置每页显示记录数
	pageObj.setEditStr("删除");//设置每页显示记录数

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();

%>
</table>
<form method="post" action="" name="insertform" >
  <div align="center">登记档案（客户编号：<%=khbh%>）</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">客户姓名</font>      </td>
      <td width="32%"><%=khxm%>      </td>
      <td width="18%" align="right"><font color="#0000FF">电话</font></td>
      <td width="32%"><%=lxfs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">房屋地址</font></td>
      <td><%=fwdz%></td>
      <td align="right"><font color="#0000FF">身份证号码</font></td>
      <td><%=sfzhm%></td>
    </tr>
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">设计师</font></td>
      <td width="32%"> <%=sjs%></td>
      <td width="18%" align="right"><font color="#0000FF">工程担当</font></td>
      <td width="32%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">施工队</font></td>
      <td width="32%"> <%=sgdmc%></td>
      <td width="18%" align="right"><font color="#0000FF">班长</font></td>
      <td width="32%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">合同号</font></td>
      <td width="32%"><%=hth%></td>
      <td width="18%" align="right"><font color="#0000FF">书面合同编号</font></td>
      <td width="32%"><%=smhtbh%></td>
    </tr>

      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button"  value="录入" onClick="f_do(insertform)">
          <input type="button" onClick="f_gd(insertform)"  value="归档">
          <input type="reset"  value="重输">
        </div>      </td>
    </tr>
  </table>
</form>


</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{

	FormName.target="_blank";
	FormName.action="InsertCrm_gcdadj.jsp";
	FormName.submit();

	return true;
}


function f_gd(FormName)//参数FormName:Form的名称
{
	FormName.target="";
	FormName.action="AllGddj.jsp";
	FormName.submit();

	return true;
}


//-->
</SCRIPT>
