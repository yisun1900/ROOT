<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcbm=null;
double zqdj=0;
double dpzk=0;
double dj=0;
String sl=null;
double zqje=0;
double je=0;
double ycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
String bz=null;
String jldwbm=null;
String qtfy=null;
String xzjg=null;
String zcmc=null;
String zclbbm=null;
String xinghao=null;
String gg=null;
String sfbhpj=null;
String pjts=null;
String lsj=null;
String yhj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String bjbz=null;
String qtfyje=null;
String cxhdbl=null;
String cxhdje=null;
String gys=null;
String ppmc=null;
double cbj=0;
double bzcbj=0;
double bzcxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String sftjcp=null;

String dqbm=null;
double zxqdl=0;
String xsfs=null;
String xsfsmc=null;
double zcpzsl=0;
double dhsl=0;
double xhsl=0;
String sfzp=null;
double zsdj=0;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sfzp,zsdj,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,cxhdbz,bz,jldwbm,qtfy,xzjg,sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl,DECODE(sftjcp,'Y','是','N','否') sftjcp";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zsdj=rs.getDouble("zsdj");
		sfzp=cf.fillNull(rs.getString("sfzp"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=cf.fillNull(rs.getString("sl"));
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		bz=cf.fillNull(rs.getString("bz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=cf.fillNull(rs.getString("qtfyje"));
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));
	}
	rs.close();
	ps.close();


	ls_sql="select dqbm";
	ls_sql+=" from  jc_zcdd,sq_dwxx";
	ls_sql+=" where jc_zcdd.fgsbh=sq_dwxx.dwbh and jc_zcdd.ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	ls_sql="select zxqdl,zcpzsl,dhsl,zcpzsl-dhsl xhsl,xsfs,DECODE(xsfs,'1','代销品','2','现货销售','3','库存无货可销售') xsfsmc,bz";
	ls_sql+=" from  jxc_cljgb";
	ls_sql+=" where clbm='"+zcbm+"' and dqbm='"+dqbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zxqdl=rs.getDouble("zxqdl");
		zcpzsl=rs.getDouble("zcpzsl");//正常品总数量
		dhsl=rs.getDouble("dhsl");
		xhsl=rs.getDouble("xhsl");
		xsfs=cf.fillNull(rs.getString("xsfs"));
		xsfsmc=cf.fillNull(rs.getString("xsfsmc"));
		bjbz=cf.fillNull(rs.getString("bz"));
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改主材订单明细（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_zcddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right"><font color="#0000CC">品牌</font></td>
              <td width="36%"><%=ppmc%></td>
              <td width="18%" align="right"><font color="#0000CC">供应商</font></td>
              <td width="28%"><%=gys%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">主材编码</font></td>
              <td width="36%"><%=zcbm%></td>
              <td width="18%" align="right"><font color="#0000CC">主材名称</font></td>
              <td width="28%"><%=zcmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">型号</font></td>
              <td width="36%"><%=xinghao%></td>
              <td width="18%" align="right"><font color="#0000CC">规格</font></td>
              <td width="28%"><%=gg%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">类别/系列</font></td>
              <td width="36%"><%=zclbbm%> </td>
              <td width="18%" align="right"><strong><font color="#0000CC">是否推荐产品</font></strong></td>
              <td width="28%"><%=sftjcp%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">是否包含配件</font></td>
              <td width="36%"> <%
	cf.radioToken(out, "sfbhpj","Y+包含&N+不包含",sfbhpj,true);
%> </td>
              <td width="18%" align="right"><font color="#0000CC">单套配件数</font></td>
              <td width="28%"><%=pjts%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">市场标价</font></td>
              <td width="36%"><%=lsj%></td>
              <td width="18%" align="right"><font color="#0000CC">销售限价</font></td>
              <td width="28%"><%=yhj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">正常计入活动比例</font></td>
              <td width="36%"><%=bzcxhdbl%>%</td>
              <td width="18%" align="right"><font color="#0000CC">促销期计入活动比例</font></td>
              <td width="28%"><%=lscxhdbl%>%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">厂家是否有促销</font></td>
              <td width="36%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销",sfycx,true);
%></td>
              <td width="18%" align="right"><font color="#0000CC">促销价</font></td>
              <td width="28%"><%=cxj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">促销开始时间</font></td>
              <td width="36%"><%=cxkssj%></td>
              <td width="18%" align="right"><font color="#0000CC">促销结束时间</font></td>
              <td width="28%"><%=cxjzsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">备注</font></td>
              <td colspan="3"><%=bjbz%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>选择价格</td>
              <td width="36%">
<%
	cf.radioToken(out, "xzjg","0+手写项目&1+销售限价&2+促销价",xzjg,true);
