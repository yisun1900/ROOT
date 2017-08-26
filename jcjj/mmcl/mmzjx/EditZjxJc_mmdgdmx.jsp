<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%

String yddbh=null;
String mmdglxbm=null;
String mlx=null;
String mmxh=null;
String sl=null;
String zjhsl=null;
String ysbm=null;
String czbm=null;
String azwzbm=null;
String kqfxbm=null;
String dbh=null;
String qh=null;
String mdk=null;
String mdg=null;
String ctbs=null;
String tjx=null;
String dj=null;
String blxh=null;
String dczlbm=null;
String sfsmjcc=null;
String sfydc=null;
String dsk=null;
String bz=null;
String mtxbm=null;
String mxxbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,mtxbm,mxxbm,dsk,mmdglxbm,mlx,mmxh,sl,zjhsl,ysbm,czbm,azwzbm,kqfxbm,dbh,qh,mdk,mdg,ctbs,tjx,dj,blxh,bz,dczlbm,sfsmjcc,sfydc ";
	ls_sql+=" from  jc_mmdgdmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		mtxbm=cf.fillNull(rs.getString("mtxbm"));
		mxxbm=cf.fillNull(rs.getString("mxxbm"));
		dsk=cf.fillNull(rs.getString("dsk"));
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mlx=cf.fillNull(rs.getString("mlx"));
		mmxh=cf.fillNull(rs.getString("mmxh"));
		sl=cf.fillNull(rs.getString("sl"));
		zjhsl=cf.fillNull(rs.getString("zjhsl"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		czbm=cf.fillNull(rs.getString("czbm"));
		azwzbm=cf.fillNull(rs.getString("azwzbm"));
		kqfxbm=cf.fillNull(rs.getString("kqfxbm"));
		dbh=cf.fillNull(rs.getString("dbh"));
		qh=cf.fillNull(rs.getString("qh"));
		mdk=cf.fillNull(rs.getString("mdk"));
		mdg=cf.fillNull(rs.getString("mdg"));
		ctbs=cf.fillNull(rs.getString("ctbs"));
		tjx=cf.fillNull(rs.getString("tjx"));
		dj=cf.fillNull(rs.getString("dj"));
		blxh=cf.fillNull(rs.getString("blxh"));
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
      <div align="center">修改木门增减项明细（增减项序号：<%=zjxxh%>）（注意：<font color="#FF6699">红色部分</font>会影响到价格）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditZjxJc_mmdgdmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">预订单编号</div>
              </td>
              <td width="32%"> <%=yddbh%></td>
              <td width="20%"> 
                <div align="right">订购类型</div>
              </td>
              <td width="30%"> <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 门类型</td>
              <td colspan="3"> <%
	cf.selectItem(out,"select mlx,mlxmc||':'||tx from jdm_mlx order by mlx",mlx,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">木门型号</td>
              <td colspan="3"><%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm order by mmxh",mmxh,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 材质</td>
              <td width="32%"> <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm",ysbm,true);
%> </td>
              <td width="20%" align="right">油色 </td>
              <td width="30%"> <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",czbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 安装位置</td>
              <td width="32%"> <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm",azwzbm,true);
%> </td>
              <td width="20%" align="right"> 开启方向</td>
              <td width="30%"> <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm",kqfxbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right">门套线</td>
              <td width="32%"> <%
	cf.selectItem(out,"select mtxbm,mtxmc from jdm_mtxbm ",mtxbm,true);
%> </td>
              <td width="20%" align="right">门芯线</td>
              <td width="30%"> <%
	cf.selectItem(out,"select mxxbm,mxxmc from jdm_mxxbm ",mxxbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">地材种类</td>
              <td width="32%"> <%
	cf.selectItem(out,"select dczlbm,dczlmc||'，厚度:'||dzhd from jdm_dczlbm order by dczlbm",dczlbm,true);
%> </td>
              <td width="20%" align="right">玻璃型号</td>
              <td width="30%"> <%=blxh%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">墙厚（mm）</td>
              <td width="32%" bgcolor="#FFFFFF"> <%=qh%> </td>
              <td width="20%" align="right" bgcolor="#FFFFFF">地材厚（mm）</td>
              <td width="30%"> <%=dbh%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">门洞宽（mm）</div>
              </td>
              <td width="32%"> <%=mdk%> </td>
              <td width="20%"> 
                <div align="right">门洞高（mm）</div>
              </td>
              <td width="30%"> <%=mdg%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">单双口</td>
              <td width="32%"> <%
		cf.radioToken(out, "dsk","1+单口&2+双口",dsk,true);
%> </td>
              <td width="20%" align="right"><font color="#0000CC">单价（元）</font></td>
              <td width="30%"> <%=dj%> </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">是否有顶窗</td>
              <td width="32%" bgcolor="#FFFFFF"><%
		cf.radioToken(out, "sfydc","Y+有顶窗&N+无顶窗",sfydc,true);
%> </td>
              <td width="20%" bgcolor="#FFFFFF" align="right">门套/哑口材质</td>
              <td width="30%" bgcolor="#FFFFFF"> <%
	cf.selectToken(out,"Y+松木集成材&N+非松木集成材",sfsmjcc,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right">门套/窗套边数</div>
              </td>
              <td width="32%"> <%
	cf.selectToken(out,"3+三边&4+四边",ctbs,true);
%> </td>
              <td width="20%"> 
                <div align="right">踢脚线</div>
              </td>
              <td width="30%"> <%=tjx%> 延米/平米 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>增减后数量</div>
              </td>
              <td width="32%"> 
                <input type="text" name="zjhsl" value="<%=zjhsl%>" size="10" maxlength="8" >
              </td>
              <td width="20%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">合同数量</font></div>
              </td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="sl" value="<%=sl%>" size="10" maxlength="8" readonly>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
                <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
                <input type="hidden" name="yddbh" value="<%=yddbh%>" >
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

	if(	javaTrim(FormName.zjhsl)=="") {
		alert("请输入[增减后数量]！");
		FormName.zjhsl.focus();
		return false;
	}
	if(!(isNumber(FormName.zjhsl, "增减后数量"))) {
		return false;
	}
	if (parseInt(FormName.zjhsl.value)<0)
	{
		alert("[增减后数量]不能小于0！");
		FormName.zjhsl.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
