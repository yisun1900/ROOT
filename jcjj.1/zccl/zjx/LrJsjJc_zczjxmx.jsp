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
double bzcxhdbl=0;
double lscxhdbl=0;
String sftjcp=null;
double jsbl=0;
double cbj=0;

String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
String zjxbh=cf.GB2Uni(request.getParameter("zjxbh"));
String xh=cf.GB2Uni(request.getParameter("xh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double zjsl=0;
double zjje=0;
double zjycf=0;
double zjqtfy=0;
double zjcbje=0;
double zjcxhdje=0;

try {
	conn=cf.getConnection();

	ls_sql="select zcbm,zcmc,zclbbm,xinghao,gg,dj,sl,je,ycf,zcpzwzbm,zcysbm,cxhdbz,jldwbm,qtfy,xzjg,sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,bzcxhdbl,lscxhdbl,jsbl,cbj,DECODE(sftjcp,'Y','是','N','否') sftjcp ";
	ls_sql+=" from  jc_zcddmx";
	ls_sql+=" where xh="+xh;
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
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
		jsbl=rs.getDouble("jsbl");
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
		sftjcp=cf.fillNull(rs.getString("sftjcp"));
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

	
	ls_sql="select zjsl,zjje,zjycf,zjqtfy,zjcbje,zjcxhdje,bz ";
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
		zjcbje=rs.getDouble("zjcbje");
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
      <div align="center">审核手写项目结算价－录入结算价（增减项编号：<%=zjxbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveLrJsjJc_zczjxmx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">品牌</font></td>
              <td width="32%"><%=ppmc%></td>
              <td width="23%" align="right"><font color="#0000CC">供应商</font></td>
              <td width="27%"><%=gys%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">主材编码</font></td>
              <td width="32%"><%=zcbm%></td>
              <td width="23%" align="right"><font color="#0000CC">主材名称</font></td>
              <td width="27%"><%=zcmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">型号</font></td>
              <td width="32%"><%=xinghao%></td>
              <td width="23%" align="right"><font color="#0000CC">规格</font></td>
              <td width="27%"><%=gg%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">类别/系列</font></td>
              <td><%=zclbbm%></td>
              <td align="right"><strong><font color="#0000CC">是否推荐产品</font></strong></td>
              <td><%=sftjcp%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">是否包含配件</font></td>
              <td width="32%"> <%
	cf.radioToken(out, "sfbhpj","Y+包含&N+不包含",sfbhpj,true);
%> </td>
              <td width="23%" align="right"><font color="#0000CC">单套配件数</font></td>
              <td width="27%"><%=pjts%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">市场标价</font></td>
              <td width="32%"><%=lsj%></td>
              <td width="23%" align="right"><font color="#0000CC">销售限价</font></td>
              <td width="27%"><%=yhj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">正常计入活动比例</font></td>
              <td width="32%"><%=bzcxhdbl%>%</td>
              <td width="23%" align="right"><font color="#0000CC">促销期计入活动比例</font></td>
              <td width="27%"><%=lscxhdbl%>%</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">厂家是否有促销</font></td>
              <td width="32%"><%
	cf.radioToken(out, "sfycx","N+没促销&Y+有促销",sfycx,true);
%></td>
              <td width="23%" align="right"><font color="#0000CC">促销价</font></td>
              <td width="27%"><%=cxj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">促销开始时间</font></td>
              <td width="32%"><%=cxkssj%></td>
              <td width="23%" align="right"><font color="#0000CC">促销结束时间</font></td>
              <td width="27%"><%=cxjzsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">备注</font></td>
              <td colspan="3"><%=bjbz%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>选择价格</td>
              <td width="32%"> 
<%
	cf.radioToken(out,"0+手写项目&1+销售限价&2+促销价",xzjg,true);
%>			  </td> 
              <td width="23%" align="right"><font color="#0000CC">实销单价</font></td>
              <td width="27%"><%=dj%> 
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 颜色</td>
              <td width="32%"><%=zcysbm%></td>
              <td width="23%" align="right">铺装位置</td>
              <td width="27%"><%=zcpzwzbm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>订货数量</td>
              <td width="32%"><%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
%> </td>
              <td width="23%" align="right">&nbsp;</td>
              <td width="27%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#0000CC">增减材料费</font></td>
              <td width="32%"><%=zjje%> 
                元 </td>
              <td width="23%" align="right">增减远程费</td>
              <td width="27%"><%=zjycf%> 
                元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>其它费用</td>
              <td width="32%"> <%
			cf.radioToken(out,"1+安装费&2+加工费&3+其它收费&W+无",qtfy,true);
%> </td>
              <td width="23%" align="right">增减其它费金额</td>
              <td width="27%"><%=zjqtfy%> 
                元 </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#FF0000">*</font>参加促销活动标志</td>
              <td><%
			cf.radioToken(out, "cxhdbz","Y+参加&N+不参加",cxhdbz,true);
%></td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#000099">计入促销活动比率</font></td>
              <td width="32%"><%=cxhdbl%> % </td>
              <td width="23%" align="right"><font color="#0000CC">增减计入活动金额</font></td>
              <td width="27%"><%=zjcxhdje%> 元 </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0000">*</font>结算价</td>
              <td><input type="text" name="cbj" size="17" maxlength="9"  value="<%=cbj%>"  >
元</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="4" height="2">
                <div align="center"> 
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.cbj)=="") {
		alert("请输入[结算价]！");
		FormName.cbj.focus();
		return false;
	}
	if(!(isFloat(FormName.cbj, "结算价"))) {
		return false;
	}

	if (parseFloat(FormName.cbj.value)<=0 )
	{
		alert("[结算价]必须大于0！");
		FormName.cbj.select();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
