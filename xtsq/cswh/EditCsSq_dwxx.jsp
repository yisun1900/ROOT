<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010122")==0) 
{
	out.print(new String("系统闲置时间过长，请重新登录！"));
	return;
}
%>

<%
String dwmc=null;
String dwdh=null;
String dwcz=null;
String bianma=null;
String cwdm=null;
String dhqh=null;
String bz=null;

String jcppbz=null;
String zxkhlrjc=null;
String zxkhlrts=null;
String qdkhbljc=null;
String qdkhblts=null;
String dzbjjc=null;
String hfsjzdsz=null;
String xmzyglbz=null;
String jjgwglbz=null;
String jjsjsglbz=null;

String jcddblxs=null;
String jcddmxblxs=null;
String djlrfs=null;
String kgcxhdbl=null;
String zcmmbz=null;
String mmbz=null;
String cgjjbz=null;
String jjbz=null;
String gcjcbjxs=null;
String sgcbbjxs=null;

String zdyxmshbz=null;
String zdyxmyxq=null;
String clfbfb=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" ,jcppbz,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts,dzbjjc,hfsjzdsz,xmzyglbz,jjgwglbz,jjsjsglbz";
	ls_sql+=" ,jcddblxs,jcddmxblxs,djlrfs,kgcxhdbl,zcmmbz,mmbz,cgjjbz,jjbz,gcjcbjxs,sgcbbjxs  ";
	ls_sql+=" ,zdyxmshbz,zdyxmyxq,clfbfb  ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		bianma=cf.fillNull(rs.getString("bianma"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
		bz=cf.fillNull(rs.getString("bz"));

		jcppbz=cf.fillNull(rs.getString("jcppbz"));
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		zxkhlrts=cf.fillNull(rs.getString("zxkhlrts"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		qdkhblts=cf.fillNull(rs.getString("qdkhblts"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		hfsjzdsz=cf.fillNull(rs.getString("hfsjzdsz"));
		xmzyglbz=cf.fillNull(rs.getString("xmzyglbz"));
		jjgwglbz=cf.fillNull(rs.getString("jjgwglbz"));
		jjsjsglbz=cf.fillNull(rs.getString("jjsjsglbz"));

		jcddblxs=cf.fillNull(rs.getString("jcddblxs"));
		jcddmxblxs=cf.fillNull(rs.getString("jcddmxblxs"));
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		mmbz=cf.fillNull(rs.getString("mmbz"));
		cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
		gcjcbjxs=cf.fillNull(rs.getString("gcjcbjxs"));
		sgcbbjxs=cf.fillNull(rs.getString("sgcbbjxs"));

		zdyxmshbz=cf.fillNull(rs.getString("zdyxmshbz"));
		zdyxmyxq=cf.fillNull(rs.getString("zdyxmyxq"));
		clfbfb=cf.fillNull(rs.getString("clfbfb"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<form method="post" action="" name="editform">
      <div align="center">分公司参数－维护</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr>
	  <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">单位编号</font> </td>
	  <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">单位名称</font></td>
		<td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
	
	<tr bgcolor="#CCCCFF"> 
	  <td width="20%" align="right"><font color="#0000FF">编码</font></td>
	  <td width="30%"><%=bianma%></td>
	  <td width="20%" align="right"><font color="#0000FF">电话区号</font></td>
	  <td width="30%"><%=dhqh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">单位电话</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwdh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">单位传真</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwcz%></td></tr>
	<tr> 
	  <td width="20%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">备注</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
	</tr>
	
	<tr>
      <td bgcolor="#FFFFFF" align="right">投诉报修供应商检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcppbz","Y+无订单无法录入&N+无订单可录入",jcppbz);
%>
          <BR>
          <b><font color="#000099">投诉报修时，[供应商]下拉框如何取数据</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">主材收款检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zcmmbz","Y+无订单不能收款&N+无订单可收款&M+可空",zcmmbz);
%>
          <BR>
          <b><font color="#000099">财务收主材款时，[收款品牌]下拉框如何取数据</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">木门收款检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "mmbz","Y+无订单不能收款&N+无订单可收款&M+可空",mmbz);
%>
          <BR>
          <b><font color="#000099">财务收木门款时，[收款品牌]下拉框如何取数据</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">橱柜收款检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "cgjjbz","Y+无订单不能收款&N+无订单可收款&M+可空",cgjjbz);
%>
          <BR>
          <b><font color="#000099">财务收橱柜款时，[收款品牌]下拉框如何取数据</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">家具收款检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjbz","Y+无订单不能收款&N+无订单可收款&M+可空",jjbz);
%>
          <BR>
          <b><font color="#000099">财务收家具款时，[收款品牌]下拉框如何取数据</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">启用自动回访设置（4位）</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="hfsjzdsz" value="<%=hfsjzdsz%>" size="10" maxlength="4" >
          <BR>
          <b><font color="#000099">根据工程部设置的工程进度，自动设置相应的客服回访时间，第1位：开工回访；第2位：隐蔽工程回访；第3位：中期回访；第4位：完工回访 
            ，1：设置；0：不设置</font> </b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">启用咨询客户录入检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zxkhlrjc","N+不启用&Y+启用",zxkhlrjc);
%>
	      <b><BR>
          <font color="#000099">咨询客户资料必须提前若干天录入，否则不允许做签单登记</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">咨询客户提前录入天数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="zxkhlrts" value="<%=zxkhlrts%>" size="10" maxlength="8" >
          <BR>
          <b><font color="#000099">签单登记中，[咨询录入时间]和[签单录入时间]允许相差最小天数</font> </b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">启用签单客户补录检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "qdkhbljc","N+不启用&Y+启用",qdkhbljc);
%>
	      <BR>
          <b><font color="#000099">对补录签单客户进行限制，超过某几天后，不允许补录</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">签单客户补录允许天数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="qdkhblts" value="<%=qdkhblts%>" size="10" maxlength="8" >
          <BR>
          <b><font color="#000099">签单登记中，[签单录入时间]和[签约时间]允许相差最大天数</font></b> </td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单对[<b>项目专员</b>]过滤</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "xmzyglbz","N+不过滤&Y+过滤",xmzyglbz);
%>
          <BR>
          <b><font color="#000099">集成家居订单对项目专员进行过滤，不属于自己的单不能看</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单对[<b>家居顾问</b>]过滤</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjgwglbz","N+不过滤&Y+过滤",jjgwglbz);
%>
          <br>
          <b><font color="#000099">集成家居订单对家居顾问进行过滤，不属于自己的单不能看</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单对[<b>家居设计师</b>]过滤</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjsjsglbz","N+不过滤&Y+过滤",jjsjsglbz);
%>
          <br>
          <b><font color="#000099">集成家居订单对家居设计师进行过滤，不属于自己的单不能看</font></b></td>
    </tr>
	
	<tr>
      <td bgcolor="#FFFFFF" align="right">启用电子报价检查</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "dzbjjc","1+1：人工录入[折扣率、工程原报价]，根据[折扣率、工程原报价]自动计算[签约额]<BR>&2+2：人工录入[签约额、工程原报价]，根据[签约额、工程原报价]自动计算[折扣率]<BR>&3+3：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，不记录减免<BR>&6+6：全部人工录入[折扣率、签约额、合同原报价]，不自动计算，记录减免<BR>&4+4：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]不可改<BR>&7+7：[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]不可改，可改其它优惠<BR>&5+5：必须做电子报价，[工程原报价]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]",dzbjjc);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单保留小数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddblxs","2+2位小数&1+1位小数&0+保留个位&-1+保留十位&-2+保留百位&-3+保留千位",jcddblxs);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">集成订单明细保留小数</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddmxblxs","2+2位小数&1+1位小数&0+保留个位&-1+保留十位&-2+保留百位&-3+保留千位",jcddmxblxs);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">主材订单单价录入方式</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "djlrfs","1+录入单价算折扣&2+录入折扣算单价&3+不可打折",djlrfs);
