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
String tdsj=null;
double wdzgce=0;
double qye=0;

String yjjzsj="";
String tdyjjzsj="";
String zt=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select yjjzsj,tdyjjzsj,khxm,fwdz,lxfs,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sgbz,fgsbh,qyrq,tdsj,wdzgce,qye  ,zt";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
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
		tdsj=cf.fillNull(rs.getDate("tdsj"));
		wdzgce=rs.getDouble("wdzgce");
		qye=rs.getDouble("qye");

		zt=cf.fillNull(rs.getString("zt"));
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


<body bgcolor="#FFFFFF">
<form method="post" action="SaveInsertCw_jzsjxgjl.jsp" name="insertform" target="_blank">
  <div align="center">修改－结转时间</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">客户编号</font></td>
      <td width="32%"><%=khbh%></td>
      <td align="right" width="22%"><font color="#000099">合同号</font></td>
      <td width="28%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">客户姓名</font></td>
      <td width="32%"><%=khxm%></td>
      <td align="right" width="22%"><font color="#000099">房屋地址</font></td>
      <td width="28%"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">设计师</font></td>
      <td width="32%"><%=sjs%></td>
      <td align="right" width="22%"><font color="#000099">质检员</font></td>
      <td width="28%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">施工队</font></td>
      <td width="32%"><%=sgdmc%></td>
      <td align="right" width="22%"><font color="#000099">施工班组</font></td>
      <td width="28%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">签约店面</font></td>
      <td width="32%"><%=dwmc%></td>
      <td align="right" width="22%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099"><b>签约日期</b></font></td>
      <td width="32%"><%=qyrq%></td>
      <td align="right" width="22%"><b>退单时间</b></td>
      <td width="28%"><%=tdsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="28" colspan="4">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>修改类型</td>
      <td width="32%"> 
        <input type="radio" name="xglx"  value="1" checked>
        修改 </td>
      <td align="right" width="22%"><font color="#CC0000">*</font>客户类型</td>
      <td width="28%"> 
        <select name="zt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectToken(out,"2+家装客户&3+退单客户&4+集成客户&5+设计客户",zt,false);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">原－签单结转时间</font></td>
      <td width="32%"> 
        <input type="text" name="yqdjzsj" value="<%=yjjzsj%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="22%"><b><font color="#CC0000">修改后－签单结转时间</font></b></td>
      <td width="28%"> 
        <input type="text" name="xghqdjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">原－退单结转时间</font></td>
      <td width="32%"> 
        <input type="text" name="ytdjzsj" value="<%=tdyjjzsj%>" size="20" maxlength="10" readonly>
      </td>
      <td align="right" width="22%"><b><font color="#CC0000">修改后－退单结转时间</font></b></td>
      <td width="28%"> 
        <input type="text" name="xghtdjzsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">原工程原报价</font></td>
      <td width="32%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="22%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#000099">原工程签约额</font></td>
      <td width="32%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
      </td>
      <td align="right" width="22%">&nbsp;</td>
      <td width="28%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font><font color="#000099">修改人</font></td>
      <td width="32%"> 
        <input type="text" name="xgr" value="<%=yhmc%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="22%"><font color="#CC0000">*</font><font color="#000099">修改时间</font></td>
      <td width="28%"> 
        <input type="text" name="xgsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#CC0000">*</font>修改说明</td>
      <td colspan="3"> 
        <textarea name="xgsm" rows="3" cols="76"></textarea>
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
/*
	if(	javaTrim(FormName.hth)=="") {
		alert("请输入[合同号]！");
		FormName.hth.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.khxm)=="") {
		alert("请输入[客户姓名]！");
		FormName.khxm.focus();
		return false;
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[工程原报价]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}

	if(	javaTrim(FormName.xgsm)=="") {
		alert("请输入[修改说明]！");
		FormName.xgsm.focus();
		return false;
	}

	if(!(isDatetime(FormName.yqdjzsj, "原签单结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.ytdjzsj, "原退单结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xghqdjzsj, "修改后签单结转时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.xghtdjzsj, "修改后退单结转时间"))) {
		return false;
	}


	//检查录入是否正确
	if ("<%=zt%>"!="3")//2：家装客户；3：退单客户；4：集成客户；5：设计客户
	{
		if(	javaTrim(FormName.xghtdjzsj)!="") {
			alert("错误！非退单客户，不能有『修改后退单结转时间』");
			FormName.xghtdjzsj.select();
			return false;
		}
	}

	if(	javaTrim(FormName.xghtdjzsj)!="") 
	{
		if(	javaTrim(FormName.xghqdjzsj)=="") {
			alert("错误！已录入『修改后退单结转时间』，『修改后签单结转时间』不能为空");
			FormName.xghqdjzsj.select();
			return false;
		}
		if (FormName.xghqdjzsj.value>FormName.xghtdjzsj.value)
		{
			alert("错误！『签单结转时间』不能大于『退单结转时间』");
			FormName.xghqdjzsj.select();
			return false;
		}
	}


	if(	javaTrim(FormName.xghqdjzsj)!="") 
	{
		if (FormName.xghqdjzsj.value > "<%=cf.today()%>")
		{
			alert("错误！『签单结转时间』不能大于『今天』");
			FormName.xghqdjzsj.select();
			return false;
		}

		if (FormName.xghqdjzsj.value < "<%=qyrq%>")
		{
			alert("错误！『签单结转时间』不能小于『签约日期』");
			FormName.xghqdjzsj.select();
			return false;
		}
	}

	if(	javaTrim(FormName.xghtdjzsj)!="") 
	{
		if (FormName.xghtdjzsj.value > "<%=cf.today()%>")
		{
			alert("错误！『退单结转时间』不能大于『今天』");
			FormName.xghtdjzsj.select();
			return false;
		}
		if (FormName.xghtdjzsj.value < "<%=tdsj%>")
		{
			alert("错误！『退单结转时间』不能小于『退单时间』");
			FormName.xghtdjzsj.select();
			return false;
		}
	}


	if (javaTrim(FormName.xghtdjzsj)==""  && javaTrim(FormName.xghqdjzsj)=="")
	{
		if (!confirm("提醒！『签单结转时间』和『退单结转时间』全为空，将删除全部接转记录，确实要继续吗?") )	
		{
			return;
		}
	}
	else{
		if (!confirm("确实要继续吗?") )	
		{
			return;
		}
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