%>			  </td> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">折前实销单价</font></td>
              <td width="28%"> 
                <input type="text" name="zqdj" size="17" maxlength="9"  value="<%=zqdj%>" readonly>
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font><font color="#0000CC">折扣率</font></td>
              <td><input type="text" name="dpzk" size="8" maxlength="9"  value="<%=dpzk%>" readonly>
              <b><font color="#0000FF">（>0且<=10）</font></b></td>
              <td align="right"><font color="#FF0000">*</font>折后实销单价</td>
              <td><input type="text" name="dj" size="17" maxlength="9"  value="<%=dj%>" onChange="f_jsjg(editform)">
元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC">颜色</td>
              <td width="36%"> 
                <input type="text" name="zcysbm" size="20" maxlength="50"  value="<%=zcysbm%>" onKeyUp="keyGo(zcpzwzbm)" ></td>
              <td width="18%" align="right">铺装位置</td>
              <td width="28%"> 
				<select name="zcpzwzbm" style="FONT-SIZE:12PX;WIDTH:132PX" >
					<option value=""></option>
					<%
						cf.selectItem(out,"select pzwz c1,pzwz c2 from jdm_pzwz  order by pzwz",zcpzwzbm);
					%>
				</select>				</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>订货数量</td>
              <td colspan="3"><input type="text" name="sl" size="17" maxlength="8"  value="<%=sl%>" onChange="f_jsjg(editform)" onKeyUp="keyGo(ycf)">
                <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
%> 
&nbsp;&nbsp;&nbsp;&nbsp;
<font color="#0000CC"><%=xsfsmc%>：库存数<%=zcpzsl%>、订货数<%=dhsl%>、最小起订量<%=zxqdl%>、可订货数<%=xhsl%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">&nbsp;</td>
              <td width="36%">&nbsp;</td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">折前材料费</font></td>
              <td width="28%"><input type="text" name="zqje" size="17" maxlength="9"  value="<%=zqje%>" readonly>
元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">远程费</td>
              <td width="36%"><input type="text" name="ycf" size="17" maxlength="9"  value="<%=ycf%>" onKeyUp="keyTo(qtfy[0])">
元</td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">折后材料费</font></td>
              <td width="28%"><input type="text" name="je" size="17" maxlength="9"  value="<%=je%>" readonly>
元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>其它费用</td>
              <td width="36%"> <%
	cf.radioToken(out, "qtfy","1+安装费&2+加工费&3+其它收费&W+无",qtfy);
%> </td>
              <td width="18%" align="right">其它费金额</td>
              <td width="28%"> 
                <input type="text" name="qtfyje" size="17" maxlength="9"  value="<%=qtfyje%>" onKeyUp="keyTo(cxhdbz[0])">
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><strong><font color="#FF0000">*</font></strong>是否赠品</td>
              <td><%
	cf.radioToken(out, "sfzp","Y+是&N+否",sfzp);
%></td>
              <td align="right"><font color="#FF0000">*</font>赠送单价</td>
              <td><input type="text" name="zsdj" size="17" maxlength="9"  value="<%=zsdj%>"  >
元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>参加促销活动标志</td>
              <td width="36%"><%
	cf.radioToken(out, "cxhdbz","Y+参加&N+不参加",cxhdbz,true);
%></td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="28%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>计入促销活动比率</td>
              <td width="36%"> 
                <input type="text" name="cxhdbl" size="17" maxlength="9"  value="<%=cxhdbl%>" onChange="f_jsjg(editform)" >
                % </td>
              <td width="18%" align="right"><font color="#0000CC">计入促销活动金额</font></td>
              <td width="28%"> 
                <input type="text" name="cxhdje" size="17" maxlength="9"  value="<%=cxhdje%>" readonly>
                元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="68" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input type="hidden" name="ddbh"  value="<%=ddbh%>" >
				<input type="hidden" name="xh"  value="<%=xh%>" >

				<input type="hidden" name="xsfs"  value="<%=xsfs%>" >
				<input type="hidden" name="zxqdl"  value="<%=zxqdl%>" >
				<input type="hidden" name="zcpzsl"  value="<%=zcpzsl%>" >
				<input type="hidden" name="dhsl"  value="<%=dhsl%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
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

