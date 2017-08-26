<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String yddbh=null;
String spks=null;
String spzl=null;
String spgn=null;
String spfw=null;
String azjs=null;
String fwtd=null;
String fwgf=null;
String mfsh=null;
String mfaz=null;
String zssm=null;
String syxt=null;
String sydb=null;
String wzzq=null;
String qlxc=null;
String cscp=null;
String jsbyzs=null;
String bzgkjxy=null;
String bzgkjcf=null;
String bsdtt=null;
String bjsgkxf=null;
String bsygksb=null;
String bjsgkyq=null;
String azhs=null;
String bz=null;
String whereyddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,spks,spzl,spgn,spfw,azjs,fwtd,fwgf,mfsh,mfaz,zssm,syxt,sydb,wzzq,qlxc,cscp,jsbyzs,bzgkjxy,bzgkjcf,bsdtt,bjsgkxf,bsygksb,bjsgkyq,azhs,bz ";
	ls_sql+=" from  jc_mmazfkd";
	ls_sql+=" where  (yddbh='"+whereyddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		spks=cf.fillNull(rs.getString("spks"));
		spzl=cf.fillNull(rs.getString("spzl"));
		spgn=cf.fillNull(rs.getString("spgn"));
		spfw=cf.fillNull(rs.getString("spfw"));
		azjs=cf.fillNull(rs.getString("azjs"));
		fwtd=cf.fillNull(rs.getString("fwtd"));
		fwgf=cf.fillNull(rs.getString("fwgf"));
		mfsh=cf.fillNull(rs.getString("mfsh"));
		mfaz=cf.fillNull(rs.getString("mfaz"));
		zssm=cf.fillNull(rs.getString("zssm"));
		syxt=cf.fillNull(rs.getString("syxt"));
		sydb=cf.fillNull(rs.getString("sydb"));
		wzzq=cf.fillNull(rs.getString("wzzq"));
		qlxc=cf.fillNull(rs.getString("qlxc"));
		cscp=cf.fillNull(rs.getString("cscp"));
		jsbyzs=cf.fillNull(rs.getString("jsbyzs"));
		bzgkjxy=cf.fillNull(rs.getString("bzgkjxy"));
		bzgkjcf=cf.fillNull(rs.getString("bzgkjcf"));
		bsdtt=cf.fillNull(rs.getString("bsdtt"));
		bjsgkxf=cf.fillNull(rs.getString("bjsgkxf"));
		bsygksb=cf.fillNull(rs.getString("bsygksb"));
		bjsgkyq=cf.fillNull(rs.getString("bjsgkyq"));
		azhs=cf.fillNull(rs.getString("azhs"));
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
      <div align="center">请修改安装售服单</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmazfkd.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">预订单编号</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yddbh" size="20" maxlength="9"  value="<%=yddbh%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right">商品款式</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "spks","1+很满意&2+满意&3+不满意",spks);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">商品质量</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "spzl","1+很满意&2+满意&3+不满意",spzl);
%> </td>
              <td width="15%"> 
                <div align="right">商品功能</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "spgn","1+很满意&2+满意&3+不满意",spgn);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">商品服务</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "spfw","1+很满意&2+满意&3+不满意",spfw);
%> </td>
              <td width="15%"> 
                <div align="right">安装技术</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "azjs","1+很满意&2+满意&3+不满意",azjs);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">服务态度</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "fwtd","1+很满意&2+满意&3+不满意",fwtd);
%> </td>
              <td width="15%"> 
                <div align="right">服务规范</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "fwgf","1+很满意&2+满意&3+不满意",fwgf);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">免费送货</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "mfsh","Y+是&N+否",mfsh);
%> </td>
              <td width="15%"> 
                <div align="right">免费安装</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "mfaz","Y+是&N+否",mfaz);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">准时上门</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "zssm","Y+是&N+否",zssm);
%> </td>
              <td width="15%"> 
                <div align="right">使用鞋套</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "syxt","Y+是&N+否",syxt);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">使用垫布</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "sydb","Y+是&N+否",sydb);
%> </td>
              <td width="15%"> 
                <div align="right">位置正确</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "wzzq","Y+是&N+否",wzzq);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">清理现场</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "qlxc","Y+是&N+否",qlxc);
%> </td>
              <td width="15%"> 
                <div align="right">擦拭产品</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "cscp","Y+是&N+否",cscp);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">介绍保养知识</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "jsbyzs","Y+是&N+否",jsbyzs);
%> </td>
              <td width="15%"> 
                <div align="right">不在顾客家吸烟</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bzgkjxy","Y+是&N+否",bzgkjxy);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">不在顾客家吃饭</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bzgkjcf","Y+是&N+否",bzgkjcf);
%> </td>
              <td width="15%"> 
                <div align="right">不随地吐痰</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bsdtt","Y+是&N+否",bsdtt);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">不接受顾客小费</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bjsgkxf","Y+是&N+否",bjsgkxf);
%> </td>
              <td width="15%"> 
                <div align="right">不使用顾客家水杯</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bsygksb","Y+是&N+否",bsygksb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">不接受顾客宴请</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "bjsgkyq","Y+是&N+否",bjsgkyq);
%> </td>
              <td width="15%"> 
                <div align="right">安装耗时</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "azhs","Y+是&N+否",azhs);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="whereyddbh"  value="<%=whereyddbh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="重输">
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
