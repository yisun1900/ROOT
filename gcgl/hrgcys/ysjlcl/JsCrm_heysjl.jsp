<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String lrdw=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");


String khbh=null;
String yssj=null;
String ysr=null;
String lrbm=null;
String lrr=null;
String lrsj=null;
String bz=null;
String yscsjlh=null;
String gcysxmmc=null;
String sjysjg=null;
String sgd=null;
String sjs=null;
String zjxm=null;
String clbz=null;


String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sgbz=null;

String zgcljlh=null;

String ysjlh=cf.GB2Uni(request.getParameter("ysjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select crm_heysjl.yssj,crm_heysjl.ysr,crm_heysjl.lrbm,crm_heysjl.lrr,crm_heysjl.lrsj,crm_heysjl.bz,crm_heysjl.khbh,crm_heysjl.sjs,crm_heysjl.zjxm,sgdmc,crm_heysjl.yscsjlh,crm_heysjl.gcysxmmc,DECODE(crm_heysjl.sjysjg,'0','合格','1','需整改') sjysjg,DECODE(crm_heysjl.clbz,'9','录入未完成','0','没问题','1','整改未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') clbz";
	ls_sql+=" from  crm_heysjl,sq_sgd";
	ls_sql+=" where  crm_heysjl.sgd=sq_sgd.sgd(+)";
	ls_sql+=" and crm_heysjl.ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yssj=cf.fillNull(rs.getDate("yssj"));
		ysr=cf.fillNull(rs.getString("ysr"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getString("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		khbh=cf.fillNull(rs.getString("khbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
		yscsjlh=cf.fillNull(rs.getString("yscsjlh"));
		gcysxmmc=cf.fillNull(rs.getString("gcysxmmc"));
		sjysjg=cf.fillNull(rs.getString("sjysjg"));
		clbz=cf.fillNull(rs.getString("clbz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();

	int count=0;
	ls_sql="select NVL(max(substr(zgcljlh,11,3)),0)";
	ls_sql+=" from  crm_yszgcljl";
	ls_sql+=" where ysjlh='"+ysjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	zgcljlh=ysjlh+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>整改接收</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">

<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="10%">整改处理记录号</td>
	<td  width="8%">类型</td>
	<td  width="8%">处理结果</td>
	<td  width="8%">处理人</td>
	<td  width="10%">处理时间</td>
	<td  width="56%">处理说明</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT zgcljlh,lx,DECODE(cljg,'1','未接收','2','接收','3','在处理','4','已解决','5','验收通过','6','验收未通过') ,clr,clsj,clsm";
	ls_sql+=" FROM crm_yszgcljl";
    ls_sql+=" where ysjlh='"+ysjlh+"'";
    ls_sql+=" order by zgcljlh";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(1000);//设置每页显示记录数


	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>

<form method="post" action="SaveJsCrm_heysjl.jsp" name="editform" >
<div align="center">整改接收(处理记录号:<%=zgcljlh%>)</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">客户编号</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#000099">实开工日期</font> </td>
    <td width="32%"><%=sjkgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">客户姓名</font></td>
    <td><%=khxm%></td>
    <td align="right"><font color="#000099">联系方式</font></td>
    <td><input type="button" onClick="window.open('/khxx/ViewDh.jsp?khbh=<%=khbh%>')" value="查看电话" ></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">房屋地址</font></td>
    <td colspan="3"><%=fwdz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">设计师</font></td>
    <td><%=sjs%></td>
    <td align="right"><font color="#000099">施工队</font></td>
    <td><%=sgd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#000099">质检姓名</font></td>
    <td><%=zjxm%></td>
    <td align="right"><font color="#000099">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">验收记录号</td>
    <td><%=ysjlh%></td>
    <td align="right">验收次数记录号</td>
    <td><%=yscsjlh%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">验收人 </td>
    <td><%=ysr%> </td>
    <td align="right"> 验收时间 </td>
    <td><%=yssj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 验收项目 </td>
    <td><%=gcysxmmc%>    </td>
    <td align="right"> 验收结果 </td>
    <td><%=sjysjg%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"> 录入人 </td>
    <td><%=lrr%> </td>
    <td align="right"> 录入时间 </td>
    <td><%=lrsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">备注</td>
    <td colspan="3"><%=bz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#CCCCCC"><font color="#CCCCCC">&nbsp;</font></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#CC0000">*</font>计划解决时间</td>
    <td><input type="text" name="jhjjsj" size="20" maxlength="10"  value="" onDblClick="JSCalendar(this)"></td>
    <td align="right">整改处理状态</td>
    <td><%=clbz%></td>
  </tr>
  
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#CC0000">*</font>接收人</td>
  <td><input type="text" name="jsr" size="20" maxlength="50"  value="<%=yhmc%>" readonly></td>
  <td align="right"><font color="#CC0000">*</font>接收时间</td>
  <td><input type="text" name="jssj" size="20" maxlength="10"  value="<%=cf.getDate()%>" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">接收说明</td> 
  <td colspan="3"> 
    <textarea name="jssm" cols="71" rows="4" ></textarea>  </td>
</tr>
    <tr> 
      <td colspan="4" >
	<div align="center">
	<input type="hidden" name="zgcljlh"  value="<%=zgcljlh%>" >
	<input type="hidden" name="ysjlh"  value="<%=ysjlh%>" >
	  <input type="button"  value="保存" onClick="f_do(editform)">
      <input type="button"  onClick="window.open('/gcgl/hrgcys/ysjl/ViewCrm_heysmxb.jsp?ysjlh=<%=ysjlh%>')"  value="查看项目" > 
	  <input type="button" id="cktp" onClick="window.open('/gcgl/hrgcys/ysjl/ViewZp1.jsp?ysjlh=<%=ysjlh%>')"  value="查看图片" > 
	  <input type="reset"  value="重输">
	</div>      </td>
    </tr>
  </table>

</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.jhjjsj)=="") {
		alert("请输入[计划解决时间]！");
		FormName.jhjjsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhjjsj, "计划解决时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jssj)=="") {
		alert("请输入[接收时间]！");
		FormName.jssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jssj, "接收时间"))) {
		return false;
	}
	if(	javaTrim(FormName.jsr)=="") {
		alert("请输入[接收人]！");
		FormName.jsr.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