function f_jsjg(FormName)//参数FormName:Form的名称
{
	var dpzk=FormName.dj.value*10.0/FormName.zqdj.value;
	dpzk=round(dpzk,2);
	FormName.dpzk.value=dpzk;

	var zqje=FormName.zqdj.value*FormName.sl.value;
	zqje=round(zqje,2);
	FormName.zqje.value=zqje;

	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);
	FormName.je.value=je;

	var cxhdje=FormName.je.value*FormName.cxhdbl.value/100;
	cxhdje=round(cxhdje,2);
	FormName.cxhdje.value=cxhdje;
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

	if(	javaTrim(FormName.zqdj)=="") {
		alert("请输入[折前实销单价]！");
		FormName.zqdj.focus();
		return false;
	}
	if(!(isFloat(FormName.zqdj, "折前实销单价"))) {
		return false;
	}

	if(	javaTrim(FormName.dpzk)=="") {
		alert("请输入[折扣率]！");
		FormName.dpzk.focus();
		return false;
	}
	if(!(isFloat(FormName.dpzk, "折扣率"))) {
		return false;
	}
	if (FormName.dpzk.value<0 || FormName.dpzk.value>10)
	{
		alert("错误！[折扣率]应该在0和10之间！");
		FormName.dpzk.select();
		return false;
	}

	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[折后实销单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "折后实销单价"))) {
		return false;
	}

	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订货数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isFloat(FormName.sl, "订货数量"))) {
		return false;
	}
	if (parseFloat(FormName.sl.value)<=0)
	{
		alert("[订货数量]不能<=0！");
		FormName.sl.select();
		return false;
	}
	if (parseFloat(FormName.sl.value)<parseFloat(FormName.zxqdl.value))
	{
		alert("[订货数量]不能 小于 [最小起订量"+parseFloat(FormName.zxqdl.value)+"]");
		FormName.sl.select();
		return false;
	}
	if (FormName.xsfs.value=="2")//1：代销品；2：现货销售；3：库存无货可销售
	{
		var kdhsl=parseFloat(FormName.zcpzsl.value);
		if (  parseFloat(FormName.sl.value)  > kdhsl )
		{
			alert("该产品现货销售，[订货数量]不能 大于 [可订货数"+kdhsl+"]");
			FormName.sl.select();
			return false;
		}
	}
	else if (FormName.xsfs.value=="3")//1：代销品；2：现货销售；3：库存无货可销售
	{
	}
	else{
		alert("错误！[销售方式]不正确："+FormName.xsfs.value);
		return false;
	}

	if(	javaTrim(FormName.zqje)=="") {
		alert("请输入[折前材料费]！");
		FormName.zqje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqje, "折前材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.je)=="") {
		alert("请输入[折后材料费]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "折后材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.ycf)=="") {
		alert("请输入[远程费]！");
		FormName.ycf.focus();
		return false;
	}
	if(!(isFloat(FormName.ycf, "远程费"))) {
		return false;
	}

	if(	!radioChecked(FormName.qtfy)) {
		alert("请选择[其它费用]！");
		FormName.qtfy[0].focus();
		return false;
	}
	if(FormName.qtfy[0].checked || FormName.qtfy[1].checked || FormName.qtfy[2].checked) {
		if(	javaTrim(FormName.qtfyje)=="") {
			alert("请输入[其它费金额]！");
			FormName.qtfyje.focus();
			return false;
		}
		if(!(isFloat(FormName.qtfyje, "其它费金额"))) {
			return false;
		}
		if (FormName.qtfyje.value=="0")
		{
			alert("[其它费金额]不能为0！");
			FormName.qtfyje.select();
			return false;
		}
	}
	else{
		FormName.qtfyje.value="0";
	}


	if (FormName.cxhdbz.value=="Y")
	{
		if(	javaTrim(FormName.cxhdbl)=="") {
			alert("请输入[计入促销活动比率]！");
			FormName.cxhdbl.focus();
			return false;
		}
		if(!(isFloat(FormName.cxhdbl, "计入促销活动比率"))) {
			return false;
		}
		if (FormName.cxhdbl.value<=0 || FormName.cxhdbl.value>300)
		{
			alert("[计入促销活动比率]应在0％和300％之间！");
			FormName.cxhdbl.select();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.cxhdbl)!="" && FormName.cxhdbl.value!="0") {
			alert("错误！不参加促销活动，[计入促销活动比率]应为0！");
			FormName.cxhdbl.select();
			return false;
		}
		if(	javaTrim(FormName.cxhdje)!="" && FormName.cxhdje.value!="0") {
			alert("错误！不参加促销活动，[计入促销活动金额]应为0！");
			FormName.cxhdbl.select();
			return false;
		}
	}

	if(	!radioChecked(FormName.sfzp)) {
		alert("请选择[是否赠品]！");
		FormName.sfzp[0].focus();
		return false;
	}
	if (FormName.sfzp[0].checked)
	{
		if (parseFloat(FormName.dj.value)!=0)
		{
			alert("错误！赠品【折后实销单价】应为0");
			FormName.dj.select();
			return false;
		}
		if(	javaTrim(FormName.zsdj)=="") {
			alert("请输入[赠送单价]！");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "赠送单价"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)==0)
		{
			alert("错误！赠品【赠送单价】不能为0");
			FormName.zsdj.select();
			return false;
		}
	}
	else{
		if (parseFloat(FormName.dj.value)==0)
		{
			alert("错误！非赠品【折后实销单价】不能为0");
			FormName.dj.select();
			return false;
		}

		if(	javaTrim(FormName.zsdj)=="") {
			alert("请输入[赠送单价]！");
			FormName.zsdj.focus();
			return false;
		}
		if(!(isFloat(FormName.zsdj, "赠送单价"))) {
			return false;
		}
		if (parseFloat(FormName.zsdj.value)!=0)
		{
			alert("错误！非赠品【赠送单价】应为0");
			FormName.zsdj.select();
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
