<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcmc=null;
String zcdlbm=null;
String zcxlbm=null;
String xh=null;
String gg=null;
String lsj=null;
String yhj=null;
String dwbh=null;
String zp=null;
String bz=null;
String zclbbm=null;
String zcysbm=null;
String jldwbm=null;
String sfbhpj=null;
String pjts=null;
String sfyh=null;

String cbj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String dqbm=null;
String sftjcp=null;

double jsbl=0;
double cxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String cpjb=null;
String fgsx=null;
String cd=null;
String gys=null;
String cpsm=null;

String zcbm=cf.GB2Uni(request.getParameter("zcbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sftjcp,lscxhdbl,cxcbj,jsbl,cxhdbl,cpjb,fgsx,cd,gys,dqbm,zcbm,zcmc,zcdlbm,zcxlbm,xh,gg,lsj,yhj,dwbh,zp,bz,zclbbm,zcysbm,jldwbm,sfbhpj,pjts,sfyh,cbj,sfycx,cxj,cxkssj,cxjzsj,cpsm ";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where  (zcbm='"+zcbm+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sftjcp=cf.fillNull(rs.getString("sftjcp"));
		lscxhdbl=rs.getDouble("lscxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		jsbl=rs.getDouble("jsbl");
		cxhdbl=rs.getDouble("cxhdbl");
		cpjb=cf.fillNull(rs.getString("cpjb"));
		fgsx=cf.fillNull(rs.getString("fgsx"));
		cd=cf.fillNull(rs.getString("cd"));
		gys=cf.fillNull(rs.getString("gys"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zp=cf.fillNull(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		sfyh=cf.fillNull(rs.getString("sfyh"));

		cbj=cf.fillNull(rs.getString("cbj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		cpsm=cf.fillNull(rs.getString("cpsm"));
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
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<%
String yhjs=(String)session.getAttribute("yhjs");
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改主材报价信息（主材编码：<%=zcbm%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">所属地区</font></td>
              <td width="32%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	if (yhjs.equals("A0") || yhjs.equals("A1"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm);
	}
	else{
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
	}
%> 
                </select>
              </td>
              <td width="17%" align="right"><strong><font color="#FF0000">*</font></strong>是否推荐产品</td>
              <td width="33%"><%
	cf.radioToken(out, "sftjcp","Y+是&N+否",sftjcp);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>主材大类</td>
              <td width="32%"> 
                <select name="zcdlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select zcdlmc c1,zcdlmc c2 from jdm_zcdlbm where zcdlmc='"+zcdlbm+"'",zcdlbm);
%> 
                </select>
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>主材小类</td>
              <td width="33%"> 
                <select name="zcxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm where zcxlmc='"+zcxlbm+"'",zcxlbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>品牌供应商</td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="<%=dwbh%>"><%=dwbh%></option>
                </select>
              </td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="33%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>主材名称</td>
              <td colspan="3"> 
                <input type="text" name="zcmc" size="73" maxlength="50"  value="<%=zcmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">类别系列</td>
              <td colspan="3"> 
                <input type="text" name="zclbbm" value="<%=zclbbm%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xh" size="73" maxlength="100"  value="<%=xh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">规格</td>
              <td colspan="3"> 
                <input type="text" name="gg" size="73" maxlength="100"  value="<%=gg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">颜色</td>
              <td width="32%"> 
                <input type="text" name="zcysbm" value="<%=zcysbm%>" size="20" maxlength="100" >
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>计量单位</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>市场标价</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lsj" size="20" maxlength="9"  value="<%=lsj%>" >
              </td>
              <td width="17%"> 
                <div align="right"><font color="#FF0000">*</font>销售限价</div>
              </td>
              <td width="33%"> 
                <input type="text" name="yhj" size="20" maxlength="9"  value="<%=yhj%>" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>结算价</td>
              <td width="32%"> 
                <input type="text" name="cbj" value="<%=cbj%>" size="20" maxlength="9" >
              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>结算比例</td>
              <td width="33%"> 
                <input type="text" name="jsbl" value="<%=jsbl%>" size="12" maxlength="8" >
                % <font color="#0000CC">（百分比）</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>计入活动比例</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="cxhdbl" value="<%=cxhdbl%>" size="12" maxlength="8" >
                % <font color="#0000CC">（百分比）</font> </td>
              <td width="17%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>是否有促销</td>
              <td width="33%" bgcolor="#E8E8FF"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销",sfycx);
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">促销开始时间</td>
              <td width="32%"> 
                <input type="text" name="cxkssj" value="<%=cxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="17%" align="right">促销结束时间</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj" value="<%=cxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">促销价</td>
              <td width="32%"> 
                <input type="text" name="cxj" value="<%=cxj%>" size="20" maxlength="9" >
              </td>
              <td width="17%" align="right">促销结算价</td>
              <td width="33%"> 
                <input type="text" name="cxcbj" value="<%=cxcbj%>" size="20" maxlength="9" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">促销期计入活动比例</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="lscxhdbl" value="<%=lscxhdbl%>" size="12" maxlength="9" >
                % <font color="#0000CC">（百分比）</font> </td>
              <td width="17%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>是否有货</td>
              <td width="33%" bgcolor="#CCCCFF"><%
	cf.radioToken(out, "sfyh","Y+有货&N+无货",sfyh);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>是否包含配件</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sfbhpj","Y+包含&N+不包含",sfbhpj);
%> </td>
              <td width="17%"> 
                <div align="right">配件套数</div>
              </td>
              <td width="33%"> 
                <input type="text" name="pjts" size="20" maxlength="8"  value="<%=pjts%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">产品级别</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cpjb" value="<%=cpjb%>" size="20" maxlength="50" >
              </td>
              <td width="17%"> 
                <div align="right">风格属性</div>
              </td>
              <td width="33%"> 
                <input type="text" name="fgsx" value="<%=fgsx%>" size="20" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">产品说明</td>
              <td colspan="3"> 
                <input type="text" name="cpsm" size="73" maxlength="200"  value="<%=cpsm%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">产地</td>
              <td width="32%"> 
                <input type="text" name="cd" value="<%=cd%>" size="20" maxlength="50" >
              </td>
              <td width="17%" align="right"><font color="#0000CC">照片名称</font></td>
              <td width="33%"> 
                <input type="text" name="zp" size="20" maxlength="50"  value="<%=zp%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="zcbm"  value="<%=zcbm%>" >
            <tr> 
              <td colspan="4"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="button"  value="上传照片" onClick="f_do1(editform)" name="button">
                  <input type="button"  value="查看照片" onClick="f_do2(editform)" name="button">
                </div>
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	!radioChecked(FormName.sftjcp)) {
		alert("请选择[是否推荐产品]！");
		FormName.sftjcp[0].focus();
		return false;
	}

	if(	javaTrim(FormName.zcbm)=="") {
		alert("请输入[主材编码]！");
		FormName.zcbm.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcdlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.zcdlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcxlbm)=="") {
		alert("请选择[主材小类]！");
		FormName.zcxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[品牌供应商]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.zcmc)=="") {
		alert("请输入[主材名称]！");
		FormName.zcmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lsj)=="") {
		alert("请输入[市场标价]！");
		FormName.lsj.focus();
		return false;
	}
	if(!(isFloat(FormName.lsj, "市场标价"))) {
		return false;
	}
	if(	javaTrim(FormName.yhj)=="") {
		alert("请输入[销售限价]！");
		FormName.yhj.focus();
		return false;
	}
	if(!(isFloat(FormName.yhj, "销售限价"))) {
		return false;
	}
	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[结算价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "结算价"))) {
		return false;
	}
	if(	javaTrim(FormName.jsbl)=="") {
		alert("请输入[结算比例]！");
		FormName.jsbl.focus();
		return false;
	}
	if(!(isFloat(FormName.jsbl, "结算比例"))) {
		return false;
	}
	if (parseFloat(FormName.jsbl.value)<0 || parseFloat(FormName.jsbl.value)>100)
	{
		alert("错误！[结算比例]应在0到100之间");
		FormName.jsbl.focus();
		return false;
	}

	if(	javaTrim(FormName.cxhdbl)=="") {
		alert("请输入[计入活动比例]！");
		FormName.cxhdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cxhdbl, "计入活动比例"))) {
		return false;
	}
	if (parseFloat(FormName.cxhdbl.value)<0 || parseFloat(FormName.cxhdbl.value)>100)
	{
		alert("错误！[计入活动比例]应在0到100之间");
		FormName.cxhdbl.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("请选择[是否有促销]！");
		FormName.sfycx[0].focus();
		return false;
	}
	if (FormName.sfycx[1].checked)
	{
		if(	javaTrim(FormName.cxj)=="") {
			alert("请输入[促销价]！");
			FormName.cxj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxj, "促销价"))) {
			return false;
		}
		if(	javaTrim(FormName.cxcbj)=="") {
			alert("请输入[促销结算价]！");
			FormName.cxcbj.focus();
			return false;
		}
		if(!(isFloat(FormName.cxcbj, "促销结算价"))) {
			return false;
		}
		if(	javaTrim(FormName.lscxhdbl)=="") {
			alert("请输入[促销期计入活动比例]！");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.lscxhdbl, "促销期计入活动比例"))) {
			return false;
		}
		if (parseFloat(FormName.lscxhdbl.value)<0 || parseFloat(FormName.lscxhdbl.value)>100)
		{
			alert("错误！[促销期计入活动比例]应在0到100之间");
			FormName.lscxhdbl.focus();
			return false;
		}
		if(	javaTrim(FormName.cxkssj)=="") {
			alert("请输入[促销开始时间]！");
			FormName.cxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxkssj, "促销开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.cxjzsj)=="") {
			alert("请输入[促销结束时间]！");
			FormName.cxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxjzsj, "促销结束时间"))) {
			return false;
		}
		if (FormName.cxkssj.value>FormName.cxjzsj.value)
		{
			alert("[促销开始时间]不能大于[促销结束时间]！");
			FormName.cxjzsj.select();
			return false;
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxcbj.value="";
		FormName.lscxhdbl.value="";
		FormName.cxkssj.value="";
		FormName.cxjzsj.value="";
	}

	if(	!radioChecked(FormName.sfyh)) {
		alert("请选择[是否有货]！");
		FormName.sfyh[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfbhpj)) {
		alert("请选择[是否包含配件]！");
		FormName.sfbhpj[0].focus();
		return false;
	}
	if (FormName.sfbhpj[0].checked)
	{
		if(	javaTrim(FormName.pjts)=="") {
			alert("请输入[配件套数]！");
			FormName.pjts.focus();
			return false;
		}
		if(!(isNumber(FormName.pjts, "配件套数"))) {
			return false;
		}
	}
	else{
		FormName.pjts.value="";
	}


	
	FormName.action="SaveEditJc_zcjgb.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zcbm)=="") {
		alert("请输入[主材编码]！");
		FormName.zcbm.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.zcbm)=="") {
		alert("请输入[主材编码]！");
		FormName.zcbm.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
