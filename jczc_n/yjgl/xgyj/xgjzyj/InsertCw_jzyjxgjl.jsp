<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");

String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sgbz=null;
String dwbh=null;
String dwmc=null;
String fgsbh=null;
String qyrq=null;
double wdzgce=0;
double qye=0;

String yjjzsj=null;
String tdyjjzsj=null;
String zt=null;

String yjzrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq,wdzgce,qye  ,yjjzsj,tdyjjzsj,zt";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");

		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		zt=cf.fillNull(rs.getString("zt"));
	}
	rs.close();
	ps.close();

	if (!zt.equals("3"))//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	{
		if (!tdyjjzsj.equals(""))//退单结转
		{
			out.println("错误！非退单客户，不能有『退单业绩结转时间』");
			return;
		}
	}
	else{
		if (yjjzsj.equals(""))//签单未结转
		{
			out.println("错误！退单客户，『签单未结转』，不能进行修改");
			return;
		}
	}

	if (!yjjzsj.equals("") && !tdyjjzsj.equals(""))//签单,退单同时结转
	{
		if (yjjzsj.compareTo(tdyjjzsj)>=0)
		{
			out.println("错误！『签单业绩结转时间』要小于『退单业绩结转时间』");
			return;
		}
		yjzrq=tdyjjzsj;
	}
	else if (!yjjzsj.equals("") && tdyjjzsj.equals(""))//签单结转,退单未结转
	{
		yjzrq=yjjzsj;
	}
	else if (yjjzsj.equals("") && !tdyjjzsj.equals(""))//签单未结转,退单结转
	{
		out.println("错误！『签单未结转』而『退单结转』");
		return;
	}
	else{
		yjzrq="";
	}

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


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jzyjxgjl.jsp" name="insertform" target="_blank">
  <div align="center">修改－结转业绩</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">客户编号</font></td>
      <td width="32%"><%=khbh%></td>
      <td align="right" width="19%"><font color="#000099">合同号</font></td>
      <td width="31%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">客户姓名</font></td>
      <td width="32%"><%=khxm%></td>
      <td align="right" width="19%"><font color="#000099">房屋地址</font></td>
      <td width="31%"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">设计师</font></td>
      <td width="32%"><%=sjs%></td>
      <td align="right" width="19%"><font color="#000099">质检员</font></td>
      <td width="31%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">施工队</font></td>
      <td width="32%"><%=sgdmc%></td>
      <td align="right" width="19%"><font color="#000099">施工班组</font></td>
      <td width="31%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">签约日期</font></td>
      <td width="32%"><%=qyrq%></td>
      <td align="right" width="19%"><font color="#000099">签约店面</font></td>
      <td width="31%"><%=dwmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000"><b>签单业绩结转时间</b></font></td>
      <td width="32%"><font color="#CC0000"><b><%=yjjzsj%></b></font></td>
      <td align="right" width="19%"><font color="#CC0000"><b>退单业绩结转时间</b></font></td>
      <td width="31%"><font color="#CC0000"><b><%=tdyjjzsj%></b></font></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="28" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>修改类型</td>
      <td width="32%"> 
        <input type="radio" name="xglx"  value="1">
        修改 
        <input type="radio" name="xglx"  value="2">
        删除 
        <input type="radio" name="xglx"  value="3">
        增加 </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>客户类型</td>
      <td width="31%"> 
        <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectToken(out,"2+家装客户&3+退单客户&4+集成客户&5+设计客户",zt,false);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">原业绩结转时间</font></td>
      <td width="32%"> 
        <input type="text" name="yjzrq" value="<%=yjzrq%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="19%">修改后业绩结转时间</td>
      <td width="31%"> 
        <input type="text" name="xjzrq" value="" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">原合同原报价</font></td>
      <td width="32%"> 
        <input type="text" name="ywdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>修改后合同原报价</td>
      <td width="31%"> 
        <input type="text" name="xwdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">原工程签约额</font></td>
      <td width="32%"> 
        <input type="text" name="yqye" value="<%=qye%>" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font>修改后工程签约额</td>
      <td width="31%"> 
        <input type="text" name="xqye" value="<%=qye%>" size="20" maxlength="17" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">修改人</font></td>
      <td width="32%"> 
        <input type="text" name="xgr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="19%"><font color="#CC0000">*</font><font color="#000099">修改时间</font></td>
      <td width="31%"> 
        <input type="text" name="xgsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="hidden" name="hth"  value="<%=hth%>" >
        <input type="hidden" name="khxm"  value="<%=khxm%>" >
        <input type="button"  value="存盘" name="bc" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xgsj)=="") {
		alert("请输入[修改时间]！");
		FormName.xgsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.xgsj, "修改时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xgr)=="") {
		alert("请输入[修改人]！");
		FormName.xgr.focus();
		return false;
	}
	if(	javaTrim(FormName.zt)=="") {
		alert("请选择[客户类型]！");
		FormName.zt.focus();
		return false;
	}
	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xglx)) {
		alert("请选择[修改类型]！");
		FormName.xglx[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.yjzrq, "原业绩结转时间"))) {
		return false;
	}
	if(	javaTrim(FormName.ywdzgce)=="") {
		alert("请输入[原合同原报价]！");
		FormName.ywdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.ywdzgce, "原合同原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.yqye)=="") {
		alert("请输入[原工程签约额]！");
		FormName.yqye.focus();
		return false;
	}
	if(!(isFloat(FormName.yqye, "原工程签约额"))) {
		return false;
	}
	if(!(isDatetime(FormName.xjzrq, "修改后业绩结转时间"))) {
		return false;
	}
	if(	javaTrim(FormName.xwdzgce)=="") {
		alert("请输入[修改后合同原报价]！");
		FormName.xwdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.xwdzgce, "修改后合同原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.xqye)=="") {
		alert("请输入[修改后工程签约额]！");
		FormName.xqye.focus();
		return false;
	}
	if(!(isFloat(FormName.xqye, "修改后工程签约额"))) {
		return false;
	}

	if (FormName.xglx[0].checked)//修改
	{
		if(	javaTrim(FormName.yjzrq)=="") {
			alert("错误！[原业绩结转时间]不存在，不能修改！");
			FormName.xglx[2].focus();
			return false;
		}

		if(	javaTrim(FormName.xjzrq)=="") {
			alert("请输入[修改后业绩结转时间]！");
			FormName.xjzrq.select();
			return false;
		}
	}
	else if (FormName.xglx[1].checked)//删除
	{
		if(	javaTrim(FormName.yjzrq)=="") {
			alert("错误！[原业绩结转时间]不存在，不能删除！");
			FormName.xglx[2].focus();
			return false;
		}

		if(	javaTrim(FormName.xjzrq)!="") {
			alert("错误！删除不能输入[修改后业绩结转时间]！");
			FormName.xjzrq.select();
			return false;
		}
	}
	else if (FormName.xglx[2].checked)//增加
	{
		if(	javaTrim(FormName.xjzrq)=="") {
			alert("请输入[修改后业绩结转时间]！");
			FormName.xjzrq.select();
			return false;
		}
	}

	if (!confirm("确实要继续吗?") )	
	{
		return;
	}

	
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
