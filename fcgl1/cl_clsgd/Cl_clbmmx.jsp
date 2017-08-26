<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgph=cf.GB2Uni(request.getParameter("sgph"));
String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
String whereclbm=null;
whereclbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String clbm=null;
String clmc=null;
String clgg=null;
String lrjsfs=null;
String lrbfb=null;
String bz=null;
String fgsdj=null;
String jldwmc=null;
String qybfb=null;
String cldlmc=null;

double kcsl=0;

try {
	conn=cf.getConnection();

	ls_sql="SELECT cl_clbm.clbm,clmc,clgg,fgsdj,jldwmc,qybfb,DECODE(lrjsfs,'1','差价方式','2','百分比方式') lrjsfs,lrbfb,bz,cl_clbm.cldlmc  ";
	ls_sql+=" FROM cl_clbm,cl_jgmx,cl_cldlbm ";
    ls_sql+=" where cl_clbm.clbm=cl_jgmx.clbm(+) and cl_jgmx.dwbh='"+dwbh+"' and cl_clbm.cldlmc=cl_cldlbm.cldlmc(+) and cl_clbm.clbm='"+whereclbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cldlmc=cf.fillNull(rs.getString("cldlmc"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		clgg=cf.fillNull(rs.getString("clgg"));
		lrjsfs=cf.fillNull(rs.getString("lrjsfs"));
		lrbfb=cf.fillNull(rs.getString("lrbfb"));
		bz=cf.fillNull(rs.getString("bz"));
		fgsdj=cf.fillNull(rs.getString("fgsdj"));
		jldwmc=cf.fillNull(rs.getString("jldwmc"));
		qybfb=cf.fillNull(rs.getString("qybfb"));
	}
	rs.close();
	ps.close();

	//查询库存++++++++++++++++++++++++++++++++++++++++++++++++

	//查询：上期结转日期、上期库存数量
	java.sql.Date sqjzrq=null;
	ls_sql="select max(jzrq)";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+dwbh+"' ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzrq=rs.getDate(1);
	} 
	rs.close();
	ps.close();

	String sqjzph=null;
	ls_sql="select jzph";
	ls_sql+=" from cl_ydjz ";
	ls_sql+=" where dwbh='"+dwbh+"' and jzrq=?";
	ps=conn.prepareStatement(ls_sql);  
	ps.setDate(1,sqjzrq);
	rs=ps.executeQuery();
	if (rs.next())
	{
		sqjzph=rs.getString(1);
	} 
	rs.close();
	ps.close();

	double sqkcsl=0;
	ls_sql="select cl_ydjzmx.kcsl ";
	ls_sql+=" from cl_ydjzmx,cl_ydjz ";
	ls_sql+=" where cl_ydjzmx.jzph=cl_ydjz.jzph and cl_ydjz.dwbh='"+dwbh+"' and cl_ydjzmx.jzph='"+sqjzph+"' and cl_ydjzmx.clbm='"+whereclbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqkcsl=rs.getDouble("kcsl");
	}
	rs.close();
	ps.close();

	
	double sumrk=0;
	ls_sql="select nvl(sum(rksl),0)  ";
	ls_sql+=" from cl_rkmx,cl_rkd  ";
	ls_sql+=" where cl_rkd.rkph=cl_rkmx.rkph  ";
	ls_sql+=" and cl_rkd.dwbh='"+dwbh+"'  ";
	ls_sql+=" and clbm='"+whereclbm+"' ";
	ls_sql+=" and cl_rkd.rkzt='2' and rksj>?";//注意起点不包括等于
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqjzrq);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumrk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	double sumck=0;
	ls_sql="select nvl(sum(cksl),0)  ";
	ls_sql+=" from cl_ckmx,cl_ckd  ";
	ls_sql+=" where cl_ckd.ckph=cl_ckmx.ckph  ";
	ls_sql+=" and cl_ckd.dwbh='"+dwbh+"' ";
	ls_sql+=" and cl_ckmx.clbm='"+whereclbm+"' and cl_ckmx.leixing='1' ";
	ls_sql+=" and cl_ckd.ckzt='2' and cksj>?";//注意起点不包括等于
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,sqjzrq);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sumck=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	kcsl=cf.doubleTrim(sqkcsl+sumrk-sumck);

	//查询库存----------------------------------------------------


}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center"> 材料明细（申购批号：<%=sgph%>）</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">材料编码</div>
    </td>
    <td width="31%"> <%=clbm%>&nbsp;</td>
    <td width="20%"> 
      <div align="right">材料名称</div>
    </td>
    <td width="30%"><%=clmc%>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">材料大类</div>
    </td>
    <td width="31%"> <%=cldlmc%>&nbsp;</td>
    <td width="20%"> 
      <div align="right">大类应领取百分比</div>
    </td>
    <td width="30%"><%=qybfb%>%&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">材料规格</div>
    </td>
    <td width="31%"><%=clgg%>&nbsp;</td>
    <td width="20%"> 
      <div align="right">分公司材料单价</div>
    </td>
    <td width="30%"> <%=fgsdj%>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">计量单位</div>
    </td>
    <td width="31%"><%=jldwmc%>&nbsp;</td>
    <td width="20%"> 
      <div align="right"></div>
    </td>
    <td width="30%">&nbsp; </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%"> 
      <div align="right">备注</div>
    </td>
    <td colspan="3"><%=bz%> </td>
  </tr>
</table>
<div align="center">
		<form method="post" action="ServerCl_clbmmx.jsp" name="insertform">
			
    <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
      <tr bgcolor="#FFFFFF"> 
        <td width="19%"> 
          <div align="right"><font color="red">申购数量</font></div>
        </td>
        <td width="31%"> 
          <input type="text" name="sgsl" value="" size="20" maxlength="10" >
          <%=jldwmc%> </td>
        <td width="20%" align="right"><font color="#0000CC">目前库存</font></td>
        <td colspan="3" width="30%"><b><font color="#0000CC"><%=kcsl%><%=jldwmc%> 
          </font></b></td>
      </tr>
      <tr align="center"> 
        <td colspan="6"> 
          <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="reset"  value="重输" name="reset">
          <input type="hidden" name="sgph" value="<%=sgph%>"  >
          <input type="hidden" name="clbm" value="<%=clbm%>"  >
          <input type="hidden" name="dwbh" value="<%=dwbh%>"  >
        </td>
      </tr>
    </table>
		</form>
	</div>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	var ssl=FormName.sgsl.value-0;

	if(	javaTrim(FormName.sgsl)=="") {
		alert("请输入[申购数量]！");
		FormName.sgsl.focus();
		return false;
	}
	if (!(isFloat(FormName.sgsl,"申购数量")))
	{
		FormName.sgsl.focus();     
		return      
   }
	if (ssl<=0)
	{
		alert("[申购数量]必须大于零！");
		FormName.sgsl.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>