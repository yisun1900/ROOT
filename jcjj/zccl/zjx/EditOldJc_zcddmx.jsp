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
double je=0;
double ycf=0;
double zjcxhdje=0;
double zjcbje=0;
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
double cbj=0;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String bjbz="";
String qtfyje=null;
String cxhdbl=null;
String cxhdje=null;
String gys=null;
String ppmc=null;
double bzcxhdbl=0;
double lscxhdbl=0;
String sfzp=null;
double yjjrbl=0;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double zjsl=0;
double zqzjje=0;
double zjje=0;
double zjycf=0;
double zjqtfy=0;
double zjyjjrje=0;

String zjhsl=null;
String zjhje=null;
String zjhycf=null;
String zjhqtfy=null;
String zjhcxhdje=null;
String lx=null;

try {
	conn=cf.getConnection();

	ls_sql="select yjjrbl,sfzp,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,je,ycf,zcpzwzbm,zcysbm,cxhdbz,jldwbm,qtfy,xzjg,sfbhpj,pjts,lsj,yhj,cbj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,bzcxhdbl,lscxhdbl,zjhsl,zjhje,zjhycf,zjhqtfy,zjhcxhdje";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yjjrbl=rs.getDouble("yjjrbl");
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
		cbj=rs.getDouble("cbj");
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=cf.fillNull(rs.getString("qtfyje"));
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		lscxhdbl=rs.getDouble("lscxhdbl");

		zjhsl=cf.fillNull(rs.getString("zjhsl"));
		zjhje=cf.fillNull(rs.getString("zjhje"));
		zjhycf=cf.fillNull(rs.getString("zjhycf"));
		zjhqtfy=cf.fillNull(rs.getString("zjhqtfy"));
		zjhcxhdje=cf.fillNull(rs.getString("zjhcxhdje"));
	
	}
	rs.close();
	ps.close();
	if (qtfy.equals(""))
	{
		qtfy="W";
	}

	ls_sql="select bz";
	ls_sql+=" from  jxc_clbm";
	ls_sql+=" where clbm='"+zcbm+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		bjbz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	
	ls_sql="select zjyjjrje,zjsl,zqzjje,zjje,zjycf,zjqtfy,zjcxhdje,zjcbje,lx,bz ";
	ls_sql+=" from  jc_zczjxmx";
	ls_sql+=" where jc_zczjxmx.zjxbh='"+zjxbh+"' and jc_zczjxmx.xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjyjjrje=rs.getDouble("zjyjjrje");
		zjsl=rs.getDouble("zjsl");
		zqzjje=rs.getDouble("zqzjje");
		zjje=rs.getDouble("zjje");
		zjycf=rs.getDouble("zjycf");
		zjqtfy=rs.getDouble("zjqtfy");
		zjcxhdje=rs.getDouble("zjcxhdje");
		zjcbje=rs.getDouble("zjcbje");
		lx=cf.fillNull(rs.getString("lx"));
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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">主材增减项（订单编号：<%=ddbh%>，增减项编号：<%=zjxbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditOldJc_zcddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">品牌</font></td>
              <td width="31%"><%=ppmc%></td>
              <td width="20%" align="right"><font color="#0000CC">供应商</font></td>
              <td width="30%"><%=gys%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">主材编码</font></td>
              <td width="31%"><%=zcbm%></td>
              <td width="20%" align="right"><font color="#0000CC">主材名称</font></td>
              <td width="30%"><%=zcmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">型号</font></td>
              <td width="31%"><%=xinghao%></td>
              <td width="20%" align="right"><font color="#0000CC">规格</font></td>
              <td width="30%"><%=gg%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">类别/系列</font></td>
              <td colspan="3"><%=zclbbm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">是否包含配件</font></td>
              <td width="31%"> <%
	cf.radioToken(out, "sfbhpj","Y+包含&N+不包含",sfbhpj,true);
%> </td>
              <td width="20%" align="right"><font color="#0000CC">单套配件数</font></td>
              <td width="30%"><%=pjts%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">市场标价</font></td>
              <td width="31%"><%=lsj%></td>
              <td width="20%" align="right"><font color="#0000CC">销售限价</font></td>
              <td width="30%"><%=yhj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">正常计入活动比例</font></td>
              <td width="31%"><%=bzcxhdbl%>%</td>
              <td width="20%" align="right"><font color="#0000CC">促销期计入活动比例</font></td>
              <td width="30%"><%=lscxhdbl%>%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">厂家是否有促销</font></td>
              <td width="31%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销",sfycx,true);
%></td>
              <td width="20%" align="right"><font color="#0000CC">促销价</font></td>
              <td width="30%"><%=cxj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">促销开始时间</font></td>
              <td width="31%"><%=cxkssj%></td>
              <td width="20%" align="right"><font color="#0000CC">促销结束时间</font></td>
              <td width="30%"><%=cxjzsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">备注</font></td>
              <td colspan="3"><%=bjbz%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td height="20" colspan="4" align="center">增减前情况</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">原数量</td>
              <td width="31%"><%=zjhsl%></td>
              <td width="20%" align="right">原材料费</td>
              <td width="30%"><%=zjhje%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">原远程费</td>
              <td width="31%"><%=zjhycf%></td>
              <td width="20%" align="right">原其它费用</td>
              <td width="30%"><%=zjhqtfy%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">原计入活动金额</td>
              <td><%=zjhcxhdje%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">选择价格</td>
              <td><%
					cf.radioToken(out, "xzjg","0+手写项目&1+销售限价&2+促销价",xzjg,true);
				%></td>
              <td align="right"><font color="#0000CC"><strong>折前实销单价</strong></font></td>
              <td><%=zqdj%>元</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"><strong><font color="#0000CC">折扣率</font></strong></td>
              <td width="31%"><%=dpzk%></td>
              <td width="20%" align="right"><font color="#0000CC"><strong>折后实销单价</strong></font></td>
              <td width="30%"><%=dj%>元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">颜色</td>
              <td width="31%"><%=zcysbm%> </td>
              <td width="20%" align="right">铺装位置</td>
              <td width="30%"><%=zcpzwzbm%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">参加促销活动标志</td>
              <td width="31%"> <%
			cf.radioToken(out, "cxhdbz","Y+参加&N+不参加",cxhdbz,true);
