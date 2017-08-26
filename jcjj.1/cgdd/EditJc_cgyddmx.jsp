<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String ddbh=null;
String cgbm=null;
String dgcd=null;
String dggd=null;
String dgjs=null;
String dgdj=null;
double dgfbxs=0;
String tdcd=null;
String tggd=null;
String tgjs=null;
String tgdj=null;
double tgfbxs=0;
String tmbm=null;
String tmcd=null;
String tmdj=null;
double tmfbxs=0;
String mbmj=null;
String mbdj=null;
String mbbm=null;
String mbfbbm=null;
String mbfbjg=null;
String xtbm=null;
String xtjg=null;
String lsbm=null;
String lsjg=null;
String tjbbm=null;
String tjbjg=null;
String ctbm=null;
String ctjg=null;
String jlbm=null;
String jljg=null;
String sjzj=null;
String bz=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select ddbh,cgbm,dgcd,dggd,dgjs,dgdj,dgfbxs,tdcd,tggd,tgjs,tgdj,tgfbxs,tmbm,tmcd,tmdj,tmfbxs,mbmj,mbdj,mbbm,mbfbbm,mbfbjg,xtbm,xtjg,lsbm,lsjg,tjbbm,tjbjg,ctbm,ctjg,jlbm,jljg,sjzj,bz ";
	ls_sql+=" from  jc_cgyddmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ddbh=cf.fillNull(rs.getString("ddbh"));
		cgbm=cf.fillNull(rs.getString("cgbm"));
		dgcd=cf.fillNull(rs.getString("dgcd"));
		dggd=cf.fillNull(rs.getString("dggd"));
		dgjs=cf.fillNull(rs.getString("dgjs"));
		dgdj=cf.fillNull(rs.getString("dgdj"));
		dgfbxs=rs.getDouble("dgfbxs");
		tdcd=cf.fillNull(rs.getString("tdcd"));
		tggd=cf.fillNull(rs.getString("tggd"));
		tgjs=cf.fillNull(rs.getString("tgjs"));
		tgdj=cf.fillNull(rs.getString("tgdj"));
		tgfbxs=rs.getDouble("tgfbxs");
		tmbm=cf.fillNull(rs.getString("tmbm"));
		tmcd=cf.fillNull(rs.getString("tmcd"));
		tmdj=cf.fillNull(rs.getString("tmdj"));
		tmfbxs=rs.getDouble("tmfbxs");
		mbmj=cf.fillNull(rs.getString("mbmj"));
		mbdj=cf.fillNull(rs.getString("mbdj"));
		mbbm=cf.fillNull(rs.getString("mbbm"));
		mbfbbm=cf.fillNull(rs.getString("mbfbbm"));
		mbfbjg=cf.fillNull(rs.getString("mbfbjg"));
		xtbm=cf.fillNull(rs.getString("xtbm"));
		xtjg=cf.fillNull(rs.getString("xtjg"));
		lsbm=cf.fillNull(rs.getString("lsbm"));
		lsjg=cf.fillNull(rs.getString("lsjg"));
		tjbbm=cf.fillNull(rs.getString("tjbbm"));
		tjbjg=cf.fillNull(rs.getString("tjbjg"));
		ctbm=cf.fillNull(rs.getString("ctbm"));
		ctjg=cf.fillNull(rs.getString("ctjg"));
		jlbm=cf.fillNull(rs.getString("jlbm"));
		jljg=cf.fillNull(rs.getString("jljg"));
		sjzj=cf.fillNull(rs.getString("sjzj"));
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
      <div align="center"> 请修改橱柜预订单（订单号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_cgyddmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="13%"> 
                <div align="right">橱柜</div>
              </td>
              <td width="37%"> 
                <select name="cgbm" style="FONT-SIZE:13PX;WIDTH:224PX" onChange="getDj(insertform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cgbm,cgmc from jc_cgjgb order by cgbm",cgbm);
