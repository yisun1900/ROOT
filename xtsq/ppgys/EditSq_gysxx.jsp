<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String gysbh=null;
String gysmc=null;
String dqbm=null;
String gyslb=null;
String zclb=null;
String bz=null;
String mrazhs=null;
String ppbm=null;
String ppmc=null;
String gysbm=null;
String gys=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String cwdm=null;
String wheregysbh=request.getParameter("gysbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select gysbh,gysmc,dqbm,gyslb,zclb,mrazhs,ppbm,ppmc,gysbm,gys,bz,sfyyh,yhkssj,yhjzsj,yhnr,cwdm ";
	ls_sql+=" from  sq_gysxx";
	ls_sql+=" where gysbh='"+wheregysbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gysbh=cf.fillNull(rs.getString("gysbh"));
		gysmc=cf.fillNull(rs.getString("gysmc"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		gyslb=cf.fillNull(rs.getString("gyslb"));
		zclb=cf.fillNull(rs.getString("zclb"));
		mrazhs=cf.fillNull(rs.getString("mrazhs"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gysbm=cf.fillNull(rs.getString("gysbm"));
		gys=cf.fillNull(rs.getString("gys"));
		bz=cf.fillNull(rs.getString("bz"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
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
      <div align="center"> 修改『<font color="#CC0000"><b>品牌供应商</b></font>』信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>所属地区</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>
              </td>
              <td rowspan="5" align="right"> 
                <div align="right"><font color="#FF0000">*</font>所属分公司</div>
              </td>
              <td rowspan="5"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
                  <%
	cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','『撤销』') from sq_dwxx where dwlx='F0' order by cxbz,dwbh","select ssfgs from sq_ppgyssqfgs where gysbh='"+wheregysbh+"'");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>供应商类别</td>
              <td width="31%"> 
                <select name="gyslb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+木门&2+橱柜&3+家具&4+主材",gyslb);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">主材类别</td>
              <td width="31%"> 
                <select name="zclb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zcxlmc c1,zcxlmc c2 from jdm_zcxlbm order by zcxlmc",zclb);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right"><font color="#FF0000">*</font>品牌名称</td>
              <td width="31%">
                <select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ppbm,ppmc from sq_ppxx order by ppmc",ppbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">财务代码</td>
              <td width="31%">
                <input type="text" name="cwdm" value="<%=cwdm%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>品牌供应商名称</td>
              <td colspan="3"> 
                <input type="text" name="gysmc" size="71" maxlength="50"  value="<%=gysmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>供应商名称</td>
              <td colspan="3"> 
                <select name="gysbm" style="FONT-SIZE:12PX;WIDTH:512PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gysbm,gys||'（'||dqmc||'）' from sq_gysbm,dm_dqbm where sq_gysbm.dqbm=dm_dqbm.dqbm(+) and sq_gysbm.dqbm='"+dqbm+"' order by gys",gysbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>是否有优惠</td>
              <td width="31%"> <%
	cf.radioToken(out, "sfyyh","N+否&Y+是",sfyyh);
%> </td>
              <td width="18%" align="right">每日安装户数限制</td>
              <td width="32%"> 
                <input type="text" name="mrazhs" value="<%=mrazhs%>" size="20" maxlength="8" >
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">优惠开始时间</td>
              <td width="31%"> 
                <input type="text" name="yhkssj" value="<%=yhkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="18%" align="right">优惠截至时间</td>
              <td width="32%"> 
                <input type="text" name="yhjzsj" value="<%=yhjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">优惠内容</td>
              <td colspan="3"> 
                <textarea name="yhnr" cols="70" rows="3"><%=yhnr%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="70" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="wheregysbh"  value="<%=wheregysbh%>" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[所属地区]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.gyslb)=="") {
		alert("请选择[供应商类别]！");
		FormName.gyslb.focus();
		return false;
	}
	if (FormName.gyslb.value=="4")
	{
		if(	javaTrim(FormName.zclb)=="") {
			alert("请选择[主材类别]！");
			FormName.zclb.focus();
			return false;
		}
	}
	else{
		FormName.zclb.value="";
	}

	if(	javaTrim(FormName.ppbm)=="") {
		alert("请选择[品牌名称]！");
		FormName.ppbm.focus();
		return false;
	}


	if(	javaTrim(FormName.gysmc)=="") {
		alert("请输入[品牌供应商名称]！");
		FormName.gysmc.focus();
		return false;
	}

	if(	javaTrim(FormName.gysbm)=="") {
		alert("请选择[供应商名称]！");
		FormName.gysbm.focus();
		return false;
	}

	if(!(isNumber(FormName.mrazhs, "每日安装户数限制"))) {
		return false;
	}

	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}

	if (FormName.sfyyh[1].checked)
	{
		if(	javaTrim(FormName.yhkssj)=="") {
			alert("请输入[优惠开始时间]！");
			FormName.yhkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhkssj, "优惠开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.yhjzsj)=="") {
			alert("请输入[优惠截至时间]！");
			FormName.yhjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.yhjzsj, "优惠截至时间"))) {
			return false;
		}
		if (FormName.yhkssj.value>FormName.yhjzsj.value)
		{
			alert("[优惠开始时间]不能大于[优惠截至时间]！");
			FormName.yhjzsj.select();
			return false;
		}
		if(	javaTrim(FormName.yhnr)=="") {
			alert("请输入[优惠内容]！");
			FormName.yhnr.focus();
			return false;
		}
	}
	else{
		FormName.yhkssj.value="";
		FormName.yhjzsj.value="";
		FormName.yhnr.value="";
	}

	if(	!selectChecked(FormName.ssfgs)) {
		alert("请选择[所属分公司]！");
		FormName.ssfgs.focus();
		return false;
	}


	FormName.action="SaveEditSq_gysxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