%></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right">主材订单可改促销活动比例</td>
	  <td><%
	cf.radioToken(out, "kgcxhdbl","Y+可改&N+不可改",kgcxhdbl);
%></td>
	  <td align="right">&nbsp;</td>
	  <td>&nbsp;</td>
    </tr>
	
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="保存" onClick="f_do(editform)">
		  <input type="reset"  value="重输"></td>
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请输入[单位编号]！");
		FormName.dwbh.focus();
		return false;
	}


	if(	!radioChecked(FormName.jcppbz)) {
		alert("请选择[投诉报修供应商检查]！");
		FormName.jcppbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zcmmbz)) {
		alert("请选择[主材收款检查]！");
		FormName.zcmmbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mmbz)) {
		alert("请选择[木门收款检查]！");
		FormName.mmbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cgjjbz)) {
		alert("请选择[橱柜收款检查]！");
		FormName.cgjjbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjbz)) {
		alert("请选择[家具收款检查]！");
		FormName.jjbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zxkhlrjc)) {
		alert("请选择[启用咨询客户录入检查]！");
		FormName.zxkhlrjc[0].focus();
		return false;
	}
	if (FormName.zxkhlrjc[1].checked)
	{
		if(	javaTrim(FormName.zxkhlrts)=="") {
			alert("请选择[咨询客户提前录入天数]！");
			FormName.zxkhlrts.focus();
			return false;
		}
		if(!(isNumber(FormName.zxkhlrts, "咨询客户提前录入天数"))) {
			return false;
		}
	}
	else{
		FormName.zxkhlrts.value="";
	}


	if(	!radioChecked(FormName.qdkhbljc)) {
		alert("请选择[启用签单客户补录检查]！");
		FormName.qdkhbljc[0].focus();
		return false;
	}
	if (FormName.qdkhbljc[1].checked)
	{
		if(	javaTrim(FormName.qdkhblts)=="") {
			alert("请选择[签单客户补录允许天数]！");
			FormName.qdkhblts.focus();
			return false;
		}
		if(!(isNumber(FormName.qdkhblts, "签单客户补录允许天数"))) {
			return false;
		}
	}
	else{
		FormName.qdkhblts.value="";
	}

	if(	!radioChecked(FormName.dzbjjc)) {
		alert("请选择[启用电子报价检查]！");
		FormName.dzbjjc[0].focus();
		return false;
	}

	if(	javaTrim(FormName.hfsjzdsz)=="") {
		alert("请选择[启用自动回访设置]！");
		FormName.hfsjzdsz.focus();
		return false;
	}
	if (FormName.hfsjzdsz.value.length!=4)
	{
		alert("[启用自动回访设置]必须4位！");
		FormName.hfsjzdsz.focus();
		return false;
	}


	if(	!radioChecked(FormName.xmzyglbz)) {
		alert("请选择[集成订单对项目专员过滤]！");
		FormName.xmzyglbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjgwglbz)) {
		alert("请选择[集成订单对家居顾问过滤]！");
		FormName.jjgwglbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjsjsglbz)) {
		alert("请选择[集成订单对家居设计师过滤标志]！");
		FormName.jjsjsglbz[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.jcddblxs)) {
		alert("请选择[集成订单保留小数]！");
		FormName.jcddblxs[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.jcddmxblxs)) {
		alert("请选择[集成订单明细保留小数]！");
		FormName.jcddmxblxs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.djlrfs)) {
		alert("请选择[主材订单单价录入方式]！");
		FormName.djlrfs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kgcxhdbl)) {
		alert("请选择[主材订单可改促销活动比例]！");
		FormName.kgcxhdbl[0].focus();
		return false;
	}
	if (FormName.djlrfs[2].checked)
	{
		if (FormName.kgcxhdbl[0].checked)
		{
			alert("错误！单价不可打折，必须选择【不可改】");
			FormName.kgcxhdbl[1].focus();
			return false;
		}
	}



	FormName.action="SaveEditCsSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