%> 
                </select>
              </td>
              <td width="13%"> 
                <div align="right">台面</div>
              </td>
              <td width="37%"> 
                <select name="tmbm" style="FONT-SIZE:13PX;WIDTH:224PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select tmbm,tmmc||'('||xh||')'||'￥:'||ymjg from jc_tmbj order by tmbm",tmbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="13%" align="right">门板</td>
              <td width="37%"> 
                <select name="mbbm" style="FONT-SIZE:13PX;WIDTH:224PX" onChange="getJg(mbbm,mbdj)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_mbbm.mbbm,jdm_mbbm.mbmc||'￥:'||jc_mbjg.jg from jdm_mbbm,jc_mbjg where jdm_mbbm.mbbm=jc_mbjg.mbbm  order by jdm_mbbm.mbbm",mbbm);
%> 
                </select>
              </td>
              <td width="13%" align="right">门板封边</td>
              <td width="37%"> 
                <select name="mbfbbm" style="FONT-SIZE:13PX;WIDTH:224PX" onChange="getJg(mbfbbm,mbfbjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_mbfbbm.mbfbbm,jdm_mbfbbm.mbfbmc||'￥:'||jc_mbfbjg.jg  from jdm_mbfbbm,jc_mbfbjg where jdm_mbfbbm.mbfbbm=jc_mbfbjg.mbfbbm order by jdm_mbfbbm.mbfbbm",mbfbbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%"> 
                <div align="right">箱体</div>
              </td>
              <td width="37%"> 
                <select name="xtbm" style="FONT-SIZE:13PX;WIDTH:224PX" onChange="getJg(xtbm,xtjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_xtbm.xtbm,jdm_xtbm.xtmc||'￥:'||jc_xtjg.jg  from jdm_xtbm,jc_xtjg where jdm_xtbm.xtbm=jc_xtjg.xtbm order by jdm_xtbm.xtbm",xtbm);
%> 
                </select>
              </td>
              <td width="13%" align="right">拉手</td>
              <td width="37%"> 
                <select name="lsbm" style="FONT-SIZE:13PX;WIDTH:224PX" onChange="getJg(lsbm,lsjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_lsbm.lsbm,jdm_lsbm.lsmc||'￥:'||jc_lsjg.jg from jdm_lsbm,jc_lsjg where jdm_lsbm.lsbm=jc_lsjg.lsbm order by jdm_lsbm.lsbm",lsbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%"> 
                <div align="right">踢脚板</div>
              </td>
              <td width="37%" bgcolor="#FFFFCC"> 
                <select name="tjbbm" style="FONT-SIZE:13PX;WIDTH:224PX" onChange="getJg(tjbbm,tjbjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_tjbbm.tjbbm,jdm_tjbbm.tjbmc||'￥:'||jc_tjbjg.jg from jdm_tjbbm,jc_tjbjg where jdm_tjbbm.tjbbm=jc_tjbjg.tjbbm order by jdm_tjbbm.tjbbm",tjbbm);
%> 
                </select>
              </td>
              <td width="13%" align="right">抽屉</td>
              <td width="37%"> 
                <select name="ctbm" style="FONT-SIZE:13PX;WIDTH:224PX" onChange="getJg(ctbm,ctjg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_ctbm.ctbm,jdm_ctbm.ctmc||'￥:'||jc_ctjg.jg from jdm_ctbm,jc_ctjg where jdm_ctbm.ctbm=jc_ctjg.ctbm order by jdm_ctbm.ctbm",ctbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="13%"> 
                <div align="right">铰链</div>
              </td>
              <td width="37%"> 
                <select name="jlbm" style="FONT-SIZE:13PX;WIDTH:224PX" onChange="getJg(jlbm,jljg)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jdm_jlbm.jlbm,jdm_jlbm.jlmc||'￥:'||jc_jljg.jg from jdm_jlbm,jc_jljg where jdm_jlbm.jlbm=jc_jljg.jlbm order by jdm_jlbm.jlbm",jlbm);
%> 
                </select>
              </td>
              <td width="13%">&nbsp;</td>
              <td width="37%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="13%" bgcolor="#FFFFFF" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="ddbh" value="<%=ddbh%>" >
            <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(insertform)">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.cgbm)=="") {
		alert("请选择[橱柜编码]！");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tmbm)=="") {
		alert("请选择[台面]！");
		FormName.tmbm.focus();
		return false;
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
