<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%

String yddbh=null;
String mmdglxbm=null;
String mlx=null;
String mmxh=null;
String sl=null;
String ysbm=null;
String czbm=null;
String azwzbm=null;
String kqfxbm=null;
String ctbs=null;
String blxhbm=null;
String bz=null;
String dczlbm=null;
String sfsmjcc=null;
String sfydc=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,mmdglxbm,mlx,mmxh,sl,ysbm,czbm,azwzbm,kqfxbm,ctbs,blxhbm,bz,dczlbm,sfsmjcc,sfydc ";
	ls_sql+=" from  jc_mmydmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mlx=cf.fillNull(rs.getString("mlx"));
		mmxh=cf.fillNull(rs.getString("mmxh"));
		sl=cf.fillNull(rs.getString("sl"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		czbm=cf.fillNull(rs.getString("czbm"));
		azwzbm=cf.fillNull(rs.getString("azwzbm"));
		kqfxbm=cf.fillNull(rs.getString("kqfxbm"));
		ctbs=cf.fillNull(rs.getString("ctbs"));
		blxhbm=cf.fillNull(rs.getString("blxhbm"));
		bz=cf.fillNull(rs.getString("bz"));
		dczlbm=cf.fillNull(rs.getString("dczlbm"));
		sfsmjcc=cf.fillNull(rs.getString("sfsmjcc"));
		sfydc=cf.fillNull(rs.getString("sfydc"));
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">修改木门预订明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmydmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">预订单编号</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">订购类型</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">门类型</div>
              </td>
              <td width="35%"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mlx,mlxmc from jdm_mlx order by mlx",mlx);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">木门型号</div>
              </td>
              <td width="33%"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm order by mmxh",mmxh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">油色</div>
              </td>
              <td width="35%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm",ysbm);
%> 
                </select>
              </td>
              <td width="17%"> 
                <div align="right">材质</div>
              </td>
              <td width="33%"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",czbm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">安装位置</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="azwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm",azwzbm);
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">开启方向</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm",kqfxbm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF"> 
                <div align="right">玻璃型号</div>
              </td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm",blxhbm);
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFFF"> 
                <div align="right">地材种类</div>
              </td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc from jdm_dczlbm order by dczlbm",dczlbm);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF" align="right">门套/哑口材质</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="sfsmjcc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+松木集成材&N+非松木集成材",sfsmjcc);
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFFF" align="right">是否有顶窗</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <select name="sfydc" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+有顶窗&N+无顶窗",sfydc);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="15%" bgcolor="#FFFFFF" align="right">门套/窗套边数</td>
              <td width="35%" bgcolor="#FFFFFF"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"3+三边&4+四边",ctbs);
%> 
                </select>
              </td>
              <td width="17%" bgcolor="#FFFFFF" align="right">订购数量</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <input type="text" name="sl" value="<%=sl%>" size="20" maxlength="8" >
              </td>
            </tr>
            <tr> 
              <td width="15%" align="right" bgcolor="#FFFFFF">备注</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
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
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("请选择[木门订购类型]！");
		FormName.mmdglxbm.focus();
		return false;
	}


	if(	javaTrim(FormName.sl)=="") {
		alert("请输入[订购数量]！");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "订购数量"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