%> </td>
              <td width="20%" align="right">计入促销活动比率</td>
              <td width="30%"><%=cxhdbl%>% </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td height="25" colspan="4" align="center"><strong>增减[数量、金额]</strong></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right">是否赠品</td>
              <td colspan="3"><%
	cf.radioToken(out,"Y+赠品&N+否",sfzp,true);
%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>增减数量</td>
              <td colspan="3"> 
                <input type="text" name="zjsl" size="10" maxlength="8"  value="<%=zjsl%>" onChange="f_jsjg(editform)" onKeyUp="keyGo(zjycf)">
               <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
%> <font color="#0000CC">（增项为正，减项为负）</font> </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">折前增减材料费</font></td>
              <td bgcolor="#E8E8FF"><font color="#0000CC">
                <input type="text" name="zqzjje" size="17" maxlength="9"  value="<%=zqzjje%>" readonly>
元</font></td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">折扣增减材料费</font></td>
              <td><font color="#0000CC">
                <input type="text" name="zjje" size="17" maxlength="9"  value="<%=zjje%>" readonly>
元</font></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font><font color="#0000CC">其它费用</font></td>
              <td width="31%" bgcolor="#E8E8FF"> <%
			cf.radioToken(out, "qtfy","1+安装费&2+加工费&3+其它收费&W+无",qtfy,true);
%> </td>
              <td width="20%" align="right"><font color="#FF0000">*</font>增减其它费金额</td>
              <td width="30%"> 
                <input type="text" name="zjqtfy" size="17" maxlength="9"  value="<%=zjqtfy%>" onKeyUp="keyTo(cxhdbz[0])">
                元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>增减远程费</td>
              <td width="31%"><input type="text" name="zjycf" size="17" maxlength="9"  value="<%=zjycf%>" onKeyUp="keyTo(qtfy[0])">
元 </td>
              <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">增减计入活动金额</font></td>
              <td width="30%"><font color="#0000CC">
                <input type="text" name="zjcxhdje" size="17" maxlength="9"  value="<%=zjcxhdje%>" readonly>
元 </font> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="zjyjjrje"  value="<%=zjyjjrje%>" >
                  <input type="hidden" name="zjcbje"  value="<%=zjcbje%>" >
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="hidden" name="zjxbh"  value="<%=zjxbh%>" >
                  <input type="hidden" name="xh"  value="<%=xh%>" >
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
	var zqzjje=<%=zqdj%>*FormName.zjsl.value;
	zqzjje=round(zqzjje,2);
	FormName.zqzjje.value=zqzjje;

	var zjje=<%=dj%>*FormName.zjsl.value;
	zjje=round(zjje,2);
	FormName.zjje.value=zjje;

	var zjcxhdje=<%=cxhdbl%>/100*FormName.zjje.value;
	zjcxhdje=round(zjcxhdje,2);
	FormName.zjcxhdje.value=zjcxhdje;

	var zjyjjrje=<%=yjjrbl%>/100*FormName.zjje.value;
	zjyjjrje=round(zjyjjrje,2);
	FormName.zjyjjrje.value=zjyjjrje;

	var zjcbje=<%=cbj%>*FormName.zjsl.value;
	zjcbje=round(zjcbje,2);
	FormName.zjcbje.value=zjcbje;
}
function f_do(FormName)//参数FormName:Form的名称
{
	
	f_jsjg(FormName);


	if(	javaTrim(FormName.zjsl)=="") {
		alert("请输入[增减数量]！");
		FormName.zjsl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjsl, "增减数量"))) {
		return false;
	}
	if (FormName.zjsl.value=="0")
	{
		alert("请输入[增减数量]！");
		FormName.zjsl.select();
		return false;
	}
	if ( (parseFloat(FormName.zjsl.value) + <%=zjhsl%> ) <0 )
	{
		alert("[减项数量]不能超过订货数量[<%=zjhsl%>]！");
		FormName.zjsl.select();
		return false;
	}

	if(	javaTrim(FormName.zqzjje)=="") {
		alert("请输入[折前增减材料费]！");
		FormName.zqzjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zqzjje, "折前增减材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.zjje)=="") {
		alert("请输入[折扣增减材料费]！");
		FormName.zjje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjje, "折扣增减材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.zjycf)=="") {
		alert("请输入[增减远程费]！");
		FormName.zjycf.focus();
		return false;
	}
	if(!(isFloat(FormName.zjycf, "增减远程费"))) {
		return false;
	}
	if(	javaTrim(FormName.zjqtfy)=="") {
		alert("请输入[增减其它费金额]！");
		FormName.zjqtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zjqtfy, "增减其它费金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjcxhdje)=="") {
		alert("请输入[增减计入活动金额]！");
		FormName.zjcxhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjcxhdje, "增减计入活动金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjyjjrje)=="") {
		alert("请输入[增减业绩记入金额]！");
		FormName.zjyjjrje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjyjjrje, "增减业绩记入金额"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
