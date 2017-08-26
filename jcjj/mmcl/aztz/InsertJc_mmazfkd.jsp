<%@ page contentType="text/html;charset=GBK" %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
%>
<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入木门安装反馈单</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertJc_mmazfkd.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">预订单编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="15%"> 
                <div align="right">商品款式</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="spks"  value="1">
                很满意 
                <input type="radio" name="spks"  value="2">
                满意 
                <input type="radio" name="spks"  value="3">
                不满意 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">商品质量</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="spzl"  value="1">
                很满意 
                <input type="radio" name="spzl"  value="2">
                满意 
                <input type="radio" name="spzl"  value="3">
                不满意 </td>
              <td width="15%"> 
                <div align="right">商品功能</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="spgn"  value="1">
                很满意 
                <input type="radio" name="spgn"  value="2">
                满意 
                <input type="radio" name="spgn"  value="3">
                不满意 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">商品服务</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="spfw"  value="1">
                很满意 
                <input type="radio" name="spfw"  value="2">
                满意 
                <input type="radio" name="spfw"  value="3">
                不满意 </td>
              <td width="15%"> 
                <div align="right">安装技术</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="azjs"  value="1">
                很满意 
                <input type="radio" name="azjs"  value="2">
                满意 
                <input type="radio" name="azjs"  value="3">
                不满意 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">服务态度</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="fwtd"  value="1">
                很满意 
                <input type="radio" name="fwtd"  value="2">
                满意 
                <input type="radio" name="fwtd"  value="3">
                不满意 </td>
              <td width="15%"> 
                <div align="right">服务规范</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="fwgf"  value="1">
                很满意 
                <input type="radio" name="fwgf"  value="2">
                满意 
                <input type="radio" name="fwgf"  value="3">
                不满意 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">免费送货</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="mfsh"  value="Y">
                是 
                <input type="radio" name="mfsh"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right">免费安装</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="mfaz"  value="Y">
                是 
                <input type="radio" name="mfaz"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">准时上门</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="zssm"  value="Y">
                是 
                <input type="radio" name="zssm"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right">使用鞋套</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="syxt"  value="Y">
                是 
                <input type="radio" name="syxt"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">使用垫布</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="sydb"  value="Y">
                是 
                <input type="radio" name="sydb"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right">位置正确</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="wzzq"  value="Y">
                是 
                <input type="radio" name="wzzq"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">清理现场</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="qlxc"  value="Y">
                是 
                <input type="radio" name="qlxc"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right">擦拭产品</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="cscp"  value="Y">
                是 
                <input type="radio" name="cscp"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">介绍保养知识</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="jsbyzs"  value="Y">
                是 
                <input type="radio" name="jsbyzs"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right">不在顾客家吸烟</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bzgkjxy"  value="Y">
                是 
                <input type="radio" name="bzgkjxy"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">不在顾客家吃饭</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bzgkjcf"  value="Y">
                是 
                <input type="radio" name="bzgkjcf"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right">不随地吐痰</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bsdtt"  value="Y">
                是 
                <input type="radio" name="bsdtt"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">不接受顾客小费</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bjsgkxf"  value="Y">
                是 
                <input type="radio" name="bjsgkxf"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right">不使用顾客家水杯</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bsygksb"  value="Y">
                是 
                <input type="radio" name="bsygksb"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">不接受顾客宴请</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="bjsgkyq"  value="Y">
                是 
                <input type="radio" name="bjsgkyq"  value="N">
                否 </td>
              <td width="15%"> 
                <div align="right">安装耗时</div>
              </td>
              <td width="35%"> 
                <input type="radio" name="azhs"  value="Y">
                是 
                <input type="radio" name="azhs"  value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.spks)) {
		alert("请选择[商品款式]！");
		FormName.spks[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spzl)) {
		alert("请选择[商品质量]！");
		FormName.spzl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spgn)) {
		alert("请选择[商品功能]！");
		FormName.spgn[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.spfw)) {
		alert("请选择[商品服务]！");
		FormName.spfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.azjs)) {
		alert("请选择[安装技术]！");
		FormName.azjs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.fwtd)) {
		alert("请选择[服务态度]！");
		FormName.fwtd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.fwgf)) {
		alert("请选择[服务规范]！");
		FormName.fwgf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mfsh)) {
		alert("请选择[免费送货]！");
		FormName.mfsh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mfaz)) {
		alert("请选择[免费安装]！");
		FormName.mfaz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zssm)) {
		alert("请选择[准时上门]！");
		FormName.zssm[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.syxt)) {
		alert("请选择[使用鞋套]！");
		FormName.syxt[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sydb)) {
		alert("请选择[使用垫布]！");
		FormName.sydb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.wzzq)) {
		alert("请选择[位置正确]！");
		FormName.wzzq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.qlxc)) {
		alert("请选择[清理现场]！");
		FormName.qlxc[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cscp)) {
		alert("请选择[擦拭产品]！");
		FormName.cscp[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jsbyzs)) {
		alert("请选择[介绍保养知识]！");
		FormName.jsbyzs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bzgkjxy)) {
		alert("请选择[不在顾客家吸烟]！");
		FormName.bzgkjxy[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bzgkjcf)) {
		alert("请选择[不在顾客家吃饭]！");
		FormName.bzgkjcf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bsdtt)) {
		alert("请选择[不随地吐痰]！");
		FormName.bsdtt[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjsgkxf)) {
		alert("请选择[不接受顾客小费]！");
		FormName.bjsgkxf[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bsygksb)) {
		alert("请选择[不使用顾客家水杯]！");
		FormName.bsygksb[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.bjsgkyq)) {
		alert("请选择[不接受顾客宴请]！");
		FormName.bjsgkyq[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.azhs)) {
		alert("请选择[安装耗时]！");
		FormName.azhs[0].focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
