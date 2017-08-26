<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcbm=null;
double dj=0;
double cbj=0;
String sl=null;
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

String zcdlbm=null;
String zcxlbm=null;
String dwbh=null;
String sxhtyy=null;


double zjsl=0;
double zjje=0;
double zjycf=0;
double zjqtfy=0;
double zjcxhdje=0;



String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcbm,zcmc,zclbbm,xinghao,gg,dj,sl,je,ycf,zcpzwzbm,zcysbm,cxhdbz,jldwbm,qtfy,xzjg,sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cbj ";
	ls_sql+=" ,zcdlbm,zcxlbm,dwbh,sxhtyy";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		dwbh=cf.fillNull(rs.getString("dwbh"));

		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillNull(rs.getString("zcmc"));
		zclbbm=cf.fillNull(rs.getString("zclbbm"));
		xinghao=cf.fillNull(rs.getString("xinghao"));
		gg=cf.fillNull(rs.getString("gg"));
		dj=rs.getDouble("dj");
		sl=cf.fillNull(rs.getString("sl"));
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
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
		sxhtyy=cf.fillNull(rs.getString("sxhtyy"));
		cbj=rs.getDouble("cbj");
	}
	rs.close();
	ps.close();
	if (qtfy.equals(""))
	{
		qtfy="W";
	}

	ls_sql="select bz";
	ls_sql+=" from  jc_zcjgb";
	ls_sql+=" where zcbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjbz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	
	ls_sql="select zjsl,zjje,zjycf,zjqtfy,zjcxhdje,bz ";
	ls_sql+=" from  jc_zczjxmx";
	ls_sql+=" where jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zczjxmx.xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjsl=rs.getDouble("zjsl");
		zjje=rs.getDouble("zjje");
		zjycf=rs.getDouble("zjycf");
		zjqtfy=rs.getDouble("zjqtfy");
		zjcxhdje=rs.getDouble("zjcxhdje");
		bz=cf.fillNull(rs.getString("bz"));
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">修改手写合同（订单编号：<%=ddbh%>，增减项编号：<%=zjxbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveTqLrEditNewJc_zcddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材大类</td>
              <td width="32%"> 
                <input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材小类</td>
              <td width="32%"> 
                <input type="text" name="zcxlbm" value="<%=zcxlbm%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>品牌</td>
              <td width="32%"> 
                <input type="text" name="dwbh" value="<%=dwbh%>" readonly>
              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>计量单位</td>
              <td width="32%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jldwmc c1,jldwmc c2 from jdm_jldwbm order by jldwmc",jldwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>主材名称</td>
              <td colspan="3"> 
                <input type="text" name="zcmc" value="<%=zcmc%>" size="73" maxlength="50" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">类别/系列</td>
              <td colspan="3"> 
                <input type="text" name="zclbbm" value="<%=zclbbm%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">型号</td>
              <td colspan="3"> 
                <input type="text" name="xinghao" value="<%=xinghao%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">规格</td>
              <td colspan="3"> 
                <input type="text" name="gg" value="<%=gg%>" size="73" maxlength="100" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>是否有促销</td>
              <td width="35%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销",sfycx);
%></td>
              <td width="18%" align="right"><font color="#FF0000">*</font>实销单价</td>
              <td width="29%"> 
                <input type="text" name="dj" size="17" maxlength="9"  value="<%=dj%>"  onChange="f_jsjg(editform)">
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">颜色</div>
              </td>
              <td width="35%"> 
                <input type="text" name="zcysbm" size="20" maxlength="50"  value="<%=zcysbm%>" onKeyUp="keyGo(zcpzwzbm)" >
              </td>
              <td width="18%"> 
                <div align="right">铺装位置</div>
              </td>
              <td width="29%"> 
                <input type="text" name="zcpzwzbm" size="20" maxlength="20"  value="<%=zcpzwzbm%>" onKeyUp="keyGo(sl)">
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>订货数量</td>
              <td width="35%"> 
                <input type="text" name="sl" size="20" maxlength="8"  value="<%=zjsl%>" onChange="f_jsjg(editform)" onKeyUp="keyGo(ycf)">
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">材料费</font></td>
              <td width="35%"> 
                <input type="text" name="je" size="17" maxlength="9"  value="<%=zjje%>" readonly>
                元 </td>
              <td width="18%" align="right">远程费</td>
              <td width="29%"> 
                <input type="text" name="ycf" size="17" maxlength="9"  value="<%=zjycf%>" onKeyUp="keyTo(qtfy[0])">
                元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>其它费用</td>
              <td width="35%"> <%
	cf.radioToken(out, "qtfy","1+安装费&2+加工费&3+其它收费&W+无",qtfy);
%> </td>
              <td width="18%" align="right">其它费金额</td>
              <td width="29%"> 
                <input type="text" name="qtfyje" size="17" maxlength="9"  value="<%=zjqtfy%>" onKeyUp="keyTo(cxhdbz[0])">
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>参加促销活动标志</td>
              <td width="35%"><%
	cf.radioToken(out, "cxhdbz","Y+参加&N+不参加",cxhdbz);
%></td>
              <td width="18%" align="right"><font color="#FF0000">*</font>手写合同原因</td>
              <td width="29%"> 
                <select name="sxhtyy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sxhtyy c1,sxhtyy c2 from jdm_sxhtyybm order by sxhtyybm",sxhtyy);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">计入促销活动比率</td>
              <td width="35%"> 
                <input type="text" name="cxhdbl" size="14" maxlength="9"  value="<%=cxhdbl%>" onChange="f_jsjg(editform)" onKeyUp="keyGo(bz)">
                % </td>
              <td width="18%" align="right"><font color="#0000CC">计入促销活动金额</font></td>
              <td width="29%"> 
                <input type="text" name="cxhdje" size="17" maxlength="9"  value="<%=zjcxhdje%>" readonly>
                元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="68" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="hidden" name="zjxbh"  value="<%=zjxbh%>" >
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="hidden" name="xh"  value="<%=xh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_jsjg(FormName)//参数FormName:Form的名称
{
	var je=FormName.dj.value*FormName.sl.value;
	je=round(je,2);

	FormName.je.value=je;

	je=FormName.dj.value*FormName.sl.value*FormName.cxhdbl.value/100;
	je=round(je,2);

	FormName.cxhdje.value=je;
}
function f_do(FormName)//参数FormName:Form的名称
{
	f_jsjg(FormName);

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
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zcmc)=="") {
		alert("请输入[主材名称]！");
		FormName.zcmc.focus();
		return false;
	}

	if(	!radioChecked(FormName.sfycx)) {
		alert("请选择[是否有促销]！");
		FormName.sfycx[0].focus();
		return false;
	}


	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[实销单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "实销单价"))) {
		return false;
	}

	if (FormName.dj.value=="0")
	{
		alert("[实销单价]不能为0！");
		FormName.dj.select();
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

	if(	javaTrim(FormName.je)=="") {
		alert("请输入[材料费]！");
		FormName.je.focus();
		return false;
	}
	if(!(isFloat(FormName.je, "材料费"))) {
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
	if(	!radioChecked(FormName.cxhdbz)) {
		alert("请选择[参加促销活动标志]！");
		FormName.cxhdbz[0].focus();
		return false;
	}
	if (FormName.cxhdbz[0].checked)
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
		FormName.cxhdbl.value="";
		FormName.cxhdje.value="0";
	}

	if(	javaTrim(FormName.sxhtyy)=="") {
		alert("请输入[手写合同原因]！");
		FormName.sxhtyy.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
