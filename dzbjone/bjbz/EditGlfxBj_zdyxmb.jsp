<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dqbm=null;
String bjjbbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;
double clbj=0;
double rgbj=0;
double jxbj=0;
double bj=0;
double sgdbj=0;
String gycl=null;
String xh=null;
String zdyxmyxq=null;
String flmcgg=null;
String bz=null;
String sfxycl=null;
String sfxyyjd=null;
double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
String xmflbm=null;
double sgcbj=0;


String lrr=cf.GB2Uni(request.getParameter("lrr"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmflmc,sgcbj,zcf,shf,ysf,qtf,dqmc,bjjbmc,xmmc,xmdlmc,xmxlmc,smbm,jldwmc,clcb,rgcb,jxcb,cbenj,bj,clbj,rgbj,jxbj,sgdbj,gycl,xh,zdyxmyxq,flmcgg,bz,DECODE(sfxycl,'Y','需要','N','否') sfxycl,DECODE(sfxyyjd,'Y','需要','N','否') sfxyyjd";
	ls_sql+=" from  bj_zdyxmb,dm_dqbm,bdm_bjjbbm,bdm_xmdlbm,bdm_xmxlbm,bdm_xmflbm,jdm_jldwbm";
	ls_sql+=" where  bj_zdyxmb.lrr='"+lrr+"' and bj_zdyxmb.xmbh='"+xmbh+"'";
	ls_sql+=" and  bj_zdyxmb.dqbm=dm_dqbm.dqbm(+)";
	ls_sql+=" and  bj_zdyxmb.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and  bj_zdyxmb.xmdlbm=bdm_xmdlbm.xmdlbm(+)";
	ls_sql+=" and  bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm(+)";
	ls_sql+=" and  bj_zdyxmb.xmflbm=bdm_xmflbm.xmflbm(+)";
	ls_sql+=" and  bj_zdyxmb.jldwbm=jdm_jldwbm.jldwbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmflbm=cf.fillNull(rs.getString("xmflmc"));
		sgcbj=rs.getDouble("sgcbj");
		zcf=rs.getDouble("zcf");
		shf=rs.getDouble("shf");
		ysf=rs.getDouble("ysf");
		qtf=rs.getDouble("qtf");
		dqbm=cf.fillNull(rs.getString("dqmc"));
		bjjbbm=cf.fillNull(rs.getString("bjjbmc"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlmc"));
		xmxlbm=cf.fillNull(rs.getString("xmxlmc"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		clcb=rs.getDouble("clcb");
		rgcb=rs.getDouble("rgcb");
		jxcb=rs.getDouble("jxcb");
		cbenj=rs.getDouble("cbenj");
		bj=rs.getDouble("bj");
		clbj=rs.getDouble("clbj");
		rgbj=rs.getDouble("rgbj");
		jxbj=rs.getDouble("jxbj");
		sgdbj=rs.getDouble("sgdbj");
		gycl=cf.fillNull(rs.getString("gycl"));
		xh=cf.fillNull(rs.getString("xh"));
		zdyxmyxq=cf.fillNull(rs.getDate("zdyxmyxq"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
		bz=cf.fillNull(rs.getString("bz"));
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		sfxyyjd=cf.fillNull(rs.getString("sfxyyjd"));
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
      <div align="center"> 修改－－自定义项目（项目编号：<%=xmbh%>）</div>    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">地区</td>
              <td width="32%"><%=dqbm%></td>
              <td width="18%" align="right" bgcolor="#FFFFFF">报价级别</td>
              <td width="32%"><%=bjjbbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">项目大类</td>
              <td width="32%"><%=xmdlbm%></td>
              <td width="18%" align="right">项目小类</td>
              <td width="32%"><%=xmxlbm%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right" >项目分类</td>
              <td colspan="3"  ><%=xmflbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" >项目名称</td>
              <td colspan="3"  ><%=xmmc%>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"  >计量单位</td>
              <td width="32%"  ><%=jldwbm%></td>
              <td width="18%" align="right"  >自定义项目有效期</td>
              <td width="32%"  ><%=zdyxmyxq%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">是否需要材料</td>
              <td><%=sfxycl%></td>
              <td align="right">是否需要预交底</td>
              <td><%=sfxyyjd%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFFF">成本价</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">材料成本</td>
              <td bgcolor="#FFFFFF"><%=clcb%></td>
              <td align="right" bgcolor="#FFFFFF">人工成本</td>
              <td bgcolor="#FFFFFF"><%=rgcb%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">机械成本</td>
              <td bgcolor="#FFFFFF"><%=jxcb%></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">成本价</td>
              <td colspan="3" bgcolor="#FFFFFF"><%=cbenj%>&nbsp;&nbsp;&nbsp;&nbsp;注意：成本价(自动生成)＝材料成本＋人工成本＋机械成本 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td colspan="4" align="center" bgcolor="#FFFFFF">对外报价</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">辅材费</td>
              <td bgcolor="#FFFFFF"><%=clbj%></td>
              <td align="right" bgcolor="#FFFFFF">主材费</td>
              <td bgcolor="#FFFFFF"><%=zcf%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">人工费</td>
              <td bgcolor="#FFFFFF"><%=rgbj%></td>
              <td align="right" bgcolor="#FFFFFF">运输费</td>
              <td bgcolor="#FFFFFF"><%=ysf%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">机械费</td>
              <td bgcolor="#FFFFFF"><%=jxbj%></td>
              <td align="right" bgcolor="#FFFFFF">损耗费</td>
              <td bgcolor="#FFFFFF"><%=shf%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">其它费</td>
              <td bgcolor="#FFFFFF"><%=qtf%></td>
              <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
              <td bgcolor="#FFFFFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">工程预算价</td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bj%>&nbsp;&nbsp;&nbsp;&nbsp;注意：工程预算价(自动生成)＝辅材费+主材费＋人工费＋运输费＋机械费＋损耗费＋其它费</td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"  >工艺材料简介</td>
              <td colspan="3"><%=gycl%>             </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">辅料名称规格</td>
              <td colspan="3"><%=flmcgg%>             </td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">备注</td>
              <td colspan="3"><%=bz%>              </td></tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">工程基础报价</td>
              <td colspan="3" bgcolor="#FFFFFF"><%=sgdbj%>&nbsp;&nbsp;&nbsp;&nbsp;工程基础报价=工程预算价/参数</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF">施工成本价</td>
              <td colspan="3" bgcolor="#FFFFFF"><%=sgcbj%>&nbsp;&nbsp;&nbsp;&nbsp;施工成本价=工程基础报价×参数</td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center">
                  <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
                  <input type="hidden" name="lrr"  value="<%=lrr%>" >
                  <input type="button" onClick="f_lr(editform)"  value="录入工料分析" name="lr" >
                  <input type="button" onClick="f_wh(editform)"  value="维护工料分析" name="wh" >
                </div>              </td>
            </tr>
          </table>
        </form>
	  </div>    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.sgdbj)=="") {
		alert("请输入[工程基础报价]！");
		FormName.sgdbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdbj, "工程基础报价"))) {
		return false;
	}
	if(	javaTrim(FormName.sgcbj)=="") {
		alert("请输入[施工成本价]！");
		FormName.sgcbj.focus();
		return false;
	}
	if(!(isFloat(FormName.sgcbj, "施工成本价"))) {
		return false;
	}

	FormName.action="SaveEditGlfxBj_zdyxmb.jsp";
	FormName.submit();
	return true;
}

function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrr)=="") {
		alert("请选择[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请选择[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="InsertBj_zdyglfxb.jsp";
	FormName.submit();
	return true;
}

function f_wh(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.lrr)=="") {
		alert("请选择[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请选择[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="EditBj_zdyglfxb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
