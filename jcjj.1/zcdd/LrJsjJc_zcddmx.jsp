<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String zcbm=null;
double dj=0;
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
String cxhdje=null;
String gys=null;
String ppmc=null;
double jsbl=0;
double cbj=0;
double bzcbj=0;
double bzcxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String jsfs=null;

String ddlx="";

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select zcbm,zcmc,zclbbm,xinghao,gg,dj,sl,je,ycf,zcpzwzbm,zcysbm,cxhdbz,bz,jldwbm,qtfy,xzjg,sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,jsfs,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,jsbl,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl ";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsfs=cf.fillNull(rs.getString("jsfs"));
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
		jsbl=rs.getDouble("jsbl");
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
	}
	rs.close();
	ps.close();


	ls_sql="select ddlx ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ddlx=cf.fillNull(rs.getString("ddlx"));
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
      <div align="center">审核手写项目结算比例－录入结算价（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveLrJsjJc_zcddmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td width="19%" align="right"><font color="#0000CC">品牌</font></td>
              <td width="31%"><%=ppmc%></td>
              <td width="19%" align="right"><font color="#0000CC">供应商</font></td>
              <td width="31%"><%=gys%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">主材编码</font></td>
              <td width="31%"><%=zcbm%></td>
              <td width="19%" align="right"><font color="#0000CC">主材名称</font></td>
              <td width="31%"><%=zcmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">型号</font></td>
              <td width="31%"><%=xinghao%></td>
              <td width="19%" align="right"><font color="#0000CC">规格</font></td>
              <td width="31%"><%=gg%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">类别/系列</font></td>
              <td width="31%"><%=zclbbm%> </td>
              <td width="19%">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">是否包含配件</font></td>
              <td width="31%"> <%
	cf.radioToken(out, "sfbhpj","Y+包含&N+不包含",sfbhpj,true);
%> </td>
              <td width="19%" align="right"><font color="#0000CC">单套配件数</font></td>
              <td width="31%"><%=pjts%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">市场标价</font></td>
              <td width="31%"><%=lsj%></td>
              <td width="19%" align="right"><font color="#0000CC">销售限价</font></td>
              <td width="31%"><%=yhj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">正常计入活动比例</font></td>
              <td width="31%"><%=bzcxhdbl%>%</td>
              <td width="19%" align="right"><font color="#0000CC">促销期计入活动比例</font></td>
              <td width="31%"><%=lscxhdbl%>%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">厂家是否有促销</font></td>
              <td width="31%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销",sfycx,true);
%></td>
              <td width="19%" align="right"><font color="#0000CC">促销价</font></td>
              <td width="31%"><%=cxj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">促销开始时间</font></td>
              <td width="31%"><%=cxkssj%></td>
              <td width="19%" align="right"><font color="#0000CC">促销结束时间</font></td>
              <td width="31%"><%=cxjzsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000CC">备注</font></td>
              <td colspan="3"><%=bjbz%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF">选择价格</td>
              <td width="31%">
<%
	cf.radioToken(out, "xzjg","0+手写项目&1+销售限价&2+促销价",xzjg,true);
%>			  </td> 
              <td width="19%" align="right"><font color="#0000CC">实销单价</font></td>
              <td width="31%"><%=dj%>
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right" bgcolor="#FFFFCC">颜色</td>
              <td width="31%"><%=zcysbm%></td>
              <td width="19%" align="right">铺装位置</td>
              <td width="31%"><%=zcpzwzbm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">订货数量</td>
              <td width="31%"><%=sl%>
              <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
%> </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">材料费</font></td>
              <td width="31%"><%=je%> 
              元 </td>
              <td width="19%" align="right">远程费</td>
              <td width="31%"><%=ycf%> 
                元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">其它费用</td>
              <td width="31%"> <%
	cf.radioToken(out, "1+安装费&2+加工费&3+其它收费&W+无",qtfy,true);
%> </td>
              <td width="19%" align="right">其它费金额</td>
              <td width="31%"><%=qtfyje%> 
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right">参加促销活动标志</td>
              <td width="31%"><%
	cf.radioToken(out, "Y+参加&N+不参加",cxhdbz,true);
%></td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"><font color="#000099">计入促销活动比率</font></td>
              <td width="31%"><%=cxhdbl%> 
              % </td>
              <td width="19%" align="right"><font color="#0000CC">计入促销活动金额</font></td>
              <td width="31%"><%=cxhdje%> 
                元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font>结算方式</td>
              <td><%
	cf.radioToken(out, "jsfs","1+结算价&2+结算比例",jsfs,true);
%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
<%
		if (jsfs.equals("2"))//1：结算价；2：结算比例
		{
			%>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font>结算比例</td>
              <td><input name="jsbl" type="text" value="<%=jsbl%>" size="10" maxlength="9" onchange="f_jsj(editform)" >
% 百分比</td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000CC">结算价</font></td>
              <td><input type="text" name="cbj" size="17" maxlength="9"  value="<%=cbj%>"  readonly>
元</td>
            </tr>
			<%
		}
		else{
			%>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font>结算价</td>
              <td><input type="text" name="cbj" size="17" maxlength="9"  value="<%=cbj%>"  >
元</td>
              <td align="right">&nbsp;</td>
              <td><input name="jsbl" type="hidden" value="<%=jsbl%>" size="10" maxlength="9"  ></td>
            </tr>
			<%
		}
%>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
				<input type="hidden" name="jsfs"  value="<%=jsfs%>" >
				<input type="hidden" name="ddbh"  value="<%=ddbh%>" >
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

function f_jsj(FormName)//参数FormName:Form的名称
{
	if ("<%=jsfs%>"=="2")
	{
		var cbj=<%=dj%>/100*FormName.jsbl.value;
		cbj=round(cbj,2);
		FormName.cbj.value=cbj;
	}
}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsj(FormName);

	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[结算价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "结算价"))) {
		return false;
	}

	if (parseFloat(FormName.cbj.value)<0 )
	{
		alert("[结算价]必须大于等于0！");
		FormName.cbj.select();
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
		alert("[结算比例]只能在0到100之间！");
		FormName.jsbl.select();
		return false;
	}

	if ("<%=ddlx%>"!="5")//5：标准套餐
	{
		if (parseFloat(FormName.cbj.value) > <%=dj%>)
		{
			alert("提醒！[实销单价:<%=dj%>]小于[结算价:"+FormName.cbj.value+"]");
		}
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
