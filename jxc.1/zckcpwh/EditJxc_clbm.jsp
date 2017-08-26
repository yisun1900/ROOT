<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%

String clmc=null;
String cldlbm=null;
String clxlbm=null;
String xh=null;
String gg=null;
String lsj=null;
String xsj=null;
String ppmc=null;
String zp=null;
String bz=null;
String cllbbm=null;
String clysbm=null;
String jldwbm=null;
String sfbhpj=null;
String pjts=null;
String sfyh=null;

String cbj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String sftjcp=null;

double jsbl=0;
double cxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String cpjb=null;
String fgsx=null;
String cd=null;
String gysmc=null;
String cpsm=null;
String nbbm=null;
String xsfs=null;

double zdxsj=0;
double yjjrj=0;
String jsfs=null;
double cxjsbl=0;

String dqbm=request.getParameter("dqbm");
String clbm=cf.GB2Uni(request.getParameter("clbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jxc_cljgb.xsfs,jxc_clbm.nbbm,jxc_cljgb.sftjcp,jxc_cljgb.lscxhdbl,jxc_cljgb.cxcbj,jxc_cljgb.jsbl,jxc_cljgb.cxhdbl,jxc_clbm.cpjb,jxc_clbm.fgsx,jxc_clbm.cd,jxc_cljgb.gysmc,jxc_cljgb.dqbm,jxc_clbm.clbm,jxc_clbm.clmc,jxc_clbm.cldlbm,jxc_clbm.clxlbm,jxc_clbm.xh,jxc_clbm.gg,jxc_cljgb.lsj,jxc_cljgb.xsj,jxc_clbm.ppmc,jxc_clbm.zp,jxc_clbm.bz,jxc_clbm.cllbbm,jxc_clbm.clysbm,jxc_clbm.jldwbm,jxc_clbm.sfbhpj,jxc_clbm.pjts,jxc_cljgb.sfyh,jxc_cljgb.cbj,jxc_cljgb.sfycx,jxc_cljgb.cxj,jxc_cljgb.cxkssj,jxc_cljgb.cxjzsj,jxc_clbm.cpsm ";
	ls_sql+=" ,jxc_cljgb.zdxsj,jxc_cljgb.yjjrj,jxc_cljgb.jsfs,jxc_cljgb.cxjsbl";
	ls_sql+=" FROM jxc_clbm,jxc_cljgb";
    ls_sql+=" where jxc_clbm.clbm=jxc_cljgb.clbm";
	ls_sql+=" and jxc_clbm.clbm='"+clbm+"' and jxc_cljgb.dqbm='"+dqbm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zdxsj=rs.getDouble("zdxsj");
		yjjrj=rs.getDouble("yjjrj");
		jsfs=cf.fillNull(rs.getString("jsfs"));
		cxjsbl=rs.getDouble("cxjsbl");

		xsfs=cf.fillNull(rs.getString("xsfs"));
		nbbm=cf.fillNull(rs.getString("nbbm"));
		sftjcp=cf.fillNull(rs.getString("sftjcp"));
		lscxhdbl=rs.getDouble("lscxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		jsbl=rs.getDouble("jsbl");
		cxhdbl=rs.getDouble("cxhdbl");
		cpjb=cf.fillNull(rs.getString("cpjb"));
		fgsx=cf.fillNull(rs.getString("fgsx"));
		cd=cf.fillNull(rs.getString("cd"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		clbm=cf.fillNull(rs.getString("clbm"));
		clmc=cf.fillNull(rs.getString("clmc"));
		cldlbm=cf.fillNull(rs.getString("cldlbm"));
		clxlbm=cf.fillNull(rs.getString("clxlbm"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		lsj=cf.fillNull(rs.getString("lsj"));
		xsj=cf.fillNull(rs.getString("xsj"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		zp=cf.fillNull(rs.getString("zp"));
		bz=cf.fillNull(rs.getString("bz"));
		cllbbm=cf.fillNull(rs.getString("cllbbm"));
		clysbm=cf.fillNull(rs.getString("clysbm"));
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
      <div align="center"> 请修改主材报价信息（主材编码：<%=clbm%>）</div>
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
		cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>              </td>
              <td width="17%" align="right"><strong><font color="#FF0000">*</font></strong>是否推荐产品</td>
              <td width="33%"><%
	cf.radioToken(out, "sftjcp","Y+是&N+否",sftjcp);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">主材大类</font></td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select cldlmc c1,cldlmc c2 from jxc_cldlbm where cldllb in('1','3') and cldlmc='"+cldlbm+"'",cldlbm);
%> 
                </select>              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>主材小类</td>
              <td width="33%"> 
                <select name="clxlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
					 <OPTION  value=""></OPTION>
				     <%
	cf.selectItem(out,"select clxlmc c1,clxlmc c2 from jxc_clxlbm where cldlmc='"+cldlbm+"' order by clxlmc",clxlbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">子品牌</font></td>
              <td width="32%"> 
                <select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value="<%=ppmc%>"><%=ppmc%></option>
                </select>              </td>
              <td width="17%" align="right">内部编码</td>
              <td width="33%"><input type="text" name="nbbm" size="20" maxlength="100"  value="<%=nbbm%>" ></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>主材名称</td>
              <td colspan="3"> 
                <input type="text" name="clmc" size="73" maxlength="50"  value="<%=clmc%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">类别系列</td>
              <td colspan="3"> 
                <input type="text" name="cllbbm" value="<%=cllbbm%>" size="73" maxlength="100" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xh" size="73" maxlength="100"  value="<%=xh%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">规格</td>
              <td colspan="3"> 
                <input type="text" name="gg" size="73" maxlength="100"  value="<%=gg%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">颜色</td>
              <td width="32%"> 
                <input type="text" name="clysbm" value="<%=clysbm%>" size="20" maxlength="100" >              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>计量单位</td>
              <td width="33%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwbm",jldwbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>市场标价              </td>
              <td width="32%"> 
                <input type="text" name="lsj" size="20" maxlength="9"  value="<%=lsj%>" >              </td>
              <td width="17%" align="right"> 
                <font color="#FF0000">*</font>销售价              </td>
              <td width="33%"> 
                <input type="text" name="xsj" size="20" maxlength="9"  value="<%=xsj%>" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"><font color="#FF0000">*</font>最低销售限价</td>
              <td><input name="zdxsj" type="text" id="zdxsj" value="<%=zdxsj%>" size="20" maxlength="9" ></td>
              <td align="right"><font color="#FF0000">*</font>业绩记入价</td>
              <td><input name="yjjrj" type="text" id="yjjrj" value="<%=yjjrj%>" size="20" maxlength="9" ></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right"><font color="#FF0000">*</font>结算方式</td>
              <td><%
	cf.radioToken(out, "jsfs","1+结算价&2+结算比例",jsfs);
%></td>
              <td align="right"><font color="#FF0000">*</font>计入活动比例</td>
              <td><input type="text" name="cxhdbl" value="<%=cxhdbl%>" size="10" maxlength="8" >
% <font color="#0000CC">（百分比）</font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>结算价</td>
              <td width="32%"> 
                <input type="text" name="cbj" value="<%=cbj%>" size="20" maxlength="9" >              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>结算比例</td>
              <td width="33%"> 
                <input type="text" name="jsbl" value="<%=jsbl%>" size="10" maxlength="8" >
                % <font color="#0000CC">（百分比）</font></td>
            </tr>
            
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font>是否有促销</td>
              <td><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销",sfycx);
%></td>
              <td align="right">促销价</td>
              <td><input type="text" name="cxj" value="<%=cxj%>" size="20" maxlength="9" ></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">促销开始时间</td>
              <td width="32%"> 
                <input type="text" name="cxkssj" value="<%=cxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="17%" align="right">促销结束时间</td>
              <td width="33%"> 
                <input type="text" name="cxjzsj" value="<%=cxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">促销结算价</td>
              <td width="32%"><input type="text" name="cxcbj" value="<%=cxcbj%>" size="20" maxlength="9" ></td>
              <td width="17%" align="right">促销结算比例</td>
              <td width="33%"><input type="text" name="cxjsbl" value="<%=cxjsbl%>" size="10" maxlength="9" >
              % <font color="#0000CC">（百分比）</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">促销期计入活动比例</td>
              <td width="32%" bgcolor="#E8E8FF"> 
                <input type="text" name="lscxhdbl" value="<%=lscxhdbl%>" size="10" maxlength="9" >
                % <font color="#0000CC">（百分比）</font> </td>
              <td width="17%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>是否有货</td>
              <td width="33%" bgcolor="#CCCCFF"><%
	cf.radioToken(out, "sfyh","Y+有货&N+无货",sfyh);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <font color="#FF0000">*</font>是否包含配件              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sfbhpj","Y+包含&N+不包含",sfbhpj);
%> </td>
              <td width="17%" align="right"> 
                配件套数              </td>
              <td width="33%"> 
                <input type="text" name="pjts" size="20" maxlength="8"  value="<%=pjts%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                产品级别              </td>
              <td width="32%"> 
                <input type="text" name="cpjb" value="<%=cpjb%>" size="20" maxlength="50" >              </td>
              <td width="17%" align="right"> 
                风格属性              </td>
              <td width="33%"> 
                <input type="text" name="fgsx" value="<%=fgsx%>" size="20" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">产品说明</td>
              <td colspan="3"> 
                <input type="text" name="cpsm" size="73" maxlength="200"  value="<%=cpsm%>">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">产地</td>
              <td width="32%"> 
                <input type="text" name="cd" value="<%=cd%>" size="20" maxlength="50" >              </td>
              <td width="17%" align="right"><font color="#0000CC">照片名称</font></td>
              <td width="33%"> 
                <input type="text" name="zp" size="20" maxlength="50"  value="<%=zp%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>销售方式</td>
              <td colspan="3"><%
	cf.radioToken(out, "xsfs","2+现货销售&3+期货销售",xsfs);
%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
				<input type="hidden" name="clbm"  value="<%=clbm%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="button"  value="上传照片" onClick="f_do1(editform)" name="button">
                  <input type="button"  value="查看照片" onClick="f_do2(editform)" name="button">              </td>
            </tr>
        </table>
</form>

	  
	  
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

	if(	javaTrim(FormName.clbm)=="") {
		alert("请输入[主材编码]！");
		FormName.clbm.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请选择[主材大类]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.clxlbm)=="") {
		alert("请选择[主材小类]！");
		FormName.clxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ppmc)=="") {
		alert("请选择[子品牌]！");
		FormName.ppmc.focus();
		return false;
	}
	if(	javaTrim(FormName.clmc)=="") {
		alert("请输入[主材名称]！");
		FormName.clmc.focus();
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
	if(	javaTrim(FormName.xsj)=="") {
		alert("请输入[销售价]！");
		FormName.xsj.focus();
		return false;
	}
	if(!(isFloat(FormName.xsj, "销售价"))) {
		return false;
	}
	if(	javaTrim(FormName.zdxsj)=="") {
		alert("请输入[最低销售限价]！");
		FormName.zdxsj.focus();
		return false;
	}
	if(!(isFloat(FormName.zdxsj, "最低销售限价"))) {
		return false;
	}
	if(	javaTrim(FormName.yjjrj)=="") {
		alert("请输入[业绩记入价]！");
		FormName.yjjrj.focus();
		return false;
	}
	if(!(isFloat(FormName.yjjrj, "业绩记入价"))) {
		return false;
	}

	if(	!radioChecked(FormName.jsfs)) {
		alert("请选择[结算方式]！");
		FormName.jsfs[0].focus();
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

	if (FormName.jsfs[0].checked)//结算价
	{
		if (parseFloat(FormName.cbj.value)==0)
		{
			alert("提醒！按[结算价]结算，[结算价]=0");
		}
	}
	else{
		if (parseFloat(FormName.jsbl.value)==0)
		{
			alert("提醒！按[结算比例]结算，[结算比例]=0");
		}
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

		if (FormName.jsfs[0].checked)//结算价
		{
			if (parseFloat(FormName.cxcbj.value)==0)
			{
				alert("提醒！按[促销结算价]结算，[促销结算价]=0");
			}
		}
		else{
			if (parseFloat(FormName.cxjsbl.value)==0)
			{
				alert("提醒！按[促销结算比例]结算，[促销结算比例]=0");
			}
		}
	}
	else{
		FormName.cxj.value="";
		FormName.cxcbj.value="";
		FormName.cxjsbl.value="";
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

	if(	!radioChecked(FormName.xsfs)) {
		alert("请选择[销售方式 ]！");
		FormName.xsfs[0].focus();
		return false;
	}


	
	FormName.action="SaveEditJxc_clbm.jsp";
	FormName.submit();
	return true;
}
function f_do1(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clbm)=="") {
		alert("请输入[主材编码]！");
		FormName.clbm.focus();
		return false;
	}

	FormName.action="loadPhoto.jsp";
	FormName.submit();
	return true;
}

function f_do2(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clbm)=="") {
		alert("请输入[主材编码]！");
		FormName.clbm.focus();
		return false;
	}

	FormName.action="viewPhoto.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
